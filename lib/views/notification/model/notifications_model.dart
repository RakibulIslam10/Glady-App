
class NotificationsModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Notifications> notifications;

  NotificationsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.notifications,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    notifications: List<Notifications>.from(json["data"].map((x) => Notifications.fromJson(x))),
  );
}

class Notifications {
  final String id;
  final String userId;
  final String type;
  final String title;
  final String message;
  final Data data;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Notifications({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    required this.data,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    id: json["_id"],
    userId: json["userId"],
    type: json["type"],
    title: json["title"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    isRead: json["isRead"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

}

class Data {
  final String doctorId;

  Data({
    required this.doctorId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    doctorId: json["doctorId"] ?? '',
  );
}
