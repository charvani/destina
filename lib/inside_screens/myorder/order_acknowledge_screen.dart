import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/myorder/invoice_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_screen.dart';

class OrderAknowledgeScreen extends StatefulWidget {
  const OrderAknowledgeScreen({super.key});

  @override
  State<OrderAknowledgeScreen> createState() => _OrderAknowledgeScreenState();
}

class _OrderAknowledgeScreenState extends State<OrderAknowledgeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Order Acknowledge", backNavigation: true),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeightWidget(height: 10),
          Container(
            height: 60,
            padding: const EdgeInsets.all(8.0),
            child: CommonFormFieldwidget(
              hintText: "Search",
              onChangeFun: (val) {
                print("vall...$val");
              },
              prefixIcon: Icon(
                FeatherIcons.search,
                size: 18,
                color: blackColor.withOpacity(0.3),
              ),
            ),
          ),
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
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                    dataRowMaxHeight: 50,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    headingRowColor: MaterialStatePropertyAll(
                        lightDarKBlue.withOpacity(0.15)),
                    border: TableBorder.all(
                        color: middleBlackColor.withOpacity(0.15)),
                    columns: [
                      DataColumn(label: tableTitleWidget("S.No")),
                      DataColumn(label: tableTitleWidget("Order No")),
                      DataColumn(label: tableTitleWidget("Collection Mode")),
                      DataColumn(label: tableTitleWidget("Date Of Dispatch")),
                      DataColumn(label: tableTitleWidget("Licensee Collected")),
                      DataColumn(label: tableTitleWidget("Acknowledge Date")),
                      DataColumn(
                          label: tableTitleWidget(
                              "Product Collection Acknowledge")),
                      DataColumn(label: tableTitleWidget("Status")),
                      DataColumn(label: tableTitleWidget("Updation")),
                    ],
                    rows: [
                      for (int i = 1; i < 9; i++)
                        DataRow(cells: [
                          DataCell(
                            rowTextWidget(i.toString()),
                          ),
                          DataCell(
                            orderNumTextWidget("1209034_1727"),
                          ),
                          DataCell(
                            rowTextWidget("Self Collect"),
                          ),
                          DataCell(
                            rowTextWidget("16 Sep 2012"),
                          ),
                          DataCell(
                            rowTextWidget(""),
                          ),
                          DataCell(
                            rowTextWidget("16 Sep 2012"),
                          ),
                          DataCell(
                            rowTextWidget("OldData"),
                          ),
                          DataCell(
                            rowTextWidget("Acknowledged"),
                          ),
                          DataCell(
                            orderNumTextWidget("Details"),
                          ),
                        ])
                    ]),
              ),
            ),
          )
        ],
      )),
    );
  }

  tableTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "OnestSemiBold", fontSize: 12, color: blackColor),
      ),
    );
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

  orderNumTextWidget(String title) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (title != "Details") {
          Get.to(() => const InvoiceScreen());
        } else {
          Get.to(() => const OrderDetailsScreen());
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
}
