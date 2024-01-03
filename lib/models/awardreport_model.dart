// To parse this JSON data, do
//
//     final awardReportModel = awardReportModelFromJson(jsonString);

import 'dart:convert';

AwardReportModel awardReportModelFromJson(String str) =>
    AwardReportModel.fromJson(json.decode(str));

class AwardReportModel {
  List<dynamic> countRpt;
  String msg;
  String message;
  String offername;
  String sdate;
  String edate;
  String descr;
  bool bonusRequirement;
  bool requirement1;
  bool requirement2;
  bool requirement3;
  bool requirement4;
  bool requirement5;
  bool requirement6;
  dynamic req1Psales1;
  dynamic req1Pcv1;
  dynamic req1Lsalecnt1;
  dynamic req1Rsalecnt1;
  dynamic req1Lsalecv1;
  dynamic req1Rsalecv1;
  dynamic req1Ldirspr1;
  dynamic req1Rdirspr1;
  dynamic req1Steps1;
  dynamic req1Achpsale1;
  dynamic req1Achpcv1;
  dynamic req1Lachsalecnt1;
  dynamic req1Rachsalecnt1;
  dynamic req1Lachsalecv1;
  dynamic req1Rachsalecv1;
  dynamic req1Lachdirspr1;
  dynamic req1Rachdirspr1;
  dynamic req1AchSteps1;
  dynamic req1Balpsales1;
  dynamic req1Balpcv1;
  dynamic req1Sts;
  dynamic req1Lbalsalecnt1;
  dynamic req1Rbalsalecnt1;
  dynamic req1Lbalsalecv1;
  dynamic req1Rbalsalecv1;
  dynamic req1Lbaldirspr1;
  dynamic req1Rbaldirspr1;
  dynamic req1BalSteps1;
  int req1Stps;
  int req1Achstps;
  dynamic req2Psales2;
  dynamic req2Pcv2;
  dynamic req2Lsalecnt2;
  dynamic req2Rsalecnt2;
  dynamic req2Lsalecv2;
  dynamic req2Rsalecv2;
  dynamic req2Ldirspr2;
  dynamic req2Rdirspr2;
  dynamic req2Steps2;
  dynamic req2Achpsale2;
  dynamic req2Achpcv2;
  dynamic req2Lachsalecnt2;
  dynamic req2Rachsalecnt2;
  dynamic req2Lachsalecv2;
  dynamic req2Rachsalecv2;
  dynamic req2Lachdirspr2;
  dynamic req2Rachdirspr2;
  dynamic req2AchSteps2;
  dynamic req2Balpsales2;
  dynamic req2Balpcv2;
  dynamic req2Sts;
  dynamic req3Lsalecnt3;
  dynamic req3Rsalecnt3;
  dynamic req3Lsalecv3;
  dynamic req3Rsalecv3;
  dynamic req3Ldirspr3;
  dynamic req3Rdirspr3;
  dynamic req3Steps3;
  dynamic req3Achpsale3;
  dynamic req3Achpcv3;
  dynamic req3Lachsalecnt3;
  dynamic req3Rachsalecnt3;
  dynamic req3Lachsalecv3;
  dynamic req3Rachsalecv3;
  dynamic req3Lachdirspr3;
  dynamic req3Rachdirspr3;
  dynamic req3AchSteps3;
  dynamic req3Balpsales3;
  dynamic req3Balpcv3;
  dynamic req3Sts;
  dynamic req4Steps4;
  dynamic req4Achpsale4;
  dynamic req4Achpcv4;
  dynamic req4Lachsalecnt4;
  dynamic req4Rachsalecnt4;
  dynamic req4Lachsalecv4;
  dynamic req4Rachsalecv4;
  dynamic req4Lachdirspr4;
  dynamic req4Rachdirspr4;
  dynamic req4AchSteps4;
  dynamic req4Balpsales4;
  dynamic req4Balpcv4;
  dynamic req4Sts;
  dynamic req5Lsalecnt5;
  dynamic req5Rsalecnt5;
  dynamic req5Lsalecv5;
  dynamic req5Rsalecv5;
  dynamic req5Ldirspr5;
  dynamic req5Rdirspr5;
  dynamic req5Steps5;
  dynamic req5Achpsale5;
  dynamic req5Achpcv5;
  dynamic req5Lachsalecnt5;
  dynamic req5Rachsalecnt5;
  dynamic req5Lachsalecv5;
  dynamic req5Rachsalecv5;
  dynamic req5Lachdirspr5;
  dynamic req5Rachdirspr5;
  dynamic req5AchSteps5;
  dynamic req5Balpsales5;
  dynamic req5Balpcv5;
  dynamic req5Sts;
  int req6Achstps;
  dynamic req6OachGrpcv6;
  dynamic req6OGrpcv6;
  dynamic req6ObalGrpcv6;
  dynamic req6IachDirRnk6;
  dynamic req6IDirRnk6;
  dynamic req6IbalDirRnk6;
  dynamic status;
  dynamic req4Lbalsalecnt4;
  dynamic req4Rbalsalecnt4;
  dynamic req4Lbalsalecv4;
  dynamic req4Rbalsalecv4;
  dynamic req4Lbaldirspr4;
  dynamic req4Rbaldirspr4;
  dynamic req4BalSteps4;
  int req4Stps;
  int req4Achstps;
  dynamic req4OachGrpcv4;
  dynamic req4OGrpcv4;
  dynamic req4ObalGrpcv4;
  dynamic req5Psales5;
  dynamic req5Pcv5;
  dynamic req2Lbalsalecnt2;
  dynamic req2Rbalsalecnt2;
  dynamic req2Lbalsalecv2;
  dynamic req2Rbalsalecv2;
  dynamic req2Lbaldirspr2;
  dynamic req2Rbaldirspr2;
  dynamic req2BalSteps2;
  dynamic req2Lachdircv2;
  dynamic req2Rachdircv2;
  dynamic req2Ldircv2;
  dynamic req2Rdircv2;
  dynamic req2Lbaldircv2;
  dynamic req2Rbaldircv2;
  dynamic req3Odircv3;
  dynamic req3Psales3;
  dynamic req3Pcv3;
  dynamic req3Lbalsalecnt3;
  dynamic req3Rbalsalecnt3;
  dynamic req3Lbalsalecv3;
  dynamic req3Rbalsalecv3;
  dynamic req3Lbaldirspr3;
  dynamic req3Rbaldirspr3;
  dynamic req3BalSteps3;
  dynamic req3Obaldircv3;
  dynamic req3Oachdircv3;
  dynamic req4Psales4;
  dynamic req4Pcv4;
  dynamic req4Lsalecnt4;
  dynamic req4Rsalecnt4;
  dynamic req4Lsalecv4;
  dynamic req4Rsalecv4;
  dynamic req4Ldirspr4;
  dynamic req4Rdirspr4;
  dynamic req5Lbalsalecnt5;
  dynamic req5Rbalsalecnt5;
  dynamic req5Lbalsalecv5;
  dynamic req5Rbalsalecv5;
  dynamic req5Lbaldirspr5;
  dynamic req5Rbaldirspr5;
  dynamic req5BalSteps5;
  dynamic req5OachGrpcv5;
  dynamic req5OGrpcv5;
  dynamic req5ObalGrpcv5;
  dynamic req5AchDirRnk5;
  dynamic req5DirRnk5;
  dynamic req5BalDirRnk5;
  dynamic req6Psales6;
  dynamic req6Pcv6;
  dynamic req6Lsalecnt6;
  dynamic req6Rsalecnt6;
  dynamic req6Lsalecv6;
  dynamic req6Rsalecv6;
  dynamic req6Ldirspr6;
  dynamic req6Rdirspr6;
  dynamic req6Steps6;
  dynamic req6Achpsale6;
  dynamic req6Achpcv6;
  dynamic req6Lachsalecnt6;
  dynamic req6Rachsalecnt6;
  dynamic req6Lachsalecv6;
  dynamic req6Rachsalecv6;
  dynamic req6Lachdirspr6;
  dynamic req6Rachdirspr6;
  dynamic req6AchSteps6;
  dynamic req6Balpsales6;
  dynamic req6Balpcv6;
  dynamic req6Sts;
  dynamic req6Lbalsalecnt6;
  dynamic req6Rbalsalecnt6;
  dynamic req6Lbalsalecv6;
  dynamic req6Rbalsalecv6;
  dynamic req6Lbaldirspr6;
  dynamic req6Rbaldirspr6;
  dynamic req6BalSteps6;
  int req2Stps;
  int req2Achstps;
  int req3Stps;
  int req3Achstps;
  int req5Stps;
  int req5Achstps;
  int req6Stps;

