import 'package:timbo/model/cart_response_model/cart_response_model.dart';

class AddToCartResponseModel {
  String? status;
  Data? data;

  AddToCartResponseModel({
    this.status,
    this.data,
  });

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) =>
      AddToCartResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Product? product;
  int? groupId;
  String? id;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.product,
    this.groupId,
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: json["productId"] == null
            ? null
            : Product.fromJson(json["productId"]),
        groupId: json["groupId"],
        id: json["_id"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "productId": product?.toJson(),
        "groupId": groupId,
        "_id": id,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

