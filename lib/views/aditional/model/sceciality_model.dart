class SpecialistsModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Specialis> data;
  final Meta meta;

  SpecialistsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory SpecialistsModel.fromJson(Map<String, dynamic> json) => SpecialistsModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<Specialis>.from(json["data"].map((x) => Specialis.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );


}

class Specialis {
  final String id;
  final String name;
  final String description;
  final String thumbnail;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Specialis({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Specialis.fromJson(Map<String, dynamic> json) => Specialis(
    id: json["_id"],
    name: json["name"] ?? '',
    description: json["description"],
    thumbnail: json["thumbnail"] ?? '',
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
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
