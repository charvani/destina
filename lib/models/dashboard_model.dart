// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  List<MyIncome> myIncome;
  List<MyDownlineRpt> myDownlineLRpt;
  List<MyDownlineRpt> myDownlineRRpt;
  String msg;
  String message;
  String pdName;
  String pdSponsorId;
  String pdJoinDate;
  String pdStatus;
  String pdMobileNo;
  String remdays;
  int days;
  String currentDashbordDate;
  String bdActivBuss;
  String bdRetBuss;
  String bdPreCustBuss;
  String bdSalesBuss;
  String bdActivBussM;
  String bdRetBussM;
  String bdPreCustBussM;
  String bdSalesBussM;
  String commissonEMny;
  String prepaidEMny;
  String stockLicEMny;
  String prepaidECard;
  String redmptionEMny;
  String newLeftCv;
  String newRightCv;
  String leftCarryFwd;
  String rightCarryFwd;
  String netSteps;
  String cashBack;
  String creRebate;
  String dpPts;
  String redmMsg;
  String flushMsg;
  String pkageName;
  String rankname;
  String symbol;
  String incRemarks;
  String icons;
  String mbdBonus;
  String mainForCurMnt;
  String mainForNxtMnt;
  String rentMntsMaintain;
  String licenseType;
  String commisions;
  String licenseCode;
  String licenseName;
  String country;
  String state;
  String showRes;
  String remainingDays;
  String pkmall;
  String catRemainingDays;
  String reqcv;
  String upgcat;
  String upgsteps;
  String upgpack;
  bool catUpg;
  bool catSteps;
  String nupgdate;
  String pkgUpgrade;
  String endDate;

  DashboardModel({
    required this.myIncome,
    required this.myDownlineLRpt,
    required this.myDownlineRRpt,
    required this.msg,
    required this.message,
    required this.pdName,
    required this.pdSponsorId,
    required this.pdJoinDate,
    required this.pdStatus,
    required this.pdMobileNo,
    required this.remdays,
    required this.days,
    required this.currentDashbordDate,
    required this.bdActivBuss,
    required this.bdRetBuss,
    required this.bdPreCustBuss,
    required this.bdSalesBuss,
    required this.bdActivBussM,
    required this.bdRetBussM,
    required this.bdPreCustBussM,
    required this.bdSalesBussM,
    required this.commissonEMny,
    required this.prepaidEMny,
    required this.stockLicEMny,
    required this.prepaidECard,
    required this.redmptionEMny,
    required this.newLeftCv,
    required this.newRightCv,
    required this.leftCarryFwd,
    required this.rightCarryFwd,
    required this.netSteps,
    required this.cashBack,
    required this.creRebate,
    required this.dpPts,
    required this.redmMsg,
    required this.flushMsg,
    required this.pkageName,
    required this.rankname,
    required this.symbol,
    required this.incRemarks,
    required this.icons,
    required this.mbdBonus,
    required this.mainForCurMnt,
    required this.mainForNxtMnt,
    required this.rentMntsMaintain,
    required this.licenseType,
    required this.commisions,
    required this.licenseCode,
    required this.licenseName,
    required this.country,
    required this.state,
    required this.showRes,
    required this.remainingDays,
    required this.pkmall,
    required this.catRemainingDays,
    required this.reqcv,
    required this.upgcat,
    required this.upgsteps,
    required this.upgpack,
    required this.catUpg,
    required this.catSteps,
    required this.nupgdate,
    required this.pkgUpgrade,
    required this.endDate,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        myIncome: List<MyIncome>.from(
            json["myIncome"].map((x) => MyIncome.fromJson(x))),
        myDownlineLRpt: List<MyDownlineRpt>.from(
            json["MyDownlineLRpt"].map((x) => MyDownlineRpt.fromJson(x))),
        myDownlineRRpt: List<MyDownlineRpt>.from(
            json["MyDownlineRRpt"].map((x) => MyDownlineRpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        pdName: json["PDName"],
        pdSponsorId: json["PDSponsorId"],
        pdJoinDate: json["PDJoinDate"],
        pdStatus: json["PDStatus"],
        pdMobileNo: json["PDMobileNo"],
        remdays: json["remdays"],
        days: json["days"],
        currentDashbordDate: json["currentDashbordDate"],
        bdActivBuss: json["BDActivBuss"],
        bdRetBuss: json["BDRetBuss"],
        bdPreCustBuss: json["BDPreCustBuss"],
        bdSalesBuss: json["BDSalesBuss"],
        bdActivBussM: json["BDActivBussM"],
        bdRetBussM: json["BDRetBussM"],
        bdPreCustBussM: json["BDPreCustBussM"],
        bdSalesBussM: json["BDSalesBussM"],
        commissonEMny: json["CommissonEMny"],
        prepaidEMny: json["PrepaidEMny"],
        stockLicEMny: json["StockLicEMny"],
        prepaidECard: json["PrepaidECard"],
        redmptionEMny: json["RedmptionEMny"],
        newLeftCv: json["NewLeftCV"],
        newRightCv: json["NewRightCV"],
        leftCarryFwd: json["LeftCarryFwd"],
        rightCarryFwd: json["RightCarryFwd"],
        netSteps: json["NetSteps"],
        cashBack: json["cashBack"],
        creRebate: json["CreRebate"],
        dpPts: json["DpPts"],
        redmMsg: json["RedmMsg"],
        flushMsg: json["FlushMsg"],
        pkageName: json["PkageName"],
        rankname: json["Rankname"],
        symbol: json["Symbol"],
        incRemarks: json["IncRemarks"],
        icons: json["icons"],
        mbdBonus: json["MBDBonus"],
        mainForCurMnt: json["MainForCurMnt"],
        mainForNxtMnt: json["MainForNxtMnt"],
        rentMntsMaintain: json["RentMntsMaintain"],
        licenseType: json["LicenseType"],
        commisions: json["Commisions"],
        licenseCode: json["LicenseCode"],
        licenseName: json["LicenseName"],
        country: json["Country"],
        state: json["State"],
        showRes: json["ShowRes"],
        remainingDays: json["RemainingDays"],
        pkmall: json["pkmall"],
        catRemainingDays: json["CatRemainingDays"],
        reqcv: json["reqcv"],
        upgcat: json["upgcat"],
        upgsteps: json["upgsteps"],
        upgpack: json["upgpack"],
        catUpg: json["CatUpg"],
        catSteps: json["CatSteps"],
        nupgdate: json["Nupgdate"],
        pkgUpgrade: json["PkgUpgrade"],
        endDate: json["EndDate"],
      );

  Map<String, dynamic> toJson() => {
        "myIncome": List<dynamic>.from(myIncome.map((x) => x.toJson())),
        "MyDownlineLRpt":
            List<dynamic>.from(myDownlineLRpt.map((x) => x.toJson())),
        "MyDownlineRRpt":
            List<dynamic>.from(myDownlineRRpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "PDName": pdName,
        "PDSponsorId": pdSponsorId,
        "PDJoinDate": pdJoinDate,
        "PDStatus": pdStatus,
        "PDMobileNo": pdMobileNo,
        "remdays": remdays,
        "days": days,
        "currentDashbordDate": currentDashbordDate,
        "BDActivBuss": bdActivBuss,
        "BDRetBuss": bdRetBuss,
        "BDPreCustBuss": bdPreCustBuss,
        "BDSalesBuss": bdSalesBuss,
        "BDActivBussM": bdActivBussM,
        "BDRetBussM": bdRetBussM,
        "BDPreCustBussM": bdPreCustBussM,
        "BDSalesBussM": bdSalesBussM,
        "CommissonEMny": commissonEMny,
        "PrepaidEMny": prepaidEMny,
        "StockLicEMny": stockLicEMny,
        "PrepaidECard": prepaidECard,
        "RedmptionEMny": redmptionEMny,
        "NewLeftCV": newLeftCv,
        "NewRightCV": newRightCv,
        "LeftCarryFwd": leftCarryFwd,
        "RightCarryFwd": rightCarryFwd,
        "NetSteps": netSteps,
        "cashBack": cashBack,
        "CreRebate": creRebate,
        "DpPts": dpPts,
        "RedmMsg": redmMsg,
        "FlushMsg": flushMsg,
        "PkageName": pkageName,
        "Rankname": rankname,
        "Symbol": symbol,
        "IncRemarks": incRemarks,
        "icons": icons,
        "MBDBonus": mbdBonus,
        "MainForCurMnt": mainForCurMnt,
        "MainForNxtMnt": mainForNxtMnt,
        "RentMntsMaintain": rentMntsMaintain,
        "LicenseType": licenseType,
        "Commisions": commisions,
        "LicenseCode": licenseCode,
        "LicenseName": licenseName,
        "Country": country,
        "State": state,
        "ShowRes": showRes,
        "RemainingDays": remainingDays,
        "pkmall": pkmall,
        "CatRemainingDays": catRemainingDays,
        "reqcv": reqcv,
        "upgcat": upgcat,
        "upgsteps": upgsteps,
        "upgpack": upgpack,
        "CatUpg": catUpg,
        "CatSteps": catSteps,
      };
}

class MyDownlineRpt {
  String idno;
  String name;
  Position position;
  String image;

  MyDownlineRpt({
    required this.idno,
    required this.name,
    required this.position,
    required this.image,
  });

  factory MyDownlineRpt.fromJson(Map<String, dynamic> json) => MyDownlineRpt(
        idno: json["idno"],
        name: json["name"],
        position: positionValues.map[json["Position"]]!,
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "idno": idno,
        "name": name,
        "Position": positionValues.reverse[position],
        "Image": image,
      };
}

enum Position { LEFT, RIGHT }

final positionValues =
    EnumValues({"Left": Position.LEFT, "Right": Position.RIGHT});

class MyIncome {
  String incName;
  String bonus;

  MyIncome({
    required this.incName,
    required this.bonus,
  });

  factory MyIncome.fromJson(Map<String, dynamic> json) => MyIncome(
        incName: json["IncName"],
        bonus: json["Bonus"],
      );

  Map<String, dynamic> toJson() => {
        "IncName": incName,
        "Bonus": bonus,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
