import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class SpecialLeadershipScreen extends StatefulWidget {
  final String fromDate, toDate, distributorId;

  const SpecialLeadershipScreen(
      {super.key,
      required this.distributorId,
      required this.fromDate,
      required this.toDate});

  @override
  State<SpecialLeadershipScreen> createState() =>
      _SpecialLeadershipScreenState();
}

final MainController _dataController = Get.put(MainController());

class _SpecialLeadershipScreenState extends State<SpecialLeadershipScreen> {
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
      "FromDate": widget.fromDate,
      "ToDate": widget.toDate,
      "FIdNo": userid,
      "TIdNo": widget.distributorId,
      "FCategory": null,
      "TCategory": null,
      "Steps": null,
      "StpsSym": null,
      "SalesMnth": null,
      "SalesYr": null,
      "BonusType": "SPL_LB",
    };
    _dataController.getSpecialLeadershipBonus(bData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Special Leadership Bonus",
        backNavigation: true,
      ),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SpaceHeightWidget(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ViewProfileWidget(
                          infoColor: redColor,
                          title: "Grand Total",
                          info: _dataController.specialLeaderBonusTotal.value
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
                          headingRowColor: MaterialStatePropertyAll(darkBlue),
                          columns: [
                            const DataColumn(
                                label: TableHeadingWidget(title: "S.No")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Distributor ID")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "From Distributor ID")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Month")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Date")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Matching")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Team")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "	Percent %")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "Bonus (D1 \$)")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Redemption Deduction(RP)")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Net Bonus (D1 \$)")),
                          ],
                          source: tSource),
                    ),
                    const SpaceHeightWidget(height: 25)
                  ],
                ),
              );
      }),
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
            info: _dataController.specialLeaderBonusList[index].distbutorId),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].frmDist),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].month),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].date),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].matching),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].team),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].percentage),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].bonus),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].redmption),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.specialLeaderBonusList[index].netBonus),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.specialLeaderBonusList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
