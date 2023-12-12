import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class EcardReqReportScreen extends StatefulWidget {
  const EcardReqReportScreen({super.key});

  @override
  State<EcardReqReportScreen> createState() => _EcardReqReportScreenState();
}

class _EcardReqReportScreenState extends State<EcardReqReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Ecard Topup Request Report",
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
            SingleChildScrollView(
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
                      DataColumn(label: TableHeadingWidget(title: "View Slip")),
                    ],
                    rows: [
                      for (int i = 1; i < 9; i++)
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
                                info: "Amount Deducted For Bill 28112023/7055"),
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
              title: "Ecard",
              info: "89uQABC5DpEF",
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Pin",
              info: "6EtQYbABCDEF",
            ),
          ),
        ),
        Container(
          color: limeColor.withOpacity(0.5),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Credit",
              info: "RM  387,508.30",
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Debit",
              info: "RM  365,358.69",
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
              info: "RM 22,149.61",
            ),
          ),
        ),
      ],
    );
  }
}
