// To parse this JSON data, do
//
//     final ftaReportModel = ftaReportModelFromJson(jsonString);

import 'dart:convert';

FtaReportModel ftaReportModelFromJson(String str) =>
    FtaReportModel.fromJson(json.decode(str));

String ftaReportModelToJson(FtaReportModel data) => json.encode(data.toJson());

class FtaReportModel {
  String fdated;
  String ftaName;
  String ftaProofNo;
  String ftaContact;
  String ftaEmail;

  FtaReportModel({
    required this.fdated,
    required this.ftaName,
    required this.ftaProofNo,
    required this.ftaContact,
    required this.ftaEmail,
  });

  factory FtaReportModel.fromJson(Map<String, dynamic> json) => FtaReportModel(
        fdated: json["Fdated"],
        ftaName: json["FtaName"],
        ftaProofNo: json["FTAProofNo"],
        ftaContact: json["FtaContact"],
        ftaEmail: json["FTAEmail"],
      );

  Map<String, dynamic> toJson() => {
        "Fdated": fdated,
        "FtaName": ftaName,
        "FTAProofNo": ftaProofNo,
        "FtaContact": ftaContact,
        "FTAEmail": ftaEmail,
      };
}
