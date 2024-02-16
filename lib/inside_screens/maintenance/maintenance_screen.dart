import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/maintenance/cv_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class AccountMaintenanceScreen extends StatefulWidget {
  const AccountMaintenanceScreen({super.key});

  @override
  State<AccountMaintenanceScreen> createState() =>
      _AccountMaintenanceScreenState();
}

final MainController _dataController = Get.put(MainController());

class _AccountMaintenanceScreenState extends State<AccountMaintenanceScreen> {
  final ScrollController _scrollController = ScrollController();
  DataTableSource tSource = MyData();
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
      "Month": "",
      "year": "",
      "Mtype": ""
    };
    _dataController.getMaintenance(bData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Account Maintenance", backNavigation: true),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceHeightWidget(height: 10),
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
                        columnSpacing: 0,
                        horizontalMargin: 0,
                        headingRowColor: MaterialStatePropertyAll(darkBlue),
                        columns: [
                          const DataColumn(
                              label: TableHeadingWidget(title: "S.No")),
                          DataColumn(label: _verticalDivider),
                          const DataColumn(
                              label: TableHeadingWidget(title: "Amount")),
                          DataColumn(label: _verticalDivider),
                          const DataColumn(
                              label: TableHeadingWidget(title: "CV")),
                          DataColumn(label: _verticalDivider),
                          const DataColumn(
                              label: TableHeadingWidget(title: "Date")),
                          DataColumn(label: _verticalDivider),
                          const DataColumn(
                              label: TableHeadingWidget(title: "Month & Year")),
                          DataColumn(label: _verticalDivider),
                          const DataColumn(
                              label: TableHeadingWidget(
                                  title: "Maintenance Type")),
                        ],
                        source: tSource),
                  ),
                ],
              ));
      }),
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

orderNumTextWidget(String title, int index) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      Get.to(() => CVScreen(
            month: _dataController.maintenanceList[index].actualmonth,
            year: _dataController.maintenanceList[index].actualyear,
            monthType: _dataController.maintenanceList[index].monthYear,
          ));
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

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        TableInfoWidget(info: "${index + 1}"),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.maintenanceList[index].amount),
      ),
      DataCell(_verticalDivider),
      DataCell(
          orderNumTextWidget(_dataController.maintenanceList[index].cv, index)),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.maintenanceList[index].date),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(info: _dataController.maintenanceList[index].monthYear),
      ),
      DataCell(_verticalDivider),
      DataCell(
        TableInfoWidget(
            info: _dataController.maintenanceList[index].maintenanceType),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dataController.maintenanceList.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);
