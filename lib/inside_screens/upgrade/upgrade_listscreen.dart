import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../myorder/invoice_screen.dart';

class UpgradeListScreen extends StatefulWidget {
  final String? fromDate;
  final String? toDate;
  final String? onDate;
  final String? all;
  const UpgradeListScreen(
      {super.key, this.fromDate, this.toDate, this.onDate, this.all});

  @override
  State<UpgradeListScreen> createState() => _UpgradeListScreenState();
}

class _UpgradeListScreenState extends State<UpgradeListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.all != null) {
      print("all...${widget.all}");
    } else if (widget.onDate != null) {
      print("on...${widget.onDate}");
    } else if (widget.fromDate != null) {
      print("from...${widget.fromDate}....${widget.toDate}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Upgrade List",
        backNavigation: true,
      ),
      body: SingleChildScrollView(
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
              child: SingleChildScrollView(
                controller: _scrollController,
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
                        DataColumn(label: TableHeadingWidget(title: "S.No")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Order No.")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Total Price")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Total CV")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Order Date")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Package Name")),
                      ],
                      rows: [
                        for (int i = 1; i < 9; i++)
                          DataRow(cells: [
                            DataCell(
                              TableInfoWidget(info: i.toString()),
                            ),
                            DataCell(orderNumTextWidget("29072017/6503")),
                            const DataCell(
                              TableInfoWidget(info: "RM 6740.60"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "700"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "29 Jul 2017"),
                            ),
                            const DataCell(
                              TableInfoWidget(
                                  info:
                                      "	STOCKIST/DIAMOND TO BLUE DIAMOND MIX UPGRADE PROMO"),
                            ),
                          ])
                      ]),
                ),
              ),
            ),
            const SpaceHeightWidget(height: 25)
          ],
        ),
      ),
    );
  }

  orderNumTextWidget(String title) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.to(() => const InvoiceScreen(
              redirectUrl: "",
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
}
