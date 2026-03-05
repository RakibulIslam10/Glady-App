import 'package:agora_chat_sdk/agora_chat_sdk.dart' hide MessageType;
import 'package:http/http.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart' hide FormData, MultipartFile;
import '../../../core/api/services/api_request.dart';
import '../model/chat_message_model.dart';
import '../model/inbox_args_model.dart';
import '../model/chat_token_model.dart';
import 'package:agora_chat_sdk/agora_chat_sdk.dart' hide MessageType;
import '../../../core/utils/basic_import.dart';

import 'package:agora_chat_sdk/agora_chat_sdk.dart' hide MessageType;
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart';
import '../../../core/api/services/api_request.dart';
import '../model/chat_message_model.dart';
import '../model/inbox_args_model.dart';
import '../model/chat_token_model.dart';

class InboxController extends GetxController {
  final textController = TextEditingController();
  final scrollController = ScrollController();
  late final InboxArgsModel args;

  final RxBool isLoading = false.obs;
  final RxBool isChatReady = false.obs;
  final int maxImageCount = 5;

  RxList<ChatMessageModel> messagesList = <ChatMessageModel>[].obs;
  final RxList<XFile> multipleImages = <XFile>[].obs;

  late String myUserId;
  late String appointmentId;
  late String conversationId;

  ChatConversation? currentConversation;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;
    if (arguments == null || arguments['appointmentId'] == null) {
      print('❌ No appointment ID provided');
      Get.back();
      CustomSnackBar.error('Invalid chat session');
      return;
    }

    args = InboxArgsModel.fromMap(arguments);
    appointmentId = args.appointmentId ?? '';
    conversationId = appointmentId;

