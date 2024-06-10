import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../service_call/api_data.dart';
import '../myorder/invoice_screen.dart';
import 'ecard_transfer_screen.dart';

class EcardScreen extends StatefulWidget {
  final String transPass;
  const EcardScreen({super.key, required this.transPass});

  @override
  State<EcardScreen> createState() => _EcardScreenState();
}

final MainController _dataController = Get.put(MainController());

class _EcardScreenState extends State<EcardScreen> {
  final ScrollController _scrollController = ScrollController();
  DataTableSource tSource = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(
            title: "E-Card",
            backNavigation: true,
            action: _dataController.ecardData.value.ecardButton
                ? SizedBox(
                    height: 30,
                    width: 100,
                    child: CustomFixedElevatedButton(
                        onTapFun: () {
                          Get.to(() => EcardTransferScreen(
                                from: "E-Card",
                                transPass: widget.transPass,
                                bal: _dataController
                                    .ecardData.value.balenceAmount,
                                symbol: _dataController.ecardData.value.symbol,
                                etype: "Ecard",
                              ));
                        },
                        title: "Ecard Transfer"))
                : const SizedBox.shrink()),
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
                          label: TableHeadingWidget(title: "Date")),
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
                      DataColumn(label: _verticalDivider),
                      const DataColumn(
                          label: TableHeadingWidget(title: "View Slip")),
                    ],
                    source: tSource),
              ),
              const SpaceHeightWidget(height: 25)
            ],
          ),
        ));
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
              title: "Ecard",
              info: _dataController.ecardData.value.ecard,
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Pin",
              info: _dataController.ecardData.value.ePin,
            ),
          ),
        ),
        Container(
          color: limeColor.withOpacity(0.5),
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
        _dataController.ecardData.value.emoneyrpt[index].remarks
                .contains("Amount Deducted For Bill")
            ? remarkTextWidget(
                _dataController.ecardData.value.emoneyrpt[index].remarks, index)
            : TableInfoWidget(
                info: _dataController.ecardData.value.emoneyrpt[index].remarks),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.ecardData.value.emoneyrpt[index].description),
      ),
      DataCell(_verticalDivider),
      DataCell(
        _dataController.ecardData.value.emoneyrpt[index].imageText != ""
            ? viewSlipWidget(
                _dataController.ecardData.value.emoneyrpt[index].imageText,
                _dataController.ecardData.value.emoneyrpt[index].imageEndPath)
            : const TableInfoWidget(info: ""),
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
remarkTextWidget(String title, int i) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      Get.to(() => InvoiceScreen(
          redirectUrl:
              "https://${ApiData().checkOutUrlDomain}/MobileAppCheckout/invoiceparam.html?BillNo=${_dataController.ecardData.value.emoneyrpt[i].billNo}"

          ));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "OnestRegular", fontSize: 12, color: darkBlue),
      ),
    ),
  );
}

viewSlipWidget(String imageText, imagePath) {
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
              CommonCachedNetworkImage(
                  imagePath:
                      "https://members.destina1.com/Ecardimages/$imagePath"),
            ],
          ),
        ),
      ));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        imageText,
        style: TextStyle(
            fontFamily: "OnestRegular", fontSize: 12, color: darkBlue),
      ),
    ),
  );
}
