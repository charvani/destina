import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class PersonalSalesScreen extends StatefulWidget {
  final String fromDate, toDate;

  const PersonalSalesScreen(
      {super.key, required this.fromDate, required this.toDate});

  @override
  State<PersonalSalesScreen> createState() => _PersonalSalesScreenState();
}

final MainController _dataController = Get.put(MainController());

class _PersonalSalesScreenState extends State<PersonalSalesScreen> {
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
      "TIdNo": null,
      "FCategory": null,
      "TCategory": null,
      "Steps": null,
      "StpsSym": null,
      "SalesMnth": null,
      "SalesYr": null,
      "BonusType": "PSB",
    };
    _dataController.getPersonalBonus(bData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Personal Sales Bonus",
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
                          info: _dataController.pesonalBonusTotal.value
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
                                    title: "Distributor Name")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Order No.")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Date")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "CV")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Percent %")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "Bonus (D1 \$)")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Redemption Points(RP)")),
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
            info: _dataController.pesonalBonusList[index].distbutorId),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.pesonalBonusList[index].distbutorName),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.pesonalBonusList[index].orderNo),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.pesonalBonusList[index].date),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.pesonalBonusList[index].cv),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.pesonalBonusList[index].percentage),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.pesonalBonusList[index].bonus),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.pesonalBonusList[index].redmption),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.pesonalBonusList[index].netBonus),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.pesonalBonusList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
