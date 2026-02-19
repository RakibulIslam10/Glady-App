class DoctorDashboardModel {
  final bool success;
  final int statusCode;
  final String message;
  final DashboardData data;

  DoctorDashboardModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory DoctorDashboardModel.fromJson(Map<String, dynamic> json) =>
      DoctorDashboardModel(
        success: json['success'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: DashboardData.fromJson(json['data']),
      );
}

class DashboardData {
  final TodaySchedule today;
  final String nextSchedule;
  final ActiveAppointment? activeAppointment;
  final DashboardStats stats;
  final List<UpcomingAppointment> upcomingAppointments;

  DashboardData({
    required this.today,
    required this.nextSchedule,
    this.activeAppointment,
    required this.stats,
    required this.upcomingAppointments,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
    today: TodaySchedule.fromJson(json['today']),
    nextSchedule: json['nextSchedule'] ?? '',
    activeAppointment: json['activeAppointment'] != null
        ? ActiveAppointment.fromJson(json['activeAppointment'])
        : null,
    stats: DashboardStats.fromJson(json['stats']),
    upcomingAppointments: List<UpcomingAppointment>.from(
      json['upcomingAppointments'].map((x) => UpcomingAppointment.fromJson(x)),
    ),
  );
}

class TodaySchedule {
  final String date;
  final String dayName;
  final int slotCount;
  final String startTime;
  final String endTime;

  TodaySchedule({
    required this.date,
    required this.dayName,
    required this.slotCount,
    required this.startTime,
    required this.endTime,
  });

  factory TodaySchedule.fromJson(Map<String, dynamic> json) => TodaySchedule(
    date: json['date'],
    dayName: json['dayName'],
    slotCount: json['slotCount'],
    startTime: json['startTime'],
    endTime: json['endTime'],
  );
}

class ActiveAppointment {
  final String id;
  final String timeRange;
  final String status;

  ActiveAppointment({
    required this.id,
    required this.timeRange,
    required this.status,
  });

  factory ActiveAppointment.fromJson(Map<String, dynamic> json) =>
      ActiveAppointment(
        id: json['_id'],
        timeRange: json['timeRange'],
        status: json['status'],
      );
}

class DashboardStats {
  final int bookingRequestCount;
  final int acceptedCount;

  DashboardStats({
    required this.bookingRequestCount,
    required this.acceptedCount,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) => DashboardStats(
    bookingRequestCount: json['bookingRequestCount'],
    acceptedCount: json['acceptedCount'],
  );
}

class UpcomingAppointment {
  final String id;
  final String patientName;
  final String patientProfileImage;
  final String timeRange;
  final String date;
  final String status;

  UpcomingAppointment({
    required this.id,
    required this.patientName,
    required this.patientProfileImage,
    required this.timeRange,
    required this.date,
    required this.status,
  });

  factory UpcomingAppointment.fromJson(Map<String, dynamic> json) =>
      UpcomingAppointment(
        id: json['_id'],
        patientName: json['patientName'],
        patientProfileImage: json['patientProfileImage'],
        timeRange: json['timeRange'],
        date: json['date'],
        status: json['status'],
      );
}