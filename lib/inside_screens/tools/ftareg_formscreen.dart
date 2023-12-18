import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commons/colors.dart';

class FTARegistrationFormScreen extends StatefulWidget {
  const FTARegistrationFormScreen({super.key});

  @override
  State<FTARegistrationFormScreen> createState() =>
      _FTARegistrationFormScreenState();
}

class _FTARegistrationFormScreenState extends State<FTARegistrationFormScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime nameToSelectedDate = DateTime.now();
  TextEditingController dateTController = TextEditingController();
  TextEditingController ftaNameController = TextEditingController();
  TextEditingController ftaPassportNoController = TextEditingController();
  TextEditingController ftaMobileNoController = TextEditingController();
  TextEditingController ftaEmailController = TextEditingController();
  TextEditingController inviterNameController = TextEditingController();
  TextEditingController inviterPassportNoController = TextEditingController();
  TextEditingController inviterMobileNoController = TextEditingController();
  TextEditingController inviterEmailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nametoDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppBar(title: "FTA Registration Form", backNavigation: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonTitle(
                  titleName:
                      "COMPULSORY - BOTH FTA & INVITER NRIC/PASSPORT (S) MUST BE ATTACHED TO THIS FORM OTHERWISE REGISTRATION IS VOIDPLEASE COLLECT BACK YOUR NRIC/PASSPORT (S) ONCE REGISTRATION IS COMPLETED",
                  size: 11,
                  fontFamily: "OnestRegular",
                ),
                const SpaceHeightWidget(height: 10),
                const CommonTitle(
                  titleName: "Date :",
                  size: 13,
                  fontFamily: "OnestRegular",
                ),
                SizedBox(
                  width: 150,
                  child: LoginTextField(
                      readOnly: true,
                      onTapFun: () async {
                        final DateTime? picked = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                                data: Theme.of(context).copyWith(
                                  primaryColor: blackColor,
                                  colorScheme: ColorScheme.light(
                                      primary: blackColor,
                                      onPrimary: whiteColor),
                                  buttonTheme: const ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary),
                                ),
                                child: child!);
                          },
                          lastDate: DateTime.now(),
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1900, 0),
                        );
                        if (picked != null) {
                          print(picked);
                          final DateFormat formatter = DateFormat('dd-MM-yyyy');
                          setState(() {
                            dateTController.text = formatter.format(picked);
                          });
                        }
                      },
                      suffix: Icon(
                        Icons.calendar_month_rounded,
                        color: middleBlackColor.withOpacity(0.5),
                      ),
                      controller: dateTController,
                      hintText: "dd-mm-yyyy",
                      textInputType: TextInputType.datetime,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Select date";
                        } else {
                          return null;
                        }
                      },
                      labelText: ""),
                ),
                const SpaceHeightWidget(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: lightDarKBlue.withOpacity(0.15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonTitle(
                        titleName:
                            "1) Particulars Of D1DB First Time Attendee (FTA)",
                        size: 15,
                      ),
                      const SpaceHeightWidget(height: 10),
                      const SideTitle(title: "i. FTA Name :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: ftaNameController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "FTA Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SideTitle(title: "ii. FTA NRIC/Passport No. :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: ftaPassportNoController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "FTA NRIC/Passport No.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SideTitle(title: "iii. FTA Mobile :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: ftaPassportNoController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "FTA Mobile";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SideTitle(title: "iv. FTA Email :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: ftaEmailController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "FTA Email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SpaceHeightWidget(height: 15),
                      const CommonTitle(
                        titleName: "2) Particulars Of D1DB Inviter",
                        size: 15,
                      ),
                      const SpaceHeightWidget(height: 10),
                      const SideTitle(title: "i. Inviter Name :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: inviterNameController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Inviter Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SideTitle(title: "ii. Inviter NRIC/Passport No:"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: inviterPassportNoController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Inviter NRIC/Passport No.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SideTitle(title: "iii. Inviter Mobile :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: inviterMobileNoController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Inviter Mobile";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SideTitle(title: "iv. Inviter Email :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: inviterEmailController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Inviter Email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SpaceHeightWidget(height: 10),
                      const CommonTitle(
                        titleName:
                            "1. The above mentioned FTA name and holder of the FTA NRIC/Passport stated herein above under items (1)(i) and 1(ii) hereby confirm and warrants the followings :-",
                        size: 13,
                        fontFamily: "OnestSemiBold",
                      ),
                      const SpaceHeightWidget(height: 10),
                      const CommonTitle(
                        titleName:
                            "I have never attended any destina1 Dream builder (D1DB) presentation before. this is my frist attendance\nI am currently not Destina1 international (D1) member and i have never join Destina1 international as a member before.",
                        size: 12,
                        fontFamily: "OnestRegular",
                      ),
                      const SpaceHeightWidget(height: 10),
                      const CommonTitle(
                        titleName:
                            "In the event that the above declaration is untrue or incorrect, i agree to indemnify Destina1 international (D1) for the price of the product/gift/prize that was redeemed by me as a lucky draw gift. i further authorize D1 to deduct the said amount from my D1 account E-wallet (if have any) in event of non-payment by me due to my false declaration/representation.",
                        size: 12,
                        fontFamily: "OnestRegular",
                      ),
                      const SpaceHeightWidget(height: 10),
                      const SideTitle(title: "Name :"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: inviterEmailController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const CommonTitle(
                        titleName: "Date :",
                        size: 13,
                        fontFamily: "OnestRegular",
                      ),
                      SizedBox(
                        width: 150,
                        child: LoginTextField(
                            readOnly: true,
                            onTapFun: () async {
                              final DateTime? picked = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                        primaryColor: blackColor,
                                        colorScheme: ColorScheme.light(
                                            primary: blackColor,
                                            onPrimary: whiteColor),
                                        buttonTheme: const ButtonThemeData(
                                            textTheme: ButtonTextTheme.primary),
                                      ),
                                      child: child!);
                                },
                                lastDate: DateTime.now(),
                                context: context,
                                initialDate: nameToSelectedDate,
                                firstDate: DateTime(1900, 0),
                              );
                              if (picked != null) {
                                print(picked);
                                final DateFormat formatter =
                                    DateFormat('dd-MM-yyyy');
                                setState(() {
                                  nametoDateController.text =
                                      formatter.format(picked);
                                });
                              }
                            },
                            suffix: Icon(
                              Icons.calendar_month_rounded,
                              color: middleBlackColor.withOpacity(0.5),
                            ),
                            controller: nametoDateController,
                            hintText: "dd-mm-yyyy",
                            textInputType: TextInputType.datetime,
                            validation: (val) {
                              if (val!.isEmpty) {
                                return "Select date";
                              } else {
                                return null;
                              }
                            },
                            labelText: ""),
                      ),
                      const SpaceHeightWidget(height: 10),
                      const CommonTitle(
                        titleName:
                            'All of the above mentioned terms shall be subjected to the terms & Condition of the "free gift promo" currently being carried out by D1 in 2015',
                        size: 12,
                        fontFamily: "OnestRegular",
                      ),
                      const SpaceHeightWidget(height: 10),
                      const CommonTitle(
                        titleName:
                            "(Note: All items a(i) - 1(iv) and 2(i) - 2(iv) must be completely filled in otherwise registration in void)",
                        size: 12,
                        fontFamily: "OnestSemiBold",
                      ),
                    ],
                  ),
                ),
                const SpaceHeightWidget(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAutoWidthButton(
                        onTapFun: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        title: "Submit"),
                  ],
                ),
                const SpaceHeightWidget(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
