// To parse this JSON data, do
//
//     final newsDetailsModel = newsDetailsModelFromJson(jsonString);

import 'dart:convert';

NewsDetailsModel newsDetailsModelFromJson(String str) =>
    NewsDetailsModel.fromJson(json.decode(str));

String newsDetailsModelToJson(NewsDetailsModel data) =>
    json.encode(data.toJson());

class NewsDetailsModel {
  List<NewsRpt> newsRpt;
  List<NewsImagesRpt> newsImagesRpt;
  String msg;
  String message;
  bool found;

  NewsDetailsModel({
    required this.newsRpt,
    required this.newsImagesRpt,
    required this.msg,
    required this.message,
    required this.found,
  });

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) =>
      NewsDetailsModel(
        newsRpt:
            List<NewsRpt>.from(json["newsRpt"].map((x) => NewsRpt.fromJson(x))),
        newsImagesRpt: List<NewsImagesRpt>.from(
            json["NewsImagesRpt"].map((x) => NewsImagesRpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        found: json["Found"],
      );

  Map<String, dynamic> toJson() => {
        "newsRpt": List<dynamic>.from(newsRpt.map((x) => x.toJson())),
        "NewsImagesRpt":
            List<dynamic>.from(newsImagesRpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "Found": found,
      };
}

class NewsImagesRpt {
  int slno;
  String url;
  String thumbUrl;
  String eventId;
  String pageNAme;

  NewsImagesRpt({
    required this.slno,
    required this.url,
    required this.thumbUrl,
    required this.eventId,
    required this.pageNAme,
  });

  factory NewsImagesRpt.fromJson(Map<String, dynamic> json) => NewsImagesRpt(
        slno: json["Slno"],
        url: json["url"],
        thumbUrl: json["thumbUrl"],
        eventId: json["eventID"],
        pageNAme: json["pageNAme"],
      );

  Map<String, dynamic> toJson() => {
        "Slno": slno,
        "url": url,
        "thumbUrl": thumbUrl,
        "eventID": eventId,
        "pageNAme": pageNAme,
      };
}

class NewsRpt {
  int sno;
  String title;
  String imgPath;
  String descr;
  String url;
  String adDate;
  String slugUrl;

  NewsRpt({
    required this.sno,
    required this.title,
    required this.imgPath,
    required this.descr,
    required this.url,
    required this.adDate,
    required this.slugUrl,
  });

  factory NewsRpt.fromJson(Map<String, dynamic> json) => NewsRpt(
        sno: json["sno"],
        title: json["title"],
        imgPath: json["ImgPath"],
        descr: json["Descr"],
        url: json["Url"],
        adDate: json["AdDate"],
        slugUrl: json["slugUrl"],
      );

  Map<String, dynamic> toJson() => {
        "sno": sno,
        "title": title,
        "ImgPath": imgPath,
        "Descr": descr,
        "Url": url,
        "AdDate": adDate,
        "slugUrl": slugUrl,
      };
}
