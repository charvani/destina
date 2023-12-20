// To parse this JSON data, do
//
//     final biomatrixImageData = biomatrixImageDataFromJson(jsonString);

import 'dart:convert';

BiomatrixImageData biomatrixImageDataFromJson(String str) =>
    BiomatrixImageData.fromJson(json.decode(str));

String biomatrixImageDataToJson(BiomatrixImageData data) =>
    json.encode(data.toJson());

class BiomatrixImageData {
  String imageName;
  String title1;
  String title2;
  String count;

  BiomatrixImageData({
    required this.imageName,
    required this.title1,
    required this.title2,
    required this.count,
  });

  factory BiomatrixImageData.fromJson(Map<String, dynamic> json) =>
      BiomatrixImageData(
        imageName: json["image_name"],
        title1: json["title1"],
        title2: json["title2"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "image_name": imageName,
        "title1": title1,
        "title2": title2,
        "count": count,
      };
}
