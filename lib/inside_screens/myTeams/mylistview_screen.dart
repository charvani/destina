import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../commons/colors.dart';
import 'getreport_screen.dart';

class MyListViewScreen extends StatefulWidget {
  const MyListViewScreen({super.key});

  @override
  State<MyListViewScreen> createState() => _MyListViewScreenState();
}

class _MyListViewScreenState extends State<MyListViewScreen> {
  dynamic selectedRadio;
  DateTime onSelectedDate = DateTime.now();
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();
  TextEditingController onDateTController = TextEditingController();
  TextEditingController fromDateTController = TextEditingController();
  TextEditingController toDateTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "My List View", backNavigation: true),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: lightDarKBlue.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                RadioListTile(
                  value: "All",
                  groupValue: selectedRadio,
                  onChanged: (val) {
                    setState(() {
                      selectedRadio = val;
                      onDateTController.text = "";
                      fromDateTController.text = "";
                      toDateTController.text = "";
                    });
                  },
                  dense: true,
                  contentPadding: const EdgeInsets.all(0),
                  title: const SideTitle(
                    title: "All",
                    // size: 14,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: RadioListTile(
                        value: "On",
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setState(() {
                            selectedRadio = val;
                            fromDateTController.text = "";
                            toDateTController.text = "";
                          });
                        },
                        dense: true,
                        contentPadding: const EdgeInsets.all(0),
                        title: const SideTitle(
                          title: "On",
                          // size: 14,
                        ),
                      ),
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
                              initialDate: onSelectedDate,
                              firstDate: DateTime(1900, 0),
                            );
                            if (picked != null) {
                              print(picked);
                              final DateFormat formatter =
                                  DateFormat('dd-MM-yyyy');
                              setState(() {
                                onDateTController.text =
                                    formatter.format(picked);
                              });
                            }
                          },
                          suffix: Icon(
                            Icons.calendar_month_rounded,
                            color: middleBlackColor.withOpacity(0.5),
                          ),
                          controller: onDateTController,
                          hintText: "dd-mm-yyyy",
                          textInputType: TextInputType.datetime,
                          validation: (val) {
                            if (selectedRadio == "On" && val!.isEmpty) {
                              return "Select date";
                            } else {
                              return null;
                            }
                          },
                          labelText: ""),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: RadioListTile(
                        value: "From",
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setState(() {
                            selectedRadio = val;
                            onDateTController.text = "";
                          });
                        },
                        dense: true,
                        contentPadding: const EdgeInsets.all(0),
                        title: const SideTitle(
                          title: "From",
                          // size: 14,
                        ),
                      ),
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
                              initialDate: fromSelectedDate,
                              firstDate: DateTime(1900, 0),
                            );
                            if (picked != null) {
                              print(picked);
                              final DateFormat formatter =
                                  DateFormat('dd-MM-yyyy');
                              setState(() {
                                fromDateTController.text =
                                    formatter.format(picked);
                              });
                            }
                          },
                          suffix: Icon(
                            Icons.calendar_month_rounded,
                            color: middleBlackColor.withOpacity(0.5),
                          ),
                          controller: fromDateTController,
                          hintText: "dd-mm-yyyy",
                          textInputType: TextInputType.datetime,
                          validation: (val) {
                            if (selectedRadio == "From" && val!.isEmpty) {
                              return "Select From date";
                            } else {
                              return null;
                            }
                          },
                          labelText: ""),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceWidthWidget(width: 60),
                    const SideTitle(title: "To"),
                    const SpaceWidthWidget(width: 25),
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
                              initialDate: toSelectedDate,
                              firstDate: DateTime(1900, 0),
                            );
                            if (picked != null) {
                              print(picked);
                              final DateFormat formatter =
                                  DateFormat('dd-MM-yyyy');
                              setState(() {
                                toDateTController.text =
                                    formatter.format(picked);
                              });
                            }
                          },
                          suffix: Icon(
                            Icons.calendar_month_rounded,
                            color: middleBlackColor.withOpacity(0.5),
                          ),
                          controller: toDateTController,
                          hintText: "dd-mm-yyyy",
                          textInputType: TextInputType.datetime,
                          validation: (val) {
                            if (selectedRadio == "From" && val!.isEmpty) {
                              return "Select To date";
                            } else {
                              return null;
                            }
                          },
                          labelText: ""),
                    ),
                  ],
                ),
                const SpaceHeightWidget(height: 15),
                CustomElevatedButton(
                    onTapFun: () {
                      if (selectedRadio != null) {
                        if (selectedRadio == "All") {
                          Get.to(() => const GetReportScreen(
                                all: "All",
                              ));
                        } else {
                          if (_formKey.currentState!.validate()) {
                            if (selectedRadio == "On") {
                              Get.to(() => GetReportScreen(
                                    onDate: onDateTController.text,
                                  ));
                            } else {
                              Get.to(() => GetReportScreen(
                                    fromDate: fromDateTController.text,
                                    toDate: toDateTController.text,
                                  ));
                            }
                          }
                        }
                      } else {
                        CommonToast("Select report type");
                      }
                    },
                    title: "Get Report")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
