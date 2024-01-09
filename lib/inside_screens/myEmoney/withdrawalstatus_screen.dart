import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import 'ecard_transfer_screen.dart';

class WithdrawalStatusScreen extends StatefulWidget {
  final String transPass;

  const WithdrawalStatusScreen({super.key, required this.transPass});

  @override
  State<WithdrawalStatusScreen> createState() => _WithdrawalStatusScreenState();
}

final MainController _dataController = Get.put(MainController());

class _WithdrawalStatusScreenState extends State<WithdrawalStatusScreen> {
  final ScrollController _scrollController = ScrollController();
  DataTableSource tSource = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Withdrawal Status",
        backNavigation: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeightWidget(height: 10),
            Row(
              children: [
                const SpaceWidthWidget(width: 10),
                if (_dataController.withdrawStatusData.value.ecardButton)
                  SizedBox(
                    height: 30,
                    child: CustomAutoWidthButton(
                        onTapFun: () {
                          Get.to(() => EcardTransferScreen(
                                from: "Withdrawal",
                                transPass: widget.transPass,
                                bal: _dataController
                                    .ecardData.value.balenceAmount,
                                symbol: _dataController.ecardData.value.symbol,
                              ));
                        },
                        title: "EMoney Transfer"),
                  ),
              ],
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
                  headingRowColor:
                      MaterialStatePropertyAll(lightDarKBlue.withOpacity(0.2)),
                  columns: [
                    const DataColumn(label: TableHeadingWidget(title: "S.No")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Request Code")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Request  Amount")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Request Date")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Status")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Remarks")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Email Messages")),
                  ],
                  source: tSource),
            ),
            const SpaceHeightWidget(height: 25)
          ],
        ),
      ),
    );
  }

  cardDetailsWidget() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: limeColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Credit",
              info: "RM  23,382.61",
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Debit",
              info: "RM  2,924.40",
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: limeColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Balance",
              info: "RM 20,458.21",
            ),
          ),
        ),
      ],
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
            info: _dataController
                .withdrawStatusData.value.tpCheckWithdrawrpt[index].reqCode),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .withdrawStatusData.value.tpCheckWithdrawrpt[index].reqAmount),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .withdrawStatusData.value.tpCheckWithdrawrpt[index].reqDate),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .withdrawStatusData.value.tpCheckWithdrawrpt[index].status),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .withdrawStatusData.value.tpCheckWithdrawrpt[index].remarks),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.withdrawStatusData.value
                .tpCheckWithdrawrpt[index].emailMessages),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>
      _dataController.withdrawStatusData.value.tpCheckWithdrawrpt.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
