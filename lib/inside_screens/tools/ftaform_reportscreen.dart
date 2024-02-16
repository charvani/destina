import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class FTAFormReportScreen extends StatefulWidget {
  const FTAFormReportScreen({super.key});

  @override
  State<FTAFormReportScreen> createState() => _FTAFormReportScreenState();
}

final MainController _dataController = Get.put(MainController());

class _FTAFormReportScreenState extends State<FTAFormReportScreen> {
  DataTableSource tSource = MyData();
  final ScrollController _scrollController = ScrollController();

  dynamic userid, password;
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
    Map bdata = {
      "Action": "GetRpt",
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "FTAName": "",
      "FTAProofNo": "",
      "FtaContact": "",
      "FtaEmail": "",
      "InvName": "",
      "InvProofNo": "",
      "InvContact": "",
      "InvEmail": "",
      "Dated": "",
      "Name": "",
      "IDated": "",
    };
    _dataController.getFTAReport(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "FTA Form Report",
        backNavigation: true,
      ),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SpaceHeightWidget(height: 10),
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
                                    TableHeadingWidget(title: "Meeting Date")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "FTA Name")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "FTA ID")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "FTA Contact No.")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "FTA Email Id")),
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
        TableInfoWidget(info: _dataController.ftaReportList[index].fdated),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.ftaReportList[index].ftaName),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.ftaReportList[index].ftaProofNo),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.ftaReportList[index].ftaContact),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.ftaReportList[index].ftaEmail),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.ftaReportList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
