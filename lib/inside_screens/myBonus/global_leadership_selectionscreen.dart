import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import 'global_leadership_screen.dart';

class GlobalLeadershipSelctionScreen extends StatefulWidget {
  const GlobalLeadershipSelctionScreen({super.key});

  @override
  State<GlobalLeadershipSelctionScreen> createState() =>
      _GlobalLeadershipSelctionScreenState();
}

class _GlobalLeadershipSelctionScreenState
    extends State<GlobalLeadershipSelctionScreen> {
  final _formKey = GlobalKey<FormState>();
  dynamic salesMonth;
  dynamic salesYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(backNavigation: true, title: ""),
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
                  const SpaceHeightWidget(height: 5),
                  const SideTitle(title: "Sales Month"),
                  ProfileDropDown(
                    value: salesMonth,
                    hintText: "--Select Month--",
                    onChangedFun: (val) {
                      setState(() {
                        salesMonth = val!;
                      });
                    },
                    items: const [
                      "January",
                      "February",
                      "March",
                      "April",
                      "May",
                      "June",
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December'
                    ],
                    validationFun: (val) {
                      if (val == "" || val == null) {
                        return "Select month";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SpaceHeightWidget(height: 5),
                  const SideTitle(title: "Sales Year"),
                  ProfileDropDown(
                    value: salesYear,
                    hintText: "--Select Year--",
                    onChangedFun: (val) {
                      setState(() {
                        salesYear = val!;
                      });
                    },
                    items: const [
                      "2024",
                      "2023",
                      "2022",
                      "2021",
                      "2020",
                      "2019",
                      "2018",
                      '2017',
                      '2016',
                      '2015',
                      '2014',
                      '2013',
                      '2012'
                    ],
                    validationFun: (val) {
                      if (val == "" || val == null) {
                        return "Select Year";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SpaceHeightWidget(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                            onTapFun: () {
                              setState(() {
                                salesMonth = null;
                                salesYear = null;
                              });
                            },
                            title: "Reset"),
                      ),
                      const SpaceWidthWidget(width: 10),
                      Expanded(
                        child: CustomElevatedButton(
                            onTapFun: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(() => GlobalLeadershipBonusScreen(
                                      selMonth: salesMonth,
                                      selYear: salesYear,
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
