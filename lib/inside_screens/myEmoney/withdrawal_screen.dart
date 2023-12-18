import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class WithdrawalStatusScreen extends StatefulWidget {
  const WithdrawalStatusScreen({super.key});

  @override
  State<WithdrawalStatusScreen> createState() => _WithdrawalStatusScreenState();
}

class _WithdrawalStatusScreenState extends State<WithdrawalStatusScreen> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Withdrawal Status",
        backNavigation: true,
      ),
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
                            label: TableHeadingWidget(title: "Request Code")),
                        DataColumn(
                            label:
                                TableHeadingWidget(title: "Request  Amount")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Request Date")),
                        DataColumn(label: TableHeadingWidget(title: "Status")),
                        DataColumn(label: TableHeadingWidget(title: "Remarks")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Email Messages")),
                      ],
                      rows: [
                        for (int i = 1; i < 4; i++)
                          DataRow(cells: [
                            DataCell(
                              TableInfoWidget(info: i.toString()),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "WDL/2019-00006"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "50"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "12 Sep 2019"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "Pending"),
                            ),
                            const DataCell(
                              TableInfoWidget(
                                  info:
                                      "Credit Amount : D1 \$ 50.00</br>Cancellation Fee : D1 \$ 1.00</br>Test123"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: ""),
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
