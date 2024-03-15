class CompanyDetailsResponseModel {
  String? status;
  Data? data;
  String? message;

  CompanyDetailsResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory CompanyDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      CompanyDetailsResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? id;
  String? name;
  String? shortName;
  int? groupId;
  String? userId;
  String? type;
  List<String>? parentId;
  String? logoUrl;
  String? mobileLogoUrl;
  String? mobileCoverImage;
  String? coverUrl;
  String? coverVideo;
  String? location;
  String? email;
  String? phone;
  String? color;
  String? description;
  List<BannerData>? banners;
  LegalInfo? legalInfo;
  List<Admin>? admins;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.name,
    this.shortName,
    this.groupId,
    this.userId,
    this.type,
    this.parentId,
    this.logoUrl,
    this.mobileLogoUrl,
    this.mobileCoverImage,
    this.coverUrl,
    this.coverVideo,
    this.location,
    this.email,
    this.phone,
    this.color,
    this.description,
    this.banners,
    this.legalInfo,
    this.admins,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        shortName: json["shortName"],
        groupId: json["groupId"],
        userId: json["user_id"],
        type: json["type"],
        parentId: json["parentId"] == null
            ? []
            : List<String>.from(json["parentId"]!.map((x) => x)),
        logoUrl: json["logo_url"],
        mobileLogoUrl: json["mobile_logo_url"],
        mobileCoverImage: json["mobile_cover_image"],
        coverUrl: json["cover_url"],
        coverVideo: json["cover_video"],
        location: json["location"],
        email: json["email"],
        phone: json["phone"],
        color: json["color"],
        description: json["description"],
        banners: json["banners"] == null
            ? []
            : List<BannerData>.from(
                json["banners"]!.map((x) => BannerData.fromJson(x))),
        legalInfo: json["legal_info"] == null
            ? null
            : LegalInfo.fromJson(json["legal_info"]),
        admins: json["admins"] == null
            ? []
            : List<Admin>.from(json["admins"]!.map((x) => Admin.fromJson(x))),
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
        "groupId": groupId,
        "user_id": userId,
        "type": type,
        "parentId":
            parentId == null ? [] : List<dynamic>.from(parentId!.map((x) => x)),
        "logo_url": logoUrl,
        "mobile_logo_url": mobileLogoUrl,
        "mobile_cover_image": mobileCoverImage,
        "cover_url": coverUrl,
        "cover_video": coverVideo,
        "location": location,
        "email": email,
        "phone": phone,
        "color": color,
        "description": description,
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "legal_info": legalInfo?.toJson(),
        "admins": admins == null
            ? []
            : List<dynamic>.from(admins!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Admin {
  String? id;
  String? name;
  String? profileUrl;

  Admin({
    this.id,
    this.name,
    this.profileUrl,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["_id"],
        name: json["name"],
        profileUrl: json["profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "profile_url": profileUrl,
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

class LegalInfo {
  String? gst;
  String? pan;
  String? legalName;

  LegalInfo({
    this.gst,
    this.pan,
    this.legalName,
  });

  factory LegalInfo.fromJson(Map<String, dynamic> json) => LegalInfo(
        gst: json["gst"],
        pan: json["pan"],
        legalName: json["legal_name"],
      );

  Map<String, dynamic> toJson() => {
        "gst": gst,
        "pan": pan,
        "legal_name": legalName,
      };
}
