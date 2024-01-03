// To parse this JSON data, do
//
//     final teamBuilderViewModel = teamBuilderViewModelFromJson(jsonString);

import 'dart:convert';

TeamBuilderViewModel teamBuilderViewModelFromJson(String str) =>
    TeamBuilderViewModel.fromJson(json.decode(str));

String teamBuilderViewModelToJson(TeamBuilderViewModel data) =>
    json.encode(data.toJson());

class TeamBuilderViewModel {
  String team;
  String count;
  String level;
  List<TeamViewListData> data;

  TeamBuilderViewModel({
    required this.team,
    required this.count,
    required this.level,
    required this.data,
  });

  factory TeamBuilderViewModel.fromJson(Map<String, dynamic> json) =>
      TeamBuilderViewModel(
        team: json["Team"],
        count: json["Count"],
        level: json["Level"],
        data: json["data"] != null
            ? List<TeamViewListData>.from(json["data"].map((x) => TeamViewListData.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "Team": team,
        "Count": count,
        "Level": level,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TeamViewListData {
  String userId;
  String name;
  String country;
  String dateOfJoin;

  TeamViewListData({
    required this.userId,
    required this.name,
    required this.country,
    required this.dateOfJoin,
  });

  factory TeamViewListData.fromJson(Map<String, dynamic> json) => TeamViewListData(
        userId: json["UserID"],
        name: json["Name"],
        country: json["Country"],
        dateOfJoin: json["DateOfJoin"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "Name": name,
        "Country": country,
        "DateOfJoin": dateOfJoin,
      };
}
