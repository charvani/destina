import 'dart:math';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class FlushCvReportScreen extends StatefulWidget {
  const FlushCvReportScreen({super.key});

  @override
  State<FlushCvReportScreen> createState() => _FlushCvReportScreenState();
}

class _FlushCvReportScreenState extends State<FlushCvReportScreen> {
  DataTableSource tSource = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Flush CV Report",
        backNavigation: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceHeightWidget(height: 10),
            // PaginatedDataTable(
            //     headingRowColor:
            //         MaterialStatePropertyAll(lightDarKBlue.withOpacity(0.2)),
            //     columns: const [
            //       DataColumn(label: TableHeadingWidget(title: "S.No")),
            //       DataColumn(label: TableHeadingWidget(title: "Date")),
            //       DataColumn(label: TableHeadingWidget(title: "Credit Amount")),
            //     ],
            //     source: tSource),
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
                      DataColumn(
                          label: TableHeadingWidget(title: "Distributor ID")),
                      DataColumn(
                          label: TableHeadingWidget(title: "Distributor Name")),
                      DataColumn(
                          label: TableHeadingWidget(title: "Left Flush CV")),
                      DataColumn(
                          label: TableHeadingWidget(title: "Right Flush CV")),
                      DataColumn(
                          label: TableHeadingWidget(title: "Date Of Flush")),
                      DataColumn(label: TableHeadingWidget(title: "Reason")),
                    ],
                    rows: [
                      for (int i = 1; i < 1; i++)
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
                            TableInfoWidget(info: "07122023/10819"),
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
