// To parse this JSON data, do
//
//     final geneologyPopupModel = geneologyPopupModelFromJson(jsonString);

import 'dart:convert';

GeneologyPopupModel geneologyPopupModelFromJson(String str) =>
    GeneologyPopupModel.fromJson(json.decode(str));

String geneologyPopupModelToJson(GeneologyPopupModel data) =>
    json.encode(data.toJson());

class GeneologyPopupModel {
  String msg;
  String message;
  String distributorId;
  String fullName;
  String joinDate;
  String sponsorId;
  String packageNAme;
  String personalCv;
  String rankstatus;
  String leftCv;
  String rightCv;
  String totalCv;
  String totalCount;
  String directs;
  String leftCount;
  String rightCount;
  String cfLeftCv;
  String cfRightCv;

  GeneologyPopupModel({
    required this.msg,
    required this.message,
    required this.distributorId,
    required this.fullName,
    required this.joinDate,
    required this.sponsorId,
    required this.packageNAme,
    required this.personalCv,
    required this.rankstatus,
    required this.leftCv,
    required this.rightCv,
    required this.totalCv,
    required this.totalCount,
    required this.directs,
    required this.leftCount,
    required this.rightCount,
    required this.cfLeftCv,
    required this.cfRightCv,
  });

  factory GeneologyPopupModel.fromJson(Map<String, dynamic> json) =>
      GeneologyPopupModel(
        msg: json["Msg"],
        message: json["Message"],
        distributorId: json["DistributorID"],
        fullName: json["FullName"],
        joinDate: json["JoinDate"],
        sponsorId: json["SponsorId"],
        packageNAme: json["PackageNAme"],
        personalCv: json["PersonalCV"],
        rankstatus: json["Rankstatus"],
        leftCv: json["LeftCV"],
        rightCv: json["RightCV"],
        totalCv: json["TotalCV"],
        totalCount: json["TotalCount"],
        directs: json["Directs"],
        leftCount: json["LeftCount"],
        rightCount: json["RightCount"],
        cfLeftCv: json["CFLeftCV"],
        cfRightCv: json["CFRightCV"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "DistributorID": distributorId,
        "FullName": fullName,
        "JoinDate": joinDate,
        "SponsorId": sponsorId,
        "PackageNAme": packageNAme,
        "PersonalCV": personalCv,
        "Rankstatus": rankstatus,
        "LeftCV": leftCv,
        "RightCV": rightCv,
        "TotalCV": totalCv,
        "TotalCount": totalCount,
        "Directs": directs,
        "LeftCount": leftCount,
        "RightCount": rightCount,
        "CFLeftCV": cfLeftCv,
        "CFRightCV": cfRightCv,
      };
}
