// To parse this JSON data, do
//
//     final cowCompetitionResponseModel = cowCompetitionResponseModelFromJson(jsonString);

import 'dart:convert';

CowCompetitionResponseModel cowCompetitionResponseModelFromJson(String str) => CowCompetitionResponseModel.fromJson(json.decode(str));

String cowCompetitionResponseModelToJson(CowCompetitionResponseModel data) => json.encode(data.toJson());

class CowCompetitionResponseModel {
    String? status;
    Data? data;

    CowCompetitionResponseModel({
        this.status,
        this.data,
    });

    factory CowCompetitionResponseModel.fromJson(Map<String, dynamic> json) => CowCompetitionResponseModel(
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
    int? groupId;
    CompetitionId? competitionId;
    String? userName;
    String? village;
    String? taluka;
    String? dist;
    int? userMobile;
    int? doctorMobile;
    List<CustomField>? customField;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.id,
        this.groupId,
        this.competitionId,
        this.userName,
        this.village,
        this.taluka,
        this.dist,
        this.userMobile,
        this.doctorMobile,
        this.customField,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        groupId: json["groupId"],
        competitionId: json["competitionId"] == null ? null : CompetitionId.fromJson(json["competitionId"]),
        userName: json["userName"],
        village: json["village"],
        taluka: json["taluka"],
        dist: json["dist"],
        userMobile: json["user_mobile"],
        doctorMobile: json["doctor_mobile"],
        customField: json["custom_field"] == null ? [] : List<CustomField>.from(json["custom_field"]!.map((x) => CustomField.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "groupId": groupId,
        "competitionId": competitionId?.toJson(),
        "userName": userName,
        "village": village,
        "taluka": taluka,
        "dist": dist,
        "user_mobile": userMobile,
        "doctor_mobile": doctorMobile,
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
        "time": time,
        "competitionId": competitionId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class CustomField {
    String? cowCaste;
    String? milkCapacity;
    int? tagNo;
    String? weight;
    String? condition;
    String? imageUrl;

    CustomField({
        this.cowCaste,
        this.milkCapacity,
        this.tagNo,
        this.weight,
        this.condition,
        this.imageUrl,
    });

    factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        cowCaste: json["cow_caste"],
        milkCapacity: json["milk_capacity"],
        tagNo: json["tag_no"],
        weight: json["weight"],
        condition: json["condition"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "cow_caste": cowCaste,
        "milk_capacity": milkCapacity,
        "tag_no": tagNo,
        "weight": weight,
        "condition": condition,
        "imageUrl": imageUrl,
    };
}
