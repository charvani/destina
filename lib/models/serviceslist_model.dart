// To parse this JSON data, do
//
//     final servicesListModel = servicesListModelFromJson(jsonString);

import 'dart:convert';

ServicesListModel servicesListModelFromJson(String str) =>
    ServicesListModel.fromJson(json.decode(str));

String servicesListModelToJson(ServicesListModel data) =>
    json.encode(data.toJson());

class ServicesListModel {
  String title;
  String date;
  String descrption;
  String downloadLink;

  ServicesListModel({
    required this.title,
    required this.date,
    required this.descrption,
    required this.downloadLink,
  });

  factory ServicesListModel.fromJson(Map<String, dynamic> json) =>
      ServicesListModel(
        title: json["Title"],
        date: json["Date"],
        descrption: json["Descrption"],
        downloadLink: json["DownloadLink"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Date": date,
        "Descrption": descrption,
        "DownloadLink": downloadLink,
      };
}
