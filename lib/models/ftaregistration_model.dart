// To parse this JSON data, do
//
//     final ftaRegistrationModel = ftaRegistrationModelFromJson(jsonString);

import 'dart:convert';

FtaRegistrationModel ftaRegistrationModelFromJson(String str) =>
    FtaRegistrationModel.fromJson(json.decode(str));

String ftaRegistrationModelToJson(FtaRegistrationModel data) =>
    json.encode(data.toJson());

class FtaRegistrationModel {
  String result;
  String ftaName;
  String ftaProofNo;
  dynamic ftaContact;
  String ftaEmail;
  String invName;
  String invProofNo;
  dynamic invContact;
  String invEmail;
  String fdated;
  String logName;
  String ldated;
  String add1;
  String add2;
  String city;
  String stateName;
  String name;
  String email;
  String faxno;
  String companyName;
  String vatno;
  String mobile;
  String website;

  FtaRegistrationModel({
    required this.result,
    required this.ftaName,
    required this.ftaProofNo,
    required this.ftaContact,
    required this.ftaEmail,
    required this.invName,
    required this.invProofNo,
    required this.invContact,
    required this.invEmail,
    required this.fdated,
    required this.logName,
    required this.ldated,
    required this.add1,
    required this.add2,
    required this.city,
    required this.stateName,
    required this.name,
    required this.email,
    required this.faxno,
    required this.companyName,
    required this.vatno,
    required this.mobile,
    required this.website,
  });

  factory FtaRegistrationModel.fromJson(Map<String, dynamic> json) =>
      FtaRegistrationModel(
        result: json["result"],
        ftaName: json["FTAName"],
        ftaProofNo: json["FTAProofNo"],
        ftaContact: json["FtaContact"],
        ftaEmail: json["FTAEmail"],
        invName: json["InvName"],
        invProofNo: json["InvProofNo"],
        invContact: json["InvContact"],
        invEmail: json["InvEmail"],
        fdated: json["Fdated"],
        logName: json["LogName"],
        ldated: json["Ldated"],
        add1: json["Add1"],
        add2: json["Add2"],
        city: json["City"],
        stateName: json["StateName"],
        name: json["name"],
        email: json["email"],
        faxno: json["faxno"],
        companyName: json["CompanyName"],
        vatno: json["vatno"],
        mobile: json["mobile"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "FTAName": ftaName,
        "FTAProofNo": ftaProofNo,
        "FtaContact": ftaContact,
        "FTAEmail": ftaEmail,
        "InvName": invName,
        "InvProofNo": invProofNo,
        "InvContact": invContact,
        "InvEmail": invEmail,
        "Fdated": fdated,
        "LogName": logName,
        "Ldated": ldated,
        "Add1": add1,
        "Add2": add2,
        "City": city,
        "StateName": stateName,
        "name": name,
        "email": email,
        "faxno": faxno,
        "CompanyName": companyName,
        "vatno": vatno,
        "mobile": mobile,
        "website": website,
      };
}
