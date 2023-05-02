// To parse this JSON data, do
//
//     final stateName = stateNameFromJson(jsonString);

import 'dart:convert';

StateName stateNameFromJson(String str) => StateName.fromJson(json.decode(str));

String stateNameToJson(StateName data) => json.encode(data.toJson());

class StateName {
  StateName({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory StateName.fromJson(Map<String, dynamic> json) => StateName(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.stateId,
    this.stateTitle,
  });

  String? stateId;
  String? stateTitle;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    stateId: json["state_id"],
    stateTitle: json["state_title"],
  );

  Map<String, dynamic> toJson() => {
    "state_id": stateId,
    "state_title": stateTitle,
  };
}
