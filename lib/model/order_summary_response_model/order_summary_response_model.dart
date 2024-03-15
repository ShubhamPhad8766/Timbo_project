class OrderSummaryModel {
    String? status;
    ProductData? data;
    int? totalCartPrice;

    OrderSummaryModel({
        this.status,
        this.data,
        this.totalCartPrice,
    });

    factory OrderSummaryModel.fromJson(Map<String, dynamic> json) => OrderSummaryModel(
        status: json["status"],
        data: json["data"] == null ? null : ProductData.fromJson(json["data"]),
        totalCartPrice: json["totalCartPrice"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "totalCartPrice": totalCartPrice,
    };
}

class ProductData {
    String? id;
    DataUserId? userId;
    int? groupId;
    List<Product>? products;
    int? v;

    ProductData({
        this.id,
        this.userId,
        this.groupId,
        this.products,
        this.v,
    });

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["_id"],
        userId: json["userId"] == null ? null : DataUserId.fromJson(json["userId"]),
        groupId: json["groupId"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "groupId": groupId,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "__v": v,
    };
}

class Product {
    ProductId? productId;
    int? quantity;
    String? id;

    Product({
        this.productId,
        this.quantity,
        this.id,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"] == null ? null : ProductId.fromJson(json["productId"]),
        quantity: json["quantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId?.toJson(),
        "quantity": quantity,
        "_id": id,
    };
}

class ProductId {
    String? id;
    String? name;
    int? groupId;
    CategoryId? categoryId;
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
    int? v;
    int? quantity;

    ProductId({
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
        this.v,
        this.quantity,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        categoryId: json["categoryId"] == null ? null : CategoryId.fromJson(json["categoryId"]),
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
        v: json["__v"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "groupId": groupId,
        "categoryId": categoryId?.toJson(),
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
        "__v": v,
        "quantity": quantity,
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

class DataUserId {
    String? id;
    UserData? userId;
    int? v;
    List<Address>? addresses;
    String? phoneNo;

    DataUserId({
        this.id,
        this.userId,
        this.v,
        this.addresses,
        this.phoneNo,
    });

    factory DataUserId.fromJson(Map<String, dynamic> json) => DataUserId(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserData.fromJson(json["userId"]),
        v: json["__v"],
        addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
        phoneNo: json["phoneNo"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "__v": v,
        "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "phoneNo": phoneNo,
    };
}

class Address {
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
    String? gender;
    String? name;
    String? phone;
    String? post;
    String? remarks;

    Address({
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
        this.gender,
        this.name,
        this.phone,
        this.post,
        this.remarks,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
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
        gender: json["gender"],
        name: json["name"],
        phone: json["phone"],
        post: json["post"],
        remarks: json["remarks"],
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
        "gender": gender,
        "name": name,
        "phone": phone,
        "post": post,
        "remarks": remarks,
    };
}

class UserData {
    String? id;
    String? name;
    String? password;
    String? phoneNumber;
    String? mobile;
    String? pin;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? expirationTime;
    int? expiresInMinutes;

    UserData({
        this.id,
        this.name,
        this.password,
        this.phoneNumber,
        this.mobile,
        this.pin,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.expirationTime,
        this.expiresInMinutes,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        mobile: json["mobile"],
        pin: json["pin"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        expirationTime: json["expirationTime"],
        expiresInMinutes: json["expiresInMinutes"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "phoneNumber": phoneNumber,
        "mobile": mobile,
        "pin": pin,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "expirationTime": expirationTime,
        "expiresInMinutes": expiresInMinutes,
    };
}
