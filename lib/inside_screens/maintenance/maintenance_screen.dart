import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/maintenance/cv_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountMaintenanceScreen extends StatefulWidget {
  const AccountMaintenanceScreen({super.key});

  @override
  State<AccountMaintenanceScreen> createState() =>
      _AccountMaintenanceScreenState();
}

class _AccountMaintenanceScreenState extends State<AccountMaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Account Maintenance", backNavigation: true),
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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Note: Click on CV to get CV details",
              style: TextStyle(
                  fontFamily: "OnestRegular",
                  color: darkRedColor,
                  fontSize: 10),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                  dataRowMaxHeight: 50,
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  headingRowColor:
                      MaterialStatePropertyAll(lightDarKBlue.withOpacity(0.15)),
                  border: TableBorder.all(
                      color: middleBlackColor.withOpacity(0.15)),
                  columns: const [
                    DataColumn(label: TableHeadingWidget(title: "S.No")),
                    DataColumn(label: TableHeadingWidget(title: "Amount")),
                    DataColumn(label: TableHeadingWidget(title: "CV")),
                    DataColumn(label: TableHeadingWidget(title: "Date")),
                    DataColumn(
                        label: TableHeadingWidget(title: "Month & Year")),
                    DataColumn(
                        label: TableHeadingWidget(title: "Maintenance Type")),
                  ],
                  rows: [
                    for (int i = 1; i < 9; i++)
                      DataRow(cells: [
                        DataCell(
                          TableInfoWidget(info: i.toString()),
                        ),
                        const DataCell(
                          TableInfoWidget(info: "RM 454.10"),
                        ),
                        DataCell(
                          orderNumTextWidget("50"),
                        ),
                        const DataCell(
                          TableInfoWidget(info: "01 Jun 2019"),
                        ),
                        const DataCell(
                          TableInfoWidget(info: "Jul 2019"),
                        ),
                        const DataCell(
                          TableInfoWidget(info: "PURCHASE MAINTENANCE"),
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
        Get.to(() => const CVScreen());
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
