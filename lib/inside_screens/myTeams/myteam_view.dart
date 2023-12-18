import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';

class MyTeamViewScreen extends StatefulWidget {
  const MyTeamViewScreen({super.key});

  @override
  State<MyTeamViewScreen> createState() => _MyTeamViewScreenState();
}

class _MyTeamViewScreenState extends State<MyTeamViewScreen> {
  List<String> teamNames = ["Left Team", "Right Team"];
  int selectedInt = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightBlackColor,
          toolbarHeight: 50,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  color: whiteColor,
                  margin: const EdgeInsets.all(0),
                  borderOnForeground: false,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListTile(
                        minLeadingWidth: 0,
                        leading: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        )),
                  ),
                ),
                Container(
                    width: 1000,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: whiteColor,
                    child: Row(
                      children: [
                        for (int i = 0; i < teamNames.length; i++)
                          (selectedInt == i)
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: CustomElevatedButton(
                                        onTapFun: () {}, title: teamNames[i]),
                                  ),
                                )
                              : Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 3,
                                    ),
                                    child: SizedBox(
                                      height: 35,
                                      child: CommonOulineTextButton(
                                          onTapFun: () {
                                            setState(() {
                                              selectedInt = i;
                                            });
                                          },
                                          title: teamNames[i]),
                                    ),
                                  ),
                                ),
                      ],
                    ))
              ],
            ),
          )),
      body: Container(
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceHeightWidget(height: 15),
              Column(
                children: [
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
                                    for (int i = 1; i <= 8; i++)
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
