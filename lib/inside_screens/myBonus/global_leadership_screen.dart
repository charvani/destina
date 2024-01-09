import 'dart:math';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class GlobalLeadershipBonusScreen extends StatefulWidget {
  final String selMonth, selYear;

  const GlobalLeadershipBonusScreen(
      {super.key, required this.selMonth, required this.selYear});

  @override
  State<GlobalLeadershipBonusScreen> createState() =>
      _GlobalLeadershipBonusScreenState();
}

final MainController _dataController = Get.put(MainController());

class _GlobalLeadershipBonusScreenState
    extends State<GlobalLeadershipBonusScreen> {
  DataTableSource tSource = MyData();
  final ScrollController _scrollController = ScrollController();
  dynamic userid, password;
  Map bData = {};
  @override
  void initState() {
    super.initState();
    userid = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() {
    bData = {
      "UserId": userid,
      "Pwd": password,
      "FromDate": "1/1/1900",
      "ToDate": "1/1/2200",
      "FIdNo": userid,
      "TIdNo": null,
      "FCategory": null,
      "TCategory": null,
      "Steps": null,
      "StpsSym": null,
      "SalesMnth": widget.selMonth,
      "SalesYr": widget.selYear,
      "BonusType": "GLB",
    };
    _dataController.getGlobalLBonus(bData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Global Leadership Bonus",
        backNavigation: true,
      ),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
            child: Column(
              children: [
                 Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ViewProfileWidget(
                          infoColor: redColor,
                          title: "Grand Total",
                          info: _dataController.customerBonusTotal.value
                              .toStringAsFixed(2)),
                    ),
                    Scrollbar(
                      interactive: true,
                      trackVisibility: true,
                      controller: _scrollController,
                      thumbVisibility: true,
                      thickness: 8,
                      radius: const Radius.circular(10),
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      child: PaginatedDataTable(
                          controller: _scrollController,
                          columnSpacing: 0,
                          horizontalMargin: 0,
                          headingRowColor: MaterialStatePropertyAll(
                              lightDarKBlue.withOpacity(0.2)),
                          columns: [
                            

                            DataColumn(
                                label: TableHeadingWidget(title: "S.No")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(
                                    title: "Distributor ID")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(title: "Month")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(title: "Date")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label:
                                    TableHeadingWidget(title: "Total Steps")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(
                                    title: "Qualify Shares")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label:
                                    TableHeadingWidget(title: "Free Shares")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label:
                                    TableHeadingWidget(title: "Total Shares")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(
                                    title: "Value Per Share\n(D1 \$)")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(
                                    title: "Share Bonus\n(D1 \$)")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(
                                    title: "Redemption Deduction\n(RP)")),
                            DataColumn(label: _verticalDivider),

                            DataColumn(
                                label: TableHeadingWidget(
                                    title: "Net Leadership Bonus\n(D1 \$)")),


                          ],
                          source: tSource),
                    ),
                
                const SpaceHeightWidget(height: 25)
              ],
            ),
          );
        }
      ),
    );
  }
}


class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        TableInfoWidget(info: "${index + 1}"),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].fromDistId),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].toDistId),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.customerBonusList[index].date),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].yrPakageCatg),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].newSinupCatg),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.customerBonusList[index].cv),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].percentage),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.customerBonusList[index].bonus),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].redmption),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].netBonus),
      ),
       DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.customerBonusList[index].netBonus),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.customerBonusList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
