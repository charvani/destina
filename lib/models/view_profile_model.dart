// To parse this JSON data, do
//
//     final viewProfileModel = viewProfileModelFromJson(jsonString);

import 'dart:convert';

ViewProfileModel viewProfileModelFromJson(String str) =>
    ViewProfileModel.fromJson(json.decode(str));

String viewProfileModelToJson(ViewProfileModel data) =>
    json.encode(data.toJson());

class ViewProfileModel {
  String msg;
  String message;
  String fullName;
  String fathSpousName;
  String dob;
  String gender;
  String joinType;
  String ssnein;
  String passport;
  String add1;
  String add2;
  String city;
  String state;
  String zipCode;
  String countryName;
  String dialCode;
  String landLine;
  String email;
  String mobile;
  String bankid;
  String bankName;
  String bankBranch;
  String acNo;
  String ifscCode;
  String bankSwiftCode;
  String acHolderName;
  String typeOfAc;
  String nomieeName;
  String nomieeRelation;
  String eText;
  String deduction;

  ViewProfileModel({
    required this.msg,
    required this.message,
    required this.fullName,
    required this.fathSpousName,
    required this.dob,
    required this.gender,
    required this.joinType,
    required this.ssnein,
    required this.passport,
    required this.add1,
    required this.add2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.countryName,
    required this.dialCode,
    required this.landLine,
    required this.email,
    required this.mobile,
    required this.bankid,
    required this.bankName,
    required this.bankBranch,
    required this.acNo,
    required this.ifscCode,
    required this.bankSwiftCode,
    required this.acHolderName,
    required this.typeOfAc,
    required this.nomieeName,
    required this.nomieeRelation,
    required this.eText,
    required this.deduction,
  });

  factory ViewProfileModel.fromJson(Map<String, dynamic> json) =>
      ViewProfileModel(
        msg: json["Msg"],
        message: json["Message"],
        fullName: json["FullName"],
        fathSpousName: json["FathSpousName"],
        dob: json["DOB"],
        gender: json["Gender"],
        joinType: json["JoinType"],
        ssnein: json["SSNEIN"],
        passport: json["Passport"],
        add1: json["Add1"],
        add2: json["Add2"],
        city: json["City"],
        state: json["State"],
        zipCode: json["ZipCode"],
        countryName: json["CountryName"],
        dialCode: json["DialCode"],
        landLine: json["LandLine"],
        email: json["Email"],
        mobile: json["Mobile"],
        bankid: json["bankid"],
        bankName: json["BankName"],
        bankBranch: json["BankBranch"],
        acNo: json["AcNo"],
        ifscCode: json["IFSCCode"],
        bankSwiftCode: json["BankSwiftCode"],
        acHolderName: json["AcHolderName"],
        typeOfAc: json["TypeOfAc"],
        nomieeName: json["NomieeName"],
        nomieeRelation: json["NomieeRelation"],
        eText: json["EText"],
        deduction: json["Deduction"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "FullName": fullName,
        "FathSpousName": fathSpousName,
        "DOB": dob,
        "Gender": gender,
        "JoinType": joinType,
        "SSNEIN": ssnein,
        "Passport": passport,
        "Add1": add1,
        "Add2": add2,
        "City": city,
        "State": state,
        "ZipCode": zipCode,
        "CountryName": countryName,
        "DialCode": dialCode,
        "LandLine": landLine,
        "Email": email,
        "Mobile": mobile,
        "bankid": bankid,
        "BankName": bankName,
        "BankBranch": bankBranch,
        "AcNo": acNo,
        "IFSCCode": ifscCode,
        "BankSwiftCode": bankSwiftCode,
        "AcHolderName": acHolderName,
        "TypeOfAc": typeOfAc,
        "NomieeName": nomieeName,
        "NomieeRelation": nomieeRelation,
        "EText": eText,
        "Deduction": deduction,
      };
}
