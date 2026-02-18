class TermsModel {
  final bool success;
  final int statusCode;
  final String message;
  final Data data;

  TermsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  final String id;
  final String type;
  final int v;
  final String content;
  final DateTime createdAt;
  final bool isActive;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.type,
    required this.v,
    required this.content,
    required this.createdAt,
    required this.isActive,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    type: json["type"],
    v: json["__v"],
    content: json["content"],
    createdAt: DateTime.parse(json["createdAt"]),
    isActive: json["isActive"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

}
