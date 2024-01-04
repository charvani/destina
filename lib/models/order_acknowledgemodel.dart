// To parse this JSON data, do
//
//     final orderAcknowledgeModel = orderAcknowledgeModelFromJson(jsonString);

import 'dart:convert';

OrderAcknowledgeModel orderAcknowledgeModelFromJson(String str) =>
    OrderAcknowledgeModel.fromJson(json.decode(str));

String orderAcknowledgeModelToJson(OrderAcknowledgeModel data) =>
    json.encode(data.toJson());

class OrderAcknowledgeModel {
  String orderNo;
  String collectionMode;
  String dateOfDispatch;
  String licenseCollected;
  String licenseCode;
  String licenseName;
  String licenseAdd;
  String licenseEmail;
  String licenseContctNo;
  String acknowledgeDate;
  String acknowledgeTrough;
  String status;
  String updation;
  dynamic rmid;

  OrderAcknowledgeModel({
    required this.orderNo,
    required this.collectionMode,
    required this.dateOfDispatch,
    required this.licenseCollected,
    required this.licenseCode,
    required this.licenseName,
    required this.licenseAdd,
    required this.licenseEmail,
    required this.licenseContctNo,
    required this.acknowledgeDate,
    required this.acknowledgeTrough,
    required this.status,
    required this.updation,
    required this.rmid,
  });

  factory OrderAcknowledgeModel.fromJson(Map<String, dynamic> json) =>
      OrderAcknowledgeModel(
        orderNo: json["OrderNo"],
        collectionMode: json["CollectionMode"],
        dateOfDispatch: json["DateOfDispatch"],
        licenseCollected: json["LicenseCollected"],
        licenseCode: json["LicenseCode"],
        licenseName: json["LicenseName"],
        licenseAdd: json["LicenseAdd"],
        licenseEmail: json["LicenseEmail"],
        licenseContctNo: json["LicenseContctNo"],
        acknowledgeDate: json["AcknowledgeDate"],
        acknowledgeTrough: json["AcknowledgeTrough"],
        status: json["Status"],
        updation: json["Updation"],
        rmid: json["rmid"],
      );

  Map<String, dynamic> toJson() => {
        "OrderNo": orderNo,
        "CollectionMode": collectionMode,
        "DateOfDispatch": dateOfDispatch,
        "LicenseCollected": licenseCollected,
        "LicenseCode": licenseCode,
        "LicenseName": licenseName,
        "LicenseAdd": licenseAdd,
        "LicenseEmail": licenseEmail,
        "LicenseContctNo": licenseContctNo,
        "AcknowledgeDate": acknowledgeDate,
        "AcknowledgeTrough": acknowledgeTrough,
        "Status": status,
        "Updation": updation,
        "rmid": rmid,
      };
}
