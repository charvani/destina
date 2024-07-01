import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../commons/colors.dart';
import 'myorders_screen.dart';

class OrdersSectionScreen extends StatefulWidget {
  const OrdersSectionScreen({super.key});

  @override
  State<OrdersSectionScreen> createState() => _OrdersSectionScreenState();
}

class _OrdersSectionScreenState extends State<OrdersSectionScreen> {
  final MainController _dataController = Get.put(MainController());
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();
  TextEditingController fromDateTController = TextEditingController();
  TextEditingController toDateTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  dynamic mallType, mallId;
  List<String> dropDownData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    dynamic res = await _dataController.getOrdersMall(bdata);
    if (res != null) {
      _dataController.mallData.map((element) {
        return dropDownData.add(element.mallType);
      }).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(backNavigation: true, title: "Order Report"),
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
                                    // DateFormat('dd-MM-yyyy');
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
                  const SpaceHeightWidget(height: 5),
                  const SideTitle(title: "Mall Type"),
                  dropDownData.isEmpty
                      ? SizedBox(height: 50, child: loader)
                      : ProfileDropDown(
                          value: mallType,
                          hintText: "Select Mall",
                          onChangedFun: (val) {
                            mallType = val!;

                            for (int i = 0;
                                i < _dataController.mallData.length;
                                i++) {
                              if (mallType ==
                                  _dataController.mallData[i].mallType) {
                                mallId = _dataController.mallData[i].mallId;
                              }
                            }
                            setState(() {});
                          },
                          items: dropDownData,
                          validationFun: (val) {
                            if (val == "" || val == null) {
                              return "Select Mall";
                            } else {
                              return null;
                            }
                          },
                        ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                            onTapFun: () {
                              setState(() {
                                fromDateTController.text = "";
                                toDateTController.text = "";
                                mallType = null;
                              });
                            },
                            title: "Reset"),
                      ),
                      const SpaceWidthWidget(width: 10),
                      Expanded(
                        child: CustomElevatedButton(
                            onTapFun: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(() => MyOrdersScreen(
                                      fromDate: fromDateTController.text,
                                      toDate: toDateTController.text,
                                      mallId: mallId ?? "0",
                                    ));
                              }
                            },
                            title: "Submit"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
