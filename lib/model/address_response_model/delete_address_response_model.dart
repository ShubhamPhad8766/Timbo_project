class DeleteAddressResponseModel {
    String? status;
    DeleteAddress? data;
    String? message;

    DeleteAddressResponseModel({
        this.status,
        this.data,
        this.message,
    });

    factory DeleteAddressResponseModel.fromJson(Map<String, dynamic> json) => DeleteAddressResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : DeleteAddress.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
    };
}

class DeleteAddress {
    String? id;
    UserId? userId;
    int? v;
    List<String>? addresses;
    DateTime? createdAt;
    String? phoneNo;
    DateTime? updatedAt;
    String? city;
    String? locality;
    String? state;
    String? street;
    String? tag;
    String? zip;

    DeleteAddress({
        this.id,
        this.userId,
        this.v,
        this.addresses,
        this.createdAt,
        this.phoneNo,
        this.updatedAt,
        this.city,
        this.locality,
        this.state,
        this.street,
        this.tag,
        this.zip,
    });

    factory DeleteAddress.fromJson(Map<String, dynamic> json) => DeleteAddress(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        v: json["__v"],
        addresses: json["addresses"] == null ? [] : List<String>.from(json["addresses"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        phoneNo: json["phoneNo"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        city: json["city"],
        locality: json["locality"],
        state: json["state"],
        street: json["street"],
        tag: json["tag"],
        zip: json["zip"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "__v": v,
        "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "phoneNo": phoneNo,
        "updatedAt": updatedAt?.toIso8601String(),
        "city": city,
        "locality": locality,
        "state": state,
        "street": street,
        "tag": tag,
        "zip": zip,
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
