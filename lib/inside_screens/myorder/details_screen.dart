import 'dart:async';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String billno, rmidNum;
  const OrderDetailsScreen(
      {super.key, required this.billno, required this.rmidNum});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  ScrollController payScrollController = ScrollController();

  final MainController _dataController = Get.put(MainController());
  bool ackLoad = false;
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
      "Action": "GetPrds",
      "BillNo": widget.billno,
      "Lcode": "",
      "country": ""
    };
    await _dataController.getOrderAcknowledgeDetails(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(children: [
                  const SpaceHeightWidget(height: 10),
                  Scrollbar(
                    interactive: true,
                    trackVisibility: true,
                    controller: payScrollController,
                    thumbVisibility: true,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    radius: const Radius.circular(10),
                    child: SingleChildScrollView(
                      controller: payScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DataTable(
                            // dataRowMaxHeight: 50,
                            horizontalMargin: 0,
                            columnSpacing: 0,
                            // headingRowColor: MaterialStatePropertyAll(blackColor.withOpacity(0.85)),
                            headingRowColor: MaterialStatePropertyAll(
                                lightDarKBlue.withOpacity(0.2)),
                            border: TableBorder.all(
                              color: middleBlackColor.withOpacity(0.15),
                            ),
                            columns: const [
                              DataColumn(
                                  label: TableHeadingWidget(title: "SNo.")),
                              DataColumn(
                                  label: TableHeadingWidget(
                                      title: "Product Code")),
                              DataColumn(
                                  label: TableHeadingWidget(
                                      title: "Product Name")),
                              DataColumn(
                                  label: TableHeadingWidget(title: "Qty")),
                            ],
                            rows: [
                              for (int i = 0;
                                  i <
                                      _dataController.updationData.value
                                          .chechUpdrpt.length;
                                  i++)
                                DataRow(cells: [
                                  DataCell(
                                    TableInfoWidget(
                                      info: "${i + 1}",
                                    ),
                                  ),
                                  DataCell(
                                    TableInfoWidget(
                                        info: _dataController.updationData.value
                                            .chechUpdrpt[i].productCode),
                                  ),
                                  DataCell(
                                    TableInfoWidget(
                                        info: _dataController.updationData.value
                                            .chechUpdrpt[i].productName),
                                  ),
                                  DataCell(
                                    TableInfoWidget(
                                        info: _dataController.updationData.value
                                            .chechUpdrpt[i].qty),
                                  ),
                                ])
                            ]),
                      ),
                    ),
                  ),
                  const SpaceHeightWidget(height: 20),
                  ackLoad
                      ? loader
                      : CustomAutoWidthButton(
                          onTapFun: () async {
                            setState(() {
                              ackLoad = true;
                            });
                            Map bdata = {
                              "UserId": Constants.prefs.getString("user_id"),
                              "Pwd": Constants.prefs.getString("password"),
                              "Action": "ackupdate",
                              "BillNo": "Member",
                              "Lcode": widget.rmidNum,
                              "country": ""
                            };
                            dynamic res = await _dataController
                                .getOrderAcknowledgeUpdation(bdata);
                            if (res != null) {
                              if (res['Msg'] == "SUCCESS") {
                                CommonToastTrue(
                                    "Acknowledge updated successfully");
                                Timer(const Duration(seconds: 1), () {
                                  Get.back();
                                });
                              } else {
                                CommonToast(res['Message']);
                              }
                            }
                            setState(() {
                              ackLoad = false;
                            });
                          },
                          title: "Acknowledge"),
                  const SpaceHeightWidget(height: 20),
                ]),
              );
      }),
    );
  }
}
