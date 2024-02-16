import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../myorder/invoice_screen.dart';

class NetGroupCvScreen extends StatefulWidget {
  final String from, fromdate, todate;

  const NetGroupCvScreen(
      {super.key,
      required this.from,
      required this.fromdate,
      required this.todate});

  @override
  State<NetGroupCvScreen> createState() => _NetGroupCvScreenState();
}

final MainController _datacontroller = Get.put(MainController());

class _NetGroupCvScreenState extends State<NetGroupCvScreen> {
  DataTableSource tSource = MyData();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "action":
          widget.from == "Net Left Group CV" ? "GroupSalesL" : "GroupSalesR",
      "regid": Constants.prefs.getString("country_id"),
      "FromDate": widget.fromdate,
      "ToDate": widget.todate,
    };
    _datacontroller.getGroupSalesCvList(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(backNavigation: true, title: ""),
        body: Obx(() {
          return _datacontroller.loading.value
              ? loader
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SpaceHeightWidget(height: 10),
                      Scrollbar(
                        interactive: true,
                        trackVisibility: true,
                        controller: _scrollController,
                        thumbVisibility: true,
                        thickness: 8,
                        radius: const Radius.circular(10),
                        // scrollbarOrientation: ScrollbarOrientation.bottom,
                        child: PaginatedDataTable(
                            controller: _scrollController,
                            columnSpacing: 10,
                            horizontalMargin: 10,
                            headingRowColor: MaterialStatePropertyAll(darkBlue),
                            columns: [
                              DataColumn(label: idTextStyle("S.No")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Bill No")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("User Id")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Name")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Net Amount")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Total CV")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Bill Date")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Mall Name")),
                              DataColumn(label: _verticalDivider),
                              DataColumn(label: idTextStyle("Country")),
                            ],
                            source: tSource),
                      ),
                      const SpaceHeightWidget(height: 20)
                    ],
                  ),
                );
        }));
  }
}

idTextStyle(String id) {
  return Text(
    id,
    style:
        TextStyle(fontFamily: "OnestSemiBold", fontSize: 12, color: whiteColor),
  );
}

infoTextStyle(String id, Color textColor) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      if (textColor == darkBlue) {
        // print("funtion cll");

        Get.to(() => InvoiceScreen(
            redirectUrl:
                "https://showcase.worldunityfoundation.org/MobileAppCheckout/invoiceparam.html?BillNo=$id"
            // 'https://worldunityfoundation.org/members/MobileAppMTaxInvoice.aspx?Type="OrderRpt"&OrderNo=${_dataController.orderReportData[i].orderNo}',
            ));
      }
    },
    child: Text(
      id,
      style:
          TextStyle(fontFamily: "OnestRegular", fontSize: 12, color: textColor),
    ),
  );
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        infoTextStyle("${index + 1}", blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].billno,
            darkBlue),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].idno,
            blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].name
                .toString(),
            blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].netAmt,
            blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].totBv,
            blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].billDate,
            blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].mname
                .toString(),
            blackColor),
      ),
      DataCell(_verticalDivider),
      DataCell(
        infoTextStyle(
            _datacontroller
                .groupsalesCvData.value.groupSalSummaryRpt[index].county,
            blackColor),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>
      _datacontroller.groupsalesCvData.value.groupSalSummaryRpt.length;

  @override
  int get selectedRowCount => 0;
}
