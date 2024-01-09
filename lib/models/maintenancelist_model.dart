// To parse this JSON data, do
//
//     final maintenanceListModel = maintenanceListModelFromJson(jsonString);

import 'dart:convert';

MaintenanceListModel maintenanceListModelFromJson(String str) =>
    MaintenanceListModel.fromJson(json.decode(str));

String maintenanceListModelToJson(MaintenanceListModel data) =>
    json.encode(data.toJson());

class MaintenanceListModel {
  String sno;
  String amount;
  String cv;
  String date;
  String monthYear;
  String maintenanceType;
  String actualmonth;
  String actualyear;

  MaintenanceListModel({
    required this.sno,
    required this.amount,
    required this.cv,
    required this.date,
    required this.monthYear,
    required this.maintenanceType,
    required this.actualmonth,
    required this.actualyear,
  });

  factory MaintenanceListModel.fromJson(Map<String, dynamic> json) =>
      MaintenanceListModel(
        sno: json["Sno"],
        amount: json["Amount"],
        cv: json["CV"],
        date: json["Date"],
        monthYear: json["MonthYear"],
        maintenanceType: json["MaintenanceType"],
        actualmonth: json["actualmonth"],
        actualyear: json["actualyear"],
      );

  Map<String, dynamic> toJson() => {
        "Sno": sno,
        "Amount": amount,
        "CV": cv,
        "Date": date,
        "MonthYear": monthYear,
        "MaintenanceType": maintenanceType,
        "actualmonth": actualmonth,
        "actualyear": actualyear,
      };
}
