import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController fullNameTController = TextEditingController();
  TextEditingController dateOfBirthTController = TextEditingController();
  String? joiningType;
  TextEditingController passportTController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    fullNameTController.text = "Charvani";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Member Details", backNavigation: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccountTitleWidget(
                title: "Personal Details",
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: darkBlue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                 
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AccountWidgetT(
                      title: "Full Name",
                    ),
                    AccountTextField(
                      readOnly: true,
                      onchangeFun: (val) {},
                      outsideFun: (val) async {},
                      textInputType: TextInputType.name,
                      hintText: "ex: John Lee",
                      controller: fullNameTController,
                      validation: (val) {
                        return null;
                      },
                    ),
                    const AccountWidgetT(
                      title: "Date Of Birth",
                    ),
                    LoginTextField(
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
                          if (picked != null && picked != selectedDate) {
                            final DateFormat formatter =
                                DateFormat('dd-MM-yyyy');
                            setState(() {
                              dateOfBirthTController.text =
                                  formatter.format(picked);
                            });
                          }
                        },
                        suffix: Icon(
                          Icons.calendar_month_rounded,
                          color: middleBlackColor.withOpacity(0.5),
                        ),
                        controller: dateOfBirthTController,
                        hintText: "dd-mm-yyyy",
                        textInputType: TextInputType.datetime,
                        validation: (val) {
                          return null;
                        },
                        labelText: ""),
                    const SpaceHeightWidget(height: 6),
                    const AccountWidgetT(
                      title: "Joining Type",
                    ),
                    RegisterDropDown(
                        onChangedFun: (val) {
                          setState(() {
                            joiningType = val;
                          });
                        },
                        items: const ["Personal", "Business"]),
                    const AccountWidgetT(
                      title: "Passport/IC/DL",
                    ),
                    RegisterTextField(
                      onchangeFun: (val) {},
                      outsideFun: (val) async {},
                      textInputType: TextInputType.name,
                      hintText: "ex: John Lee",
                      labelText: "Sponsor User ID",
                      controller: passportTController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Sponsor user id";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