    initializeChat();
  }

  // ✅ Step 1: Initialize Chat
  Future<void> initializeChat() async {
    try {
      isLoading.value = true;

      // Get token and login
      await getChatTokenAndLogin();

      // Setup listener
      setupMessageListener();

      // Load old messages
      await loadOldMessages();

      isChatReady.value = true;
      isLoading.value = false;

      print('✅ Chat initialized successfully');
    } catch (e) {
      print('❌ Chat initialization error: $e');
      isLoading.value = false;
      CustomSnackBar.error('Failed to initialize chat');
    }
  }

  // ✅ Step 2: Get Token & Login
  Future<void> getChatTokenAndLogin() async {
    await ApiRequest().get(
      fromJson: ChatTokenModel.fromJson,
      endPoint: '/appointments/$appointmentId/chat/token',
      showResponse: true,
      onSuccess: (ChatTokenModel result) async {
        try {
          myUserId = result.data.userId;

          // Initialize Agora Chat SDK
          final options = ChatOptions(
            appKey: result.data.chatAppKey,
            autoLogin: false,
          );

          await ChatClient.getInstance.init(options);

          // Login with token
          await ChatClient.getInstance.loginWithAgoraToken(
            result.data.userId,
            result.data.token,
          );

          print('✅ Logged in as: ${result.data.userId}');
        } on ChatError catch (e) {
          if (e.code == 200) {
            print('⚠️ Already logged in');
            myUserId = result.data.userId;
          } else {
            print('❌ Login error: ${e.code} - ${e.description}');
            throw Exception('Chat login failed');
          }
        }
      },
      isLoading: isLoading,
    );
  }

  // ✅ Step 3: Setup Message Listener
  void setupMessageListener() {
    ChatClient.getInstance.chatManager.addEventHandler(
      "INBOX_$appointmentId",
      ChatEventHandler(
        onMessagesReceived: (messages) {
          print('📥 Received ${messages.length} messages');

          for (var msg in messages) {
            if (msg.conversationId == conversationId) {
              _addMessageToUI(msg, isMe: false);
            }
          }

          _scrollToBottom();
        },
        onMessagesRead: (messages) {
          // Mark messages as read
          for (var msg in messages) {
            final index = messagesList.indexWhere(
              (m) => m.senderId == msg.msgId,
            );
            if (index != -1) {
              messagesList[index] = messagesList[index].copyWith(isSeen: true);
            }
          }
          messagesList.refresh();
        },
      ),
    );
  }

  // ✅ Step 4: Load Old Messages
  Future<void> loadOldMessages() async {
    try {
      // Get or create conversation
      currentConversation = await ChatClient.getInstance.chatManager
          .getConversation(
            conversationId,
            type: ChatConversationType.GroupChat,
            createIfNeed: true,
          );

      if (currentConversation != null) {
        // Load last 50 messages
        final messages = await currentConversation!.loadMessages(loadCount: 50);

        print('📜 Loaded ${messages.length} old messages');

        messagesList.clear();

        for (var msg in messages.reversed) {
          _addMessageToUI(msg, isMe: msg.from == myUserId);
        }
      }
    } catch (e) {
      print('❌ Load messages error: $e');
    }
  }

  // ✅ Parse & Add Message to UI
  void _addMessageToUI(ChatMessage msg, {required bool isMe}) {
    if (msg.body is ChatTextMessageBody) {
      final body = msg.body as ChatTextMessageBody;

      messagesList.add(
        ChatMessageModel(
          isMe: isMe,
          type: MessageType.text,
          message: body.content,
          senderId: msg.msgId,
          isSeen: msg.hasReadAck,
          createdAt: DateTime.fromMillisecondsSinceEpoch(msg.serverTime),
        ),
      );
    } else if (msg.body is ChatImageMessageBody) {
      final body = msg.body as ChatImageMessageBody;

      messagesList.add(
        ChatMessageModel(
          isMe: isMe,
          type: MessageType.image,
          message: '',
          images: [body.remotePath ?? body.localPath ?? ''],
          senderId: msg.msgId,
          isSeen: msg.hasReadAck,
          createdAt: DateTime.fromMillisecondsSinceEpoch(msg.serverTime),
        ),
      );
    }
  }

  // ✅ Send Message
  void sendMessage() {
    final hasText = textController.text.trim().isNotEmpty;
    final hasImages = multipleImages.isNotEmpty;

    if (!hasText && !hasImages) return;

    if (hasImages) {
      _sendImageMessages();
    } else {
      _sendTextMessage();
    }
  }

  // ✅ Send Text Message
  Future<void> _sendTextMessage() async {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    final tempId = DateTime.now().millisecondsSinceEpoch.toString();

    // Add to UI immediately (optimistic update)
    messagesList.add(
      ChatMessageModel(
        isMe: true,
        senderId: tempId,
        type: MessageType.text,
        message: text,
        createdAt: DateTime.now(),
      ),
    );

    textController.clear();
    _scrollToBottom();

    try {
      // Create message
      final msg = ChatMessage.createTxtSendMessage(
        targetId: conversationId,
        content: text,
      );

      msg.chatType = ChatType.GroupChat;

      // Send via Agora
      await ChatClient.getInstance.chatManager.sendMessage(msg);

      print('✅ Text message sent');
    } on ChatError catch (e) {
      print('❌ Send error: ${e.code} - ${e.description}');
      CustomSnackBar.error('Failed to send message');

      // Remove from UI if failed
      messagesList.removeWhere((m) => m.senderId == tempId);
    }
  }

  // ✅ Send Image Messages
  Future<void> _sendImageMessages() async {
    final images = List<XFile>.from(multipleImages);
    final text = textController.text.trim();

    multipleImages.clear();
    textController.clear();

    final tempId = DateTime.now().millisecondsSinceEpoch.toString();

    // Show loading in UI
    messagesList.add(
      ChatMessageModel(
        isMe: true,
        senderId: tempId,
        type: MessageType.image,
        message: text,
        images: images.map((e) => e.path).toList(),
        isUploading: true,
        createdAt: DateTime.now(),
      ),
    );

    _scrollToBottom();

    try {
      // Send each image
      for (final image in images) {
        final msg = ChatMessage.createImageSendMessage(
          targetId: conversationId,
          filePath: image.path,
        );

        msg.chatType = ChatType.GroupChat;

        await ChatClient.getInstance.chatManager.sendMessage(msg);
      }

      // Send text if any
      if (text.isNotEmpty) {
        final textMsg = ChatMessage.createTxtSendMessage(
          targetId: conversationId,
          content: text,
        );
        textMsg.chatType = ChatType.GroupChat;
        await ChatClient.getInstance.chatManager.sendMessage(textMsg);
      }

      // Update loading state
      final index = messagesList.indexWhere((m) => m.senderId == tempId);
      if (index != -1) {
        messagesList[index] = messagesList[index].copyWith(isUploading: false);
        messagesList.refresh();
      }

      print('✅ Images sent');
    } on ChatError catch (e) {
      print('❌ Send image error: ${e.code} - ${e.description}');
      CustomSnackBar.error('Failed to send images');

      messagesList.removeWhere((m) => m.senderId == tempId);
    }
  }

  void onEmojiSelect(String emoji) {
    textController.text += emoji;
    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: textController.text.length),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    ChatClient.getInstance.chatManager.removeEventHandler(
      "INBOX_$appointmentId",
    );
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
