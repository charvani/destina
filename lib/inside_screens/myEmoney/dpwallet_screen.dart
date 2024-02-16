import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import 'withdrawal_screen.dart';

class DpWallateScreen extends StatefulWidget {
  final String transPass;

  const DpWallateScreen({super.key, required this.transPass});

  @override
  State<DpWallateScreen> createState() => _DpWallateScreenState();
}

final MainController _dataController = Get.put(MainController());

class _DpWallateScreenState extends State<DpWallateScreen> {
  DataTableSource tSource = MyData();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "DP Wallet",
        backNavigation: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: cardDetailsWidget(),
            ),
            Row(
              children: [
                const SpaceWidthWidget(width: 10),
                if (_dataController.d1cashbackpointsData.value.withDrawButton)
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
                // if (_dataController.d1cashbackpointsData.value.ecardButton)
                //   SizedBox(
                //     height: 30,
                //     child: CustomAutoWidthButton(
                //         onTapFun: () {
                //           Get.to(() => EcardTransferScreen(
                //                 from: "DP Wallet",
                //                 transPass: widget.transPass,
                //                 bal: _dataController
                //                     .d1cashbackpointsData.value.d1BalenceAmount,
                //                 symbol: "RM",
                //               ));
                //         },
                //         title: "D1 Cashback Points"),
                //   ),
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
                  headingRowColor: MaterialStatePropertyAll(darkBlue),
                  columns: [
                    const DataColumn(label: TableHeadingWidget(title: "S.No")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(label: TableHeadingWidget(title: "Date")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Credit Amount")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Debit Amount")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Balance Amount")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Remarks")),
                    DataColumn(label: _verticalDivider),
                    const DataColumn(
                        label: TableHeadingWidget(title: "Description")),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Credit",
              info: _dataController.d1cashbackpointsData.value.totalD1Credit,
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Debit",
              info: _dataController.d1cashbackpointsData.value.totalD1Debit,
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
              info: _dataController.d1cashbackpointsData.value.d1BalenceAmount,
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
                .d1cashbackpointsData.value.d1CreditRSummaryRpt[index].dated),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .d1cashbackpointsData.value.d1CreditRSummaryRpt[index].inamt),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .d1cashbackpointsData.value.d1CreditRSummaryRpt[index].outamt),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .d1cashbackpointsData.value.d1CreditRSummaryRpt[index].balance),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController
                .d1cashbackpointsData.value.d1CreditRSummaryRpt[index].remarks),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.d1cashbackpointsData.value
                .d1CreditRSummaryRpt[index].description),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>
      _dataController.d1cashbackpointsData.value.d1CreditRSummaryRpt.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
