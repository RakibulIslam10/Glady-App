class ChatPersonListModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<PersonData> data;
  final ChatPersonListModelMeta meta;

  ChatPersonListModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory ChatPersonListModel.fromJson(Map<String, dynamic> json) => ChatPersonListModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<PersonData>.from(json["data"].map((x) => PersonData.fromJson(x))),
    meta: ChatPersonListModelMeta.fromJson(json["meta"]),
  );
}

class PersonData {
  final String id;
  final List<Participant> participants;
  final String? appointmentId;
  final DatumMeta meta;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final LastMessage lastMessage;

  PersonData({
    required this.id,
    required this.participants,
     this.appointmentId,
    required this.meta,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastMessage,
  });

  factory PersonData.fromJson(Map<String, dynamic> json) => PersonData(
    id: json["_id"],
    participants: List<Participant>.from(json["participants"].map((x) => Participant.fromJson(x))),
    appointmentId: json["appointmentId"] ?? '',
    meta: DatumMeta.fromJson(json["meta"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    lastMessage: LastMessage.fromJson(json["lastMessage"]),
  );
}

class LastMessage {
  final String id;
  final String conversationId;
  final Receiver sender;
  final Receiver receiver;
  final String text;
  final List<String> images;
  final dynamic video;
  final dynamic videoCover;
  final bool seen;
  final dynamic deliveredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  LastMessage({
    required this.id,
    required this.conversationId,
    required this.sender,
    required this.receiver,
    required this.text,
    required this.images,
    required this.video,
    required this.videoCover,
    required this.seen,
    required this.deliveredAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
    id: json["_id"],
    conversationId: json["conversationId"],
    sender: Receiver.fromJson(json["sender"]),
    receiver: Receiver.fromJson(json["receiver"]),
    text: json["text"],
    images: List<String>.from(json["images"].map((x) => x)),
    video: json["video"],
    videoCover: json["videoCover"],
    seen: json["seen"],
    deliveredAt: json["deliveredAt"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

}

class Receiver {
  final String id;
  final String role;

  Receiver({
    required this.id,
    required this.role,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
    id: json["id"],
    role: json["role"],
  );
}

class DatumMeta {
  final String id;
  final DateTime lastActivityAt;

  DatumMeta({
    required this.id,
    required this.lastActivityAt,
  });

  factory DatumMeta.fromJson(Map<String, dynamic> json) => DatumMeta(
    id: json["_id"],
    lastActivityAt: DateTime.parse(json["lastActivityAt"]),
  );
}

class Participant {
  final String id;
  final String role;
  final String name;
  final String image;

  Participant({
    required this.id,
    required this.role,
    required this.name,
    required this.image,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    id: json["id"],
    role: json["role"],
    name: json["name"],
    image: json["image"],
  );
}

class ChatPersonListModelMeta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  ChatPersonListModelMeta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory ChatPersonListModelMeta.fromJson(Map<String, dynamic> json) => ChatPersonListModelMeta(
    total: json["total"],
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
  );
}
