import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  ScrollController payScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: SingleChildScrollView(
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
                      DataColumn(label: TableHeadingWidget(title: "SNo.")),
                      DataColumn(
                          label: TableHeadingWidget(title: "Product Code")),
                      DataColumn(
                          label: TableHeadingWidget(title: "Product Name")),
                      DataColumn(label: TableHeadingWidget(title: "Qty")),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(
                          TableInfoWidget(
                            info: "1",
                          ),
                        ),
                        DataCell(
                          TableInfoWidget(info: ""),
                        ),
                        DataCell(
                          TableInfoWidget(info: ""),
                        ),
                        DataCell(
                          TableInfoWidget(info: ""),
                        ),
                      ])
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
