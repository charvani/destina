import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController fullNameTController = TextEditingController();
  TextEditingController dateOfBirthTController = TextEditingController();
  TextEditingController passportTController = TextEditingController();
  TextEditingController spouseNameTController = TextEditingController();
  TextEditingController panTController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController cityTController = TextEditingController();
  TextEditingController areaTController = TextEditingController();
  TextEditingController dialTController = TextEditingController();
  TextEditingController emailTController = TextEditingController();
  TextEditingController address2TController = TextEditingController();
  TextEditingController landLineTController = TextEditingController();
  TextEditingController mobileNumTController = TextEditingController();
  TextEditingController accountNumTController = TextEditingController();
  TextEditingController swiftNumTController = TextEditingController();
  TextEditingController branchTController = TextEditingController();
  TextEditingController ifscTController = TextEditingController();
  TextEditingController holderNameTController = TextEditingController();
  TextEditingController nomineeNameTController = TextEditingController();
  dynamic gender;
  dynamic bankName, bankId;
  dynamic typeOfBank;
  dynamic relation;
  dynamic joinType;
  dynamic state;
  dynamic country;
  dynamic buttonLoading = false;
  dynamic bankLoading = true;
  BoxDecoration dec = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: lightBlackColor.withOpacity(0.5)));
  final MainController _profileController = Get.put(MainController());
  bankData() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    await _profileController.getBankInfo(bdata);
    await dataFun();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bankData();
    });
  }

  dataFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    dynamic res = await _profileController.getViewProfile(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        fullNameTController.text =
            _profileController.viewProfileData.value.fullName;
        dateOfBirthTController.text =
            _profileController.viewProfileData.value.dob;
        passportTController.text =
            _profileController.viewProfileData.value.passport;
        spouseNameTController.text =
            _profileController.viewProfileData.value.fathSpousName;
        gender = _profileController.viewProfileData.value.gender;
        joinType = _profileController.viewProfileData.value.joinType;
        panTController.text = _profileController.viewProfileData.value.ssnein;

        address1Controller.text = _profileController.viewProfileData.value.add1;
        cityTController.text = _profileController.viewProfileData.value.city;
        areaTController.text = _profileController.viewProfileData.value.zipCode;
        dialTController.text =
            _profileController.viewProfileData.value.dialCode;
        emailTController.text = _profileController.viewProfileData.value.email;
        address2TController.text =
            _profileController.viewProfileData.value.add2;
        landLineTController.text =
            _profileController.viewProfileData.value.landLine;
        mobileNumTController.text =
            _profileController.viewProfileData.value.mobile;
        bankName = _profileController.viewProfileData.value.bankName;
        accountNumTController.text =
            _profileController.viewProfileData.value.acNo;
        swiftNumTController.text =
            _profileController.viewProfileData.value.bankSwiftCode;
        branchTController.text =
            _profileController.viewProfileData.value.bankBranch;
        ifscTController.text =
            _profileController.viewProfileData.value.ifscCode;
        holderNameTController.text =
            _profileController.viewProfileData.value.acHolderName == "0"
                ? ""
                : _profileController.viewProfileData.value.acHolderName;
        relation = _profileController.viewProfileData.value.nomieeRelation;
        nomineeNameTController.text =
            _profileController.viewProfileData.value.nomieeName == "0"
                ? ""
                : _profileController.viewProfileData.value.nomieeName;
        state = _profileController.viewProfileData.value.state;
        country = _profileController.viewProfileData.value.countryName;
        typeOfBank = _profileController.viewProfileData.value.typeOfAc;
        bankId = _profileController.viewProfileData.value.bankid;
      }
    }
    setState(() {
      bankLoading = false;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Profile Update", backNavigation: true),
      body: Obx(() {
        return _profileController.loading.value || bankLoading
            ? loader
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeightWidget(height: 10),
                        const CommonTitle(titleName: "Personal Details"),
                        const SpaceHeightWidget(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: dec,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemTitleWidget("Full Name"),
                                AccountTextField(
                                  readOnly: true,
                                  backgroundColor:
                                      lightDarKBlue.withOpacity(0.1),
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "ex: John Lee",
                                  controller: fullNameTController,
                                  validation: (val) {
                                    return null;
                                  },
                                ),
                                itemTitleWidget("Date of Birth"),
                                AccountTextField(
                                  readOnly: true,
                                  backgroundColor:
                                      lightDarKBlue.withOpacity(0.1),
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "28 Jul 2012",
                                  controller: dateOfBirthTController,
                                  validation: (val) {
                                    return null;
                                  },
                                ),
                                const SpaceHeightWidget(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    itemTitleWidget("Joining Type"),
                                    Text(
                                      joinType ?? "",
                                      style: TextStyle(
                                          fontFamily: "OnestSemiBold",
                                          fontSize: 14,
                                          color: darkRedColor),
                                    )
                                  ],
                                ),
                                const SpaceHeightWidget(height: 10),
                                itemTitleWidget("Passport/IC/DL"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Passport/IC/DL",
                                  controller: passportTController,
                                  validation: (val) {
                                    return null;

                                    // if (val!.isEmpty) {
                                    //   return "Passport/IC/DL";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                ),
                                itemTitleWidget("Father/Spouse Name"),
                                AccountTextField(
                                  readOnly: true,
                                  backgroundColor:
                                      lightDarKBlue.withOpacity(0.1),
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "ex: John Lee",
                                  controller: spouseNameTController,
                                  validation: (val) {
                                    return null;
                                  },
                                ),
                                itemTitleWidget("Gender"),
                                ProfileDropDown(
                                    value: gender ?? "Male",
                                    onChangedFun: (val) {
                                      setState(() {
                                        gender = val;
                                      });
                                    },
                                    items: const ["Male", "Female"]),
                                itemTitleWidget(
                                    "SSN/EIN/ITIN/ATIN/PTIN/CBP/PAN"),
                                AccountTextField(
                                  readOnly: true,
                                  backgroundColor:
                                      lightDarKBlue.withOpacity(0.1),
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "41",
                                  controller: panTController,
                                  validation: (val) {
                                    return null;

                                    // return null;
                                  },
                                ),
                              ]),
                        ),
                        const SpaceHeightWidget(height: 10),
                        const CommonTitle(titleName: "Address Details"),
                        const SpaceHeightWidget(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: dec,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemTitleWidget("Address 1"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Address 1",
                                  controller: address1Controller,
                                  validation: (val) {
                                    if (val!.isEmpty) {
                                      return "Address 1";
                                    } else if (val.length < 3) {
                                      return "Enter valid address";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                itemTitleWidget("City/Area"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "City/Area",
                                  controller: cityTController,
                                  validation: (val) {
                                    if (val!.isEmpty) {
                                      return "City/Area";
                                    } else if (val.length < 3) {
                                      return "Enter valid City/Area";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                itemTitleWidget("Area/Zip Code"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Area/Zip Code",
                                  controller: areaTController,
                                  validation: (val) {
                                    if (val!.isEmpty) {
                                      return "Area/Zip Code";
                                    } else if (val.length < 3) {
                                      return "Enter valid Area/Zip Code";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                itemTitleWidget("Dial Code"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Dial Code",
                                  controller: dialTController,
                                  validation: (val) {
                                    return null;

                                    // if (val!.isEmpty) {
                                    //   return "Dial Code";
                                    // } else if (val.length < 3) {
                                    //   return "Enter valid Dial Code";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                ),
                                itemTitleWidget("Email Address"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Email Address",
                                  controller: emailTController,
                                  validation: (val) {
                                    RegExp reg = RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                                    if (val!.isEmpty) {
                                      return "Email address";
                                    } else if (!reg.hasMatch(val)) {
                                      return "Enter valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                itemTitleWidget("Address 2"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Address 2",
                                  controller: address2TController,
                                  validation: (val) {
                                    if (val!.isEmpty) {
                                      return "Address 2";
                                    } else if (val.length < 3) {
                                      return "Enter valid Address 2";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                ViewProfileWidget(
                                  title: "State/Province",
                                  info: state ?? "",
                                ),
                                ViewProfileWidget(
                                  title: "Country Name",
                                  info: country ?? "",
                                ),
                                const SpaceHeightWidget(height: 10),
                                itemTitleWidget("Land Line"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Land Line",
                                  controller: landLineTController,
                                  validation: (val) {
                                    return null;

                                    // if (val!.isEmpty) {
                                    //   return "Land Line";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                ),
                                itemTitleWidget("Mobile"),
                                AccountTextField(
                                  readOnly: true,
                                  backgroundColor:
                                      lightDarKBlue.withOpacity(0.1),
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "Mobile Number",
                                  controller: mobileNumTController,
                                  validation: (val) {
                                    return null;
                                  },
                                ),
                              ]),
                        ),
                        const SpaceHeightWidget(height: 10),
                        const CommonTitle(titleName: "Bank Details"),
                        const SpaceHeightWidget(height: 10),
                        if (_profileController.bankIdData.isNotEmpty)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: dec,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  itemTitleWidget("Bank Name"),
                                  ProfileDropDown(
                                      // value: bankName,
                                      onChangedFun: (val) {
                                        setState(() {
                                          bankName = val;
                                        });
                                        for (int i = 0;
                                            i <
                                                _profileController
                                                    .bankIdData.length;
                                            i++) {
                                          if (_profileController
                                                  .bankIdData[i].bankName ==
                                              bankName) {
                                            setState(() {
                                              bankId = _profileController
                                                  .bankIdData[i].bankId;
                                            });
                                          }
                                        }
                                      },
                                      items: _profileController.bankIdData
                                          .map((element) => element.bankName)
                                          .toList()),
                                  itemTitleWidget("Account Number"),
                                  AccountTextField(
                                    onchangeFun: (val) {},
                                    outsideFun: (val) async {},
                                    textInputType: TextInputType.name,
                                    hintText: "Account Number",
                                    controller: accountNumTController,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Account Number";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  itemTitleWidget("Bank Swift Code"),
                                  AccountTextField(
                                    onchangeFun: (val) {},
                                    outsideFun: (val) async {},
                                    textInputType: TextInputType.name,
                                    hintText: "Bank Swift Code",
                                    controller: swiftNumTController,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Bank Swift Code";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  itemTitleWidget("Type Of Account"),
                                  ProfileDropDown(
                                      onChangedFun: (val) {
                                        setState(() {
                                          typeOfBank = val;
                                        });
                                      },
                                      items: const [
                                        "Savings",
                                        "Current",
                                      ]),
                                  itemTitleWidget("Bank Branch"),
                                  AccountTextField(
                                    onchangeFun: (val) {},
                                    outsideFun: (val) async {},
                                    textInputType: TextInputType.name,
                                    hintText: "Bank Branch",
                                    controller: branchTController,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Bank Branch";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  itemTitleWidget(
                                      "Bank IFSC Code/Routing Number"),
                                  AccountTextField(
                                    onchangeFun: (val) {},
                                    outsideFun: (val) async {},
                                    textInputType: TextInputType.name,
                                    hintText: "Bank IFSC Code/Routing Number",
                                    controller: ifscTController,
                                    validation: (val) {
                                      if (val!.isEmpty) {
                                        return "Bank IFSC Code/Routing Number";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  itemTitleWidget(
                                      "Account Holder's Name(Same as the Bank Account)"),
                                  AccountTextField(
                                    onchangeFun: (val) {},
                                    outsideFun: (val) async {},
                                    textInputType: TextInputType.name,
                                    hintText:
                                        "Account Holder's Name(Same as the Bank Account)",
                                    controller: holderNameTController,
                                    validation: (val) {
                                      return null;

                                      // if (val!.isEmpty) {
                                      //   return "Account Holder's Name(Same as the Bank Account)";
                                      // } else {
                                      //   return null;
                                      // }
                                    },
                                  ),
                                ]),
                          ),
                        const SpaceHeightWidget(height: 10),
                        const CommonTitle(titleName: "Nominee Details"),
                        const SpaceHeightWidget(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: dec,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemTitleWidget("Nominee's Relationship"),
                                ProfileDropDown(
                                    value: relation,
                                    onChangedFun: (val) {
                                      setState(() {
                                        relation = val;
                                      });
                                    },
                                    items: const [
                                      "Brother",
                                      "Sister",
                                      "Father",
                                      "Mother",
                                      "Son",
                                      "Daughter",
                                      "Wife",
                                      "Husband"
                                    ]),
                                itemTitleWidget("Nominee's Name(Next of Kin)"),
                                AccountTextField(
                                  onchangeFun: (val) {},
                                  outsideFun: (val) async {},
                                  textInputType: TextInputType.name,
                                  hintText: "",
                                  controller: nomineeNameTController,
                                  validation: (val) {
                                    return null;

                                    // if (val!.isEmpty) {
                                    //   return "Nominee's Name(Next of Kin)";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                ),
                              ]),
                        ),
                        buttonLoading
                            ? loader
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 25),
                                child: CustomElevatedButton(
                                    onTapFun: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          buttonLoading = true;
                                        });
                                        Map bData = {
                                          "UserId": Constants.prefs
                                              .getString("user_id"),
                                          "Pwd": Constants.prefs
                                              .getString("password"),
                                          "FullName": fullNameTController.text,
                                          "FathSpousName":
                                              spouseNameTController.text,
                                          "DOB":
                                              // "28/07/2012",
                                              dateOfBirthTController.text,
                                          "Gender":
                                              gender == "Male" ? "0" : "1",
                                          "JoinType": joinType,
                                          "SSNEIN": panTController.text,
                                          "Passport": passportTController.text,
                                          "Add1": address1Controller.text,
                                          "Add2": address2TController.text,
                                          "City": cityTController.text,
                                          "State": state,
                                          "ZipCode": areaTController.text,
                                          "CountryName": country,
                                          "DialCode": dialTController.text,
                                          "LandLine": landLineTController.text,
                                          "Email": emailTController.text,
                                          "Mobile": mobileNumTController.text,
                                          "BankId": bankId,
                                          "BankBranch": branchTController.text,
                                          "AcNo": accountNumTController.text,
                                          "IFSCCode": ifscTController.text,
                                          "BankSwiftCode":
                                              swiftNumTController.text,
                                          "AcHolderName":
                                              holderNameTController.text,
                                          "TypeOfAc": typeOfBank,
                                          "NomieeName":
                                              nomineeNameTController.text,
                                          "NomieeRelation": relation,
                                        };
                                        dynamic res = await _profileController
                                            .getUpdateProfile(bData);
                                        if (res != null) {
                                          if (res['Msg'] == "SUCCESS") {
                                            CommonToastTrue(res['Message']);
                                            dataFun();
                                          }
                                        }
                                        setState(() {
                                          buttonLoading = false;
                                        });
                                      }
                                    },
                                    title: "UPDATE"),
                              ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }

  itemTitleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
    );
  }
}
