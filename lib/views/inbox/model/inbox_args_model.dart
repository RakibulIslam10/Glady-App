class InboxArgsModel {
  final String? appointmentId;
  final String receiverId;
  final String? avatar;
  final String? name;

  InboxArgsModel({
    this.appointmentId,
    required this.receiverId,
    this.avatar,
    this.name,
  });

  factory InboxArgsModel.fromMap(Map<String, dynamic> map) {
    return InboxArgsModel(
      appointmentId: map['appointmentId'],
      receiverId: map['receiverId'] ?? '',
      avatar: map['avatar'],
      name: map['name'],
    );
  }
}