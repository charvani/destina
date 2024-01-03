import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../models/mylist_reportmodel.dart';

class MyListViewGetReportScreen extends StatefulWidget {
  final String? all, onDate, fromDate, toDate;
  const MyListViewGetReportScreen(
      {super.key, this.all, this.fromDate, this.onDate, this.toDate});

  @override
  State<MyListViewGetReportScreen> createState() =>
      _MyListViewGetReportScreenState();
}

class _MyListViewGetReportScreenState extends State<MyListViewGetReportScreen> {
  final MainController _datacontroller = Get.put(MainController());
  List<MyListReportModel> dataList = [];
  List<ScrollController> scrollContollerList = [];
  bool screenLoading = true;
  dynamic userid, pass;
  @override
  void initState() {
    super.initState();
    userid = Constants.prefs.getString("user_id");
    pass = Constants.prefs.getString("password");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await listCountFun();
      setState(() {
        screenLoading = false;
      });
    });
  }

  listCountFun() async {
    Map bdata = {};
    if (widget.all != null) {
      bdata = {
        "UserId": userid,
        "Pwd": pass,
        "Action": "All",
        "FromDate": "",
        "ToDate": "",
        "ListViewID": userid,
      };
    } else if (widget.onDate != null) {
      bdata = {
        "UserId": userid,
        "Pwd": pass,
        "Action": "OnDate",
        "FromDate": widget.onDate,
        "ToDate": widget.onDate,
        "ListViewID": userid,
      };
    } else {
      bdata = {
        "UserId": userid,
        "Pwd": pass,
        "Action": "FromToDate",
        "FromDate": widget.fromDate,
        "ToDate": widget.toDate,
        "ListViewID": userid,
      };
    }

    dynamic res = await _datacontroller.getMyListViewLevels(bdata);
    for (int i = 0; i < res.length; i++) {
      dataList.add(MyListReportModel.fromJson(res[i]));
      scrollContollerList.add(ScrollController());
    }

    for (int i = 0; i < dataList.length; i++) {
      dataFun(dataList[i].level, i);
    }
    print("dddd...${dataList.length}");
  }

  dataFun(String teamNo, int index) async {
    Map bdata = {};
    if (widget.all != null) {
      bdata = {
        "UserId": userid,
        "Pwd": pass,
        "Action": "All",
        "FromDate": "",
        "ToDate": "",
        "LevelNo": teamNo,
        "LevelID": userid,
      };
    } else if (widget.onDate != null) {
      bdata = {
        "UserId": userid,
        "Pwd": pass,
        "Action": "OnDate",
        "FromDate": widget.onDate,
        "ToDate": widget.onDate,
        "LevelNo": teamNo,
        "LevelID": userid,
      };
    } else {
      bdata = {
        "UserId": userid,
        "Pwd": pass,
        "Action": "FromToDate",
        "FromDate": widget.fromDate,
        "ToDate": widget.toDate,
        "LevelNo": teamNo,
        "LevelID": userid,
      };
    }

    dynamic res = await _datacontroller.getMyListViewReport(bdata);
    for (int i = 0; i < res.length; i++) {
      dataList[index].data.add(MyListReportDataModel.fromJson(res[i]));
    }
    print("finn....${dataList[index].data.length}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "My List View", backNavigation: true),
      body: screenLoading
          ? loader
          : Container(
              color: whiteColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SpaceHeightWidget(height: 15),
                    for (int i = 0; i < dataList.length; i++)
                      Column(
                        children: [
                          CommonTitle(
                            titleName: "Team No ${i + 1}",
                            size: 16,
                            fontColor: darkBlue,
                          ),
                          Scrollbar(
                            controller: scrollContollerList[i],
                            thumbVisibility: true,
                            trackVisibility: true,
                            thickness: 5,
                            interactive: true,
                            radius: const Radius.circular(10),
                            child: SingleChildScrollView(
                              controller: scrollContollerList[i],
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: DataTable(
                                          // dataRowMaxHeight: 50,
                                          horizontalMargin: 10,
                                          columnSpacing: 20,
                                          border: TableBorder.all(
                                              color: middleBlackColor
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          headingRowColor:
                                              MaterialStatePropertyAll(
                                                  blackColor.withOpacity(0.8)),
                                          dataRowColor:
                                              MaterialStatePropertyAll(
                                                  lightDarKBlue.withOpacity(0.1)
                                                  // whiteColor
                                                  ),
                                          columns: [
                                            DataColumn(
                                                label: idTextStyle("S.No")),
                                            DataColumn(
                                                label: idTextStyle("User ID")),
                                            DataColumn(
                                                label: idTextStyle("Name")),
                                            DataColumn(
                                                label: idTextStyle("Country")),
                                            DataColumn(
                                                label: idTextStyle("Sponsor")),
                                            DataColumn(
                                                label: idTextStyle(
                                                    "	Date of Join")),
                                          ],
                                          rows: [
                                            for (int j = 0;
                                                j < dataList[i].data.length;
                                                j++)
                                              DataRow(cells: [
                                                DataCell(
                                                  infoTextStyle("${j + 1}"),
                                                ),
                                                DataCell(
                                                  infoTextStyle(dataList[i]
                                                      .data[j]
                                                      .userId),
                                                ),
                                                DataCell(
                                                  infoTextStyle(
                                                      dataList[i].data[j].name),
                                                ),
                                                DataCell(
                                                  infoTextStyle(dataList[i]
                                                      .data[j]
                                                      .country),
                                                ),
                                                DataCell(
                                                  infoTextStyle(dataList[i]
                                                      .data[j]
                                                      .sponsor),
                                                ),
                                                DataCell(
                                                  infoTextStyle(
                                                      dataList[i].data[j].doj),
                                                ),
                                              ])
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SpaceHeightWidget(
                            height: 18,
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
    );
  }

  idTextStyle(String id) {
    return Text(
      id,
      style: TextStyle(
          fontFamily: "OnestSemiBold", fontSize: 12, color: whiteColor),
    );
  }

  infoTextStyle(String id) {
    return Text(
      id,
      style: TextStyle(
          fontFamily: "OnestRegular", fontSize: 12, color: blackColor),
    );
  }
}
