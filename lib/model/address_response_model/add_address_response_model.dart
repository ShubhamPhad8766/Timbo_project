
class AddAddressResponseModel {
    String? status;
    List<AddAddressModel>? data;
    String? message;

    AddAddressResponseModel({
        this.status,
        this.data,
        this.message,
    });

    factory AddAddressResponseModel.fromJson(Map<String, dynamic> json) => AddAddressResponseModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<AddAddressModel>.from(json["data"]!.map((x) => AddAddressModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
    };
}

class AddAddressModel {
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

    AddAddressModel({
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
    });

    factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
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
    };
}
