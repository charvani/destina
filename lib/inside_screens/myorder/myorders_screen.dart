import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'invoice_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  final String fromDate;
  final String toDate;
  final String mallId;
  const MyOrdersScreen(
      {super.key,
      required this.fromDate,
      required this.toDate,
      required this.mallId});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final MainController _dataController = Get.put(MainController());

  ScrollController dialogScrollController = ScrollController();
  int? selectedInt;
  dynamic userid, username, pass;
  @override
  void initState() {
    super.initState();
    userid = Constants.prefs.getString("user_id");
    pass = Constants.prefs.getString("password");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() {
    Map bdata = {
      "UserId": userid.toString().trim(),
      "Pwd": pass,
      "Action": "FromToDate",
      "FromDate": widget.fromDate,
      "ToDate": widget.toDate,
      "MallId": widget.mallId
    };
    _dataController.getOrderReport(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : _dataController.orderReportData.isEmpty
                ? const NotAvailableText(text: "Data not found")
                : SingleChildScrollView(
                    child: Column(children: [
                      const SpaceHeightWidget(height: 10),
                      for (int i = 0;
                          i < _dataController.orderReportData.length;
                          i++)
                        MyOrderItemWidget(
                          loading: selectedInt == i ? true : false,
                          date: _dataController.orderReportData[i].orderDate,
                          itemName: _dataController.orderReportData[i].name,
                          imgPath: "assets/images/logo.png",
                          mrpRate: _dataController.orderReportData[i].amt,
                          ordercode: _dataController.orderReportData[i].orderNo,
                          shippingFun: () async {
                            setState(() {
                              selectedInt = i;
                            });
                            Map bdata = {
                              "UserId": userid,
                              "Pwd": pass,
                              "OrderNo":
                                  _dataController.orderReportData[i].orderNo,
                              // "21122023/5048"
                            };
                            await _dataController.getOrderShipping(bdata);
                            Get.dialog(shippingHistoryDialog());
                            setState(() {
                              selectedInt = null;
                            });
                          },
                          invoiceFun: () {
                            Get.to(() => InvoiceScreen(
                                redirectUrl:
                                    "https://showcase.worldunityfoundation.org/MobileAppCheckout/invoiceparam.html?BillNo=${_dataController.orderReportData[i].orderNo}"
                                // 'https://worldunityfoundation.org/members/MobileAppMTaxInvoice.aspx?Type="OrderRpt"&OrderNo=${_dataController.orderReportData[i].orderNo}',
                                ));
                          },
                        )
                    ]),
                  );
      }),
    );
  }

  shippingHistoryDialog() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: blackColor.withOpacity(0.8),
      child: StatefulBuilder(builder: (context, myState) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: darkBlue),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SHIPPING HISTORY FOR BILL",
                        style: TextStyle(
                            fontFamily: "OnestBold",
                            fontSize: 12,
                            color: whiteColor),
                      ),
                      IconButton(
                          onPressed: () {
                            // if (loading != true) {
                            Get.back();
                            // }
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
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Scrollbar(
                          interactive: true,
                          controller: dialogScrollController,
                          thumbVisibility: true,
                          trackVisibility: true,
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          radius: const Radius.circular(10),
                          child: SingleChildScrollView(
                            controller: dialogScrollController,
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DataTable(
                                  // dataRowMaxHeight: 50,
                                  horizontalMargin: 0,
                                  columnSpacing: 0,
                                  // headingRowColor: MaterialStatePropertyAll(blackColor.withOpacity(0.85)),
                                  headingRowColor:
                                      MaterialStatePropertyAll(darkBlue),
                                  border: TableBorder.all(
                                    color: middleBlackColor.withOpacity(0.15),
                                  ),
                                  columns: const [
                                    DataColumn(
                                        label:
                                            TableHeadingWidget(title: "S.No")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Dispatch Details")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Shipping Remark")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Dispatch Date")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Remarks")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Added By")),
                                    DataColumn(
                                        label:
                                            TableHeadingWidget(title: "AWB")),
                                    DataColumn(
                                        label:
                                            TableHeadingWidget(title: "Track")),
                                  ],
                                  rows: [
                                    for (int i = 0;
                                        i <
                                            _dataController
                                                .shippingOrderData.length;
                                        i++)
                                      DataRow(cells: [
                                        DataCell(
                                          TableInfoWidget(info: "${i + 1}"),
                                        ),
                                        DataCell(
                                          TableInfoWidget(
                                              info: _dataController
                                                  .shippingOrderData[i]
                                                  .dispatchDtls),
                                        ),
                                        DataCell(
                                          TableInfoWidget(
                                              info: _dataController
                                                  .shippingOrderData[i]
                                                  .shippingRmk),
                                        ),
                                        DataCell(
                                          TableInfoWidget(
                                              info: _dataController
                                                  .shippingOrderData[i]
                                                  .dispatchDate),
                                        ),
                                        DataCell(
                                          TableInfoWidget(
                                              info: _dataController
                                                  .shippingOrderData[i]
                                                  .remarks),
                                        ),
                                        DataCell(
                                          TableInfoWidget(
                                              info: _dataController
                                                  .shippingOrderData[i]
                                                  .addedBy),
                                        ),
                                        DataCell(
                                          _dataController.shippingOrderData[i]
                                                      .awblink !=
                                                  ""
                                              ? lauchWidget(
                                                  _dataController
                                                      .shippingOrderData[i].awb,
                                                  _dataController
                                                      .shippingOrderData[i]
                                                      .awblink)
                                              : TableInfoWidget(
                                                  info: _dataController
                                                      .shippingOrderData[i]
                                                      .awblink,
                                                ),
                                        ),
                                        DataCell(
                                          _dataController.shippingOrderData[i]
                                                      .tracklink !=
                                                  ""
                                              ? lauchWidget(
                                                  "Click here",
                                                  _dataController
                                                      .shippingOrderData[i]
                                                      .tracklink)
                                              : const TableInfoWidget(info: ""),
                                        ),
                                      ])
                                  ]),
                            ),
                          ),
                        ),
                        const SpaceHeightWidget(height: 10),
                      ]),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget lauchWidget(info, urlLink) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          final Uri url = Uri.parse(urlLink);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        child: TableInfoWidget(
          info: info,
          color: lightDarKBlue,
        ));
  }
}
