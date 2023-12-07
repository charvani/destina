import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class ComissionAmountScreen extends StatefulWidget {
  const ComissionAmountScreen({super.key});

  @override
  State<ComissionAmountScreen> createState() => _ComissionAmountScreenState();
}

class _ComissionAmountScreenState extends State<ComissionAmountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Commission eMoney",
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
                    ],
                    rows: [
                      for (int i = 1; i < 9; i++)
                        DataRow(cells: [
                          DataCell(
                            TableInfoWidget(info: i.toString()),
                          ),
                          const DataCell(
                            TableInfoWidget(info: "29 Nov 2023"),
                          ),
                          const DataCell(
                            TableInfoWidget(info: "0"),
                          ),
                          const DataCell(
                            TableInfoWidget(info: "64.47"),
                          ),
                          const DataCell(
                            TableInfoWidget(info: "18789.91"),
                          ),
                          const DataCell(
                            TableInfoWidget(info: "ADistShoppe"),
                          ),
                          const DataCell(
                            TableInfoWidget(
                                info: "Amount Deducted For Bill 29112023/3436"),
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
              title: "Total Credit",
              info: "D1 \$  135,624.61",
            ),
          ),
        ),
        Container(
          color: lightYellow.withOpacity(0.8),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ViewProfileWidget(
              title: "Total Debit",
              info: "D1 \$  116,834.70",
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
              info: "D1 \$ 18,789.91",
            ),
          ),
        ),
      ],
    );
  }
}
