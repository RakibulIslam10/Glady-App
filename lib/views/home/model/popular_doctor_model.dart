class PopularDoctorModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<AllDoctors> data;
  final Meta meta;

  PopularDoctorModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory PopularDoctorModel.fromJson(Map<String, dynamic> json) =>
      PopularDoctorModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: List<AllDoctors>.from(
          json["data"].map((x) => AllDoctors.fromJson(x)),
        ),
        meta: Meta.fromJson(json["meta"]),
      );
}

class AllDoctors {
  final String id;
  final String currentOrganization;
  final int experienceYears;
  final int totalReviews;
  final String name;
  final String profileImage;
  final String specialty;
  final int totalExperienceYears;
  final double averageRating;

  AllDoctors({
    required this.id,
    required this.currentOrganization,
    required this.experienceYears,
    required this.totalReviews,
    required this.name,
    required this.profileImage,
    required this.specialty,
    required this.totalExperienceYears,
    required this.averageRating,
  });

  factory AllDoctors.fromJson(Map<String, dynamic> json) => AllDoctors(
    id: json["_id"],
    currentOrganization: json["currentOrganization"],
    experienceYears: json["experienceYears"],
    totalReviews: json["totalReviews"],
    name: json["name"],
    profileImage: json["profileImage"],
    specialty: json["specialty"],
    totalExperienceYears: json["totalExperienceYears"],
    averageRating: json["averageRating"]?.toDouble(),
  );
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
