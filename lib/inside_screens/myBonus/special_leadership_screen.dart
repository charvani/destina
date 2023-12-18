import 'dart:math';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class SpecialLeadershipScreen extends StatefulWidget {
  const SpecialLeadershipScreen({super.key});

  @override
  State<SpecialLeadershipScreen> createState() =>
      _SpecialLeadershipScreenState();
}

class _SpecialLeadershipScreenState extends State<SpecialLeadershipScreen> {
  DataTableSource tSource = MyData();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Special Leadership Bonus",
        backNavigation: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceHeightWidget(height: 10),
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
                            label: TableHeadingWidget(title: "Distributor ID")),
                        DataColumn(
                            label: TableHeadingWidget(
                                title: "From Distributor ID")),
                        DataColumn(label: TableHeadingWidget(title: "Month")),
                        DataColumn(label: TableHeadingWidget(title: "Date")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Matching")),
                        DataColumn(label: TableHeadingWidget(title: "Team")),
                        DataColumn(
                            label: TableHeadingWidget(title: "	Percent %")),
                        DataColumn(
                            label: TableHeadingWidget(title: "Bonus (D1 \$)")),
                        DataColumn(
                            label: TableHeadingWidget(
                                title: "Redemption Deduction(RP)")),
                        DataColumn(
                            label:
                                TableHeadingWidget(title: "Net Bonus (D1 \$)")),
                      ],
                      rows: [
                        for (int i = 1; i < 6; i++)
                          DataRow(cells: [
                            DataCell(
                              TableInfoWidget(info: i.toString()),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "DESTINA1INT"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "NAJIEB3080"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "9"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "14 Sep 2015"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "10.00"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "3"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "5"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "0.50"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "0.10"),
                            ),
                            const DataCell(
                              TableInfoWidget(info: "0.40"),
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
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      25,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(7777)
          });

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]['title'].toString())),
      DataCell(Text(_data[index]['price'].toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
