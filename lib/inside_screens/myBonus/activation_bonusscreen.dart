import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class ActivationBonusScreen extends StatefulWidget {
  final String fromDate, toDate, distributorId;

  const ActivationBonusScreen(
      {super.key,
      required this.distributorId,
      required this.fromDate,
      required this.toDate});

  @override
  State<ActivationBonusScreen> createState() => _ActivationBonusScreenState();
}

final MainController _dataController = Get.put(MainController());

class _ActivationBonusScreenState extends State<ActivationBonusScreen> {
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
      "BonusType": "ACTB",
    };
    _dataController.getActivationBonus(bData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Activation Bonus",
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
                          info: _dataController.activationBonusTotal.value
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
                                label:
                                    TableHeadingWidget(title: "Licensee Code")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Commission Type")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "From Licensee")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Date")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Net CV")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Percent %")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Profit (D1 \$)")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Redemption Points(RP)")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Net Profit (D1 \$)")),
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
        TableInfoWidget(info: _dataController.activationBonusList[index].lcode),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.activationBonusList[index].commType),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.activationBonusList[index].frmLcode),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.activationBonusList[index].date),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.activationBonusList[index].netCv),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.activationBonusList[index].percent),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.activationBonusList[index].profit),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.activationBonusList[index].redmption),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.activationBonusList[index].netProfit),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.activationBonusList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
