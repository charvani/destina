// To parse this JSON data, do
//
//     final listOfReqProfileApproveModel = listOfReqProfileApproveModelFromJson(jsonString);

import 'dart:convert';

ListOfReqProfileApproveModel listOfReqProfileApproveModelFromJson(String str) =>
    ListOfReqProfileApproveModel.fromJson(json.decode(str));

String listOfReqProfileApproveModelToJson(ListOfReqProfileApproveModel data) =>
    json.encode(data.toJson());

class ListOfReqProfileApproveModel {
  String msg;
  String message;
  String sno;
  String idno;
  String regid;
  String fname;
  String fathername;
  String dob;
  String sex;
  String passport;
  dynamic ssn;
  String add1;
  String add2;
  String city;
  String pin;
  String email;
  String mobile;
  String stdcode;
  String landline;
  String bank;
  String branch;
  String accno;
  String ifsccode;
  String swiftcode;
  String benname;
  String benrelation;
  String nominee;
  String nomrel;
  String oadd1;
  String oadd2;
  String ocity;
  String opin;
  String omobile;
  String oemail;
  String odcode;
  String oline;
  String obenname;
  String obank;
  String oaccno;
  String obranch;
  String oifscode;
  String oswiftcode;
  String obrel;
  String onominee;
  String onomrel;
  String odob;
  String osex;
  String ofname;
  String opasport;
  String ossn;
  String oname;

  ListOfReqProfileApproveModel({
    required this.msg,
    required this.message,
    required this.sno,
    required this.idno,
    required this.regid,
    required this.fname,
    required this.fathername,
    required this.dob,
    required this.sex,
    required this.passport,
    required this.ssn,
    required this.add1,
    required this.add2,
    required this.city,
    required this.pin,
    required this.email,
    required this.mobile,
    required this.stdcode,
    required this.landline,
    required this.bank,
    required this.branch,
    required this.accno,
    required this.ifsccode,
    required this.swiftcode,
    required this.benname,
    required this.benrelation,
    required this.nominee,
    required this.nomrel,
    required this.oadd1,
    required this.oadd2,
    required this.ocity,
    required this.opin,
    required this.omobile,
    required this.oemail,
    required this.odcode,
    required this.oline,
    required this.obenname,
    required this.obank,
    required this.oaccno,
    required this.obranch,
    required this.oifscode,
    required this.oswiftcode,
    required this.obrel,
    required this.onominee,
    required this.onomrel,
    required this.odob,
    required this.osex,
    required this.ofname,
    required this.opasport,
    required this.ossn,
    required this.oname,
  });

  factory ListOfReqProfileApproveModel.fromJson(Map<String, dynamic> json) =>
      ListOfReqProfileApproveModel(
        msg: json["Msg"],
        message: json["Message"],
        sno: json["sno"],
        idno: json["idno"],
        regid: json["regid"],
        fname: json["fname"],
        fathername: json["fathername"],
        dob: json["dob"],
        sex: json["sex"],
        passport: json["passport"],
        ssn: json["ssn"],
        add1: json["add1"],
        add2: json["add2"],
        city: json["city"],
        pin: json["pin"],
        email: json["email"],
        mobile: json["mobile"],
        stdcode: json["stdcode"],
        landline: json["landline"],
        bank: json["Bank"],
        branch: json["branch"],
        accno: json["accno"],
        ifsccode: json["ifsccode"],
        swiftcode: json["swiftcode"],
        benname: json["benname"],
        benrelation: json["benrelation"],
        nominee: json["nominee"],
        nomrel: json["nomrel"],
        oadd1: json["oadd1"],
        oadd2: json["oadd2"],
        ocity: json["ocity"],
        opin: json["opin"],
        omobile: json["omobile"],
        oemail: json["oemail"],
        odcode: json["odcode"],
        oline: json["oline"],
        obenname: json["obenname"],
        obank: json["obank"],
        oaccno: json["oaccno"],
        obranch: json["obranch"],
        oifscode: json["oifscode"],
        oswiftcode: json["oswiftcode"],
        obrel: json["obrel"],
        onominee: json["onominee"],
        onomrel: json["onomrel"],
        odob: json["odob"],
        osex: json["osex"],
        ofname: json["ofname"],
        opasport: json["opasport"],
        ossn: json["ossn"],
        oname: json["oname"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "sno": sno,
        "idno": idno,
        "regid": regid,
        "fname": fname,
        "fathername": fathername,
        "dob": dob,
        "sex": sex,
        "passport": passport,
        "ssn": ssn,
        "add1": add1,
        "add2": add2,
        "city": city,
        "pin": pin,
        "email": email,
        "mobile": mobile,
        "stdcode": stdcode,
        "landline": landline,
        "Bank": bank,
        "branch": branch,
        "accno": accno,
        "ifsccode": ifsccode,
        "swiftcode": swiftcode,
        "benname": benname,
        "benrelation": benrelation,
        "nominee": nominee,
        "nomrel": nomrel,
        "oadd1": oadd1,
        "oadd2": oadd2,
        "ocity": ocity,
        "opin": opin,
        "omobile": omobile,
        "oemail": oemail,
        "odcode": odcode,
        "oline": oline,
        "obenname": obenname,
        "obank": obank,
        "oaccno": oaccno,
        "obranch": obranch,
        "oifscode": oifscode,
        "oswiftcode": oswiftcode,
        "obrel": obrel,
        "onominee": onominee,
        "onomrel": onomrel,
        "odob": odob,
        "osex": osex,
        "ofname": ofname,
        "opasport": opasport,
        "ossn": ossn,
        "oname": oname,
      };
}
