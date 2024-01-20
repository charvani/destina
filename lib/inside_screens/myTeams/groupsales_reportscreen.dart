import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'netgroup_cvscreen.dart';

class GroupSalesReportScreen extends StatefulWidget {
  final String fromDate;
  final String toDate;
  const GroupSalesReportScreen(
      {super.key, required this.fromDate, required this.toDate});

  @override
  State<GroupSalesReportScreen> createState() => _GroupSalesReportScreenState();
}

class _GroupSalesReportScreenState extends State<GroupSalesReportScreen> {
  final MainController _datacontroller = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
  

    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "FromDate": widget.fromDate,
      "ToDate": widget.toDate,
    };
    _datacontroller.getGroupSales(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: Obx(() {
        return _datacontroller.loading.value
            ? loader
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonTitle(
                        titleName: "Group CV Details",
                        size: 16,
                      ),
                      const SpaceHeightWidget(height: 8),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: lightBlackColor.withOpacity(0.5))),
                        child: Column(children: [
                          coloredBarWidget(
                              title: "User ID",
                              info: _datacontroller
                                  .groupSalesData.value.gcvUserId),
                          plainBarWidget(
                              title: "User Name",
                              info: _datacontroller
                                  .groupSalesData.value.gcvUserNAme),
                          coloredBarWidget(
                              title: "From Date",
                              info: _datacontroller
                                  .groupSalesData.value.gcvFromDate),
                          plainBarWidget(
                              title: "To Date",
                              info: _datacontroller
                                  .groupSalesData.value.gcvtoDate)
                        ]),
                      ),
                      const SpaceHeightWidget(height: 25),
                      const CommonTitle(
                        titleName: "Business In CV",
                        size: 16,
                      ),
                      const SpaceHeightWidget(height: 8),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: lightBlackColor.withOpacity(0.5))),
                        child: Column(children: [
                          coloredBarWidget(
                              title: "Total Personal CV",
                              info: _datacontroller
                                  .groupSalesData.value.bussCvTotPrsCv),
                          plainBarWidget(
                              title: "Net Left Group CV",
                              info: _datacontroller
                                  .groupSalesData.value.bussCvNetLftGrpCv),
                          coloredBarWidget(
                              title: "Net Right Group CV",
                              info: _datacontroller
                                  .groupSalesData.value.bussCvNetRghtGrpCv),
                          plainBarWidget(
                              title: "Total Group CV",
                              info: _datacontroller
                                  .groupSalesData.value.bussCvTotGrpCv)
                        ]),
                      ),
                      const SpaceHeightWidget(height: 25),
                      const CommonTitle(
                        titleName: "Business In Amount",
                        size: 16,
                      ),
                      const SpaceHeightWidget(height: 8),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: lightBlackColor.withOpacity(0.5))),
                        child: Column(children: [
                          coloredBarWidget(
                              title: "Total Personal Amount",
                              info: _datacontroller
                                  .groupSalesData.value.bussAmtTotPrsAmt),
                          plainBarWidget(
                              title: "Net Left Group Amount",
                              info: _datacontroller
                                  .groupSalesData.value.bussAmtNetLftGrpAmt),
                          coloredBarWidget(
                              title: "Net Right Group Amount",
                              info: _datacontroller
                                  .groupSalesData.value.bussAmtNetRgtGrpAmt),
                          plainBarWidget(
                              title: "Total Group Amount",
                              info: _datacontroller
                                  .groupSalesData.value.bussTotGrpAmt)
                        ]),
                      ),
                      const SpaceHeightWidget(height: 25)
                    ],
                  ),
                ),
              );
      }),
    );
  }

  plainBarWidget({required title, required info}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
            ),
          ),
          title == "Net Left Group CV" && info != "0"
              ? SizedBox(
                  height: 23,
                  child: CommonOulineTextButton(
                    title: info,
                    onTapFun: () {
                      Get.to(() => NetGroupCvScreen(
                            from: "Net Left Group CV",
                            fromdate: widget.fromDate,
                            todate: widget.toDate,
                          ));
                    },
                  ),
                )
              : Flexible(
                  child: Text(
                    info,
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 14,
                        color: title == "Total Group CV"
                            ? darkRedColor
                            : blackColor),
                  ),
                ),
        ],
      ),
    );
  }

  coloredBarWidget({required title, required info}) {
    return Container(
      color: lightDarKBlue.withOpacity(0.1),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
            ),
          ),
          title == "Net Right Group CV" && info != "0"
              ? SizedBox(
                  height: 23,
                  child: CommonOulineTextButton(
                    title: info,
                    onTapFun: () {
                      Get.to(() => NetGroupCvScreen(
                            from: "Net Right Group CV",
                            fromdate: widget.fromDate,
                            todate: widget.toDate,
                          ));
                    },
                  ),
                )
              : Flexible(
                  child: Text(
                    info,
                    style: const TextStyle(
                        fontFamily: "OnestSemiBold", fontSize: 14),
                  ),
                ),
        ],
      ),
    );
  }
}
