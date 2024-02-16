import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class CVScreen extends StatefulWidget {
  final String month, year, monthType;
  const CVScreen(
      {super.key,
      required this.month,
      required this.monthType,
      required this.year});

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  final MainController _dataController = Get.put(MainController());
  dynamic userid, password;
  Map bData = {};
  @override
  void initState() {
    super.initState();
    userid = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() {
    bData = {
      "UserId": userid,
      "Pwd": password,
      "action": "Main",
      "Month": widget.month,
      "year": widget.year,
      "Mtype": widget.monthType
    };
    _dataController.getMaintenanceDetails(bData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeightWidget(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                  dataRowMaxHeight: 50,
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  headingRowColor: MaterialStatePropertyAll(darkBlue),
                  border: TableBorder.all(
                      color: middleBlackColor.withOpacity(0.15)),
                  columns: const [
                    DataColumn(
                        label: TableHeadingWidget(
                      title: "S.No",
                      fontFamily: "OnestBold",
                    )),
                    DataColumn(
                        label: TableHeadingWidget(
                            title: "ID No", fontFamily: "OnestBold")),
                    DataColumn(
                        label: TableHeadingWidget(
                            title: "Bill No", fontFamily: "OnestBold")),
                    DataColumn(
                        label: TableHeadingWidget(
                            title: "Bill Date", fontFamily: "OnestBold")),
                    DataColumn(
                        label: TableHeadingWidget(
                            title: "CV", fontFamily: "OnestBold")),
                  ],
                  rows: [
                    for (int i = 1; i < 1; i++)
                      DataRow(cells: [
                        DataCell(
                          TableInfoWidget(info: i.toString()),
                        ),
                        const DataCell(
                          TableInfoWidget(info: ""),
                        ),
                        DataCell(
                          orderNumTextWidget(""),
                        ),
                        const DataCell(
                          TableInfoWidget(info: ""),
                        ),
                        const DataCell(
                          TableInfoWidget(info: ""),
                        ),
                      ])
                  ]),
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

  orderNumTextWidget(String title) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print("add");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "OnestRegular", fontSize: 12, color: darkBlue),
        ),
      ),
    );
  }
}
