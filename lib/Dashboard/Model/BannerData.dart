// To parse this JSON data, do
//
//     final bannerData = bannerDataFromJson(jsonString);

import 'dart:convert';

BannerData bannerDataFromJson(String str) => BannerData.fromJson(json.decode(str));

String bannerDataToJson(BannerData data) => json.encode(data.toJson());

class BannerData {
  BannerData({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
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
    this.id,
    this.title,
    this.url,
    this.image,
  });

  String? id;
  String? title;
  String? url;
  String? image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "image": image,
  };
}
