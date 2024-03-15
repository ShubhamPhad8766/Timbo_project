class JwtTokeResponseModel {
  String? id;
  String? name;
  String? password;
  int? otp;

  String? phoneNumber;
  String? mobile;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? iat;
  int? exp;

  JwtTokeResponseModel({
    this.id,
    this.name,
    this.password,
    this.otp,
    this.phoneNumber,
    this.mobile,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.iat,
    this.exp,
  });

  factory JwtTokeResponseModel.fromJson(Map<String, dynamic> json) =>
      JwtTokeResponseModel(
        id: json["_id"],
        name: json["name"],
        password: json["password"] ?? "",
        otp: json["otp"],
        phoneNumber: json["phoneNumber"],
        mobile: json["mobile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        iat: json["iat"],
        exp: json["exp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "otp": otp,
        "phoneNumber": phoneNumber,
        "mobile": mobile,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "iat": iat,
        "exp": exp,
      };
}
