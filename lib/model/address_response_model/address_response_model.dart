// To parse this JSON data, do
//
//     final addressResponseModel = addressResponseModelFromJson(jsonString);

import 'dart:convert';

AddressResponseModel addressResponseModelFromJson(String str) => AddressResponseModel.fromJson(json.decode(str));

String addressResponseModelToJson(AddressResponseModel data) => json.encode(data.toJson());

class AddressResponseModel {
    String? status;
    UserData? data;

    AddressResponseModel({
        this.status,
        this.data,
    });

    factory AddressResponseModel.fromJson(Map<String, dynamic> json) => AddressResponseModel(
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
    UserId? userId;
    int? v;
    List<AddressModel>? addresses;
    DateTime? createdAt;
    String? phoneNo;
    DateTime? updatedAt;

    UserData({
        this.id,
        this.userId,
        this.v,
        this.addresses,
        this.createdAt,
        this.phoneNo,
        this.updatedAt,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        v: json["__v"],
        addresses: json["addresses"] == null ? [] : List<AddressModel>.from(json["addresses"]!.map((x) => AddressModel.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        phoneNo: json["phoneNo"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "__v": v,
        "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "phoneNo": phoneNo,
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class AddressModel {
    String? id;
    String? tag;
    String? street;
    String? locality;
    String? city;
    String? state;
    String? zip;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    bool? isdefault;

    AddressModel({
        this.id,
        this.tag,
        this.street,
        this.locality,
        this.city,
        this.state,
        this.zip,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.isdefault,
    });

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["_id"],
        tag: json["tag"],
        street: json["street"],
        locality: json["locality"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        isdefault: json["isdefault"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "tag": tag,
        "street": street,
        "locality": locality,
        "city": city,
        "state": state,
        "zip": zip,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "isdefault": isdefault,
    };
}

class UserId {
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

    UserId({
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
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        mobile: json["mobile"],
        pin: json["pin"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        expirationTime: json["expirationTime"],
        expiresInMinutes: json["expiresInMinutes"],
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
    };
}
