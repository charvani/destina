// To parse this JSON data, do
//
//     final listOfReqModel = listOfReqModelFromJson(jsonString);

import 'dart:convert';

ListOfReqModel listOfReqModelFromJson(String str) =>
    ListOfReqModel.fromJson(json.decode(str));

String listOfReqModelToJson(ListOfReqModel data) => json.encode(data.toJson());

class ListOfReqModel {
  String name;
  String sno;
  String updateType;
  String updateDate;

  ListOfReqModel({
    required this.name,
    required this.sno,
    required this.updateType,
    required this.updateDate,
  });

  factory ListOfReqModel.fromJson(Map<String, dynamic> json) => ListOfReqModel(
        name: json["Name"],
        sno: json["Sno"],
        updateType: json["UpdateType"],
        updateDate: json["UpdateDate"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Sno": sno,
        "UpdateType": updateType,
        "UpdateDate": updateDate,
      };
}
