import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class MyListViewGetReportScreen extends StatefulWidget {
  final String? fromDate;
  final String? toDate;
  final String? onDate;
  final String? all;
  const MyListViewGetReportScreen(
      {super.key, this.fromDate, this.toDate, this.onDate, this.all});

  @override
  State<MyListViewGetReportScreen> createState() =>
      _MyListViewGetReportScreenState();
}

class _MyListViewGetReportScreenState extends State<MyListViewGetReportScreen> {
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
      appBar: commonAppBar(title: "My List View", backNavigation: true),
      body: Container(
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceHeightWidget(height: 15),
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: DataTable(
                                // dataRowMaxHeight: 50,
                                horizontalMargin: 10,
                                columnSpacing: 20,
                                border: TableBorder.all(
                                    color: middleBlackColor.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                headingRowColor: MaterialStatePropertyAll(
                                    blackColor.withOpacity(0.8)),
                                dataRowColor: MaterialStatePropertyAll(
                                    lightDarKBlue.withOpacity(0.1)
                                    // whiteColor
                                    ),
                                columns: [
                                  DataColumn(label: idTextStyle("S.No")),
                                  DataColumn(label: idTextStyle("User ID")),
                                  DataColumn(label: idTextStyle("Name")),
                                  DataColumn(label: idTextStyle("Sponsor")),
                                  DataColumn(label: idTextStyle("DOJ")),
                                  DataColumn(label: idTextStyle("Upliner")),
                                  DataColumn(label: idTextStyle("Country")),
                                ],
                                rows: [
                                  for (int i = 1; i <= 10; i++)
                                    DataRow(cells: [
                                      DataCell(
                                        infoTextStyle("$i", blackColor),
                                      ),
                                      DataCell(
                                        infoTextStyle(
                                            "Destina1USAHQ", darkBlue),
                                      ),
                                      DataCell(
                                        infoTextStyle(
                                            "US Country HQ", blackColor),
                                      ),
                                      DataCell(
                                        infoTextStyle(
                                            "DESTINA1INT", blackColor),
                                      ),
                                      DataCell(
                                        infoTextStyle(
                                            "29 Jul 2012", blackColor),
                                      ),
                                      DataCell(
                                        infoTextStyle(
                                            "DESTINA1INT - Left", blackColor),
                                      ),
                                      DataCell(
                                        infoTextStyle("Malaysia", blackColor),
                                      ),
                                    ])
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeightWidget(
                    height: 18,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  idTextStyle(String id) {
    return Text(
      id,
      style: TextStyle(
          fontFamily: "OnestSemiBold", fontSize: 12, color: whiteColor),
    );
  }

  infoTextStyle(String id, Color textColor) {
    return Text(
      id,
      style:
          TextStyle(fontFamily: "OnestRegular", fontSize: 12, color: textColor),
    );
  }
}
