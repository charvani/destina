import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

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
  dynamic bank;
  dynamic relation;
  BoxDecoration dec = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: lightBlackColor.withOpacity(0.5)));

  @override
  void initState() {
    super.initState();
    fullNameTController.text = "DESTINA1";
    dateOfBirthTController.text = "28 Jul 2012";
    passportTController.text = "790126075411";
    spouseNameTController.text = "DESTINA1";
    gender = "Male";
    panTController.text = "0";

    address1Controller.text = "Suite 3.2 Level 3, Block B";
    cityTController.text = "PETALING JAYA";
    areaTController.text = "46050";
    dialTController.text = "61";
    emailTController.text = "balajirao.s@gmail.com";
    address2TController.text = "Bangunan Pan Global,";
    landLineTController.text = "123";
    mobileNumTController.text = "514844604";
    bank = "MAYBANK";
    accountNumTController.text = "512884092299";
    swiftNumTController.text = "mbbemykl";
    branchTController.text = "PUCHONG";
    ifscTController.text = "maybank";
    holderNameTController.text = "0";
    relation = "Son";
    nomineeNameTController.text = "0";
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Profile Update", backNavigation: true),
      body: SingleChildScrollView(
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
                          backgroundColor: lightDarKBlue.withOpacity(0.1),
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
                          backgroundColor: lightDarKBlue.withOpacity(0.1),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            itemTitleWidget("Joining Type"),
                            Text(
                              "Personal",
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
                            if (val!.isEmpty) {
                              return "Passport/IC/DL";
                            } else {
                              return null;
                            }
                          },
                        ),
                        itemTitleWidget("Father/Spouse Name"),
                        AccountTextField(
                          readOnly: true,
                          backgroundColor: lightDarKBlue.withOpacity(0.1),
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
                        itemTitleWidget("SSN/EIN/ITIN/ATIN/PTIN/CBP/PAN"),
                        AccountTextField(
                          readOnly: true,
                          backgroundColor: lightDarKBlue.withOpacity(0.1),
                          onchangeFun: (val) {},
                          outsideFun: (val) async {},
                          textInputType: TextInputType.name,
                          hintText: "41",
                          controller: panTController,
                          validation: (val) {
                            return null;
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
                            if (val!.isEmpty) {
                              return "Dial Code";
                            } else if (val.length < 3) {
                              return "Enter valid Dial Code";
                            } else {
                              return null;
                            }
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
                        const ViewProfileWidget(
                          title: "State/Province",
                          info: "Johor",
                        ),
                        const ViewProfileWidget(
                          title: "Country Name",
                          info: "Malaysia",
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
                            if (val!.isEmpty) {
                              return "Land Line";
                            } else {
                              return null;
                            }
                          },
                        ),
                        itemTitleWidget("Mobile"),
                        AccountTextField(
                          readOnly: true,
                          backgroundColor: lightDarKBlue.withOpacity(0.1),
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: dec,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemTitleWidget("Bank Name"),
                        ProfileDropDown(
                            value: bank,
                            onChangedFun: (val) {
                              setState(() {
                                bank = val;
                              });
                            },
                            items: const [
                              "MAYBANK",
                              "PUBLIC BANK",
                              "CIMB BANK",
                              "AM BANK"
                            ]),
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
                                bank = val;
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
                        itemTitleWidget("Bank IFSC Code/Routing Number"),
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
                            if (val!.isEmpty) {
                              return "Account Holder's Name(Same as the Bank Account)";
                            } else {
                              return null;
                            }
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
                            if (val!.isEmpty) {
                              return "Nominee's Name(Next of Kin)";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: CustomElevatedButton(onTapFun: () {}, title: "UPDATE"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemTitleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
    );
  }
}
