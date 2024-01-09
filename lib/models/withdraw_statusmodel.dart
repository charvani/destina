// To parse this JSON data, do
//
//     final withdraStatusModel = withdraStatusModelFromJson(jsonString);

import 'dart:convert';

WithdraStatusModel withdraStatusModelFromJson(String str) =>
    WithdraStatusModel.fromJson(json.decode(str));

String withdraStatusModelToJson(WithdraStatusModel data) =>
    json.encode(data.toJson());

class WithdraStatusModel {
  List<TpCheckWithdrawrpt> tpCheckWithdrawrpt;
  String msg;
  String message;
  bool ecardButton;

  WithdraStatusModel({
    required this.tpCheckWithdrawrpt,
    required this.msg,
    required this.message,
    required this.ecardButton,
  });

  factory WithdraStatusModel.fromJson(Map<String, dynamic> json) =>
      WithdraStatusModel(
        tpCheckWithdrawrpt: List<TpCheckWithdrawrpt>.from(
            json["TPCheckWithdrawrpt"]
                .map((x) => TpCheckWithdrawrpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        ecardButton: json["EcardButton"],
      );

  Map<String, dynamic> toJson() => {
        "TPCheckWithdrawrpt":
            List<dynamic>.from(tpCheckWithdrawrpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "EcardButton": ecardButton,
      };
}

class TpCheckWithdrawrpt {
  String sno;
  String reqCode;
  String reqAmount;
  String reqDate;
  String status;
  String remarks;
  String emailMessages;

  TpCheckWithdrawrpt({
    required this.sno,
    required this.reqCode,
    required this.reqAmount,
    required this.reqDate,
    required this.status,
    required this.remarks,
    required this.emailMessages,
  });

  factory TpCheckWithdrawrpt.fromJson(Map<String, dynamic> json) =>
      TpCheckWithdrawrpt(
        sno: json["Sno"],
        reqCode: json["ReqCode"],
        reqAmount: json["ReqAmount"],
        reqDate: json["ReqDate"],
        status: json["Status"],
        remarks: json["Remarks"],
        emailMessages: json["EmailMessages"],
      );

  Map<String, dynamic> toJson() => {
        "Sno": sno,
        "ReqCode": reqCode,
        "ReqAmount": reqAmount,
        "ReqDate": reqDate,
        "Status": status,
        "Remarks": remarks,
        "EmailMessages": emailMessages,
      };
}
