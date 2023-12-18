import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class TeamBuilderViewScreen extends StatefulWidget {
  const TeamBuilderViewScreen({super.key});

  @override
  State<TeamBuilderViewScreen> createState() => _TeamBuilderViewScreenState();
}

class _TeamBuilderViewScreenState extends State<TeamBuilderViewScreen> {
  ScrollController teamScrollController1 = ScrollController();
  ScrollController teamScrollController2 = ScrollController();
  ScrollController teamScrollController3 = ScrollController();
  ScrollController teamScrollController4 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: "Genealogy View For Destina1int", backNavigation: true),
      body: Container(
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceHeightWidget(height: 15),
              for (int i = 1; i <= 4; i++)
                Column(
                  children: [
                    CommonTitle(
                      titleName: "Team No $i",
                      size: 16,
                      fontColor: darkBlue,
                    ),
                    Scrollbar(
                      controller: i == 1
                          ? teamScrollController1
                          : i == 2
                              ? teamScrollController2
                              : i == 3
                                  ? teamScrollController3
                                  : teamScrollController4,
                      thumbVisibility: true,
                      trackVisibility: true,
                      thickness: 5,
                      interactive: true,
                      radius: const Radius.circular(10),
                      child: SingleChildScrollView(
                        controller: i == 1
                            ? teamScrollController1
                            : i == 2
                                ? teamScrollController2
                                : i == 3
                                    ? teamScrollController3
                                    : teamScrollController4,
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
                                        color:
                                            middleBlackColor.withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                      DataColumn(label: idTextStyle("Country")),
                                      DataColumn(
                                          label: idTextStyle("	Date of Join")),
                                    ],
                                    rows: [
                                      for (int i = 1; i <= 5; i++)
                                        DataRow(cells: [
                                          DataCell(
                                            infoTextStyle("$i"),
                                          ),
                                          DataCell(
                                            infoTextStyle("Destina1USAHQ"),
                                          ),
                                          DataCell(
                                            infoTextStyle("US Country HQ"),
                                          ),
                                          DataCell(
                                            infoTextStyle("Malaysia"),
                                          ),
                                          DataCell(
                                            infoTextStyle("29 Jul 2012"),
                                          ),
                                        ])
                                    ]),
                              ),
                            ),
                          ],
                        ),
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

  infoTextStyle(String id) {
    return Text(
      id,
      style: TextStyle(
          fontFamily: "OnestRegular", fontSize: 12, color: blackColor),
    );
  }
}
