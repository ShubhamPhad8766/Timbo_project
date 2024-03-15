class DefaultAddressResponseModel {
    String? status;
    AddressModel? data;

    DefaultAddressResponseModel({
        this.status,
        this.data,
    });

    factory DefaultAddressResponseModel.fromJson(Map<String, dynamic> json) => DefaultAddressResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : AddressModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class AddressModel {
    String? id;
    String? tag;
    String? street;
    String? locality;
    String? state;
    String? city;
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
        this.state,
        this.city,
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
        state: json["state"],
        city: json["city"],
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
        "state": state,
        "city": city,
        "zip": zip,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "isdefault": isdefault,
    };
}
