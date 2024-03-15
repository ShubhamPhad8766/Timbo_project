
class BarCodeResponseModel {
    String? status;
    ProductDataInBarcode? data;

    BarCodeResponseModel({
        this.status,
        this.data,
    });

    factory BarCodeResponseModel.fromJson(Map<String, dynamic> json) => BarCodeResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : ProductDataInBarcode.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class ProductDataInBarcode {
    String? id;
    String? name;
    int? groupId;
    dynamic categoryId;
    String? userId;
    String? slug;
    int? code;
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
    String? productcode;

    ProductDataInBarcode({
        this.id,
        this.name,
        this.groupId,
        this.categoryId,
        this.userId,
        this.slug,
        this.code,
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
        this.productcode,
    });

    factory ProductDataInBarcode.fromJson(Map<String, dynamic> json) => ProductDataInBarcode(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        userId: json["userId"],
        slug: json["slug"],
        code: json["code"],
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
        productcode: json["productcode"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "groupId": groupId,
        "categoryId": categoryId,
        "userId": userId,
        "slug": slug,
        "code": code,
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
        "productcode": productcode,
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
