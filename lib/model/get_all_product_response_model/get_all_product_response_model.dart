class ProductListResponseModel {
  String? status;
  Data? data;

  ProductListResponseModel({
    this.status,
    this.data,
  });

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductListResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  List<ProductList>? items;
  int? totalItemsCount;

  Data({
    this.items,
    this.totalItemsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<ProductList>.from(
            json["items"].map((x) => ProductList.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
      };
}

class ProductList {
  String? id;
  String? name;
  int? groupId;
  CategoryId? categoryId;
  String? userId;
  String? slug;
  bool? sponsored;
  String? features;
  String? description;
  List<String>? tags;
  int? buyingPrice;
  int? discountedPrice;
  int? sellingPrice;
  int? marketPrice;
  List<String>? pictures;
  List<String>? mobilePictures;
  List<Variant>? variants;
  int? v;
  int? quantity;
  int? code;

  ProductList({
    this.id,
    this.name,
    this.groupId,
    this.categoryId,
    this.userId,
    this.slug,
    this.sponsored,
    this.features,
    this.description,
    this.tags,
    this.buyingPrice,
    this.discountedPrice,
    this.sellingPrice,
    this.marketPrice,
    this.pictures,
    this.mobilePictures,
    this.variants,
    this.v,
    this.quantity,
    this.code,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        categoryId: CategoryId.fromJson(json["categoryId"]),
        userId: json["userId"],
        slug: json["slug"],
        sponsored: json["sponsored"],
        features: json["features"],
        description: json["description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        buyingPrice: json["buying_price"],
        discountedPrice: json["discounted_price"],
        sellingPrice: json["selling_price"],
        marketPrice: json["market_price"],
        pictures: List<String>.from(json["pictures"].map((x) => x)),
        mobilePictures:
            List<String>.from(json["mobile_pictures"].map((x) => x)),
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        v: json["__v"],
        quantity: json["quantity"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "groupId": groupId,
        "categoryId": categoryId?.toJson(),
        "userId": userId,
        "slug": slug,
        "sponsored": sponsored,
        "features": features,
        "description": description,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "buying_price": buyingPrice,
        "discounted_price": discountedPrice,
        "selling_price": sellingPrice,
        "market_price": marketPrice,
        "pictures": List<dynamic>.from(pictures!.map((x) => x)),
        "mobile_pictures": List<dynamic>.from(mobilePictures!.map((x) => x)),
        "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
        "__v": v,
        "quantity": quantity,
        "code": code,
      };
}

class CategoryId {
  String? id;
  String? name;
  int? groupId;
  String? userId;
  bool? subcategory;
  String? imageUrl;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryId({
    this.id,
    this.name,
    this.groupId,
    this.userId,
    this.subcategory,
    this.imageUrl,
    this.description,
    this.v,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        userId: json["userId"],
        subcategory: json["subcategory"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "groupId": groupId,
        "userId": userId,
        "subcategory": subcategory,
        "imageUrl": imageUrl,
        "description": description,
        "__v": v,
      };
}

class Variant {
  String? type;
  String? buyingPrice;
  String? discountedPrice;
  String? sellingPrice;
  String? marketPrice;

  Variant({
    this.type,
    this.buyingPrice,
    this.discountedPrice,
    this.sellingPrice,
    this.marketPrice,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        type: json["type"],
        buyingPrice: json["buying_price"],
        discountedPrice: json["discounted_price"],
        sellingPrice: json["selling_price"],
        marketPrice: json["market_price"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "buying_price": buyingPrice,
        "discounted_price": discountedPrice,
        "selling_price": sellingPrice,
        "market_price": marketPrice,
      };
}
