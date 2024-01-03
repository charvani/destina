// To parse this JSON data, do
//
//     final myTeamViewModel = myTeamViewModelFromJson(jsonString);

import 'dart:convert';

MyTeamViewModel myTeamViewModelFromJson(String str) =>
    MyTeamViewModel.fromJson(json.decode(str));

String myTeamViewModelToJson(MyTeamViewModel data) =>
    json.encode(data.toJson());

class MyTeamViewModel {
  String userId;
  String name;
  String sponser;
  String doj;
  String upliner;
  String country;

  MyTeamViewModel({
    required this.userId,
    required this.name,
    required this.sponser,
    required this.doj,
    required this.upliner,
    required this.country,
  });

  factory MyTeamViewModel.fromJson(Map<String, dynamic> json) =>
      MyTeamViewModel(
        userId: json["UserID"],
        name: json["Name"],
        sponser: json["Sponser"],
        doj: json["DOJ"],
        upliner: json["Upliner"],
        country: json["Country"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "Name": name,
        "Sponser": sponser,
        "DOJ": doj,
        "Upliner": upliner,
        "Country": country,
      };
}
