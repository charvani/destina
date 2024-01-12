// To parse this JSON data, do
//
//     final bankKycReporModel = bankKycReporModelFromJson(jsonString);

import 'dart:convert';

BankKycReporModel bankKycReporModelFromJson(String str) =>
    BankKycReporModel.fromJson(json.decode(str));

String bankKycReporModelToJson(BankKycReporModel data) =>
    json.encode(data.toJson());

class BankKycReporModel {
  String msg;
  String message;
  String userId;
  String pwd;
  String bankName;
  String branch;
  String acNo;
  String ifscCode;
  String remarks;
  String status;
  dynamic filename;

  BankKycReporModel({
    required this.msg,
    required this.message,
    required this.userId,
    required this.pwd,
    required this.bankName,
    required this.branch,
    required this.acNo,
    required this.ifscCode,
    required this.remarks,
    required this.status,
    required this.filename,
  });

  factory BankKycReporModel.fromJson(Map<String, dynamic> json) =>
      BankKycReporModel(
        msg: json["Msg"],
        message: json["Message"],
        userId: json["UserId"] ?? "",
        pwd: json["Pwd"] ?? "",
        bankName: json["BankName"],
        branch: json["Branch"],
        acNo: json["ACNo"],
        ifscCode: json["IFSCCode"],
        remarks: json["Remarks"],
        status: json["Status"],
        filename: json["Filename"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "UserId": userId,
        "Pwd": pwd,
        "BankName": bankName,
        "Branch": branch,
        "ACNo": acNo,
        "IFSCCode": ifscCode,
        "Remarks": remarks,
        "Status": status,
        "Filename": filename,
      };
}
