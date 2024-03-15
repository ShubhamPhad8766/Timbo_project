
class CartResponseModel {
  String? status;
  Data? data;
  int? totalCartPrice;

  CartResponseModel({
    this.status,
    this.data,
    this.totalCartPrice,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) => CartResponseModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    totalCartPrice: json["totalCartPrice"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "totalCartPrice": totalCartPrice,
  };
}

class Data {
  String? id;
  String? userId;
  int? groupId;
  List<Product>? products;
  DateTime? createdAt;
  DateTime? updatedAt;


  Data({
    this.id,
    this.userId,
    this.groupId,
    this.products,
    this.createdAt,
    this.updatedAt,

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userId: json["userId"],
    groupId: json["groupId"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),

  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "groupId": groupId,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Product {
  ProductData? productId;
  int? quantity;
  String? id;

  Product({
    this.productId,
    this.quantity,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"] == null ? null : ProductData.fromJson(json["productId"]),
    quantity: json["quantity"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId?.toJson(),
    "quantity": quantity,
    "_id": id,
  };
}

class ProductData {
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? quantity;
  int? code;

  ProductData({
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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.quantity,
    this.code,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["_id"],
    name: json["name"],
    groupId: json["groupId"],
    categoryId: json["categoryId"] == null ? null : CategoryId.fromJson(json["categoryId"]),
    userId: json["userId"],
    slug: json["slug"],
    sponsored: json["sponsored"],
    features: json["features"],
    description: json["description"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    buyingPrice: json["buying_price"],
    discountedPrice: json["discounted_price"],
    sellingPrice: json["selling_price"],
    marketPrice: json["market_price"],
    pictures: json["pictures"] == null ? [] : List<String>.from(json["pictures"]!.map((x) => x)),
    mobilePictures: json["mobile_pictures"] == null ? [] : List<String>.from(json["mobile_pictures"]!.map((x) => x)),
    variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "buying_price": buyingPrice,
    "discounted_price": discountedPrice,
    "selling_price": sellingPrice,
    "market_price": marketPrice,
    "pictures": pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
    "mobile_pictures": mobilePictures == null ? [] : List<dynamic>.from(mobilePictures!.map((x) => x)),
    "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
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
    this.createdAt,
    this.updatedAt,
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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
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
