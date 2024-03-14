import 'dart:convert';

TestimonialModel testimonialModelFromJson(String str) =>
    TestimonialModel.fromJson(json.decode(str));

String testimonialModelToJson(TestimonialModel data) =>
    json.encode(data.toJson());

class TestimonialModel {
  int sno;
  String name;
  String title;
  String tImage;
  String descr;
  String videoUrl;
  dynamic youtubeId;
  String addedby;

  TestimonialModel({
    required this.sno,
    required this.name,
    required this.title,
    required this.tImage,
    required this.descr,
    required this.videoUrl,
    required this.youtubeId,
    required this.addedby,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) =>
      TestimonialModel(
        sno: json["sno"],
        name: json["name"],
        title: json["Title"],
        tImage: json["TImage"],
        descr: json["descr"],
        videoUrl: json["VideoUrl"],
        youtubeId: json["youtubeID"],
        addedby: json["Addedby"],
      );

  Map<String, dynamic> toJson() => {
        "sno": sno,
        "name": name,
        "Title": title,
        "TImage": tImage,
        "descr": descr,
        "VideoUrl": videoUrl,
        "youtubeID": youtubeId,
        "Addedby": addedby,
      };
}
