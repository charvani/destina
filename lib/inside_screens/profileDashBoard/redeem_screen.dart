import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardRedeemScreen extends StatefulWidget {
  final String title;

  const DashboardRedeemScreen({
    super.key,
    required this.title,
  });

  @override
  State<DashboardRedeemScreen> createState() => _DashboardRedeemScreenState();
}

class _DashboardRedeemScreenState extends State<DashboardRedeemScreen> {
  final MainController _dataController = Get.put(MainController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  dynamic redemData;
  getData() async {
    Map bdata = {
      "action": "GetRegDet",
      "minamount": "0",
      "CreditAmt": "0",
      "countryid": Constants.prefs.getString("country_id"),
      "AutoProcess": "0",
      "manualProcess": "0",
      "Regid": Constants.prefs.getString("reg_id"),
      "MasterType": widget.title == "D1 CREDIT REBATE POINTS REDEEM"
          ? "CRRedeem"
          : "CBRedeem",
      "sesuer": ""
    };
    dynamic res = await _dataController.getDashboardRedemPoints(bdata);
    if (res != null) {
      print("oooo...$res");
      if (res['Msg'] == "SUCCESS") {
        setState(() {
          redemData = res;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: Obx(() {
        return _dataController.listOfMemberLoading.value
            ? loader
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceHeightWidget(height: 10),
                      CommonTitle(
                        titleName: widget.title,
                        size: 15,
                      ),
                      const SpaceHeightWidget(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: lightBlackColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonTitle(
                                titleName: "Redeem Points",
                                size: 14,
                              ),
                              const SpaceHeightWidget(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SideTitle(title: "Available Points"),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      redemData['AvailPoints'],
                                      style: TextStyle(
                                          color: darkRedColor, fontSize: 22),
                                    ),
                                  )
                                ],
                              ),
                              SideTitle(
                                  title:
                                      "Minimum ${redemData['MinPts']} points required to redeem"),
                              const SpaceHeightWidget(height: 10),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Note:  ",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 13,
                                        color: darkRedColor)),
                                TextSpan(
                                    text:
                                        "Points are calculated to include two decimals, which appear in the 'Rewards Activity'. Points are redeemable in whole-point increments only.",
                                    style: TextStyle(
                                        fontFamily: "OnestRegular",
                                        fontSize: 13,
                                        color: middleBlackColor))
                              ]))
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: lightBlackColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonTitle(
                                titleName: "Redemption",
                                size: 14,
                              ),
                              const SpaceHeightWidget(height: 10),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "Pay yourself back with points. Best value for your points.  ",
                                    style: TextStyle(
                                        fontFamily: "OnestRegular",
                                        fontSize: 13,
                                        color: middleBlackColor)),
                                TextSpan(
                                    text:
                                        "${redemData['ptsredem']} points = ${redemData['Symbol']} ${redemData['amtad']}",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 13,
                                        color: darkRedColor)),
                              ])),
                              const SpaceHeightWidget(height: 15),
                              if (redemData['RedmBtn'])
                                Obx(() {
                                  return _dataController.loading.value
                                      ? loader
                                      : CustomElevatedButton(
                                          onTapFun: () {
                                            Map bdata = {
                                              "action": "Insert",
                                              "regid": Constants.prefs
                                                  .getString("reg_id"),
                                              "points":
                                                  redemData['AvailPoints'],
                                              "ip": Constants.prefs
                                                  .getString("ip"),
                                              "frmdate": "1/1/1990",
                                              "todate": "1/1/1990",
                                              "distid": "0",
                                              "status": "0",
                                              "countryid": Constants.prefs
                                                  .getString("country_id"),
                                              "sesuser": "0",
                                              "withdrawaltype": widget.title ==
                                                      "D1 CREDIT REBATE POINTS REDEEM"
                                                  ? "CRR"
                                                  : "CBR",
                                            };
                                            dynamic res = _dataController
                                                .getDashboardRedemReq(bdata);
                                            if (res != null) {
                                              if (res['Msg'] == "SUCCESS") {
                                                CommonToastTrue(res['Message']);
                                                Timer(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  Get.back();
                                                });
                                              }
                                            } else {
                                              CommonToast(res["Message"]);
                                            }
                                          },
                                          title: "Redeem for ECard Topup");
                                }),
                            ]),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
