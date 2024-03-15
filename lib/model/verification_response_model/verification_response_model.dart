class VerificationResponseModel {
  String? status;
  Data? data;
  String? message;
  String? token;

  VerificationResponseModel({
    this.status,
    this.data,
    this.message,
    this.token,
  });

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      VerificationResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
        "token": token,
      };
}

class Data {
  bool? userExits;
  bool? isMobileValidated;
  Data({this.userExits, this.isMobileValidated});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      userExits: json["userExits"],
      isMobileValidated: json["isMobileValidated"]);

  Map<String, dynamic> toJson() =>
      {"userExits": userExits, "isMobileValidated": isMobileValidated};
}
