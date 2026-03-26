class InboxArgsModel {
  final String conversationId;
  final String receiverId;
  final String receiverRole; // ✅ added
  final String avatar;
  final String name;
  final bool isOnline;

  InboxArgsModel({
    required this.conversationId,
    required this.receiverId,
    required this.receiverRole, // ✅ added
    required this.avatar,
    required this.name,
    required this.isOnline,
  });

  factory InboxArgsModel.fromMap(Map<String, dynamic>? arg) {
    arg ??= {};
    return InboxArgsModel(
      conversationId: arg['conversationId'] ?? '0',
      receiverId: arg['receiverId'] ?? '',
      receiverRole: arg['receiverRole'] ?? '', // ✅ added
      avatar: arg['avatar'] ?? '',
      name: arg['name'] ?? 'Unknown',
      isOnline: arg['isOnline'] ?? false,
    );
  }
}
