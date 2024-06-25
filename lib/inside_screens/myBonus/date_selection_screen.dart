import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/myBonus/level_variancebonus_screen.dart';
import 'package:destina_1_international/inside_screens/myBonus/special_bonus_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../commons/colors.dart';
import 'activation_bonusscreen.dart';
import 'customer_acquisition_screen.dart';
import 'direct_distributor_bonusscreen.dart';
import 'personal_salesscreen.dart';
import 'retail_bonusscreen.dart';
import 'rollup_bounusscreen.dart';
import 'special_leadership_screen.dart';
import 'special_sponsorbonus_screen.dart';
import 'teambuilder_buissiness_screen.dart';
import 'upgrade_acquisition_screen.dart';

class BonusDateSelectionScreen extends StatefulWidget {
  final String from;
  const BonusDateSelectionScreen({super.key, required this.from});

  @override
  State<BonusDateSelectionScreen> createState() =>
      _BonusDateSelectionScreenState();
}

class _BonusDateSelectionScreenState extends State<BonusDateSelectionScreen> {
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();
  TextEditingController fromDateTController = TextEditingController();
  TextEditingController toDateTController = TextEditingController();
  TextEditingController distributorIDTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late dynamic formattedDate;
  @override
  void initState() {
    super.initState();
    var date = DateTime.now();
    formattedDate = "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
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
                    const SideTitle(title: "Date From"),
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
                    const SideTitle(title: "Date To"),
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
                if (widget.from == "Customer Acquisition" ||
                    widget.from == "Upgrade Acquisition" ||
                    widget.from == "Special Leadership" ||
                    widget.from == "Rollup Bonus")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceHeightWidget(height: 8),
                      const SideTitle(title: "From Distributor ID"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: distributorIDTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "From distributor ID";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                if (widget.from == "Activation Bonus")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceHeightWidget(height: 8),
                      const SideTitle(title: "Received From Licensee"),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: distributorIDTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Received From Licensee";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                const SpaceHeightWidget(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: CustomElevatedButton(
                          onTapFun: () {
                            setState(() {
                              fromDateTController.text = "";
                              toDateTController.text = "";
                            });
                          },
                          title: "Reset"),
                    ),
                    SizedBox(
                      width: 100,
                      child: CustomElevatedButton(
                          onTapFun: () {
                            if (widget.from == "Retail Bonus" ||
                                widget.from == "Personal Consumption Bonus" ||
                                widget.from == "Level Consumption Bonus" ||
                                widget.from == "Group Consumption Bonus") {
                              Get.to(() => RetailBonusSCreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : "01/01/2100",
                                    from: widget.from,
                                    bonusType: (widget.from == "Retail Bonus")
                                        ? "RB"
                                        : (widget.from ==
                                                "Personal Consumption Bonus")
                                            ? "PCB"
                                            : (widget.from ==
                                                    "Level Consumption Bonus")
                                                ? "LCB "
                                                : "GCB",
                                  ));
                            } else if (widget.from == "Customer Acquisition") {
                              Get.to(() => CustomerAcquisitionScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : "01/01/2100",
                                    distributorId:
                                        distributorIDTController.text,
                                  ));
                            } else if (widget.from == "Upgrade Acquisition") {
                              Get.to(() => UpgradeAcquistionScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : "01/01/2100",
                                    distributorId:
                                        distributorIDTController.text,
                                  ));
                            } else if (widget.from == "TeamBuilder Buisiness") {
                              Get.to(() => TeamBuilderBussinessScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : formattedDate,
                                  ));
                            } else if (widget.from == "Special Leadership") {
                              Get.to(() => SpecialLeadershipScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : "01/01/2100",
                                    distributorId:
                                        distributorIDTController.text,
                                  ));
                            } else if (widget.from == "Direct Distributor") {
                              Get.to(() => DirectDistributorBonusScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : "01/01/2100",
                                  ));
                            } else if (widget.from == "Personal Sales") {
                              Get.to(() => PersonalSalesScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : formattedDate,
                                  ));
                            } else if (widget.from == "Special Bonus") {
                              Get.to(() => SpecialBonusScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : formattedDate,
                                  ));
                            } else if (widget.from ==
                                "Special Bonus(Sponsor)") {
                              Get.to(() => SpecialSponsorBonusScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : formattedDate,
                                  ));
                            } else if (widget.from == "Activation Bonus") {
                              Get.to(() => ActivationBonusScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : "01/01/2100",
                                    distributorId:
                                        distributorIDTController.text,
                                  ));
                            } else if (widget.from == "Rollup Bonus") {
                              Get.to(() => RollupBonusScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : "01/01/2100",
                                    distributorId:
                                        distributorIDTController.text,
                                  ));
                            } else if (widget.from ==
                                "Level Variance Consumption Bonus") {
                              Get.to(() => LevelVarianceConBonusScreen(
                                    fromDate: fromDateTController.text != ""
                                        ? fromDateTController.text
                                        : "01/01/1900",
                                    toDate: toDateTController.text != ""
                                        ? toDateTController.text
                                        : formattedDate,
                                  ));
                            }
                            // }
                          },
                          title: "Submit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
