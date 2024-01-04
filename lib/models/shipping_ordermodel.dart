// To parse this JSON data, do
//
//     final shippingOrderModel = shippingOrderModelFromJson(jsonString);

import 'dart:convert';

ShippingOrderModel shippingOrderModelFromJson(String str) =>
    ShippingOrderModel.fromJson(json.decode(str));

String shippingOrderModelToJson(ShippingOrderModel data) =>
    json.encode(data.toJson());

class ShippingOrderModel {
  dynamic msg;
  dynamic message;
  String dispatchDtls;
  String shippingRmk;
  String dispatchDate;
  String remarks;
  String addedBy;

  ShippingOrderModel({
    required this.msg,
    required this.message,
    required this.dispatchDtls,
    required this.shippingRmk,
    required this.dispatchDate,
    required this.remarks,
    required this.addedBy,
  });

  factory ShippingOrderModel.fromJson(Map<String, dynamic> json) =>
      ShippingOrderModel(
        msg: json["Msg"],
        message: json["Message"],
        dispatchDtls: json["DispatchDtls"],
        shippingRmk: json["ShippingRmk"],
        dispatchDate: json["DispatchDate"],
        remarks: json["Remarks"],
        addedBy: json["AddedBy"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "DispatchDtls": dispatchDtls,
        "ShippingRmk": shippingRmk,
        "DispatchDate": dispatchDate,
        "Remarks": remarks,
        "AddedBy": addedBy,
      };
}
