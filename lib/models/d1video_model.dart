// To parse this JSON data, do
//
//     final d1VideosModel = d1VideosModelFromJson(jsonString);

import 'dart:convert';

List<D1VideosModel> d1VideosModelFromJson(String str) =>
    List<D1VideosModel>.from(
        json.decode(str).map((x) => D1VideosModel.fromJson(x)));

String d1VideosModelToJson(List<D1VideosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class D1VideosModel {
  String title;
  List<VideoList> videoList;

  D1VideosModel({
    required this.title,
    required this.videoList,
  });

  factory D1VideosModel.fromJson(Map<String, dynamic> json) => D1VideosModel(
        title: json["title"],
        videoList: List<VideoList>.from(
            json["video_list"].map((x) => VideoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "video_list": List<dynamic>.from(videoList.map((x) => x.toJson())),
      };
}

class VideoList {
  String viUrl;
  String viTitle;

  VideoList({
    required this.viUrl,
    required this.viTitle,
  });

  factory VideoList.fromJson(Map<String, dynamic> json) => VideoList(
        viUrl: json["vi_url"],
        viTitle: json["vi_title"],
      );

  Map<String, dynamic> toJson() => {
        "vi_url": viUrl,
        "vi_title": viTitle,
      };
}
