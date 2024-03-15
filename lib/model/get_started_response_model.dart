class GetStartedResponseModel {
  String? status;
  Data? data;

  GetStartedResponseModel({
    this.status,
    this.data,
  });

  factory GetStartedResponseModel.fromJson(Map<String, dynamic> json) =>
      GetStartedResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? name;
  String? shortName;
  String? userId;
  String? logoUrl;
  String? mobileLogoUrl;
  String? mobileCoverImage;
  String? coverUrl;
  String? coverVideo;
  String? location;
  String? type;
  String? email;
  String? phone;
  String? color;
  String? description;
  List<BannerData>? banners;
  String? childGroupId;
  int? groupId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.name,
    this.shortName,
    this.userId,
    this.logoUrl,
    this.mobileLogoUrl,
    this.mobileCoverImage,
    this.coverUrl,
    this.coverVideo,
    this.location,
    this.type,
    this.email,
    this.phone,
    this.color,
    this.description,
    this.banners,
    this.childGroupId,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        shortName: json["shortName"],
        userId: json["user_id"],
        logoUrl: json["logo_url"],
        mobileLogoUrl: json["mobile_logo_url"],
        mobileCoverImage: json["mobile_cover_image"],
        coverUrl: json["cover_url"],
        coverVideo: json["cover_video"],
        location: json["location"],
        type: json["type"],
        email: json["email"],
        phone: json["phone"],
        color: json["color"],
        description: json["description"],
        banners: json["banners"] == null
            ? []
            : List<BannerData>.from(
                json["banners"]!.map((x) => BannerData.fromJson(x))),
        childGroupId: json["childGroupId"],
        groupId: json["groupId"],
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
        "shortName": shortName,
        "user_id": userId,
        "logo_url": logoUrl,
        "mobile_logo_url": mobileLogoUrl,
        "mobile_cover_image": mobileCoverImage,
        "cover_url": coverUrl,
        "cover_video": coverVideo,
        "location": location,
        "type": type,
        "email": email,
        "phone": phone,
        "color": color,
        "description": description,
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "childGroupId": childGroupId,
        "groupId": groupId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class BannerData {
  String? image;
  String? title;
  String? subtitle;

  BannerData({
    this.image,
    this.title,
    this.subtitle,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        image: json["image"],
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subtitle": subtitle,
      };
}
