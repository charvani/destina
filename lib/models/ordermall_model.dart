// To parse this JSON data, do
//
//     final orderMallTypeModel = orderMallTypeModelFromJson(jsonString);

import 'dart:convert';

OrderMallTypeModel orderMallTypeModelFromJson(String str) =>
    OrderMallTypeModel.fromJson(json.decode(str));

String orderMallTypeModelToJson(OrderMallTypeModel data) =>
    json.encode(data.toJson());

class OrderMallTypeModel {
  String mallType;
  String mallId;

  OrderMallTypeModel({
    required this.mallType,
    required this.mallId,
  });

  factory OrderMallTypeModel.fromJson(Map<String, dynamic> json) =>
      OrderMallTypeModel(
        mallType: json["MallType"],
        mallId: json["MallId"],
      );

  Map<String, dynamic> toJson() => {
        "MallType": mallType,
        "MallId": mallId,
      };
}
