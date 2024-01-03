class MyListReportModel {
  String team;
  String count;
  String level;
  List<MyListReportDataModel> data;

  MyListReportModel({
    required this.team,
    required this.count,
    required this.level,
    required this.data,
  });

  factory MyListReportModel.fromJson(Map<String, dynamic> json) =>
      MyListReportModel(
        team: json["Team"],
        count: json["Count"],
        level: json["LevelNo"],
        data: json["data"] != null
            ? List<MyListReportDataModel>.from(
                json["data"].map((x) => MyListReportDataModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "Team": team,
        "Count": count,
        "LevelNo": level,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MyListReportDataModel {
  String userId;
  String name;
  String country;
  String sponsor;
  String doj;
  String lvl;

  MyListReportDataModel({
    required this.userId,
    required this.name,
    required this.country,
    required this.sponsor,
    required this.doj,
    required this.lvl,
  });

  factory MyListReportDataModel.fromJson(Map<String, dynamic> json) =>
      MyListReportDataModel(
        userId: json["UserID"],
        name: json["Name"],
        country: json["Country"],
        sponsor: json["Sponsor"],
        doj: json["DOJ"],
        lvl: json["lvl"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "Name": name,
        "Country": country,
        "Sponsor": sponsor,
        "DOJ": doj,
        "lvl": lvl,
      };
}