  AwardReportModel({
    required this.countRpt,
    required this.msg,
    required this.message,
    required this.offername,
    required this.sdate,
    required this.edate,
    required this.descr,
    required this.bonusRequirement,
    required this.requirement1,
    required this.requirement2,
    required this.requirement3,
    required this.requirement4,
    required this.requirement5,
    required this.requirement6,
    required this.req1Psales1,
    required this.req1Pcv1,
    required this.req1Lsalecnt1,
    required this.req1Rsalecnt1,
    required this.req1Lsalecv1,
    required this.req1Rsalecv1,
    required this.req1Ldirspr1,
    required this.req1Rdirspr1,
    required this.req1Steps1,
    required this.req1Achpsale1,
    required this.req1Achpcv1,
    required this.req1Lachsalecnt1,
    required this.req1Rachsalecnt1,
    required this.req1Lachsalecv1,
    required this.req1Rachsalecv1,
    required this.req1Lachdirspr1,
    required this.req1Rachdirspr1,
    required this.req1AchSteps1,
    required this.req1Balpsales1,
    required this.req1Balpcv1,
    required this.req1Sts,
    required this.req1Lbalsalecnt1,
    required this.req1Rbalsalecnt1,
    required this.req1Lbalsalecv1,
    required this.req1Rbalsalecv1,
    required this.req1Lbaldirspr1,
    required this.req1Rbaldirspr1,
    required this.req1BalSteps1,
    required this.req1Stps,
    required this.req1Achstps,
    required this.req2Psales2,
    required this.req2Pcv2,
    required this.req2Lsalecnt2,
    required this.req2Rsalecnt2,
    required this.req2Lsalecv2,
    required this.req2Rsalecv2,
    required this.req2Ldirspr2,
    required this.req2Rdirspr2,
    required this.req2Steps2,
    required this.req2Achpsale2,
    required this.req2Achpcv2,
    required this.req2Lachsalecnt2,
    required this.req2Rachsalecnt2,
    required this.req2Lachsalecv2,
    required this.req2Rachsalecv2,
    required this.req2Lachdirspr2,
    required this.req2Rachdirspr2,
    required this.req2AchSteps2,
    required this.req2Balpsales2,
    required this.req2Balpcv2,
    required this.req2Sts,
    required this.req3Lsalecnt3,
    required this.req3Rsalecnt3,
    required this.req3Lsalecv3,
    required this.req3Rsalecv3,
    required this.req3Ldirspr3,
    required this.req3Rdirspr3,
    required this.req3Steps3,
    required this.req3Achpsale3,
    required this.req3Achpcv3,
    required this.req3Lachsalecnt3,
    required this.req3Rachsalecnt3,
    required this.req3Lachsalecv3,
    required this.req3Rachsalecv3,
    required this.req3Lachdirspr3,
    required this.req3Rachdirspr3,
    required this.req3AchSteps3,
    required this.req3Balpsales3,
    required this.req3Balpcv3,
    required this.req3Sts,
    required this.req4Steps4,
    required this.req4Achpsale4,
    required this.req4Achpcv4,
    required this.req4Lachsalecnt4,
    required this.req4Rachsalecnt4,
    required this.req4Lachsalecv4,
    required this.req4Rachsalecv4,
    required this.req4Lachdirspr4,
    required this.req4Rachdirspr4,
    required this.req4AchSteps4,
    required this.req4Balpsales4,
    required this.req4Balpcv4,
    required this.req4Sts,
    required this.req5Lsalecnt5,
    required this.req5Rsalecnt5,
    required this.req5Lsalecv5,
    required this.req5Rsalecv5,
    required this.req5Ldirspr5,
    required this.req5Rdirspr5,
    required this.req5Steps5,
    required this.req5Achpsale5,
    required this.req5Achpcv5,
    required this.req5Lachsalecnt5,
    required this.req5Rachsalecnt5,
    required this.req5Lachsalecv5,
    required this.req5Rachsalecv5,
    required this.req5Lachdirspr5,
    required this.req5Rachdirspr5,
    required this.req5AchSteps5,
    required this.req5Balpsales5,
    required this.req5Balpcv5,
    required this.req5Sts,
    required this.req6Achstps,
    required this.req6OachGrpcv6,
    required this.req6OGrpcv6,
    required this.req6ObalGrpcv6,
    required this.req6IachDirRnk6,
    required this.req6IDirRnk6,
    required this.req6IbalDirRnk6,
    required this.status,
    required this.req4Lbalsalecnt4,
    required this.req4Rbalsalecnt4,
    required this.req4Lbalsalecv4,
    required this.req4Rbalsalecv4,
    required this.req4Lbaldirspr4,
    required this.req4Rbaldirspr4,
    required this.req4BalSteps4,
    required this.req4Stps,
    required this.req4Achstps,
    required this.req4OachGrpcv4,
    required this.req4OGrpcv4,
    required this.req4ObalGrpcv4,
    required this.req5Psales5,
    required this.req5Pcv5,
    required this.req2Lbalsalecnt2,
    required this.req2Rbalsalecnt2,
    required this.req2Lbalsalecv2,
    required this.req2Rbalsalecv2,
    required this.req2Lbaldirspr2,
    required this.req2Rbaldirspr2,
    required this.req2BalSteps2,
    required this.req2Lachdircv2,
    required this.req2Rachdircv2,
    required this.req2Ldircv2,
    required this.req2Rdircv2,
    required this.req2Lbaldircv2,
    required this.req2Rbaldircv2,
    required this.req3Odircv3,
    required this.req3Psales3,
    required this.req3Pcv3,
    required this.req3Lbalsalecnt3,
    required this.req3Rbalsalecnt3,
    required this.req3Lbalsalecv3,
    required this.req3Rbalsalecv3,
    required this.req3Lbaldirspr3,
    required this.req3Rbaldirspr3,
    required this.req3BalSteps3,
    required this.req3Obaldircv3,
    required this.req3Oachdircv3,
    required this.req4Psales4,
    required this.req4Pcv4,
    required this.req4Lsalecnt4,
    required this.req4Rsalecnt4,
    required this.req4Lsalecv4,
    required this.req4Rsalecv4,
    required this.req4Ldirspr4,
    required this.req4Rdirspr4,
    required this.req5Lbalsalecnt5,
    required this.req5Rbalsalecnt5,
    required this.req5Lbalsalecv5,
    required this.req5Rbalsalecv5,
    required this.req5Lbaldirspr5,
    required this.req5Rbaldirspr5,
    required this.req5BalSteps5,
    required this.req5OachGrpcv5,
    required this.req5OGrpcv5,
    required this.req5ObalGrpcv5,
    required this.req5AchDirRnk5,
    required this.req5DirRnk5,
    required this.req5BalDirRnk5,
    required this.req6Psales6,
    required this.req6Pcv6,
    required this.req6Lsalecnt6,
    required this.req6Rsalecnt6,
    required this.req6Lsalecv6,
    required this.req6Rsalecv6,
    required this.req6Ldirspr6,
    required this.req6Rdirspr6,
    required this.req6Steps6,
    required this.req6Achpsale6,
    required this.req6Achpcv6,
    required this.req6Lachsalecnt6,
    required this.req6Rachsalecnt6,
    required this.req6Lachsalecv6,
    required this.req6Rachsalecv6,
    required this.req6Lachdirspr6,
    required this.req6Rachdirspr6,
    required this.req6AchSteps6,
    required this.req6Balpsales6,
    required this.req6Balpcv6,
    required this.req6Sts,
    required this.req6Lbalsalecnt6,
    required this.req6Rbalsalecnt6,
    required this.req6Lbalsalecv6,
    required this.req6Rbalsalecv6,
    required this.req6Lbaldirspr6,
    required this.req6Rbaldirspr6,
    required this.req6BalSteps6,
    required this.req2Stps,
    required this.req2Achstps,
    required this.req3Stps,
    required this.req3Achstps,
    required this.req5Stps,
    required this.req5Achstps,
    required this.req6Stps,
  });

