class AllExperienceModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Experiences> experiences;

  AllExperienceModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.experiences,
  });

  factory AllExperienceModel.fromJson(Map<String, dynamic> json) => AllExperienceModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    experiences: List<Experiences>.from(json["data"].map((x) => Experiences.fromJson(x))),
  );

}

class Experiences {
  final String id;
  final String doctorId;
  final String organizationName;
  final String designation;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCurrent;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Experiences({
    required this.id,
    required this.doctorId,
    required this.organizationName,
    required this.designation,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Experiences.fromJson(Map<String, dynamic> json) => Experiences(
    id: json["_id"],
    doctorId: json["doctorId"],
    organizationName: json["organizationName"],
    designation: json["designation"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    isCurrent: json["isCurrent"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );
}
