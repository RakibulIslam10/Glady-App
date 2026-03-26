class JoinVideoCallModel {
  final bool success;
  final int statusCode;
  final String message;
  final Data data;

  JoinVideoCallModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory JoinVideoCallModel.fromJson(Map<String, dynamic> json) =>
      JoinVideoCallModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final String appId;
  final String channel;
  final String token;

  Data({required this.appId, required this.channel, required this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    appId: json["appId"],
    channel: json["channel"],
    token: json["token"],
  );
}
