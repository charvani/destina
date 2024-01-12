// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  String sno;
  String question;
  String answer;
  String title;
  int fid;

  FaqModel({
    required this.sno,
    required this.question,
    required this.answer,
    required this.title,
    required this.fid,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        sno: json["sno"],
        question: json["Question"],
        answer: json["Answer"],
        title: json["Title"],
        fid: json["fid"],
      );

  Map<String, dynamic> toJson() => {
        "sno": sno,
        "Question": question,
        "Answer": answer,
        "Title": title,
        "fid": fid,
      };
}
