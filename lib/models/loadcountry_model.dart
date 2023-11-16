// To parse this JSON data, do
//
//     final loadCountryModel = loadCountryModelFromJson(jsonString);

import 'dart:convert';

LoadCountryModel loadCountryModelFromJson(String str) =>
    LoadCountryModel.fromJson(json.decode(str));

String loadCountryModelToJson(LoadCountryModel data) =>
    json.encode(data.toJson());

class LoadCountryModel {
  String countryId;
  String countryFlag;
  String name;

  LoadCountryModel({
    required this.countryId,
    required this.countryFlag,
    required this.name,
  });

  factory LoadCountryModel.fromJson(Map<String, dynamic> json) =>
      LoadCountryModel(
        countryId: json["CountryID"],
        countryFlag: json["countryFlag"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "CountryID": countryId,
        "countryFlag": countryFlag,
        "Name": name,
      };
}
