import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../service_call/api_data.dart';
import '../myorder/invoice_screen.dart';

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
            const Row(
              children: [
                SpaceWidthWidget(width: 10),
              
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
}

infoTextStyle(String id, sNo) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      Get.to(() => InvoiceScreen(
          redirectUrl:
              "https://${ApiData().checkOutUrlDomain}/MobileAppCheckout/PayoutParam.html?DistId=$sNo"
          // 'https://worldunityfoundation.org/members/MobileAppMTaxInvoice.aspx?Type="OrderRpt"&OrderNo=${_dataController.orderReportData[i].orderNo}',
          ));
    },
    child: Text(
      id,
      style:
          TextStyle(fontFamily: "OnestRegular", fontSize: 12, color: darkBlue),
    ),
  );
}

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        TableInfoWidget(info: "${index + 1}"),
      ),
      DataCell(_verticalDivider),
      DataCell(infoTextStyle(
        _dataController
            .withdrawStatusData.value.tpCheckWithdrawrpt[index].reqCode,
        _dataController.withdrawStatusData.value.tpCheckWithdrawrpt[index].sno,
      )
          // TableInfoWidget(
          //     info: _dataController
          //         .withdrawStatusData.value.tpCheckWithdrawrpt[index].reqCode),
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
