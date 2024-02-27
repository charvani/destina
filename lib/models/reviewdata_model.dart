// To parse this JSON data, do
//
//     final reviewData = reviewDataFromJson(jsonString);

import 'dart:convert';

ReviewData reviewDataFromJson(String str) =>
    ReviewData.fromJson(json.decode(str));

String reviewDataToJson(ReviewData data) => json.encode(data.toJson());

class ReviewData {
  List<ReviewReport1> reviewReport1;
  List<ReviewReport2> reviewReport2;
  List<ReviewReport3> reviewReport3;
  List<ReviewReport4> reviewReport4;
  String msg;
  String message;
  String avgRating;
  String totalRating;

  ReviewData({
    required this.reviewReport1,
    required this.reviewReport2,
    required this.reviewReport3,
    required this.reviewReport4,
    required this.msg,
    required this.message,
    required this.avgRating,
    required this.totalRating,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) => ReviewData(
        reviewReport1: List<ReviewReport1>.from(
            json["ReviewReport1"].map((x) => ReviewReport1.fromJson(x))),
        reviewReport2: List<ReviewReport2>.from(
            json["ReviewReport2"].map((x) => ReviewReport2.fromJson(x))),
        reviewReport3: List<ReviewReport3>.from(
            json["ReviewReport3"].map((x) => ReviewReport3.fromJson(x))),
        reviewReport4: List<ReviewReport4>.from(
            json["ReviewReport4"].map((x) => ReviewReport4.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        avgRating: json["AvgRating"],
        totalRating: json["TotalRating"],
      );

  Map<String, dynamic> toJson() => {
        "ReviewReport1":
            List<dynamic>.from(reviewReport1.map((x) => x.toJson())),
        "ReviewReport2":
            List<dynamic>.from(reviewReport2.map((x) => x.toJson())),
        "ReviewReport3":
            List<dynamic>.from(reviewReport3.map((x) => x.toJson())),
        "ReviewReport4":
            List<dynamic>.from(reviewReport4.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "AvgRating": avgRating,
        "TotalRating": totalRating,
      };
}

class ReviewReport1 {
  String pId;
  String name;
  String review;
  String video;
  String videoUrl;
  String rating;
  String dated;
  String helpful;

  ReviewReport1({
    required this.pId,
    required this.name,
    required this.review,
    required this.video,
    required this.videoUrl,
    required this.rating,
    required this.dated,
    required this.helpful,
  });

  factory ReviewReport1.fromJson(Map<String, dynamic> json) => ReviewReport1(
        pId: json["PId"],
        name: json["Name"],
        review: json["Review"],
        video: json["Video"],
        videoUrl: json["VideoURL"],
        rating: json["Rating"],
        dated: json["Dated"],
        helpful: json["Helpful"],
      );

  Map<String, dynamic> toJson() => {
        "PId": pId,
        "Name": name,
        "Review": review,
        "Video": video,
        "VideoURL": videoUrl,
        "Rating": rating,
        "Dated": dated,
      };
}

class ReviewReport2 {
  String rating;
  String percentage;

  ReviewReport2({
    required this.rating,
    required this.percentage,
  });

  factory ReviewReport2.fromJson(Map<String, dynamic> json) => ReviewReport2(
        rating: json["Rating"],
        percentage: json["Percentage"],
      );

  Map<String, dynamic> toJson() => {
        "Rating": rating,
        "Percentage": percentage,
      };
}

class ReviewReport3 {
  String pId;
  String image;

  ReviewReport3({
    required this.pId,
    required this.image,
  });

  factory ReviewReport3.fromJson(Map<String, dynamic> json) => ReviewReport3(
        pId: json["PId"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "PId": pId,
        "Image": image,
      };
}

class ReviewReport4 {
  String pId;
  String video;

  ReviewReport4({
    required this.pId,
    required this.video,
  });

  factory ReviewReport4.fromJson(Map<String, dynamic> json) => ReviewReport4(
        pId: json["PId"],
        video: json["Video"],
      );

  Map<String, dynamic> toJson() => {
        "PId": pId,
        "Video": video,
      };
}
