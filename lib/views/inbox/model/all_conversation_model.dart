class AllConversationModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Conversation>? conversation;
  final Meta meta;

  AllConversationModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.conversation,
    required this.meta,
  });

  factory AllConversationModel.fromJson(Map<String, dynamic> json) =>
      AllConversationModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        conversation: List<Conversation>.from(
          json["data"].map((x) => Conversation.fromJson(x)),
        ),
        meta: Meta.fromJson(json["meta"]),
      );
}

class Conversation {
  final String id;
  final String conversationId;
  final Receiver sender;
  final Receiver receiver;
  final String text;
  final List<String> images;
  final bool seen;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Conversation({
    required this.id,
    required this.conversationId,
    required this.sender,
    required this.receiver,
    required this.text,
    required this.images,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
    id: json["_id"],
    conversationId: json["conversationId"],
    sender: Receiver.fromJson(json["sender"]),
    receiver: Receiver.fromJson(json["receiver"]),
    text: json["text"],
    images: List<String>.from(json["images"].map((x) => x)),
    seen: json["seen"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );
}

class Receiver {
  final String id;
  final String role;

  Receiver({required this.id, required this.role});

  factory Receiver.fromJson(Map<String, dynamic> json) =>
      Receiver(id: json["id"], role: json["role"]);
}

class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
  );
}
