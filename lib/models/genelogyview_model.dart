// To parse this JSON data, do
//
//     final geneologyViewModel = geneologyViewModelFromJson(jsonString);

import 'dart:convert';

GeneologyViewModel geneologyViewModelFromJson(String str) =>
    GeneologyViewModel.fromJson(json.decode(str));

String geneologyViewModelToJson(GeneologyViewModel data) =>
    json.encode(data.toJson());

class GeneologyViewModel {
  String idno;
  String position;
  String mStatus;
  String name;

  GeneologyViewModel({
    required this.idno,
    required this.position,
    required this.mStatus,
    required this.name,
  });

  factory GeneologyViewModel.fromJson(Map<String, dynamic> json) =>
      GeneologyViewModel(
        idno: json["Idno"],
        position: json["position"],
        mStatus: json["mStatus"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "Idno": idno,
        "position": position,
        "mStatus": mStatus,
        "name": name,
      };
}
