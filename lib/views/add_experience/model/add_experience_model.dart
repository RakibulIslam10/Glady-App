class AddExperienceModel {
  final bool success;
  final int statusCode;
  final String message;
  final AddExperienceData data;

  AddExperienceModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AddExperienceModel.fromJson(Map<String, dynamic> json) =>
      AddExperienceModel(
        success: json['success'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: AddExperienceData.fromJson(json['data']),
      );
}

class AddExperienceData {
  final String id;
  final String doctorId;
  final String organizationName;
  final String designation;
  final String startDate;
  final String? endDate;
  final bool isCurrent;

  AddExperienceData({
    required this.id,
    required this.doctorId,
    required this.organizationName,
    required this.designation,
    required this.startDate,
    this.endDate,
    required this.isCurrent,
  });

  factory AddExperienceData.fromJson(Map<String, dynamic> json) =>
      AddExperienceData(
        id: json['_id'],
        doctorId: json['doctorId'],
        organizationName: json['organizationName'],
        designation: json['designation'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        isCurrent: json['isCurrent'],
      );
}