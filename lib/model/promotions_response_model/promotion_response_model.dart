class PromotionResponseModel {
  String? status;
  PromotionData? data;

  PromotionResponseModel({
    this.status,
    this.data,
  });

  factory PromotionResponseModel.fromJson(Map<String, dynamic> json) =>
      PromotionResponseModel(
        status: json["status"],
        data:
            json["data"] == null ? null : PromotionData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class PromotionData {
  List<PromotionItem>? items;
  int? totalItemsCount;

  PromotionData({
    this.items,
    this.totalItemsCount,
  });

  factory PromotionData.fromJson(Map<String, dynamic> json) => PromotionData(
        items: json["items"] == null
            ? []
            : List<PromotionItem>.from(json["items"]!.map((x) => PromotionItem.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
      };
}

class PromotionItem {
  String? id;
  int? groupId;
  String? name;
  String? description;
  String? imageUrl;
  String? link;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic shopNowButton;

  PromotionItem({
    this.id,
    this.groupId,
    this.name,
    this.description,
    this.imageUrl,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.shopNowButton,
  });

  factory PromotionItem.fromJson(Map<String, dynamic> json) => PromotionItem(
        id: json["_id"],
        groupId: json["groupId"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        link: json["link"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        shopNowButton: json["shop_now_button"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "groupId": groupId,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "link": link,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "shop_now_button": shopNowButton,
      };
}