  factory AwardReportModel.fromJson(Map<String, dynamic> json) =>
      AwardReportModel(
        countRpt: List<dynamic>.from(json["CountRpt"].map((x) => x)),
        msg: json["Msg"].toString(),
        message: json["Message"],
        offername: json["offername"],
        sdate: json["sdate"],
        edate: json["edate"],
        descr: json["descr"],
        bonusRequirement: json["BonusRequirement"],
        requirement1: json["Requirement1"],
        requirement2: json["Requirement2"],
        requirement3: json["Requirement3"],
        requirement4: json["Requirement4"],
        requirement5: json["Requirement5"],
        requirement6: json["Requirement6"],
        req1Psales1: json["Req1psales1"] ?? "0",
        req1Pcv1: json["Req1pcv1"] ?? "0",
        req1Lsalecnt1: json["Req1lsalecnt1"] ?? "0",
        req1Rsalecnt1: json["Req1rsalecnt1"] ?? "0",
        req1Lsalecv1: json["Req1lsalecv1"] ?? "0",
        req1Rsalecv1: json["Req1rsalecv1"] ?? "0",
        req1Ldirspr1: json["Req1ldirspr1"] ?? "0",
        req1Rdirspr1: json["Req1rdirspr1"] ?? "0",
        req1Steps1: json["Req1Steps1"] ?? "0",
        req1Achpsale1: json["Req1achpsale1"] ?? "0",
        req1Achpcv1: json["Req1achpcv1"] ?? "0",
        req1Lachsalecnt1: json["Req1lachsalecnt1"] ?? "0",
        req1Rachsalecnt1: json["Req1rachsalecnt1"] ?? "0",
        req1Lachsalecv1: json["Req1lachsalecv1"] ?? "0",
        req1Rachsalecv1: json["Req1rachsalecv1"] ?? "0",
        req1Lachdirspr1: json["Req1lachdirspr1"] ?? "0",
        req1Rachdirspr1: json["Req1rachdirspr1"] ?? "0",
        req1AchSteps1: json["Req1AchSteps1"] ?? "0",
        req1Balpsales1: json["Req1balpsales1"] ?? "0",
        req1Balpcv1: json["Req1balpcv1"] ?? "0",
        req1Sts: json["Req1sts"] ?? "0",
        req1Lbalsalecnt1: json["Req1lbalsalecnt1"] ?? "0",
        req1Rbalsalecnt1: json["Req1rbalsalecnt1"] ?? "0",
        req1Lbalsalecv1: json["Req1lbalsalecv1"] ?? "0",
        req1Rbalsalecv1: json["Req1rbalsalecv1"] ?? "0",
        req1Lbaldirspr1: json["Req1lbaldirspr1"] ?? "0",
        req1Rbaldirspr1: json["Req1rbaldirspr1"] ?? "0",
        req1BalSteps1: json["Req1BalSteps1"] ?? "0",
        req1Stps: json["Req1stps"] ?? "0",
        req1Achstps: json["Req1achstps"] ?? "0",
        req2Psales2: json["Req2psales2"] ?? "0",
        req2Pcv2: json["Req2pcv2"] ?? "0",
        req2Lsalecnt2: json["Req2lsalecnt2"] ?? "0",
        req2Rsalecnt2: json["Req2rsalecnt2"] ?? "0",
        req2Lsalecv2: json["Req2lsalecv2"] ?? "0",
        req2Rsalecv2: json["Req2rsalecv2"] ?? "0",
        req2Ldirspr2: json["Req2ldirspr2"] ?? "0",
        req2Rdirspr2: json["Req2rdirspr2"] ?? "0",
        req2Steps2: json["Req2Steps2"] ?? "0",
        req2Achpsale2: json["Req2achpsale2"] ?? "0",
        req2Achpcv2: json["Req2achpcv2"] ?? "0",
        req2Lachsalecnt2: json["Req2lachsalecnt2"] ?? "0",
        req2Rachsalecnt2: json["Req2rachsalecnt2"] ?? "0",
        req2Lachsalecv2: json["Req2lachsalecv2"] ?? "0",
        req2Rachsalecv2: json["Req2rachsalecv2"] ?? "0",
        req2Lachdirspr2: json["Req2lachdirspr2"] ?? "0",
        req2Rachdirspr2: json["Req2rachdirspr2"] ?? "0",
        req2AchSteps2: json["Req2AchSteps2"] ?? "0",
        req2Balpsales2: json["Req2balpsales2"] ?? "0",
        req2Balpcv2: json["Req2balpcv2"] ?? "0",
        req2Sts: json["Req2sts"] ?? "0",
        req3Lsalecnt3: json["Req3lsalecnt3"] ?? "0",
        req3Rsalecnt3: json["Req3rsalecnt3"] ?? "0",
        req3Lsalecv3: json["Req3lsalecv3"] ?? "0",
        req3Rsalecv3: json["Req3rsalecv3"] ?? "0",
        req3Ldirspr3: json["Req3ldirspr3"] ?? "0",
        req3Rdirspr3: json["Req3rdirspr3"] ?? "0",
        req3Steps3: json["Req3Steps3"] ?? "0",
        req3Achpsale3: json["Req3achpsale3"] ?? "0",
        req3Achpcv3: json["Req3achpcv3"] ?? "0",
        req3Lachsalecnt3: json["Req3lachsalecnt3"] ?? "0",
        req3Rachsalecnt3: json["Req3rachsalecnt3"] ?? "0",
        req3Lachsalecv3: json["Req3lachsalecv3"] ?? "0",
        req3Rachsalecv3: json["Req3rachsalecv3"] ?? "0",
        req3Lachdirspr3: json["Req3lachdirspr3"] ?? "0",
        req3Rachdirspr3: json["Req3rachdirspr3"] ?? "0",
        req3AchSteps3: json["Req3AchSteps3"] ?? "0",
        req3Balpsales3: json["Req3balpsales3"] ?? "0",
        req3Balpcv3: json["Req3balpcv3"] ?? "0",
        req3Sts: json["Req3sts"] ?? "0",
        req4Steps4: json["Req4Steps4"] ?? "0",
        req4Achpsale4: json["Req4achpsale4"] ?? "0",
        req4Achpcv4: json["Req4achpcv4"] ?? "0",
        req4Lachsalecnt4: json["Req4lachsalecnt4"] ?? "0",
        req4Rachsalecnt4: json["Req4rachsalecnt4"] ?? "0",
        req4Lachsalecv4: json["Req4lachsalecv4"] ?? "0",
        req4Rachsalecv4: json["Req4rachsalecv4"] ?? "0",
        req4Lachdirspr4: json["Req4lachdirspr4"] ?? "0",
        req4Rachdirspr4: json["Req4rachdirspr4"] ?? "0",
        req4AchSteps4: json["Req4AchSteps4"] ?? "0",
        req4Balpsales4: json["Req4balpsales4"] ?? "0",
        req4Balpcv4: json["Req4balpcv4"] ?? "0",
        req4Sts: json["Req4sts"] ?? "0",
        req5Lsalecnt5: json["Req5lsalecnt5"] ?? "0",
        req5Rsalecnt5: json["Req5rsalecnt5"] ?? "0",
        req5Lsalecv5: json["Req5lsalecv5"] ?? "0",
        req5Rsalecv5: json["Req5rsalecv5"] ?? "0",
        req5Ldirspr5: json["Req5ldirspr5"] ?? "0",
        req5Rdirspr5: json["Req5rdirspr5"] ?? "0",
        req5Steps5: json["Req5Steps5"] ?? "0",
        req5Achpsale5: json["Req5achpsale5"] ?? "0",
        req5Achpcv5: json["Req5achpcv5"] ?? "0",
        req5Lachsalecnt5: json["Req5lachsalecnt5"] ?? "0",
        req5Rachsalecnt5: json["Req5rachsalecnt5"] ?? "0",
        req5Lachsalecv5: json["Req5lachsalecv5"] ?? "0",
        req5Rachsalecv5: json["Req5rachsalecv5"] ?? "0",
        req5Lachdirspr5: json["Req5lachdirspr5"] ?? "0",
        req5Rachdirspr5: json["Req5rachdirspr5"] ?? "0",
        req5AchSteps5: json["Req5AchSteps5"] ?? "0",
        req5Balpsales5: json["Req5balpsales5"] ?? "0",
        req5Balpcv5: json["Req5balpcv5"] ?? "0",
        req5Sts: json["Req5sts"] ?? "0",
        req6Achstps: json["Req6achstps"] ?? "0",
        req6OachGrpcv6: json["Req6OachGrpcv6"] ?? "0",
        req6OGrpcv6: json["Req6OGrpcv6"] ?? "0",
        req6ObalGrpcv6: json["Req6ObalGrpcv6"] ?? "0",
        req6IachDirRnk6: json["Req6IachDirRnk6"] ?? "0",
        req6IDirRnk6: json["Req6IDirRnk6"] ?? "0",
        req6IbalDirRnk6: json["Req6IbalDirRnk6"] ?? "0",
        status: json["Status"] ?? "0",
        req4Lbalsalecnt4: json["Req4lbalsalecnt4"] ?? "0",
        req4Rbalsalecnt4: json["Req4rbalsalecnt4"] ?? "0",
        req4Lbalsalecv4: json["Req4lbalsalecv4"] ?? "0",
        req4Rbalsalecv4: json["Req4rbalsalecv4"] ?? "0",
        req4Lbaldirspr4: json["Req4lbaldirspr4"] ?? "0",
        req4Rbaldirspr4: json["Req4rbaldirspr4"] ?? "0",
        req4BalSteps4: json["Req4BalSteps4"] ?? "0",
        req4Stps: json["Req4stps"] ?? "0",
        req4Achstps: json["Req4achstps"] ?? "0",
        req4OachGrpcv4: json["Req4OachGrpcv4"] ?? "0",
        req4OGrpcv4: json["Req4OGrpcv4"] ?? "0",
        req4ObalGrpcv4: json["Req4ObalGrpcv4"] ?? "0",
        req5Psales5: json["Req5psales5"] ?? "0",
        req5Pcv5: json["Req5pcv5"] ?? "0",
        req2Lbalsalecnt2: json["Req2lbalsalecnt2"] ?? "0",
        req2Rbalsalecnt2: json["Req2rbalsalecnt2"] ?? "0",
        req2Lbalsalecv2: json["Req2lbalsalecv2"] ?? "0",
        req2Rbalsalecv2: json["Req2rbalsalecv2"] ?? "0",
        req2Lbaldirspr2: json["Req2lbaldirspr2"] ?? "0",
        req2Rbaldirspr2: json["Req2rbaldirspr2"] ?? "0",
        req2BalSteps2: json["Req2BalSteps2"] ?? "0",
        req2Lachdircv2: json["Req2lachdircv2"] ?? "0",
        req2Rachdircv2: json["Req2rachdircv2"] ?? "0",
        req2Ldircv2: json["Req2ldircv2"] ?? "0",
        req2Rdircv2: json["Req2rdircv2"] ?? "0",
        req2Lbaldircv2: json["Req2lbaldircv2"] ?? "0",
        req2Rbaldircv2: json["Req2rbaldircv2"] ?? "0",
        req3Odircv3: json["Req3Odircv3"] ?? "0",
        req3Psales3: json["Req3psales3"] ?? "0",
        req3Pcv3: json["Req3pcv3"] ?? "0",
        req3Lbalsalecnt3: json["Req3lbalsalecnt3"] ?? "0",
        req3Rbalsalecnt3: json["Req3rbalsalecnt3"] ?? "0",
        req3Lbalsalecv3: json["Req3lbalsalecv3"] ?? "0",
        req3Rbalsalecv3: json["Req3rbalsalecv3"] ?? "0",
        req3Lbaldirspr3: json["Req3lbaldirspr3"] ?? "0",
        req3Rbaldirspr3: json["Req3rbaldirspr3"] ?? "0",
        req3BalSteps3: json["Req3BalSteps3"] ?? "0",
        req3Obaldircv3: json["Req3Obaldircv3"] ?? "0",
        req3Oachdircv3: json["Req3Oachdircv3"] ?? "0",
        req4Psales4: json["Req4psales4"] ?? "0",
        req4Pcv4: json["Req4pcv4"] ?? "0",
        req4Lsalecnt4: json["Req4lsalecnt4"] ?? "0",
        req4Rsalecnt4: json["Req4rsalecnt4"] ?? "0",
        req4Lsalecv4: json["Req4lsalecv4"] ?? "0",
        req4Rsalecv4: json["Req4rsalecv4"] ?? "0",
        req4Ldirspr4: json["Req4ldirspr4"] ?? "0",
        req4Rdirspr4: json["Req4rdirspr4"] ?? "0",
        req5Lbalsalecnt5: json["Req5lbalsalecnt5"] ?? "0",
        req5Rbalsalecnt5: json["Req5rbalsalecnt5"] ?? "0",
        req5Lbalsalecv5: json["Req5lbalsalecv5"] ?? "0",
        req5Rbalsalecv5: json["Req5rbalsalecv5"] ?? "0",
        req5Lbaldirspr5: json["Req5lbaldirspr5"] ?? "0",
        req5Rbaldirspr5: json["Req5rbaldirspr5"] ?? "0",
        req5BalSteps5: json["Req5BalSteps5"] ?? "0",
        req5OachGrpcv5: json["Req5OachGrpcv5"] ?? "0",
        req5OGrpcv5: json["Req5OGrpcv5"] ?? "0",
        req5ObalGrpcv5: json["Req5ObalGrpcv5"] ?? "0",
        req5AchDirRnk5: json["Req5achDirRnk5"] ?? "0",
        req5DirRnk5: json["Req5DirRnk5"] ?? "0",
        req5BalDirRnk5: json["Req5balDirRnk5"] ?? "0",
        req6Psales6: json["Req6psales6"] ?? "0",
        req6Pcv6: json["Req6pcv6"] ?? "0",
        req6Lsalecnt6: json["Req6lsalecnt6"] ?? "0",
        req6Rsalecnt6: json["Req6rsalecnt6"] ?? "0",
        req6Lsalecv6: json["Req6lsalecv6"] ?? "0",
        req6Rsalecv6: json["Req6rsalecv6"] ?? "0",
        req6Ldirspr6: json["Req6ldirspr6"] ?? "0",
        req6Rdirspr6: json["Req6rdirspr6"] ?? "0",
        req6Steps6: json["Req6Steps6"] ?? "0",
        req6Achpsale6: json["Req6achpsale6"] ?? "0",
        req6Achpcv6: json["Req6achpcv6"] ?? "0",
        req6Lachsalecnt6: json["Req6lachsalecnt6"] ?? "0",
        req6Rachsalecnt6: json["Req6rachsalecnt6"] ?? "0",
        req6Lachsalecv6: json["Req6lachsalecv6"] ?? "0",
        req6Rachsalecv6: json["Req6rachsalecv6"] ?? "0",
        req6Lachdirspr6: json["Req6lachdirspr6"] ?? "0",
        req6Rachdirspr6: json["Req6rachdirspr6"] ?? "0",
        req6AchSteps6: json["Req6AchSteps6"] ?? "0",
        req6Balpsales6: json["Req6balpsales6"] ?? "0",
        req6Balpcv6: json["Req6balpcv6"] ?? "0",
        req6Sts: json["Req6sts"] ?? "0",
        req6Lbalsalecnt6: json["Req6lbalsalecnt6"] ?? "0",
        req6Rbalsalecnt6: json["Req6rbalsalecnt6"] ?? "0",
        req6Lbalsalecv6: json["Req6lbalsalecv6"] ?? "0",
        req6Rbalsalecv6: json["Req6rbalsalecv6"] ?? "0",
        req6Lbaldirspr6: json["Req6lbaldirspr6"] ?? "0",
        req6Rbaldirspr6: json["Req6rbaldirspr6"] ?? "0",
        req6BalSteps6: json["Req6BalSteps6"] ?? "0",
        req2Stps: json["Req2stps"] ?? "0",
        req2Achstps: json["Req2achstps"] ?? "0",
        req3Stps: json["Req3stps"] ?? "0",
        req3Achstps: json["Req3achstps"] ?? "0",
        req5Stps: json["Req5stps"] ?? "0",
        req5Achstps: json["Req5achstps"] ?? "0",
        req6Stps: json["Req6stps"] ?? "0",
      );
}
