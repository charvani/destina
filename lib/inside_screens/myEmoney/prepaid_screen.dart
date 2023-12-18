import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ecard_transfer_screen.dart';

class PrepaidScreen extends StatefulWidget {
  const PrepaidScreen({super.key});

  @override
  State<PrepaidScreen> createState() => _PrepaidScreenState();
}

class _PrepaidScreenState extends State<PrepaidScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Prepaid eMoney",
        backNavigation: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeightWidget(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomElevatedButton(
                      onTapFun: () {
                        Get.to(() => const EcardTransferScreen(
                              from: "Prepaid",
                            ));
                      },
                      title: "Prepaid EMoney Transfer")),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: cardDetailsWidget(),
            ),
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
                        DataColumn(label: TableHeadingWidget(title: "Date")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Credit Amount")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Debit Amount")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Balance Amount")),
                        DataColumn(label: TableHeadingWidget(title: "Remarks")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Description")),
                        DataColumn(
                            label: TableHeadingWidget(title: "View Slip")),
                      ],
                      rows: [
                        for (int i = 1; i < 6; i++)
                          DataRow(cells: [
                            DataCell(
                              TableInfoWidget(info: i.toString()),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "06 Dec 2023"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "0"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "54376"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "22149.61"),
                            ),
                            const DataCell(
                              TableInfoWidget(
                                  info:
                                      "Amount Deducted For Bill 28112023/7055"),
                            ),
                            const DataCell(
                              TableInfoWidget(
                                  info:
                                      "Ecard Transfer To Ecard Of Destina1USAHQ (Malaysia)"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "Details"),
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

  cardDetailsWidget() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: limeColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Credit",
              info: "RM  23,382.61",
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Debit",
              info: "RM  2,924.40",
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
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Balance",
              info: "RM 20,458.21",
            ),
          ),
        ),
      ],
    );
  }
}
