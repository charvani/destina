// To parse this JSON data, do
//
//     final groupSalesModel = groupSalesModelFromJson(jsonString);

import 'dart:convert';

GroupSalesModel groupSalesModelFromJson(String str) =>
    GroupSalesModel.fromJson(json.decode(str));

String groupSalesModelToJson(GroupSalesModel data) =>
    json.encode(data.toJson());

class GroupSalesModel {
  String msg;
  String message;
  String gcvUserId;
  String gcvUserNAme;
  String gcvFromDate;
  String gcvtoDate;
  String bussCvTotPrsCv;
  String bussCvNetLftGrpCv;
  String bussCvNetRghtGrpCv;
  String bussCvTotGrpCv;
  String bussAmtTotPrsAmt;
  String bussAmtNetLftGrpAmt;
  String bussAmtNetRgtGrpAmt;
  String bussTotGrpAmt;

  GroupSalesModel({
    required this.msg,
    required this.message,
    required this.gcvUserId,
    required this.gcvUserNAme,
    required this.gcvFromDate,
    required this.gcvtoDate,
    required this.bussCvTotPrsCv,
    required this.bussCvNetLftGrpCv,
    required this.bussCvNetRghtGrpCv,
    required this.bussCvTotGrpCv,
    required this.bussAmtTotPrsAmt,
    required this.bussAmtNetLftGrpAmt,
    required this.bussAmtNetRgtGrpAmt,
    required this.bussTotGrpAmt,
  });

  factory GroupSalesModel.fromJson(Map<String, dynamic> json) =>
      GroupSalesModel(
        msg: json["Msg"],
        message: json["Message"],
        gcvUserId: json["GCVUserId"],
        gcvUserNAme: json["GCVUserNAme"],
        gcvFromDate: json["GCVFromDate"],
        gcvtoDate: json["GCVTODate"],
        bussCvTotPrsCv: json["BussCVTotPrsCV"],
        bussCvNetLftGrpCv: json["BussCVNetLftGrpCV"],
        bussCvNetRghtGrpCv: json["BussCVNetRghtGrpCV"],
        bussCvTotGrpCv: json["BussCVTotGrpCV"],
        bussAmtTotPrsAmt: json["BussAmtTotPrsAmt"],
        bussAmtNetLftGrpAmt: json["BussAmtNetLftGrpAmt"],
        bussAmtNetRgtGrpAmt: json["BussAmtNetRgtGrpAmt"],
        bussTotGrpAmt: json["BussTotGrpAmt"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "GCVUserId": gcvUserId,
        "GCVUserNAme": gcvUserNAme,
        "GCVFromDate": gcvFromDate,
        "GCVTODate": gcvtoDate,
        "BussCVTotPrsCV": bussCvTotPrsCv,
        "BussCVNetLftGrpCV": bussCvNetLftGrpCv,
        "BussCVNetRghtGrpCV": bussCvNetRghtGrpCv,
        "BussCVTotGrpCV": bussCvTotGrpCv,
        "BussAmtTotPrsAmt": bussAmtTotPrsAmt,
        "BussAmtNetLftGrpAmt": bussAmtNetLftGrpAmt,
        "BussAmtNetRgtGrpAmt": bussAmtNetRgtGrpAmt,
        "BussTotGrpAmt": bussTotGrpAmt,
      };
}
