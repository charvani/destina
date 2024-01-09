// To parse this JSON data, do
//
//     final ecardReqReportModel = ecardReqReportModelFromJson(jsonString);

import 'dart:convert';

EcardReqReportModel ecardReqReportModelFromJson(String str) =>
    EcardReqReportModel.fromJson(json.decode(str));

String ecardReqReportModelToJson(EcardReqReportModel data) =>
    json.encode(data.toJson());

class EcardReqReportModel {
  String eid;
  String transid;
  String country;
  String idno;
  String name;
  String imagepath;
  String phoneNumber;
  String buyerId;
  String symbol;
  String totAmount;
  String approveDate;
  String remarks;
  String sts;
  String reqby;
  String approveamt;

  EcardReqReportModel({
    required this.eid,
    required this.transid,
    required this.country,
    required this.idno,
    required this.name,
    required this.imagepath,
    required this.phoneNumber,
    required this.buyerId,
    required this.symbol,
    required this.totAmount,
    required this.approveDate,
    required this.remarks,
    required this.sts,
    required this.reqby,
    required this.approveamt,
  });

  factory EcardReqReportModel.fromJson(Map<String, dynamic> json) =>
      EcardReqReportModel(
        eid: json["EID"],
        transid: json["transid"],
        country: json["Country"],
        idno: json["idno"],
        name: json["name"],
        imagepath: json["imagepath"],
        phoneNumber: json["PhoneNumber"],
        buyerId: json["buyerId"],
        symbol: json["Symbol"],
        totAmount: json["TotAmount"],
        approveDate: json["ApproveDate"],
        remarks: json["Remarks"],
        sts: json["sts"],
        reqby: json["reqby"],
        approveamt: json["approveamt"],
      );

  Map<String, dynamic> toJson() => {
        "EID": eid,
        "transid": transid,
        "Country": country,
        "idno": idno,
        "name": name,
        "imagepath": imagepath,
        "PhoneNumber": phoneNumber,
        "buyerId": buyerId,
        "Symbol": symbol,
        "TotAmount": totAmount,
        "ApproveDate": approveDate,
        "Remarks": remarks,
        "sts": sts,
        "reqby": reqby,
        "approveamt": approveamt,
      };
}
