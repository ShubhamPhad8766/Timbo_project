class FavoriteCategoryResponseModel {
  String? status;
  FavoriteData? data;

  FavoriteCategoryResponseModel({
    this.status,
    this.data,
  });

  factory FavoriteCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      FavoriteCategoryResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : FavoriteData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data?.toMap(),
      };
}

class FavoriteData {
  List<FavoriteItem>? items;
  int? totalItemsCount;

  FavoriteData({
    this.items,
    this.totalItemsCount,
  });

  factory FavoriteData.fromMap(Map<String, dynamic> json) => FavoriteData(
        items: json["items"] == null
            ? []
            : List<FavoriteItem>.from(json["items"]!.map((x) => FavoriteItem.fromMap(x))),
        totalItemsCount: json["totalItemsCount"],
      );

  Map<String, dynamic> toMap() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "totalItemsCount": totalItemsCount,
      };
}

class FavoriteItem {
  String? id;
  String? name;
  int? groupId;
  String? userId;
  String? imageUrl;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? isSelected =false;

  FavoriteItem({
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

  factory FavoriteItem.fromMap(Map<String, dynamic> json) => FavoriteItem(
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

  Map<String, dynamic> toMap() => {
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
