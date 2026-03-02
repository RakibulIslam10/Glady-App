class DonationModel {
  final bool success;
  final int statusCode;
  final String message;
  final Data data;

  DonationModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final String authorizationUrl;
  final String reference;

  Data({
    required this.authorizationUrl,
    required this.reference,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    authorizationUrl: json["authorization_url"],
    reference: json["reference"],
  );

  Map<String, dynamic> toJson() => {
    "authorization_url": authorizationUrl,
    "reference": reference,
  };
}