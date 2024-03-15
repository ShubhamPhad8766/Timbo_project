class SignUpResponseModel {
  String? status;
  UserData? data;
  String? token;

  SignUpResponseModel({
    this.status,
    this.data,
    this.token,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "token": token,
      };
}

class UserData {
  String? name;
  dynamic password;
  int? otp;
  String? phoneNumber;
  List<dynamic>? userAttributes;
  String? id;
  String? mobile;
  String? pin;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UserData({
    this.name,
    this.password,
    this.otp,
    this.phoneNumber,
    this.userAttributes,
    this.id,
    this.mobile,
    this.pin,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["name"],
        password: json["password"],
        otp: json["otp"],
        phoneNumber: json["phoneNumber"],
        userAttributes: json["userAttributes"] == null
            ? []
            : List<dynamic>.from(json["userAttributes"]!.map((x) => x)),
        id: json["_id"],
        mobile: json["mobile"],
        pin: json["pin"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "otp": otp,
        "phoneNumber": phoneNumber,
        "userAttributes": userAttributes == null
            ? []
            : List<dynamic>.from(userAttributes!.map((x) => x)),
        "_id": id,
        "mobile": mobile,
        "pin": pin,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
