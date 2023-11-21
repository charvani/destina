// To parse this JSON data, do
//
//     final signupLoadModel = signupLoadModelFromJson(jsonString);

import 'dart:convert';

SignupLoadModel signupLoadModelFromJson(String str) =>
    SignupLoadModel.fromJson(json.decode(str));

String signupLoadModelToJson(SignupLoadModel data) =>
    json.encode(data.toJson());

class SignupLoadModel {
  List<StateDetailsRpt> stateDetailsRpt;
  List<BankDetailsRpt> bankDetailsRpt;
  List<SecretQuesRpt> secretQuesRpt;
  List<UserSinguprulesRpt> userSinguprulesRpt;
  String msg;
  String message;
  String hidUid;
  String randomnum;
  String country;

  SignupLoadModel({
    required this.stateDetailsRpt,
    required this.bankDetailsRpt,
    required this.secretQuesRpt,
    required this.userSinguprulesRpt,
    required this.msg,
    required this.message,
    required this.hidUid,
    required this.randomnum,
    required this.country,
  });

  factory SignupLoadModel.fromJson(Map<String, dynamic> json) =>
      SignupLoadModel(
        stateDetailsRpt: List<StateDetailsRpt>.from(
            json["StateDetailsRpt"].map((x) => StateDetailsRpt.fromJson(x))),
        bankDetailsRpt: List<BankDetailsRpt>.from(
            json["BankDetailsRpt"].map((x) => BankDetailsRpt.fromJson(x))),
        secretQuesRpt: List<SecretQuesRpt>.from(
            json["SecretQuesRpt"].map((x) => SecretQuesRpt.fromJson(x))),
        userSinguprulesRpt: List<UserSinguprulesRpt>.from(
            json["UserSinguprulesRpt"]
                .map((x) => UserSinguprulesRpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        hidUid: json["hidUid"],
        randomnum: json["Randomnum"],
        country: json["Country"],
      );

  Map<String, dynamic> toJson() => {
        "StateDetailsRpt":
            List<dynamic>.from(stateDetailsRpt.map((x) => x.toJson())),
        "BankDetailsRpt":
            List<dynamic>.from(bankDetailsRpt.map((x) => x.toJson())),
        "SecretQuesRpt":
            List<dynamic>.from(secretQuesRpt.map((x) => x.toJson())),
        "UserSinguprulesRpt":
            List<dynamic>.from(userSinguprulesRpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "hidUid": hidUid,
        "Randomnum": randomnum,
        "Country": country,
      };
}

class BankDetailsRpt {
  String bankName;

  BankDetailsRpt({
    required this.bankName,
  });

  factory BankDetailsRpt.fromJson(Map<String, dynamic> json) => BankDetailsRpt(
        bankName: json["BankName"],
      );

  Map<String, dynamic> toJson() => {
        "BankName": bankName,
      };
}

class SecretQuesRpt {
  String slno;
  String squestion;

  SecretQuesRpt({
    required this.slno,
    required this.squestion,
  });

  factory SecretQuesRpt.fromJson(Map<String, dynamic> json) => SecretQuesRpt(
        slno: json["slno"],
        squestion: json["Squestion"],
      );

  Map<String, dynamic> toJson() => {
        "slno": slno,
        "Squestion": squestion,
      };
}

class StateDetailsRpt {
  String stateName;
  String stateId;

  StateDetailsRpt({
    required this.stateName,
    required this.stateId,
  });

  factory StateDetailsRpt.fromJson(Map<String, dynamic> json) =>
      StateDetailsRpt(
        stateName: json["StateName"],
        stateId: json["StateID"],
      );

  Map<String, dynamic> toJson() => {
        "StateName": stateName,
        "StateID": stateId,
      };
}

class UserSinguprulesRpt {
  String ageReq;
  String ageMin;
  String emailReq;
  String emailMin;
  String pportReq;
  String pportMin;
  String idReq;
  String idMin;

  UserSinguprulesRpt({
    required this.ageReq,
    required this.ageMin,
    required this.emailReq,
    required this.emailMin,
    required this.pportReq,
    required this.pportMin,
    required this.idReq,
    required this.idMin,
  });

  factory UserSinguprulesRpt.fromJson(Map<String, dynamic> json) =>
      UserSinguprulesRpt(
        ageReq: json["AgeReq"],
        ageMin: json["AgeMin"],
        emailReq: json["EmailReq"],
        emailMin: json["EmailMin"],
        pportReq: json["PportReq"],
        pportMin: json["PportMin"],
        idReq: json["IdReq"],
        idMin: json["IdMin"],
      );

  Map<String, dynamic> toJson() => {
        "AgeReq": ageReq,
        "AgeMin": ageMin,
        "EmailReq": emailReq,
        "EmailMin": emailMin,
        "PportReq": pportReq,
        "PportMin": pportMin,
        "IdReq": idReq,
        "IdMin": idMin,
      };
}
