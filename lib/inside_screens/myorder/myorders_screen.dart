import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/myorder/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';

class MyOrdersScreen extends StatefulWidget {
  final String fromDate;
  final String toDate;
  const MyOrdersScreen(
      {super.key, required this.fromDate, required this.toDate});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  ScrollController dialogScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: SingleChildScrollView(
        child: Column(children: [
          const SpaceHeightWidget(height: 10),
          for (int i = 0; i < 5; i++)
            MyOrderItemWidget(
              date: "04 Dec 2023",
              itemName: "D1 ASE SCALARVIA",
              imgPath: "assets/images/logo.png",
              mrpRate: "90",
              ordercode: "04122023/1238",
              shippingFun: () {
                Get.dialog(shippingHistoryDialog());
              },
              invoiceFun: () {
                Get.to(() => const InvoiceScreen());
              },
            )
        ]),
      ),
    );
  }

  shippingHistoryDialog() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: blackColor.withOpacity(0.8),
      child: StatefulBuilder(builder: (context, myState) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blackColor.withOpacity(0.8)),
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
                                  headingRowColor: MaterialStatePropertyAll(
                                      lightDarKBlue.withOpacity(0.2)),
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
                                    for (int i = 1; i < 3; i++)
                                      DataRow(cells: [
                                        DataCell(
                                          TableInfoWidget(info: i.toString()),
                                        ),
                                        const DataCell(
                                          TableInfoWidget(info: "DESTINA1INT"),
                                        ),
                                        const DataCell(
                                          TableInfoWidget(info: "DESTINA1"),
                                        ),
                                        const DataCell(
                                          TableInfoWidget(info: "DESTINA1"),
                                        ),
                                        const DataCell(
                                          TableInfoWidget(
                                              info: "07122023/10819"),
                                        ),
                                        const DataCell(
                                          TableInfoWidget(info: "50"),
                                        ),
                                        const DataCell(
                                          TableInfoWidget(info: "06 Dec 2023"),
                                        ),
                                        const DataCell(
                                          TableInfoWidget(info: "27.96"),
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
}
