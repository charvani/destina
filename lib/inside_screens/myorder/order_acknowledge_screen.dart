import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../service_call/api_data.dart';
import 'details_screen.dart';
import 'invoice_screen.dart';

class OrderAknowledgeScreen extends StatefulWidget {
  const OrderAknowledgeScreen({super.key});

  @override
  State<OrderAknowledgeScreen> createState() => _OrderAknowledgeScreenState();
}

final MainController _dataController = Get.put(MainController());

class _OrderAknowledgeScreenState extends State<OrderAknowledgeScreen> {
  DataTableSource tSource = MyData();

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    await _dataController.getOrderAcknowledgeReport(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Order Acknowledge", backNavigation: true),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceHeightWidget(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Note: Click on Order Number to get Invoice",
                      style: TextStyle(
                          fontFamily: "OnestRegular",
                          color: darkRedColor,
                          fontSize: 10),
                    ),
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
                          DataColumn(label: tableTitleWidget("S.No")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(label: tableTitleWidget("Order No")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(
                              label: tableTitleWidget("Collection Mode")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(
                              label: tableTitleWidget("Date Of Dispatch")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(
                              label: tableTitleWidget("Licensee Collected")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(
                              label: tableTitleWidget("Acknowledge Date")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(
                              label: tableTitleWidget(
                                  "Product Collection Acknowledge")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(label: tableTitleWidget("Status")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(label: tableTitleWidget("Updation")),
                        ],
                        source: tSource),
                  ),
                  const SpaceHeightWidget(height: 20),
                ],
              ));
      }),
    );
  }

  tableTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "OnestSemiBold", fontSize: 12, color: whiteColor),
      ),
    );
  }
}

rowTextWidget(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      title,
      style: TextStyle(
          fontFamily: "OnestRegular", fontSize: 12, color: blackColor),
    ),
  );
}

orderNumTextWidget(String from, title, int index) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      if (from == "ordernum") {
        Get.to(() => InvoiceScreen(
            redirectUrl:
                "https://${ApiData().checkOutUrlDomain}/MobileAppCheckout/invoiceparam.html?BillNo=${_dataController.orderAcknowledgeData[index].orderNo}"

            // 'https://worldunityfoundation.org/members/MobileAppMTaxInvoice.aspx?Type="OrderAknowledge"&OrderNo=${_dataController.orderAcknowledgeData[index].orderNo}',
            ));
      } else if (from == "details") {
        Get.to(() => OrderDetailsScreen(
              billno: _dataController.orderAcknowledgeData[index].orderNo,
              rmidNum: _dataController.orderAcknowledgeData[index].rmid,
            ));
      } else if (from == "license") {
        Get.dialog(licenseDetialsDilog(index));
      }
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

BoxDecoration dec = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: lightBlackColor.withOpacity(0.5)));
Dialog licenseDetialsDilog(int i) {
  return Dialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 6),
    backgroundColor: blackColor.withOpacity(0.8),
    child: StatefulBuilder(builder: (context, myState) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: blackColor.withOpacity(0.8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 16,
                        color: whiteColor,
                      ))
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: whiteColor,
              ),
              padding: const EdgeInsets.all(7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceHeightWidget(height: 20),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const CommonTitle(
                                titleName: "Member Details",
                                size: 13,
                              ),
                              const SpaceHeightWidget(height: 5),
                              Container(
                                width: 450,
                                padding: const EdgeInsets.all(5),
                                decoration: dec,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ViewProfileWidget(
                                        title: "Licensee Code :",
                                        info: _dataController
                                            .orderAcknowledgeData[i]
                                            .licenseCode,
                                      ),
                                      ViewProfileWidget(
                                        title: "Name :",
                                        info: _dataController
                                            .orderAcknowledgeData[i]
                                            .licenseName,
                                      ),
                                      ViewProfileWidget(
                                        title: "Address :",
                                        info: _dataController
                                            .orderAcknowledgeData[i].licenseAdd,
                                      ),
                                      ViewProfileWidget(
                                        title: "Email :",
                                        info: _dataController
                                            .orderAcknowledgeData[i]
                                            .licenseEmail,
                                      ),
                                      ViewProfileWidget(
                                        title: "Contact No :",
                                        info: _dataController
                                            .orderAcknowledgeData[i]
                                            .licenseContctNo,
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      )),
                  const SpaceHeightWidget(height: 20),
                ],
              ),
            ),
          ],
        ),
      );
    }),
  );
}

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        rowTextWidget("${index + 1}"),
      ),
      DataCell(_verticalDivider),
      DataCell(
        orderNumTextWidget("ordernum",
            _dataController.orderAcknowledgeData[index].orderNo, index),
      ),
      DataCell(_verticalDivider),
      DataCell(
        rowTextWidget(
            _dataController.orderAcknowledgeData[index].collectionMode),
      ),
      DataCell(_verticalDivider),
      DataCell(
        rowTextWidget(
            _dataController.orderAcknowledgeData[index].dateOfDispatch),
      ),
      DataCell(_verticalDivider),
      DataCell(
        // rowTextWidget(
        //     _dataController.orderAcknowledgeData[index].licenseCollected),
        orderNumTextWidget(
            "license",
            _dataController.orderAcknowledgeData[index].licenseCollected,
            index),
      ),
      DataCell(_verticalDivider),
      DataCell(
        rowTextWidget(
            _dataController.orderAcknowledgeData[index].acknowledgeDate),
      ),
      DataCell(_verticalDivider),
      DataCell(
        rowTextWidget(
            _dataController.orderAcknowledgeData[index].acknowledgeTrough),
      ),
      DataCell(_verticalDivider),
      DataCell(
        rowTextWidget(_dataController.orderAcknowledgeData[index].status),
      ),
      DataCell(_verticalDivider),
      DataCell(
        orderNumTextWidget(
            "details",
            _dataController.orderAcknowledgeData[index].status != "Acknowledged"
                ? "Details"
                : "",
            index),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.orderAcknowledgeData.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
