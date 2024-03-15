class CalfRegistrationResponseModel {
    String? status;
    Data? data;

    CalfRegistrationResponseModel({
        this.status,
        this.data,
    });

    factory CalfRegistrationResponseModel.fromJson(Map<String, dynamic> json) => CalfRegistrationResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? groupId;
    CompetitionId? competitionId;
    String? id;
    String? userName;
    String? village;
    String? taluka;
    String? dist;
    List<CustomField>? customField;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.groupId,
        this.competitionId,
        this.id,
        this.userName,
        this.village,
        this.taluka,
        this.dist,
        this.customField,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        groupId: json["groupId"],
        competitionId: json["competitionId"] == null ? null : CompetitionId.fromJson(json["competitionId"]),
        id: json["_id"],
        userName: json["userName"],
        village: json["village"],
        taluka: json["taluka"],
        dist: json["dist"],
        customField: json["custom_field"] == null ? [] : List<CustomField>.from(json["custom_field"]!.map((x) => CustomField.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "competitionId": competitionId?.toJson(),
        "_id": id,
        "userName": userName,
        "village": village,
        "taluka": taluka,
        "dist": dist,
        "custom_field": customField == null ? [] : List<dynamic>.from(customField!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class CompetitionId {
    String? id;
    int? groupId;
    String? name;
    String? title;
    String? description;
    String? rules;
    String? facilities;
    String? time;
    int? competitionId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    CompetitionId({
        this.id,
        this.groupId,
        this.name,
        this.title,
        this.description,
        this.rules,
        this.facilities,
        this.time,
        this.competitionId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory CompetitionId.fromJson(Map<String, dynamic> json) => CompetitionId(
        id: json["_id"],
        groupId: json["groupId"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        rules: json["rules"],
        facilities: json["facilities"],
        time: json["time"],
        competitionId: json["competitionId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "groupId": groupId,
        "name": name,
        "title": title,
        "description": description,
        "rules": rules,
        "facilities": facilities,
        "time": time,
        "competitionId": competitionId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class CustomField {
    String? userMobile;
    String? mobileDoctor;
    String? calfCaste;
    String? calfDob;
    String? tagNo;
    String? weight;
    String? imageUrl;

    CustomField({
        this.userMobile,
        this.mobileDoctor,
        this.calfCaste,
        this.calfDob,
        this.tagNo,
        this.weight,
        this.imageUrl,
    });

    factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        userMobile: json["user_mobile"],
        mobileDoctor: json["mobile_doctor"],
        calfCaste: json["calf_caste"],
        calfDob: json["calf_dob"],
        tagNo: json["tag_no"],
        weight: json["weight"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "user_mobile": userMobile,
        "mobile_doctor": mobileDoctor,
        "calf_caste": calfCaste,
        "calf_dob": calfDob,
        "tag_no": tagNo,
        "weight": weight,
        "imageUrl": imageUrl,
    };
}
