// To parse this JSON data, do
//
//     final calfCompetitionResponseModel = calfCompetitionResponseModelFromJson(jsonString);

import 'dart:convert';

CalfCompetitionResponseModel calfCompetitionResponseModelFromJson(String str) => CalfCompetitionResponseModel.fromJson(json.decode(str));

String calfCompetitionResponseModelToJson(CalfCompetitionResponseModel data) => json.encode(data.toJson());

class CalfCompetitionResponseModel {
    String? status;
    Data? data;

    CalfCompetitionResponseModel({
        this.status,
        this.data,
    });

    factory CalfCompetitionResponseModel.fromJson(Map<String, dynamic> json) => CalfCompetitionResponseModel(
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
    String? name;
    String? title;
    String? description;
    String? rules;
    String? time;
    int? competitionId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
