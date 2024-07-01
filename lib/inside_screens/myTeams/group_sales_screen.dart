import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../commons/colors.dart';
import 'groupsales_reportscreen.dart';

class GroupSalesSelectionScreen extends StatefulWidget {
  const GroupSalesSelectionScreen({super.key});

  @override
  State<GroupSalesSelectionScreen> createState() =>
      _GroupSalesSelectionScreenState();
}

class _GroupSalesSelectionScreenState extends State<GroupSalesSelectionScreen> {
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();
  TextEditingController fromDateTController = TextEditingController();
  TextEditingController toDateTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Group Sales", backNavigation: true),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: lightDarKBlue.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SideTitle(title: "From Date"),
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
                              final DateFormat formatter =
                                  DateFormat('MM/dd/yyyy');
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
                          hintText: "mm-dd-yyyy",
                          textInputType: TextInputType.datetime,
                          validation: (val) {
                            if (val!.isEmpty) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SideTitle(title: "To Date"),
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
                              final DateFormat formatter =
                                  DateFormat('MM/dd/yyyy');
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
                          hintText: "mm-dd-yyyy",
                          textInputType: TextInputType.datetime,
                          validation: (val) {
                            if (val!.isEmpty) {
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
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => GroupSalesReportScreen(
                              fromDate: fromDateTController.text,
                              toDate: toDateTController.text,
                            ));

                      
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
