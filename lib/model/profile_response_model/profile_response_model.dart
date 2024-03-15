class ProfileDataResponseModel {
  String? status;
  UserData? data;

  ProfileDataResponseModel({
    this.status,
    this.data,
  });

  factory ProfileDataResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class UserData {
  String? id;
  String? name;
  String? password;
  String? phoneNumber;
  String? mobile;
  String? pin;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? expirationTime;
  int? expiresInMinutes;
  String? imageUrl;

  UserData({
    this.id,
    this.name,
    this.password,
    this.phoneNumber,
    this.mobile,
    this.pin,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.expirationTime,
    this.expiresInMinutes,
    this.imageUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        mobile: json["mobile"],
        pin: json["pin"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        expirationTime: json["expirationTime"],
        expiresInMinutes: json["expiresInMinutes"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "phoneNumber": phoneNumber,
        "mobile": mobile,
        "pin": pin,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "expirationTime": expirationTime,
        "expiresInMinutes": expiresInMinutes,
        "imageUrl": imageUrl,
      };
}