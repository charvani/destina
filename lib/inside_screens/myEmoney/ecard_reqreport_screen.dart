import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class EcardReqReportScreen extends StatefulWidget {
  const EcardReqReportScreen({super.key});

  @override
  State<EcardReqReportScreen> createState() => _EcardReqReportScreenState();
}

final MainController _dataController = Get.put(MainController());

class _EcardReqReportScreenState extends State<EcardReqReportScreen> {
  final ScrollController _scrollController = ScrollController();
  DataTableSource tSource = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Ecard Topup Request Report",
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
                                label: TableHeadingWidget(
                                    title: "Transaction ID")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "Requested By")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Dated")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Request Amount")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Approve Amount")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Status")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "Deposit Slip")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Remarks")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Country")),
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

dipositSlipWidget(
  String imagePath,
) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      
      Get.dialog(Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
              CommonCachedNetworkImage(imagePath: imagePath),
            ],
          ),
        ),
      ));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "View Receipt",
        style: TextStyle(
            fontFamily: "OnestRegular", fontSize: 12, color: darkBlue),
      ),
    ),
  );
}

htmlDataWidget(info) {
  return HtmlWidget(info);
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
            info: _dataController.ecardReqReportList[index].transid),
      ),
      DataCell(_verticalDivider),
      DataCell(
        htmlDataWidget(_dataController.ecardReqReportList[index].reqby),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.ecardReqReportList[index].approveDate),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info:
                "${_dataController.ecardReqReportList[index].symbol} ${_dataController.ecardReqReportList[index].totAmount}"),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info:
                "${_dataController.ecardReqReportList[index].symbol} ${_dataController.ecardReqReportList[index].approveamt}"),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.ecardReqReportList[index].sts),
      ),
      DataCell(_verticalDivider),
      DataCell(
          dipositSlipWidget(_dataController.ecardReqReportList[index].imagepath)
          
          ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.ecardReqReportList[index].remarks),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.ecardReqReportList[index].country),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.ecardReqReportList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
