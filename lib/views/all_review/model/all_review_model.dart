
class AllReviewModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Reviews> data;
  final Meta meta;

  AllReviewModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory AllReviewModel.fromJson(Map<String, dynamic> json) => AllReviewModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<Reviews>.from(json["data"].map((x) => Reviews.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Reviews {
  final String id;
  final String appointmentId;
  final UserId userId;
  final String doctorId;
  final int rating;
  final String reviewText;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Reviews({
    required this.id,
    required this.appointmentId,
    required this.userId,
    required this.doctorId,
    required this.rating,
    required this.reviewText,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    id: json["_id"],
    appointmentId: json["appointmentId"],
    userId: UserId.fromJson(json["userId"]),
    doctorId: json["doctorId"],
    rating: json["rating"],
    reviewText: json["reviewText"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "appointmentId": appointmentId,
    "userId": userId.toJson(),
    "doctorId": doctorId,
    "rating": rating,
    "reviewText": reviewText,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  final String id;
  final String name;
  final String profileImage;

  UserId({
    required this.id,
    required this.name,
    required this.profileImage,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    name: json["name"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "profileImage": profileImage,
  };
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

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
  };
}
