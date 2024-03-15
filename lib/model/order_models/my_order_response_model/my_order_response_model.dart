class MyOrderResponseModel {
    String? status;
    MyOrder? data;

    MyOrderResponseModel({
        this.status,
        this.data,
    });

    factory MyOrderResponseModel.fromJson(Map<String, dynamic> json) => MyOrderResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : MyOrder.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class MyOrder {
    List<MyOrderModel>? items;
    int? totalItemsCount;

    MyOrder({
        this.items,
        this.totalItemsCount,
    });

    factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        items: json["items"] == null ? [] : List<MyOrderModel>.from(json["items"]!.map((x) => MyOrderModel.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
    };
}

class MyOrderModel {
    String? id;
    int? groupId;
    List<dynamic>? products;
    bool? paid;
    int? orderId;
    String? status;
    dynamic totalAmount;
    String? currency;
    String? date;
    String? source;
    PaymentInfo? paymentInfo;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    DeliveryInfo? deliveryInfo;
    String? userId;
    String? name;

    MyOrderModel({
        this.id,
        this.groupId,
        this.products,
        this.paid,
        this.orderId,
        this.status,
        this.totalAmount,
        this.currency,
        this.date,
        this.source,
        this.paymentInfo,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.deliveryInfo,
        this.userId,
        this.name,
    });

    factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
        id: json["_id"],
        groupId: json["groupId"],
        products: json["products"] == null ? [] : List<dynamic>.from(json["products"]!.map((x) => x)),
        paid: json["paid"],
        orderId: json["orderId"],
        status: json["status"],
        totalAmount: json["total_amount"],
        currency: json["currency"],
        date: json["date"],
        source: json["source"],
        paymentInfo: json["paymentInfo"] == null ? null : PaymentInfo.fromJson(json["paymentInfo"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        deliveryInfo: json["delivery_info"] == null ? null : DeliveryInfo.fromJson(json["delivery_info"]),
        userId: json["userId"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "groupId": groupId,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "paid": paid,
        "orderId": orderId,
        "status": status,
        "total_amount": totalAmount,
        "currency": currency,
        "date": date,
        "source": source,
        "paymentInfo": paymentInfo?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "delivery_info": deliveryInfo?.toJson(),
        "userId": userId,
        "name": name,
    };
}

class DeliveryInfo {
    ShippingAddress? shippingAddress;

    DeliveryInfo({
        this.shippingAddress,
    });

    factory DeliveryInfo.fromJson(Map<String, dynamic> json) => DeliveryInfo(
        shippingAddress: json["shipping_address"] == null ? null : ShippingAddress.fromJson(json["shipping_address"]),
    );

    Map<String, dynamic> toJson() => {
        "shipping_address": shippingAddress?.toJson(),
    };
}

class ShippingAddress {
    String? id;
    String? street;
    String? locality;
    String? city;
    String? state;
    dynamic zip;

    ShippingAddress({
        this.id,
        this.street,
        this.locality,
        this.city,
        this.state,
        this.zip,
    });

    factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
        id: json["id"],
        street: json["street"],
        locality: json["locality"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "street": street,
        "locality": locality,
        "city": city,
        "state": state,
        "zip": zip,
    };
}

class PaymentInfo {
    String? mode;

    PaymentInfo({
        this.mode,
    });

    factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
        mode: json["mode"],
    );

    Map<String, dynamic> toJson() => {
        "mode": mode,
    };
}

class ProductClass {
    ProductId? productId;
    int? quantity;
    String? id;

    ProductClass({
        this.productId,
        this.quantity,
        this.id,
    });

    factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
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
