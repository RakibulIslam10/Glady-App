import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:glady/core/api/services/api_request.dart';
import 'package:http/http.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart' hide FormData, MultipartFile;
import '../model/all_conversation_model.dart';
import '../model/chat_message_model.dart';
import '../model/inbox_args_model.dart';


class InboxController extends GetxController {
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final args = InboxArgsModel.fromMap(Get.arguments);

  final RxBool shouldAutoScroll = true.obs;
  final RxBool isLoading = false.obs;
  final RxBool isTyping = false.obs;
  final int maxImageCount = 5;

  RxList<ChatMessageModel> messagesList = <ChatMessageModel>[].obs;
  final RxList<XFile> multipleImages = <XFile>[].obs;
  final RxSet<String> animatedMessageIds = <String>{}.obs;

  late IO.Socket socket;
  String myId = '';




  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll); // ✅ added
    if (args.conversationId.isNotEmpty) {
      getOldMessages().then((_) => _initSocket());
    } else {
      _initSocket();
    }
  }

// ✅ scroll উপরে গেলে আরো load করো
  void _onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
      if (!isPaginationLoading.value && hasMore) {
        currentPage++;
        getOldMessages(isPagination: true);
      }
    }
  }
  void _initSocket() {
    socket = IO.io(
      "https://bvh0nlc7-3001.inc1.devtunnels.ms"
          "?token=${AppStorage.token}",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setReconnectionAttempts(10)
          .build(),
    );

    socket.onConnect((_) { log("✅ Socket connected: $myId"); });
    socket.onDisconnect((_) => log("❌ Socket disconnected"));
    socket.onError((error) => log("❌ Socket error: $error"));
    socket.onConnectError((error) => log("❌ Socket connect error: $error"));
    socket.onReconnect((_) => log("✅ Socket reconnected"));
    socket.onReconnectError((error) => log("❌ Socket reconnect error: $error"));

    // ✅ connection confirmed
    socket.on('connection_confirmed', (data) {
      log("✅ connection_confirmed: $data");
      // ✅ userId socket থেকে নাও
      myId = data['data']?['userId']?.toString() ?? AppStorage.userId;
      log("✅ myId set: $myId");
    });

    // ✅ new message listen
    socket.on('message_new', (data) { listenMsgInstant(data); });

    // ✅ typing indicator
    socket.on('typing', (data) {
      log("✏️ typing: $data");
      isTyping.value = (data['senderId'] != myId) && (data['isTyping'] == true);
    });

    // ✅ conversation update
    socket.on('conversation_update', (data) {
      log("🔄 conversation_update: $data");
    });
  }

  // ✅ Listen new message from socket
  void listenMsgInstant(dynamic data) {
    final senderId = data["sender"]?["id"]?.toString() ?? '';
    if (senderId == myId) return;

    List<String> imagesList = [];
    if (data["images"] != null) {
      imagesList = (data["images"] as List)
          .where((e) => e != null)
          .map((e) => e.toString())
          .toList();
    }

    messagesList.add(ChatMessageModel(
      isMe: false,
      type: imagesList.isNotEmpty ? MessageType.image : MessageType.text,
      message: data['text'] ?? '',
      images: imagesList,
      senderId: data['_id']?.toString(),
      isUploading: false,
      isSeen: data['seen'] ?? false,
      createdAt: DateTime.tryParse(data['createdAt'] ?? '') ?? DateTime.now(),
    ));

    shouldAutoScroll.value = true;
  }

  // ✅ Send message — decide text or image
  void sendMessage() {
    if (textController.text.trim().isEmpty && multipleImages.isEmpty) return;

    if (multipleImages.isNotEmpty) {
      sendMessageWithImages();
    } else {
      sendTextMessage();
    }
  }

  // ✅ Send text only
  void sendTextMessage() {
    final tempId = DateTime.now().millisecondsSinceEpoch.toString();
    shouldAutoScroll.value = true;

    messagesList.add(ChatMessageModel(
      isMe: true,
      senderId: tempId,
      type: MessageType.text,
      message: textController.text.trim(),
    ));

    final body = {
      "sender": {
        "id": myId,
        "role": AppStorage.isUser
      },
      "receiver": {
        "id": args.receiverId,
        "role": args.receiverRole, // ✅ AppStorage.isUser → args.receiverRole
      },
      "text": textController.text.trim()
    };

    log("📤 Emitting: $body");
    socket.emit('send_message', body);
    textController.clear();
  }

  // ✅ Send with images
  Future<void> sendMessageWithImages() async {
    final tempId = DateTime.now().millisecondsSinceEpoch.toString();
    shouldAutoScroll.value = true;

    messagesList.add(
      ChatMessageModel(
        isMe: true,
        senderId: tempId,
        type: MessageType.image,
        message: textController.text.trim(),
        isUploading: true,
      ),
    );

    final List<String> uploadedImagePaths = await uploadImages(multipleImages);

    if (uploadedImagePaths.isEmpty) {
      CustomSnackBar.error('Failed to send images');
      messagesList.removeWhere((msg) => msg.senderId == tempId);
      return;
    }

    final messageIndex = messagesList.indexWhere((msg) => msg.senderId == tempId);
    if (messageIndex != -1) {
      messagesList[messageIndex] = messagesList[messageIndex].copyWith(
        images: uploadedImagePaths,
        isUploading: false,
      );
      messagesList.refresh();
    }

    final body = {
      "receiverId": args.receiverId,
      "text": textController.text.trim(),
      "images": uploadedImagePaths,
    };
    socket.emit('send_message', body);

    textController.clear();
    multipleImages.clear();
  }

  // ✅ Upload images to server
  Future<List<String>> uploadImages(List<XFile> images) async {
    if (images.isEmpty) return [];

    try {
      final List<String> uploadedPaths = [];
      final dio = Dio();

      for (int i = 0; i < images.length; i++) {
        final image = images[i];

        String mimeType = 'image/jpeg';
        final extension = image.path.toLowerCase();
        if (extension.endsWith('.png')) {
          mimeType = 'image/png';
        } else if (extension.endsWith('.gif')) {
          mimeType = 'image/gif';
        } else if (extension.endsWith('.webp')) {
          mimeType = 'image/webp';
        }

        final formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(
            image.path,
            filename: image.name,
            contentType: MediaType.parse(mimeType),
          ),
        });

        log('📤 Uploading image ${i + 1}/${images.length}: ${image.name}');

        final response = await dio.post(
          'http://10.10.20.52:6002/chat/chat-images-video',
          data: formData,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${AppStorage.token}',
              'Content-Type': 'multipart/form-data',
            },
            validateStatus: (status) => status! < 500,
          ),
        );

        log('📥 Response status: ${response.statusCode}');
        log('📥 Response data: ${response.data}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responseData = response.data;
          if (responseData['success'] == true &&
              responseData['images'] != null &&
              responseData['images'] is List) {
            for (var imagePath in responseData['images'] as List) {
              if (imagePath != null && imagePath.toString().isNotEmpty) {
                uploadedPaths.add(imagePath.toString());
                log('✅ Image path added: $imagePath');
              }
            }
          }
        } else {
          log('❌ Upload failed for image ${i + 1} with status ${response.statusCode}');
        }
      }

      log('✅ Total uploaded: ${uploadedPaths.length}/${images.length}');
      return uploadedPaths;

    } catch (e) {
      log('❌ Error uploading images: $e');
      if (e is DioException) {
        log('❌ DioException: ${e.type} | ${e.message}');
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          CustomSnackBar.error('Upload timeout. Please check your connection');
        } else if (e.type == DioExceptionType.connectionError) {
          CustomSnackBar.error('Network error. Please try again');
        }
      } else {
        CustomSnackBar.error('Unexpected error during upload');
      }
      return [];
    }
  }

  final RxBool isLoadingOldMessage = false.obs;
  final RxBool isPaginationLoading = false.obs;

  bool hasMore = true;
  int currentPage = 1;
  int limit = 10;
  int skip = 0;

  Future<void> getOldMessages({bool isPagination = false}) async {
    if (isPagination && !hasMore) return;

    if (isPagination) {
      isPaginationLoading.value = true;
    } else {
      isLoading.value = true;
    }

    await ApiRequest().get(
      fromJson: AllConversationModel.fromJson,
      endPoint: '/chat/messages/${args.conversationId}?page=$currentPage&limit=$limit', // ✅ dynamic page
      isLoading: isLoading,
      onSuccess: (result) {
        final newMessages = (result.conversation ?? []).map((conversion) {
          return ChatMessageModel(
            id: conversion.id,
            isMe: conversion.sender.id == myId,
            type: conversion.images.isNotEmpty
                ? MessageType.image
                : MessageType.text,
            message: conversion.text,
            images: conversion.images,
            senderId: conversion.sender.id,
            isUploading: false,
            isSeen: conversion.seen,
            createdAt: conversion.createdAt,
          );
        }).toList().reversed.toList();

        if (isPagination) {
          messagesList.insertAll(0, newMessages); // ✅ উপরে যোগ
        } else {
          messagesList.assignAll(newMessages);
          scrollToBottom();
        }

        skip += newMessages.length;
        if (newMessages.length < limit) hasMore = false;
      },
    );

    isPaginationLoading.value = false;
    isLoading.value = false;
  }

// ✅ scroll method
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    socket.disconnect();
    socket.dispose();
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}