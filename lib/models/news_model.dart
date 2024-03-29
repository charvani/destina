// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  int sno;
  String eventid;
  String title;
  String country;
  String category;
  String descr;
  String url;
  String adDate;
  String shortCode;
  String categorySlugUrl;
  String slugUrl;
  String imagename;

  NewsModel({
    required this.sno,
    required this.eventid,
    required this.title,
    required this.country,
    required this.category,
    required this.descr,
    required this.url,
    required this.adDate,
    required this.shortCode,
    required this.categorySlugUrl,
    required this.slugUrl,
    required this.imagename,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        sno: json["sno"],
        eventid: json["eventid"],
        title: json["title"],
        country: json["country"],
        category: json["category"],
        descr: json["Descr"],
        url: json["Url"],
        adDate: json["AdDate"],
        shortCode: json["ShortCode"],
        categorySlugUrl: json["categorySlugUrl"],
        slugUrl: json["slugUrl"],
        imagename: json["imagename"],
      );

  Map<String, dynamic> toJson() => {
        "sno": sno,
        "eventid": eventid,
        "title": title,
        "country": country,
        "category": category,
        "Descr": descr,
        "Url": url,
        "AdDate": adDate,
        "ShortCode": shortCode,
        "categorySlugUrl": categorySlugUrl,
        "slugUrl": slugUrl,
        "imagename": imagename,
      };
}
