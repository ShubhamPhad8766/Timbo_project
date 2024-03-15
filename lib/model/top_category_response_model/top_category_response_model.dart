class TopCateogryResponseModel {
  String? status;
  Data? data;

  TopCateogryResponseModel({
    this.status,
    this.data,
  });

  factory TopCateogryResponseModel.fromJson(Map<String, dynamic> json) =>
      TopCateogryResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  List<CategoryItem>? items;
  int? totalItemsCount;

  Data({
    this.items,
    this.totalItemsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<CategoryItem>.from(
                json["items"]!.map((x) => CategoryItem.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
      };
}

class CategoryItem {
  String? id;
  String? name;
  int? groupId;
  String? userId;
  String? imageUrl;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryItem({
    this.id,
    this.name,
    this.groupId,
    this.userId,
    this.imageUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        userId: json["userId"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "groupId": groupId,
        "userId": userId,
        "imageUrl": imageUrl,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
