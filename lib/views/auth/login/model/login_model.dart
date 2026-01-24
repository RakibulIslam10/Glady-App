class LoginModel {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  LoginModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  final String? accessToken;
  final String? refreshToken;
  final String? name;
  final String? email;
  final String? role;

  Data({
    this.accessToken,
    this.refreshToken,
    this.name,
    this.email,
    this.role,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
  );
}
