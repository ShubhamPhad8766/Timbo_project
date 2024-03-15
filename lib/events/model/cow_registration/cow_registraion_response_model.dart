

class CowRegistrationResponseModel {
    int? groupId;
    String? competitionId;
    String? userName;
    String? village;
    String? taluka;
    String? dist;
    List<CustomField>? customField;

    CowRegistrationResponseModel({
        this.groupId,
        this.competitionId,
        this.userName,
        this.village,
        this.taluka,
        this.dist,
        this.customField,
    });

    factory CowRegistrationResponseModel.fromJson(Map<String, dynamic> json) => CowRegistrationResponseModel(
        groupId: json["groupId"],
        competitionId: json["competitionId"],
        userName: json["userName"],
        village: json["village"],
        taluka: json["taluka"],
        dist: json["dist"],
        customField: json["custom_field"] == null ? [] : List<CustomField>.from(json["custom_field"]!.map((x) => CustomField.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "competitionId": competitionId,
        "userName": userName,
        "village": village,
        "taluka": taluka,
        "dist": dist,
        "custom_field": customField == null ? [] : List<dynamic>.from(customField!.map((x) => x.toJson())),
    };
}

class CustomField {
    int? userMobile;
    int? mobileDoctor;
    String? cowCaste;
    String? milkLiter;
    String? cowType;
    int? tagNo;
    String? imageUrl;

    CustomField({
        this.userMobile,
        this.mobileDoctor,
        this.cowCaste,
        this.milkLiter,
        this.cowType,
        this.tagNo,
        this.imageUrl,
    });

    factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        userMobile: json["user_mobile"],
        mobileDoctor: json["mobile_doctor"],
        cowCaste: json["cow_caste"],
        milkLiter: json["milk_liter"],
        cowType: json["cow_type"],
        tagNo: json["tag_no"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "user_mobile": userMobile,
        "mobile_doctor": mobileDoctor,
        "cow_caste": cowCaste,
        "milk_liter": milkLiter,
        "cow_type": cowType,
        "tag_no": tagNo,
        "imageUrl": imageUrl,
    };
}