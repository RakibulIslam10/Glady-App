class UpdateProfileModel {
  final bool success;
  final int statusCode;
  final String message;
  final Data data;

  UpdateProfileModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final String id;
  final UserId userId;
  final String currentOrganization;
  final SpecialtyId specialtyId;
  final List<String> verificationDocuments;
  final String verificationStatus;
  final bool isVerified;
  final int totalEarnings;
  final int totalPayouts;
  final int pendingPayouts;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String verificationNote;
  final String about;
  final DateTime dateOfBirth;

  Data({
    required this.id,
    required this.userId,
    required this.currentOrganization,
    required this.specialtyId,
    required this.verificationDocuments,
    required this.verificationStatus,
    required this.isVerified,
    required this.totalEarnings,
    required this.totalPayouts,
    required this.pendingPayouts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.verificationNote,
    required this.about,
    required this.dateOfBirth,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userId: UserId.fromJson(json["userId"]),
    currentOrganization: json["currentOrganization"],
    specialtyId: SpecialtyId.fromJson(json["specialtyId"]),
    verificationDocuments: List<String>.from(json["verificationDocuments"].map((x) => x)),
    verificationStatus: json["verificationStatus"],
    isVerified: json["isVerified"],
    totalEarnings: json["totalEarnings"],
    totalPayouts: json["totalPayouts"],
    pendingPayouts: json["pendingPayouts"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    verificationNote: json["verificationNote"],
    about: json["about"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
  );
}

class SpecialtyId {
  final String id;
  final String name;

  SpecialtyId({
    required this.id,
    required this.name,
  });

  factory SpecialtyId.fromJson(Map<String, dynamic> json) => SpecialtyId(
    id: json["_id"],
    name: json["name"],
  );
}

class UserId {
  final String id;
  final String email;
  final String name;
  final String phone;

  UserId({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    phone: json["phone"],
  );

}
