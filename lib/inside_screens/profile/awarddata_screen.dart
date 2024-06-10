import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/common_widgets.dart';
import '../../controllers/main_controller.dart';
import '../../models/award_tabledata_model.dart';

class AwardDataScreen extends StatefulWidget {
  final String selectedVal;
  const AwardDataScreen({super.key, required this.selectedVal});

  @override
  State<AwardDataScreen> createState() => _AwardDataScreenState();
}

class _AwardDataScreenState extends State<AwardDataScreen> {
  final MainController _awardController = Get.put(MainController());

  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();
  final ScrollController _scrollController4 = ScrollController();
  final ScrollController _scrollController5 = ScrollController();
  final ScrollController _scrollController6 = ScrollController();
  BoxDecoration decr = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: lightBlackColor.withOpacity(0.5),
      ));

  String award = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "regid": Constants.prefs.getString("country_id"),
      "Awardname": widget.selectedVal,
    };
    _awardController.getAwardData(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: Obx(() {
        return _awardController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SpaceHeightWidget(height: 20),
                    headingWidget(),
                    const SpaceHeightWidget(height: 10),
                    if (_awardController.awardReportData.value.requirement1)
                      requirementWidget(1),
                    if (_awardController.awardReportData.value.requirement2)
                      requirementWidget(2),
                    if (_awardController.awardReportData.value.requirement3)
                      requirementWidget(3),
                    if (_awardController.awardReportData.value.requirement4)
                      requirementWidget(4),
                    if (_awardController.awardReportData.value.requirement5)
                      requirementWidget(5),
                    if (_awardController.awardReportData.value.requirement6)
                      requirementWidget(6),
                  ],
                ),
              );
      }),
    );
  }

  requirementWidget(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Requirement $i",
            style: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 16, color: blackColor),
          ),
        ),
        Scrollbar(
          interactive: true,
          trackVisibility: true,
          controller: i == 1
              ? _scrollController1
              : i == 2
                  ? _scrollController2
                  : i == 3
                      ? _scrollController3
                      : i == 4
                          ? _scrollController4
                          : i == 5
                              ? _scrollController5
                              : _scrollController6,
          thumbVisibility: true,
          thickness: 8,
          radius: const Radius.circular(10),
          scrollbarOrientation: ScrollbarOrientation.bottom,
          child: SingleChildScrollView(
            controller: i == 1
                ? _scrollController1
                : i == 2
                    ? _scrollController2
                    : i == 3
                        ? _scrollController3
                        : i == 4
                            ? _scrollController4
                            : i == 5
                                ? _scrollController5
                                : _scrollController6,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            child: DataTable(
                border: TableBorder.all(color: appthemeColor.withOpacity(0.1)),
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
                  DataRow(
                      color: MaterialStatePropertyAll(
                          appthemeColor.withOpacity(0.1)),
                      cells: [
                        DataCell(tableDataWidget(
                          "Personal Sales Count",
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Psales1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Psales2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Psales3
                                      : i == 4
                                          ? _awardController
                                              .awardReportData.value.req4Psales4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Psales5
                                              : _awardController.awardReportData
                                                  .value.req6Psales6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Achpsale1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Achpsale2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Achpsale3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Achpsale4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Achpsale5
                                              : _awardController.awardReportData
                                                  .value.req6Achpsale6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Balpsales1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Balpsales2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Balpsales3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Balpsales4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Balpsales5
                                              : _awardController.awardReportData
                                                  .value.req6Balpsales6,
                        )),
                      ]),
                  DataRow(color: MaterialStatePropertyAll(whiteColor), cells: [
                    DataCell(tableDataWidget(
                      "Personal CV",
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController.awardReportData.value.req1Pcv1
                          : i == 2
                              ? _awardController.awardReportData.value.req2Pcv2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Pcv3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Pcv4
                                      : i == 5
                                          ? _awardController
                                              .awardReportData.value.req5Pcv5
                                          : _awardController
                                              .awardReportData.value.req6Pcv6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController.awardReportData.value.req1Achpcv1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Achpcv2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Achpcv3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Achpcv4
                                      : i == 5
                                          ? _awardController
                                              .awardReportData.value.req5Achpcv5
                                          : _awardController.awardReportData
                                              .value.req6Achpcv6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController.awardReportData.value.req1Balpcv1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Balpcv2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Balpcv3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Balpcv4
                                      : i == 5
                                          ? _awardController
                                              .awardReportData.value.req5Balpcv5
                                          : _awardController.awardReportData
                                              .value.req6Balpcv6,
                    )),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          appthemeColor.withOpacity(0.1)),
                      cells: [
                        DataCell(tableDataWidget(
                          "Left Sales Count",
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lsalecnt1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lsalecnt2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Lsalecnt3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lsalecnt4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lsalecnt5
                                              : _awardController.awardReportData
                                                  .value.req6Lsalecnt6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lachsalecnt1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lachsalecnt2
                                  : i == 3
                                      ? _awardController.awardReportData.value
                                          .req3Lachsalecnt3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lachsalecnt4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lachsalecnt5
                                              : _awardController.awardReportData
                                                  .value.req6Lachsalecnt6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lbalsalecnt1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lbalsalecnt2
                                  : i == 3
                                      ? _awardController.awardReportData.value
                                          .req3Lbalsalecnt3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lbalsalecnt4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lbalsalecnt5
                                              : _awardController.awardReportData
                                                  .value.req6Lbalsalecnt6,
                        )),
                      ]),
                  DataRow(color: MaterialStatePropertyAll(whiteColor), cells: [
                    DataCell(tableDataWidget(
                      "Right Sales Count",
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController.awardReportData.value.req1Rsalecnt1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rsalecnt2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rsalecnt3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Rsalecnt4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rsalecnt5
                                          : _awardController.awardReportData
                                              .value.req6Rsalecnt6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController
                              .awardReportData.value.req1Rachsalecnt1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rachsalecnt2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rachsalecnt3
                                  : i == 4
                                      ? _awardController.awardReportData.value
                                          .req4Rachsalecnt4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rachsalecnt5
                                          : _awardController.awardReportData
                                              .value.req6Rachsalecnt6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController
                              .awardReportData.value.req1Rbalsalecnt1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rbalsalecnt2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rbalsalecnt3
                                  : i == 4
                                      ? _awardController.awardReportData.value
                                          .req4Rbalsalecnt4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rbalsalecnt5
                                          : _awardController.awardReportData
                                              .value.req6Rbalsalecnt6,
                    )),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          appthemeColor.withOpacity(0.1)),
                      cells: [
                        DataCell(tableDataWidget(
                          "Left Sales CV",
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lsalecv1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lsalecv2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Lsalecv3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lsalecv4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lsalecv5
                                              : _awardController.awardReportData
                                                  .value.req6Lsalecv6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lachsalecv1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lachsalecv2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Lachsalecv3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lachsalecv4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lachsalecv5
                                              : _awardController.awardReportData
                                                  .value.req6Lachsalecv6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lbalsalecv1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lbalsalecv2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Lbalsalecv3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lbalsalecv4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lbalsalecv5
                                              : _awardController.awardReportData
                                                  .value.req6Lbalsalecv6,
                        )),
                      ]),
                  DataRow(color: MaterialStatePropertyAll(whiteColor), cells: [
                    DataCell(tableDataWidget(
                      "Right Sales CV",
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController.awardReportData.value.req1Rsalecv1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rsalecv2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rsalecv3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Rsalecv4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rsalecv5
                                          : _awardController.awardReportData
                                              .value.req6Rsalecv6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController
                              .awardReportData.value.req1Rachsalecv1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rachsalecv2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rachsalecv3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Rachsalecv4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rachsalecv5
                                          : _awardController.awardReportData
                                              .value.req6Rachsalecv6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController
                              .awardReportData.value.req1Rbalsalecv1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rbalsalecv2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rbalsalecv3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Rbalsalecv4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rbalsalecv5
                                          : _awardController.awardReportData
                                              .value.req6Rbalsalecv6,
                    )),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          appthemeColor.withOpacity(0.1)),
                      cells: [
                        DataCell(tableDataWidget(
                          "Left Direct Sponsor",
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Ldirspr1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Ldirspr2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Ldirspr3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Ldirspr4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Ldirspr5
                                              : _awardController.awardReportData
                                                  .value.req6Ldirspr6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lachdirspr1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lachdirspr2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Lachdirspr3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lachdirspr4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lachdirspr5
                                              : _awardController.awardReportData
                                                  .value.req6Lachdirspr6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Lbaldirspr1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Lbaldirspr2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Lbaldirspr3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4Lbaldirspr4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Lbaldirspr5
                                              : _awardController.awardReportData
                                                  .value.req6Lbaldirspr6,
                        )),
                      ]),
                  DataRow(color: MaterialStatePropertyAll(whiteColor), cells: [
                    DataCell(tableDataWidget(
                      "Right Direct Sponsor",
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController.awardReportData.value.req1Rdirspr1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rdirspr2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rdirspr3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Rdirspr4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rdirspr5
                                          : _awardController.awardReportData
                                              .value.req6Rdirspr6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController
                              .awardReportData.value.req1Rachdirspr1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rachdirspr2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rachdirspr3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Rachdirspr4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rachdirspr5
                                          : _awardController.awardReportData
                                              .value.req6Rachdirspr6,
                    )),
                    DataCell(tableDataWidget(
                      i == 1
                          ? _awardController
                              .awardReportData.value.req1Rbaldirspr1
                          : i == 2
                              ? _awardController
                                  .awardReportData.value.req2Rbaldirspr2
                              : i == 3
                                  ? _awardController
                                      .awardReportData.value.req3Rbaldirspr3
                                  : i == 4
                                      ? _awardController
                                          .awardReportData.value.req4Rbaldirspr4
                                      : i == 5
                                          ? _awardController.awardReportData
                                              .value.req5Rbaldirspr5
                                          : _awardController.awardReportData
                                              .value.req6Rbaldirspr6,
                    )),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          appthemeColor.withOpacity(0.1)),
                      cells: [
                        DataCell(tableDataWidget(
                          "Steps",
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1Steps1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2Steps2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3Steps3
                                      : i == 4
                                          ? _awardController
                                              .awardReportData.value.req4Steps4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5Steps5
                                              : _awardController.awardReportData
                                                  .value.req6Steps6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1AchSteps1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2AchSteps2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3AchSteps3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4AchSteps4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5AchSteps5
                                              : _awardController.awardReportData
                                                  .value.req6AchSteps6,
                        )),
                        DataCell(tableDataWidget(
                          i == 1
                              ? _awardController
                                  .awardReportData.value.req1BalSteps1
                              : i == 2
                                  ? _awardController
                                      .awardReportData.value.req2BalSteps2
                                  : i == 3
                                      ? _awardController
                                          .awardReportData.value.req3BalSteps3
                                      : i == 4
                                          ? _awardController.awardReportData
                                              .value.req4BalSteps4
                                          : i == 5
                                              ? _awardController.awardReportData
                                                  .value.req5BalSteps5
                                              : _awardController.awardReportData
                                                  .value.req6BalSteps6,
                        )),
                      ]),
                ]),
          ),
        ),
        const SpaceHeightWidget(height: 20),
      ],
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

  headingWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: decr,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        titleWidget(
            "Award Name", _awardController.awardReportData.value.offername),
        const SpaceHeightWidget(height: 10),
        titleWidget(
            "Description", _awardController.awardReportData.value.descr),
        const SpaceHeightWidget(height: 20),
        subtitleWidget(
            "Start Date :", _awardController.awardReportData.value.sdate),
        const SpaceHeightWidget(height: 10),
        subtitleWidget(
            "End Date :", _awardController.awardReportData.value.edate),
        const SpaceHeightWidget(height: 10),
        subtitleWidget(
            "Award Status :", _awardController.awardReportData.value.status),
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
