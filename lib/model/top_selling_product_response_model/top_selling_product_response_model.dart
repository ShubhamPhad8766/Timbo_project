class TopSellingProductsResponseModel {
  String? status;
  Data? data;

  TopSellingProductsResponseModel({
    this.status,
    this.data,
  });

  factory TopSellingProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      TopSellingProductsResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  List<TopSellingItem>? items;
  int? totalItemsCount;

  Data({
    this.items,
    this.totalItemsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<TopSellingItem>.from(
                json["items"]!.map((x) => TopSellingItem.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
      };
}

class TopSellingItem {
  String? id;
  String? name;
  int? groupId;
  String? userId;
  int? code;
  String? slug;
  bool? sponsored;
  String? features;
  String? description;
  CategoryData? category;
  List<String>? tags;
  int? buyingPrice;
  int? discountedPrice;
  int? sellingPrice;
  int? marketPrice;
  List<String>? pictures;
  List<String>? mobilePictures;
  List<Variant>? variants;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  TopSellingItem({
    this.id,
    this.name,
    this.groupId,
    this.userId,
    this.code,
    this.slug,
    this.sponsored,
    this.features,
    this.description,
    this.category,
    this.tags,
    this.buyingPrice,
    this.discountedPrice,
    this.sellingPrice,
    this.marketPrice,
    this.pictures,
    this.mobilePictures,
    this.variants,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TopSellingItem.fromJson(Map<String, dynamic> json) => TopSellingItem(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        userId: json["userId"],
        code: json["code"],
        slug: json["slug"],
        sponsored: json["sponsored"],
        features: json["features"],
        description: json["description"],
        category: json["categoryId"] == null
            ? null
            : CategoryData.fromJson(json["categoryId"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        buyingPrice: json["buying_price"],
        discountedPrice: json["discounted_price"],
        sellingPrice: json["selling_price"],
        marketPrice: json["market_price"],
        pictures: json["pictures"] == null
            ? []
            : List<String>.from(json["pictures"]!.map((x) => x)),
        mobilePictures: json["mobile_pictures"] == null
            ? []
            : List<String>.from(json["mobile_pictures"]!.map((x) => x)),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
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
        "code": code,
        "slug": slug,
        "sponsored": sponsored,
        "features": features,
        "description": description,
        "categoryId": category?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "buying_price": buyingPrice,
        "discounted_price": discountedPrice,
        "selling_price": sellingPrice,
        "market_price": marketPrice,
        "pictures":
            pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
        "mobile_pictures": mobilePictures == null
            ? []
            : List<dynamic>.from(mobilePictures!.map((x) => x)),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Variant {
  String? type;
  String? type2;
  String? type3;
  String? type4;
  String? buyingPrice;
  String? discountedPrice;
  String? sellingPrice;
  String? marketPrice;

  Variant({
    this.type,
    this.type2,
    this.type3,
    this.type4,
    this.buyingPrice,
    this.discountedPrice,
    this.sellingPrice,
    this.marketPrice,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        type: json["type"],
        type2: json["type2"],
        type3: json["type3"],
        type4: json["type4"],
        buyingPrice: json["buying_price"],
        discountedPrice: json["discounted_price"],
        sellingPrice: json["selling_price"],
        marketPrice: json["market_price"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "type2": type2,
        "type3": type3,
        "type4": type4,
        "buying_price": buyingPrice,
        "discounted_price": discountedPrice,
        "selling_price": sellingPrice,
        "market_price": marketPrice,
      };
}

class CategoryData {
  String? id;
  String? name;
  int? groupId;
  String? userId;
  String? imageUrl;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryData({
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

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
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
