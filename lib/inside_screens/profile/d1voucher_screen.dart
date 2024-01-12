import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class D1VoucherScreen extends StatefulWidget {
  const D1VoucherScreen({super.key});

  @override
  State<D1VoucherScreen> createState() => _D1VoucherScreenState();
}

class _D1VoucherScreenState extends State<D1VoucherScreen> {
  final MainController _dataController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "rpt": "GetMemDiscRpt",
      "slno": "0",
      "country": "0",
      "Mallid": "0",
      "fdate": "01/01/1990",
      "tdate": "01/01/1990",
      "Amt": "0",
      "Ccode": Constants.prefs.getString("user_id"),
      "AmtType": "",
      "sesuser": "",
      "package": "0",
      "CouponCnt": "0",
      "CounponImg": "",
    };
    _dataController.getD1Voucher(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "D1 Voucher", backNavigation: true),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: lightBlackColor.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          color: appthemeColor.withOpacity(0.1),
                          child: Column(
                            children: [
                              infoDataWidget("Voucher Created", "23 Nov 2023"),
                              infoDataWidget("Voucher Code", "NewCoupon"),
                              infoDataWidget("Discount", "RM 10"),
                            ],
                          )),
                      const CommonDivider(),
                      const SpaceHeightWidget(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No. Of times Used",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 14,
                                color: blackColor),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 14,
                                color: blackColor),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No. Of times Can Be Used",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 14,
                                color: blackColor),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 14,
                                color: blackColor),
                          )
                        ],
                      ),
                      const SpaceHeightWidget(height: 15),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 6, color: darkNaviBlueColor)),
                        padding: const EdgeInsets.all(6),
                        child: Column(children: [
                          const SpaceHeightWidget(height: 15),
                          Image.asset(
                            "assets/images/logo_voucher.png",
                            height: 60,
                          ),
                          const SpaceHeightWidget(height: 10),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "FLAT",
                              style: TextStyle(
                                  fontFamily: "OnestRegular",
                                  fontSize: 14,
                                  color: blackColor),
                            ),
                            TextSpan(
                              text: "  RM 10  ",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold",
                                  fontSize: 14,
                                  color: blackColor),
                            ),
                            TextSpan(
                              text: "OFF",
                              style: TextStyle(
                                  fontFamily: "OnestRegular",
                                  fontSize: 14,
                                  color: blackColor),
                            )
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "VALID ON",
                              style: TextStyle(
                                  fontFamily: "OnestRegular",
                                  fontSize: 14,
                                  color: blackColor),
                            ),
                            TextSpan(
                              text: "  ALL  ",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold",
                                  fontSize: 14,
                                  color: blackColor),
                            ),
                            TextSpan(
                              text: "SHOPPING ORDERS",
                              style: TextStyle(
                                  fontFamily: "OnestRegular",
                                  fontSize: 14,
                                  color: blackColor),
                            )
                          ])),
                          Divider(
                            color: darkRedColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "VOUCHER CODE:",
                                    style: TextStyle(
                                        fontFamily: "OnestRegular",
                                        fontSize: 14,
                                        color: blackColor),
                                  ),
                                  Text(
                                    "VALIDITY:",
                                    style: TextStyle(
                                        fontFamily: "OnestRegular",
                                        fontSize: 14,
                                        color: blackColor),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NEWCOUPON",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 14,
                                        color: blackColor),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "FROM 01 NOV 2023\n",
                                      style: TextStyle(
                                          fontFamily: "OnestSemiBold",
                                          fontSize: 14,
                                          color: blackColor),
                                    ),
                                    TextSpan(
                                      text: "TO ",
                                      style: TextStyle(
                                          fontFamily: "OnestRegular",
                                          fontSize: 14,
                                          color: blackColor),
                                    ),
                                    TextSpan(
                                      text: "30 NOV 2023",
                                      style: TextStyle(
                                          fontFamily: "OnestSemiBold",
                                          fontSize: 14,
                                          color: blackColor),
                                    )
                                  ])),
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "time(s) only per user\nCan’t be used with other offers",
                              style: TextStyle(
                                  fontFamily: "OnestRegular",
                                  fontSize: 12,
                                  color: blackColor),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  infoDataWidget(String title, data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        infoTextWidget(title),
        infoTextWidget(data),
      ],
    );
  }

  infoTextWidget(
    String title,
  ) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: "OnestRegular", fontSize: 14, color: blackColor),
    );
  }
}
