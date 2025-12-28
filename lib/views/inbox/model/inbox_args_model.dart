class InboxArgsModel {
  final String receiverId;
  final String avatar;
  final String name;
  final bool isOnline;

  InboxArgsModel({
    required this.receiverId,
    required this.avatar,
    required this.name,
    required this.isOnline,
  });

  factory InboxArgsModel.fromMap(Map<String, dynamic>? arg) {
    arg ??= {};
    return InboxArgsModel(
      receiverId: arg['receiverId'] ?? '0',
      avatar: arg['avatar'] ?? '',
      name: arg['name'] ?? 'Unknown',
      isOnline: arg['isOnline'] ?? false,
    );
  }
}
