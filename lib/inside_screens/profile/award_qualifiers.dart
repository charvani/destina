import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../models/award_tabledata_model.dart';

class AwardQualifiersScreen extends StatefulWidget {
  const AwardQualifiersScreen({super.key});

  @override
  State<AwardQualifiersScreen> createState() => _AwardQualifiersScreenState();
}

class _AwardQualifiersScreenState extends State<AwardQualifiersScreen> {
  TextEditingController emailTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();
  final ScrollController _scrollController4 = ScrollController();

  dynamic award;
  bool selected = false;
  BoxDecoration decr = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: lightBlackColor.withOpacity(0.5),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Award Qualifiers", backNavigation: true),
      body: SingleChildScrollView(
        child: (selected == false)
            ? Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: decr,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SideTitle(title: "Scheme Award"),
                      ProfileDropDown(
                        hintText: "Select",
                        onChangedFun: (val) {
                          setState(() {
                            award = val;
                          });
                        },
                        items: const [
                          "Gateway To Malaysia Promotion",
                          "D1 CRUISE TOUR PROMOTION",
                        ],
                        validationFun: (val) {
                          if (val == "" || val == null) {
                            return "Select Award type";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SpaceHeightWidget(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: CustomElevatedButton(
                            onTapFun: () {
                              if (_formKey.currentState!.validate()) {
                                print("submit fun");
                                setState(() {
                                  selected = true;
                                });
                              }
                            },
                            title: "Submit"),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceHeightWidget(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = false;
                        award = null;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Image.asset(
                        "assets/images/arrow_left.png",
                        height: 30,
                      ),
                    ),
                  ),
                  gateWayAwardWidget(),
                  const SpaceHeightWidget(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Requirement 1",
                      style: TextStyle(
                          fontFamily: "OnestSemiBold",
                          fontSize: 16,
                          color: blackColor),
                    ),
                  ),
                  Scrollbar(
                    interactive: true,
                    trackVisibility: true,
                    controller: _scrollController1,
                    thumbVisibility: true,
                    thickness: 8,
                    radius: const Radius.circular(10),
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: SingleChildScrollView(
                      controller: _scrollController1,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          border: TableBorder.all(
                              color: appthemeColor.withOpacity(0.1)),
                          columnSpacing: 0,
                          dataRowMaxHeight: 60,
                          horizontalMargin: 0,
                          columns: [
                            DataColumn(
                              label: tableTitleWidget(""),
                            ),
                            DataColumn(
                              label: tableTitleWidget("To Qualify"),
                            ),
                            DataColumn(
                              label: tableTitleWidget("	You Have Done"),
                            ),
                            DataColumn(
                              label: tableTitleWidget("More To Go"),
                            ),
                          ],
                          rows: [
                            if (award == "D1 CRUISE TOUR PROMOTION")
                              for (int i = 0; i < dTableDataR1.length; i++)
                                DataRow(
                                    color: MaterialStatePropertyAll(i.isEven
                                        ? appthemeColor.withOpacity(0.1)
                                        : whiteColor),
                                    cells: [
                                      DataCell(tableDataWidget(
                                        dTableDataR1[i].title,
                                      )),
                                      DataCell(tableDataWidget(
                                        dTableDataR1[i].qualify,
                                      )),
                                      DataCell(tableDataWidget(
                                        dTableDataR1[i].youHaveDone,
                                      )),
                                      DataCell(tableDataWidget(
                                        dTableDataR1[i].moreToGo,
                                      )),
                                    ])
                            else
                              for (int i = 0; i < greatTableDataR1.length; i++)
                                DataRow(
                                    color: MaterialStatePropertyAll(i.isEven
                                        ? appthemeColor.withOpacity(0.1)
                                        : whiteColor),
                                    cells: [
                                      DataCell(tableDataWidget(
                                        greatTableDataR1[i].title,
                                      )),
                                      DataCell(tableDataWidget(
                                        greatTableDataR1[i].qualify,
                                      )),
                                      DataCell(tableDataWidget(
                                        greatTableDataR1[i].youHaveDone,
                                      )),
                                      DataCell(tableDataWidget(
                                        greatTableDataR1[i].moreToGo,
                                      )),
                                    ])
                          ]),
                    ),
                  ),
                  const SpaceHeightWidget(height: 20),
                  if (award == "D1 CRUISE TOUR PROMOTION")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeightWidget(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Requirement 3",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 16,
                                color: blackColor),
                          ),
                        ),
                        Scrollbar(
                          interactive: true,
                          trackVisibility: true,
                          controller: _scrollController3,
                          thumbVisibility: true,
                          thickness: 8,
                          radius: const Radius.circular(10),
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          child: SingleChildScrollView(
                            controller: _scrollController3,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                                border: TableBorder.all(
                                    color: appthemeColor.withOpacity(0.1)),
                                columnSpacing: 0,
                                dataRowMaxHeight: 60,
                                horizontalMargin: 0,
                                columns: [
                                  DataColumn(
                                    label: tableTitleWidget(""),
                                  ),
                                  DataColumn(
                                    label: tableTitleWidget("To Qualify"),
                                  ),
                                  DataColumn(
                                    label: tableTitleWidget("	You Have Done"),
                                  ),
                                  DataColumn(
                                    label: tableTitleWidget("More To Go"),
                                  ),
                                ],
                                rows: [
                                  for (int i = 0; i < dTableDataR3.length; i++)
                                    DataRow(
                                        color: MaterialStatePropertyAll(i.isEven
                                            ? appthemeColor.withOpacity(0.1)
                                            : whiteColor),
                                        cells: [
                                          DataCell(tableDataWidget(
                                            dTableDataR3[i].title,
                                          )),
                                          DataCell(tableDataWidget(
                                            dTableDataR3[i].qualify,
                                          )),
                                          DataCell(tableDataWidget(
                                            dTableDataR3[i].youHaveDone,
                                          )),
                                          DataCell(tableDataWidget(
                                            dTableDataR3[i].moreToGo,
                                          )),
                                        ])
                                ]),
                          ),
                        ),
                        const SpaceHeightWidget(height: 20)
                      ],
                    )
                ],
              ),
      ),
    );
  }

  List<AwardTableDataModel> greatTableDataR1 = [
    AwardTableDataModel(
        title: "Personal Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Personal CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Right Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Sales CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Right Sales CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Direct Sponsor",
        qualify: "5  Click On Value\nFor Valid Packages",
        youHaveDone: "0",
        moreToGo: "5"),
    AwardTableDataModel(
        title: "Right Direct Sponsor",
        qualify: "5  Click On Value\nFor Valid Packages",
        youHaveDone: "0",
        moreToGo: "5"),
    AwardTableDataModel(
        title: "Steps", qualify: "30", youHaveDone: "0", moreToGo: "30"),
  ];
  List<AwardTableDataModel> dTableDataR1 = [
    AwardTableDataModel(
        title: "Personal Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Personal CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Right Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Sales CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Right Sales CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Direct Sponsor",
        qualify: "1  Click On Value\nFor Valid Packages",
        youHaveDone: "2",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Right Direct Sponsor",
        qualify: "1  Click On Value\nFor Valid Packages",
        youHaveDone: "1",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Steps", qualify: "50", youHaveDone: "0", moreToGo: "50"),
  ];
  List<AwardTableDataModel> dTableDataR3 = [
    AwardTableDataModel(
        title: "Personal Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Personal CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Right Sales Count",
        qualify: "0",
        youHaveDone: "0",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Left Sales CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Right Sales CV", qualify: "0", youHaveDone: "0", moreToGo: "0"),
    AwardTableDataModel(
        title: "Overall Direct CV",
        qualify: "3500",
        youHaveDone: "48815",
        moreToGo: "0"),
    AwardTableDataModel(
        title: "Steps", qualify: "50", youHaveDone: "0", moreToGo: "50"),
  ];
  tableTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "OnestSemiBold", fontSize: 14, color: middleBlackColor),
      ),
    );
  }

  tableDataWidget(
    String title,
  ) {
    return Container(
        // height: 60,
        // width: double.maxFinite,
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "OnestRegular", fontSize: 14, color: blackColor),
        ));
  }

  gateWayAwardWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: decr,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        titleWidget("Award Name", award),
        const SpaceHeightWidget(height: 10),
        titleWidget(
            "Description",
            award == "D1 CRUISE TOUR PROMOTION"
                ? "EXPLORE REGIONAL GEMS DIRECT FROM PORT KLANG WITH DESTINA 1 PORT KLANG- PENANG-PHUKET-PORT KLANG"
                : "Full Paid trip To Malaysia For 5 Days"),
        const SpaceHeightWidget(height: 20),
        subtitleWidget("Start Date :", "07 Dec 2018"),
        const SpaceHeightWidget(height: 10),
        subtitleWidget("End Date :", "30 Nov 2023"),
        const SpaceHeightWidget(height: 10),
        subtitleWidget("Award Status :", "Not Acheived"),
      ]),
    );
  }

  titleWidget(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: "OnestSemiBold", fontSize: 14, color: lightDarKBlue),
        ),
        Text(
          data,
          style: TextStyle(
              fontFamily: "OnestSemiBold", fontSize: 14, color: blackColor),
        ),
      ],
    );
  }

  subtitleWidget(String title, String data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: "OnestSemiBold", fontSize: 14, color: lightDarKBlue),
        ),
        Text(
          data,
          style: TextStyle(
              fontFamily: "OnestRegular",
              fontSize: 14,
              color: middleBlackColor),
        ),
      ],
    );
  }
}
