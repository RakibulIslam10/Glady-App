import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart' hide FormData, MultipartFile;
import '../model/chat_message_model.dart';
import '../model/inbox_args_model.dart';

class InboxController extends GetxController {
  final textController = TextEditingController();
  final  scrollController = ScrollController();
  final  args = InboxArgsModel.fromMap(Get.arguments);

  final RxBool shouldAutoScroll = true.obs;
  final RxBool isLoading = false.obs;
  final int maxImageCount = 5;

  RxList<ChatMessageModel> messagesList = <ChatMessageModel>[].obs;
  final RxList<XFile> multipleImages = <XFile>[].obs;
  final RxSet<String> animatedMessageIds = <String>{}.obs;

  late IO.Socket socket;
  final String myId = AppStorage.userId;


  void onEmojiSelect(String emoji) {
    textController.text += emoji;
    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: textController.text.length),
    );
  }


  @override
  void onInit() {
    super.onInit();
    _initSocket();
    if (args.receiverId.isNotEmpty) getOldMessages();
  }

  void _initSocket() {
    socket = IO.io(
      "http://10.10.20.52:6002"
          "?id=$myId&role=${AppStorage.isUser}",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setReconnectionAttempts(10)
          .build(),
    );

    socket.onConnect((_) {log("✅ Socket connected: $myId");});
    socket.onDisconnect((_) => log("❌ Socket disconnected"));
    socket.onError((error) => log("❌ Socket error: $error"));
    socket.onConnectError((error) => log("❌ Socket connect error: $error"));
    socket.onReconnect((_) => log("✅ Socket reconnected"));
    socket.onReconnectError((error) => log("❌ Socket reconnect error: $error"));

    //GET NEW MESSAGE
    socket.on('message', (data) {listenMsgInstant(data);});
  }

  // LISTEN MESSAGE
  void listenMsgInstant(data) {
    if (data["senderId"] == myId) return;
    List<String> imagesList = [];
    if (data["images"] != null) imagesList = (data["images"] as List).map((path) => path.toString()).toList();
    final msgId = data['senderId'] + DateTime.parse(data['createdAt']).millisecondsSinceEpoch.toString();

    messagesList.add(ChatMessageModel(
        isMe: false,
        type: imagesList.isNotEmpty ? MessageType.image : MessageType.text,
        message: data['message'],
        images: imagesList,
        senderId: msgId,
        isUploading: false,
        isSeen: false,
        createdAt: DateTime.parse(data['createdAt'])
    ));

    shouldAutoScroll.value = true;
  }

  //SEND MESSAGE LOGIC
  void sendMessage (){
    if (textController.text.trim().isEmpty && !multipleImages.isNotEmpty) return;

    if (multipleImages.isNotEmpty) {
      sendMessageWithImages();
    } else {
      sendTextMessage();
    }
  }

// SENT TEXT ONLY
  void sendTextMessage() {
    final tempId = DateTime.now().millisecondsSinceEpoch.toString();
    shouldAutoScroll.value = true;

    messagesList.add(ChatMessageModel(
        isMe: true,
        senderId: tempId,
        type: MessageType.text,
        message: textController.text.trim()));

    final body = {
      "senderId": myId,
      "receiverId": args.receiverId,
      "message": textController.text.trim(),
    };
    socket.emit('message', body);

    textController.clear();
  }



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
      CustomSnackBar.error('Failed to Send images');
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
      "senderId": myId,
      "images": uploadedImagePaths,
      "receiverId": args.receiverId,
      "message": textController.text.trim(),
    };

    socket.emit('message', body);

    // Clear input fields
    textController.clear();
    multipleImages.clear();
  }

  Future<List<String>> uploadImages(List<XFile> images) async {
    if (images.isEmpty) return [];

    try {
      final List<String> uploadedPaths = [];
      final dio = Dio();

      for (int i = 0; i < images.length; i++) {
        final image = images[i];

        // Detect MIME type based on file extension
        String mimeType = 'image/jpeg';
        final extension = image.path.toLowerCase();

        if (extension.endsWith('.png')) {
          mimeType = 'image/png';
        } else if (extension.endsWith('.jpg') || extension.endsWith('.jpeg')) {
          mimeType = 'image/jpeg';
        } else if (extension.endsWith('.gif')) {
          mimeType = 'image/gif';
        } else if (extension.endsWith('.webp')) {
          mimeType = 'image/webp';
        }

        // Create form data with the image
        final formData = FormData.fromMap({
          'chatImage': await MultipartFile.fromFile(
            image.path,
            filename: image.name,
            contentType: MediaType.parse(mimeType),
          ),
        });

        log('📤 Uploading image ${i + 1}/${images.length}: ${image.name}');

        // Upload to server
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
          onSendProgress: (sent, total) {
            final progress = (sent / total * 100).toStringAsFixed(0);
            log('📊 Upload progress: $progress%');
          },
        );

        log('📥 Response status: ${response.statusCode}');
        log('📥 Response data: ${response.data}');

        // Check if upload was successful
        if (response.statusCode == 200 || response.statusCode == 201) {
          final responseData = response.data;

          // Extract image paths from response
          if (responseData['success'] == true &&
              responseData['images'] != null &&
              responseData['images'] is List) {
            final imagesList = responseData['images'] as List;

            // Add each image path to the result list
            for (var imagePath in imagesList) {
              if (imagePath != null && imagePath.toString().isNotEmpty) {
                uploadedPaths.add(imagePath.toString());
                log('✅ Image path added: $imagePath');
              }
            }
          } else {
            log('❌ Invalid response structure for image ${i + 1}');
          }
        } else {
          log('❌ Upload failed for image ${i + 1} with status ${response.statusCode}');
        }
      }

      log('✅ Total uploaded images: ${uploadedPaths.length}/${images.length}');

      if (uploadedPaths.isEmpty && images.isNotEmpty) {
        log('All image uploads failed');
      } else if (uploadedPaths.length < images.length) {
        CustomSnackBar.error('${uploadedPaths.length}/${images.length} images uploaded successfully');
      }

      return uploadedPaths;

    } catch (e) {
      log('❌ Error uploading images: $e');

      if (e is DioException) {
        log('❌ DioException type: ${e.type}');
        log('❌ DioException message: ${e.message}');
        log('❌ DioException response: ${e.response?.data}');
        log('❌ DioException statusCode: ${e.response?.statusCode}');

        // User-friendly error messages
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          CustomSnackBar.error('Upload timeout. Please check your connection');
        } else if (e.type == DioExceptionType.connectionError) {
          CustomSnackBar.error('Network error. Please try again');
        } else {
          log(' image uploads failed');
        }
      } else {
        CustomSnackBar.error('Unexpected error during upload');
      }

      return [];
    }
  }


  void getOldMessages ({bool isPagination =  false}){}

//DISPOSE ALL
  @override
  void onClose() {
    socket.disconnect();
    socket.dispose();
    textController.dispose();
    super.onClose();
  }
}
