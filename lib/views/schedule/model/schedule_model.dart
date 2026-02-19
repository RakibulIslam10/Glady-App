class ScheduleModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Schedules> data;

  ScheduleModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<Schedules>.from(json["data"].map((x) => Schedules.fromJson(x))),
  );
}

class Schedules {
  final String id;
  final String dayOfWeek;
  final String doctorId;
  final int v;
  final DateTime createdAt;
  final String endTime;
  final int fee;
  final bool isActive;
  final int slotSizeMinutes;
  final String startTime;
  final DateTime updatedAt;

  Schedules({
    required this.id,
    required this.dayOfWeek,
    required this.doctorId,
    required this.v,
    required this.createdAt,
    required this.endTime,
    required this.fee,
    required this.isActive,
    required this.slotSizeMinutes,
    required this.startTime,
    required this.updatedAt,
  });

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
    id: json["_id"],
    dayOfWeek: json["dayOfWeek"],
    doctorId: json["doctorId"],
    v: json["__v"],
    createdAt: DateTime.parse(json["createdAt"]),
    endTime: json["endTime"],
    fee: json["fee"],
    isActive: json["isActive"],
    slotSizeMinutes: json["slotSizeMinutes"],
    startTime: json["startTime"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );
}
