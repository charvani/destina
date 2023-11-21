// To parse this JSON data, do
//
//     final enrollDataModel = enrollDataModelFromJson(jsonString);

import 'dart:convert';

EnrollDataModel enrollDataModelFromJson(String str) =>
    EnrollDataModel.fromJson(json.decode(str));

String enrollDataModelToJson(EnrollDataModel data) =>
    json.encode(data.toJson());

class EnrollDataModel {
  List<EnrollPackageRpt> enrollPackageRpt;
  List<IconDetail> iconDetails;
  String msg;
  String message;

  EnrollDataModel({
    required this.enrollPackageRpt,
    required this.iconDetails,
    required this.msg,
    required this.message,
  });

  factory EnrollDataModel.fromJson(Map<String, dynamic> json) =>
      EnrollDataModel(
        enrollPackageRpt: List<EnrollPackageRpt>.from(
            json["EnrollPackageRpt"].map((x) => EnrollPackageRpt.fromJson(x))),
        iconDetails: List<IconDetail>.from(
            json["IconDetails"].map((x) => IconDetail.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "EnrollPackageRpt":
            List<dynamic>.from(enrollPackageRpt.map((x) => x.toJson())),
        "IconDetails": List<dynamic>.from(iconDetails.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
      };
}

class EnrollPackageRpt {
  String renFee;
  String renMonths;

  EnrollPackageRpt({
    required this.renFee,
    required this.renMonths,
  });

  factory EnrollPackageRpt.fromJson(Map<String, dynamic> json) =>
      EnrollPackageRpt(
        renFee: json["RenFee"],
        renMonths: json["RenMonths"],
      );

  Map<String, dynamic> toJson() => {
        "RenFee": renFee,
        "RenMonths": renMonths,
      };
}

class IconDetail {
  String iconPath;

  IconDetail({
    required this.iconPath,
  });

  factory IconDetail.fromJson(Map<String, dynamic> json) => IconDetail(
        iconPath: json["IconPath"],
      );

  Map<String, dynamic> toJson() => {
        "IconPath": iconPath,
      };
}
