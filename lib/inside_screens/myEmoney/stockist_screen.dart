import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'ecard_transfer_screen.dart';
import 'withdrawal_screen.dart';

class StockistScreen extends StatefulWidget {
  final String transPass;

  const StockistScreen({super.key, required this.transPass});

  @override
  State<StockistScreen> createState() => _StockistScreenState();
}

final MainController _dataController = Get.put(MainController());

class _StockistScreenState extends State<StockistScreen> {
  final ScrollController _scrollController = ScrollController();
  DataTableSource tSource = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Stockist eMoney",
        backNavigation: true,
      ),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceHeightWidget(height: 10),
                    Row(
                      children: [
                        const SpaceWidthWidget(width: 10),
                        if (_dataController.ecardData.value.withDrawButton)
                          SizedBox(
                              height: 30,
                              child: CustomAutoWidthButton(
                                  onTapFun: () {
                                    Get.to(() => WithdrawalScreen(
                                          transPass: widget.transPass,
                                        ));
                                  },
                                  title: "Withdrawal")),
                        const SpaceWidthWidget(width: 10),
                        if (_dataController.ecardData.value.ecardButton)
                          SizedBox(
                            height: 30,
                            child: CustomAutoWidthButton(
                                onTapFun: () {
                                  Get.to(() => EcardTransferScreen(
                                        from: "Redemption",
                                        transPass: widget.transPass,
                                        bal: _dataController
                                            .ecardData.value.balenceAmount,
                                        symbol: _dataController
                                            .ecardData.value.symbol,
                                      ));
                                },
                                title: "EMoney Transfer"),
                          ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: cardDetailsWidget(),
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
                            const DataColumn(
                                label: TableHeadingWidget(title: "S.No")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Date")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "Credit Amount")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "Debit Amount")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(
                                    title: "Balance Amount")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label: TableHeadingWidget(title: "Remarks")),
                            DataColumn(label: _verticalDivider),
                            const DataColumn(
                                label:
                                    TableHeadingWidget(title: "Description")),
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

  cardDetailsWidget() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: limeColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Credit",
              info:
                  "${_dataController.ecardData.value.symbol} ${_dataController.ecardData.value.totalCredit}",
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Debit",
              info:
                  "${_dataController.ecardData.value.symbol} ${_dataController.ecardData.value.totalDebit}",
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Balance",
              info:
                  "${_dataController.ecardData.value.symbol} ${_dataController.ecardData.value.balenceAmount}",
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
            info: _dataController.ecardData.value.emoneyrpt[index].date),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info:
                _dataController.ecardData.value.emoneyrpt[index].creditAmount),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.ecardData.value.emoneyrpt[index].debitAmount),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info:
                _dataController.ecardData.value.emoneyrpt[index].balanceAmount),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.ecardData.value.emoneyrpt[index].remarks),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.ecardData.value.emoneyrpt[index].description),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.ecardData.value.emoneyrpt.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
