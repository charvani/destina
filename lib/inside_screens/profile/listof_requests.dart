import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class UpdationReportScreen extends StatefulWidget {
  const UpdationReportScreen({super.key});

  @override
  State<UpdationReportScreen> createState() => _UpdationReportScreenState();
}

class _UpdationReportScreenState extends State<UpdationReportScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Updation Report", backNavigation: true),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SpaceHeightWidget(height: 10),
          // SearchWidget(
          //     onTapFun: () {},
          //     hintText: "Search",
          //     borderColor: lightBlackColor),
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
                    dataRowMaxHeight: 50,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    border: TableBorder.all(
                        color: middleBlackColor.withOpacity(0.15)),
                    columns: [
                      DataColumn(label: tableTitleWidget("S.No")),
                      DataColumn(label: tableTitleWidget("Name")),
                      DataColumn(label: tableTitleWidget("Update Type")),
                      DataColumn(label: tableTitleWidget("Update Date")),
                    ],
                    rows: [
                      for (int i = 0; i < 6; i++)
                        DataRow(cells: [
                          DataCell(
                            rowTextWidget(i.toString()),
                          ),
                          DataCell(
                            rowTextWidget("DESTINA1"),
                          ),
                          DataCell(
                            rowTextWidget("Member Password"),
                          ),
                          DataCell(
                            rowTextWidget("24 Apr 2017s"),
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
}
