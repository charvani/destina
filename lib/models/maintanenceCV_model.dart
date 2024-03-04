// To parse this JSON data, do
//
//     final maintanenceCvModel = maintanenceCvModelFromJson(jsonString);

import 'dart:convert';

MaintanenceCvModel maintanenceCvModelFromJson(String str) =>
    MaintanenceCvModel.fromJson(json.decode(str));

String maintanenceCvModelToJson(MaintanenceCvModel data) =>
    json.encode(data.toJson());

class MaintanenceCvModel {
  String iDno;
  String billNo;
  String billDate;
  String cv;
  String mallType;

  MaintanenceCvModel({
    required this.iDno,
    required this.billNo,
    required this.billDate,
    required this.cv,
    required this.mallType,
  });

  factory MaintanenceCvModel.fromJson(Map<String, dynamic> json) =>
      MaintanenceCvModel(
        iDno: json["IDno"],
        billNo: json["BillNo"],
        billDate: json["BillDate"],
        cv: json["CV"],
        mallType: json["MallType"],
      );

  Map<String, dynamic> toJson() => {
        "IDno": iDno,
        "BillNo": billNo,
        "BillDate": billDate,
        "CV": cv,
        "MallType": mallType,
      };
}
