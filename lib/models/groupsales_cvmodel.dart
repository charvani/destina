// To parse this JSON data, do
//
//     final groupSalesCvModel = groupSalesCvModelFromJson(jsonString);

import 'dart:convert';

GroupSalesCvModel groupSalesCvModelFromJson(String str) =>
    GroupSalesCvModel.fromJson(json.decode(str));

String groupSalesCvModelToJson(GroupSalesCvModel data) =>
    json.encode(data.toJson());

class GroupSalesCvModel {
  List<GroupSalSummaryRpt> groupSalSummaryRpt;
  String msg;
  String message;

  GroupSalesCvModel({
    required this.groupSalSummaryRpt,
    required this.msg,
    required this.message,
  });

  factory GroupSalesCvModel.fromJson(Map<String, dynamic> json) =>
      GroupSalesCvModel(
        groupSalSummaryRpt: List<GroupSalSummaryRpt>.from(
            json["GroupSalSummaryRpt"]
                .map((x) => GroupSalSummaryRpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "GroupSalSummaryRpt":
            List<dynamic>.from(groupSalSummaryRpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
      };
}

class GroupSalSummaryRpt {
  String billno;
  String netAmtT;
  String totBv;
  String netAmt;
  String billDate;
  String idno;
  String name;
  String mname;
  String county;

  GroupSalSummaryRpt(
      {required this.billno,
      required this.netAmtT,
      required this.totBv,
      required this.netAmt,
      required this.billDate,
      required this.idno,
      required this.name,
      required this.mname,
      required this.county});

  factory GroupSalSummaryRpt.fromJson(Map<String, dynamic> json) =>
      GroupSalSummaryRpt(
        billno: json["billno"],
        netAmtT: json["NetAmtT"],
        totBv: json["TotBV"],
        netAmt: json["NetAmt"],
        billDate: json["BillDate"],
        idno: json["idno"],
        county: json['country'],
        name: json["name"],
        mname: json["mname"],
      );

  Map<String, dynamic> toJson() => {
        "billno": billno,
        "NetAmtT": netAmtT,
        "TotBV": totBv,
        "NetAmt": netAmt,
        "BillDate": billDate,
        "idno": idno,
        "name": name,
        "mname": mname,
        "country": county
      };
}

enum Mname {
  ENROLLMENT_RENEWAL,
  MEMBERSHIP_MALL,
  SALES_MALL,
  SIGNUP_MALL,
  UPGRADE_MALL
}

final mnameValues = EnumValues({
  "Enrollment Renewal": Mname.ENROLLMENT_RENEWAL,
  "Membership Mall": Mname.MEMBERSHIP_MALL,
  "Sales Mall": Mname.SALES_MALL,
  "Signup Mall": Mname.SIGNUP_MALL,
  "Upgrade Mall": Mname.UPGRADE_MALL
});

enum Name {
  DAROVE83,
  DAROVE_CARLO,
  DESTINA,
  DESTINA1_INT,
  DGR,
  DIRECT,
  LIFE_CHANGER_LLC,
  TEST,
  USA_COUNTRY_LICENSEE_KRISTOFFER
}

final nameValues = EnumValues({
  "DAROVE83": Name.DAROVE83,
  "Darove Carlo": Name.DAROVE_CARLO,
  "destina": Name.DESTINA,
  "destina1int ": Name.DESTINA1_INT,
  "dgr": Name.DGR,
  "Direct": Name.DIRECT,
  "Life Changer LLC": Name.LIFE_CHANGER_LLC,
  "test": Name.TEST,
  "USA COUNTRY LICENSEE KRISTOFFER": Name.USA_COUNTRY_LICENSEE_KRISTOFFER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
