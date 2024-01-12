import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class IdTeamViewScreen extends StatefulWidget {
  final String id;
  const IdTeamViewScreen({super.key, required this.id});

  @override
  State<IdTeamViewScreen> createState() => _IdTeamViewScreenState();
}

final MainController _datacontroller = Get.put(MainController());
DataTableSource tSource = MyData();

class _IdTeamViewScreenState extends State<IdTeamViewScreen> {
  List<String> teamNames = ["Left Team", "Right Team"];
  int selectedInt = 0;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await dataFun("left");
    });
  }

  dataFun(String from) async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "Action": "All",
      "FromDate": "",
      "ToDate": "",
      "ListViewID": widget.id
    };
    dynamic res = await _datacontroller.getIdTeamView(bdata, from);
  }

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
                      ),
                      title: CommonTitle(
                        titleName: widget.id,
                        size: 14,
                      ),
                    ),
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
                                            dataFun(selectedInt == 0
                                                ? "left"
                                                : "right");
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
      body: Obx(() {
        return _datacontroller.loading.value
            ? loader
            : Container(
                color: whiteColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SpaceHeightWidget(height: 15),
                      Scrollbar(
                        interactive: true,
                        trackVisibility: true,
                        controller: _scrollController,
                        thumbVisibility: true,
                        thickness: 8,
                        radius: const Radius.circular(10),
                        scrollbarOrientation: ScrollbarOrientation.bottom,
                        child: PaginatedDataTable(
                            controller: _scrollController,
                            columnSpacing: 10,
                            horizontalMargin: 10,
                            headingRowColor: MaterialStatePropertyAll(
                                lightDarKBlue.withOpacity(0.2)),
                            columns: [
                              DataColumn(label: idTextStyle("S.No")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("User ID")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Name")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Sponsor")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("DOJ")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Upliner")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Country")),
                            ],
                            source: tSource),
                      ),
                      const SpaceHeightWidget(height: 20)
                      // Column(
                      //   children: [
                      //     Scrollbar(
                      //       interactive: true,
                      //       trackVisibility: true,
                      //       controller: _scrollController,
                      //       thumbVisibility: true,
                      //       thickness: 8,
                      //       radius: const Radius.circular(10),
                      //       scrollbarOrientation: ScrollbarOrientation.bottom,
                      //       child: SingleChildScrollView(
                      //         controller: _scrollController,
                      //         scrollDirection: Axis.horizontal,
                      //         child: Row(
                      //           children: [
                      //             Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: ClipRRect(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 child: DataTable(
                      //                     // dataRowMaxHeight: 50,
                      //                     horizontalMargin: 10,
                      //                     columnSpacing: 20,
                      //                     border: TableBorder.all(
                      //                         color: middleBlackColor.withOpacity(0.15),
                      //                         borderRadius: BorderRadius.circular(10)),
                      //                     headingRowColor: MaterialStatePropertyAll(
                      //                         blackColor.withOpacity(0.8)),
                      //                     dataRowColor: MaterialStatePropertyAll(
                      //                         lightDarKBlue.withOpacity(0.1)
                      //                         // whiteColor
                      //                         ),
                      //                     columns: [
                      //                       DataColumn(label: idTextStyle("S.No")),
                      //                       DataColumn(label: idTextStyle("User ID")),
                      //                       DataColumn(label: idTextStyle("Name")),
                      //                       DataColumn(label: idTextStyle("Sponsor")),
                      //                       DataColumn(label: idTextStyle("DOJ")),
                      //                       DataColumn(label: idTextStyle("Upliner")),
                      //                       DataColumn(label: idTextStyle("Country")),
                      //                     ],
                      //                     rows: [
                      //                       for (int i = 1; i <= 8; i++)
                      //                         DataRow(cells: [])
                      //                     ]),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     const SpaceHeightWidget(
                      //       height: 18,
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  idTextStyle(String id) {
    return Text(
      id,
      style: TextStyle(
          fontFamily: "OnestSemiBold", fontSize: 12, color: blackColor),
    );
  }
}

infoTextStyle(String id, Color textColor) {
  return Text(
    id,
    style:
        TextStyle(fontFamily: "OnestRegular", fontSize: 12, color: textColor),
  );
}

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        infoTextStyle("${index + 1}", blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(_datacontroller.idteamviewList[index].userId, darkBlue),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(_datacontroller.idteamviewList[index].name, blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller.idteamviewList[index].sponser, blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(_datacontroller.idteamviewList[index].doj, blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller.idteamviewList[index].upliner, blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller.idteamviewList[index].country, blackColor),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _datacontroller.idteamviewList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
