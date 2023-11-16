// To parse this JSON data, do
//
//     final checkCountryModel = checkCountryModelFromJson(jsonString);

import 'dart:convert';

CheckCountryModel checkCountryModelFromJson(String str) =>
    CheckCountryModel.fromJson(json.decode(str));

String checkCountryModelToJson(CheckCountryModel data) =>
    json.encode(data.toJson());

class CheckCountryModel {
  String msg;
  String message;
  String result;
  String countryFlag;
  String dRenFee;
  String dcRenFee;
  String pcRenFee;
  String diRenFee;
  String dCiRenFee;
  String pCiRenFee;
  String dRenF;
  String dcRenF;
  String pcRenF;
  String dcCnt;
  String pcCnt;
  String name;

  CheckCountryModel({
    required this.msg,
    required this.message,
    required this.result,
    required this.countryFlag,
    required this.dRenFee,
    required this.dcRenFee,
    required this.pcRenFee,
    required this.diRenFee,
    required this.dCiRenFee,
    required this.pCiRenFee,
    required this.dRenF,
    required this.dcRenF,
    required this.pcRenF,
    required this.dcCnt,
    required this.pcCnt,
    required this.name,
  });

  factory CheckCountryModel.fromJson(Map<String, dynamic> json) =>
      CheckCountryModel(
        msg: json["Msg"],
        message: json["Message"],
        result: json["result"],
        countryFlag: json["countryFlag"],
        dRenFee: json["DRenFee"],
        dcRenFee: json["DCRenFee"],
        pcRenFee: json["PCRenFee"],
        diRenFee: json["DiRenFee"],
        dCiRenFee: json["DCiRenFee"],
        pCiRenFee: json["PCiRenFee"],
        dRenF: json["DRenF"],
        dcRenF: json["DCRenF"],
        pcRenF: json["PCRenF"],
        dcCnt: json["DcCnt"],
        pcCnt: json["PcCnt"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "result": result,
        "countryFlag": countryFlag,
        "DRenFee": dRenFee,
        "DCRenFee": dcRenFee,
        "PCRenFee": pcRenFee,
        "DiRenFee": diRenFee,
        "DCiRenFee": dCiRenFee,
        "PCiRenFee": pCiRenFee,
        "DRenF": dRenF,
        "DCRenF": dcRenF,
        "PCRenF": pcRenF,
        "DcCnt": dcCnt,
        "PcCnt": pcCnt,
        "Name": name,
      };
}
