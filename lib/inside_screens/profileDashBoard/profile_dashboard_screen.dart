import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'redeem_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final MainController _dashboardController = Get.put(MainController());

  List<String> downlineList = ["Left", "Right"];
  int downlistSelectedInd = 0;

  List<String> myData = [
    "My Incomes",
    "Business Details",
    "CV Statistics",
    "Package Details",
    "Maintenance Information",
    "Licensee Details",
    "Personal Details"
  ];
  int myDataSelectedInd = 0;
  Timer? eligibilityTimer;
  DateTime givenDate = DateTime(2024, 2, 16);
  DateTime currentDate = DateTime.now();
  dynamic daysDifference;
  String? todayVal;
  String? hourVal;
  String? minVal;
  String? secVal;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        daysDifference = givenDate.difference(currentDate).inDays;
        todayVal = DateTime.now().day.toString();
        hourVal = DateTime.now().hour.toString();
        minVal = DateTime.now().minute.toString();
        secVal = DateTime.now().second.toString();
      });
    });
  }

  dataFun() {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    _dashboardController.getDashboard(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Dashboard", backNavigation: true),
      body: Obx(() {
        return _dashboardController.loading.value
            ? SizedBox(height: 500, child: loader)
            : SingleChildScrollView(
                child: Column(children: [
                  const SpaceHeightWidget(height: 20),
                  if (_dashboardController.dashboardData.value.showRes !=
                      "hide")
                    Column(
                      children: [
                        const CommonTitle(
                          titleName: "Your Upgrade Eligibility Will Expire In",
                          size: 16,
                        ),
                        if (daysDifference != null)
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  TimerWidget(
                                    timeValue: todayVal!,
                                    markedRangeVal: daysDifference.toString(),
                                    type: "Days",
                                  ),
                                  TimerWidget(
                                    timeValue: hourVal!,
                                    type: "Hours",
                                    markedRangeVal: "24",
                                  ),
                                  TimerWidget(
                                    timeValue: minVal!,
                                    type: "Minutes",
                                    markedRangeVal: "60",
                                  ),
                                  TimerWidget(
                                    timeValue: secVal!,
                                    type: "Seconds",
                                    markedRangeVal: "60",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              height: 30,
                              child: CustomAutoWidthButton(
                                  onTapFun: () {
                                    print("upgrade");
                                    // Get.to(() =>
                                    // const SalesMallScreen(from: "Upgrade"));
                                  },
                                  title: "Click to Upgrade"),
                            )
                          ],
                        ),
                        const SpaceHeightWidget(height: 20),
                      ],
                    ),
                  Text(
                    "e-Money Summary",
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        color: blackColor,
                        fontSize: 16),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CommissionWidget(
                          title: "COMMISSION\nEMONEY",
                          amount: _dashboardController
                              .dashboardData.value.commissonEMny,
                          amountType: "D1 \$",
                        ),
                        CommissionWidget(
                          title: "PREPAID\nEMONEY",
                          amount: _dashboardController
                              .dashboardData.value.prepaidEMny,
                          amountType: "RM",
                        ),
                        CommissionWidget(
                          title: "Country License\nEmoney",
                          amount: _dashboardController
                              .dashboardData.value.stockLicEMny,
                          amountType: "D1 \$",
                        ),
                      ],
                    ),
                  ),
                  const CommonDivider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommissionWidget(
                          title: "PREPAID ECARD",
                          amount:
                              "\n${_dashboardController.dashboardData.value.prepaidECard}",
                          amountType: "RM",
                          textColor: blackColor,
                          backgroundColor: whiteColor,
                        ),
                      ),
                      const CommonVerticalDivider(),
                      Expanded(
                        child: CommissionWidget(
                          title: "REDEMPTION\nEMONEY",
                          amount: _dashboardController
                              .dashboardData.value.redmptionEMny,
                          amountType: "RP",
                          textColor: blackColor,
                          backgroundColor: whiteColor,
                        ),
                      ),
                      const CommonVerticalDivider(),
                      Expanded(
                        child: CommissionWidget(
                          title: "DP POINTS",
                          amount:
                              _dashboardController.dashboardData.value.dpPts,
                          amountType: "",
                          textColor: blackColor,
                          backgroundColor: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const CommonDivider(),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: lightDarKBlue.withOpacity(0.08),
                    child: Row(
                      children: [
                        Expanded(
                          child: RedeemWidget(
                            onTapFun: () {
                              Get.to(() => const DashboardRedeemScreen(
                                    title: "D1 CASH BACK POINTS REDEEM",
                                    rmval: " RM 6",
                                    points: "0",
                                  ));
                            },
                            title: "D1 CASH BACK POINTS",
                            points: _dashboardController
                                .dashboardData.value.cashBack,
                          ),
                        ),
                        const CommonVerticalDivider(
                          height: 100,
                        ),
                        Expanded(
                          child: RedeemWidget(
                            onTapFun: () {
                              Get.to(() => const DashboardRedeemScreen(
                                    title: "D1 CREDIT REBATE POINTS REDEEM",
                                    rmval: "RM 7",
                                    points: "100",
                                  ));
                            },
                            title: "D1 CREDIT REBATE POINTS",
                            points: _dashboardController
                                .dashboardData.value.creRebate,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SpaceHeightWidget(height: 15),
                  RankWidget(
                    title: _dashboardController.dashboardData.value.rankname,
                  ),
                  const SpaceHeightWidget(height: 15),
                  Text(
                    "My Immediate Downline",
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        color: blackColor,
                        fontSize: 16),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              for (int i = 0; i < downlineList.length; i++)
                                i == downlistSelectedInd
                                    ? SizedBox(
                                        width: 100,
                                        height: 35,
                                        child: CustomElevatedButton(
                                            onTapFun: () {},
                                            title: downlineList[i]),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          setState(() {
                                            downlistSelectedInd = i;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            downlineList[i],
                                            style: TextStyle(
                                                fontFamily: "OnestSemiBold",
                                                color: blackColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                            ],
                          ),
                        ),
                        if (downlistSelectedInd == 0)
                          if (_dashboardController
                              .dashboardData.value.myDownlineLRpt.isEmpty)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: NotAvailableText(
                                  text: "No Left Downlines are found"),
                            ),
                        if (downlistSelectedInd == 0)
                          for (int i = 0;
                              i <
                                  _dashboardController.dashboardData.value
                                      .myDownlineLRpt.length;
                              i++)
                            DownLineWidget(
                              imagpath: _dashboardController
                                  .dashboardData.value.myDownlineLRpt[i].image,
                              title: _dashboardController
                                  .dashboardData.value.myDownlineLRpt[i].idno,
                              subtitle: _dashboardController
                                  .dashboardData.value.myDownlineLRpt[i].name,
                            ),
                        if (downlistSelectedInd == 1)
                          if (_dashboardController
                              .dashboardData.value.myDownlineRRpt.isEmpty)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: NotAvailableText(
                                  text: "No Right Downlines are found"),
                            ),
                        if (downlistSelectedInd == 1)
                          for (int i = 0;
                              i <
                                  _dashboardController.dashboardData.value
                                      .myDownlineRRpt.length;
                              i++)
                            DownLineWidget(
                              imagpath: _dashboardController
                                  .dashboardData.value.myDownlineRRpt[i].image,
                              title: _dashboardController
                                  .dashboardData.value.myDownlineRRpt[i].idno,
                              subtitle: _dashboardController
                                  .dashboardData.value.myDownlineRRpt[i].name,
                            ),
                      ],
                    ),
                  ),
                  const SpaceHeightWidget(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          for (int i = 0; i < myData.length; i++)
                            i == myDataSelectedInd
                                ? SizedBox(
                                    width: i == 4 ? 220 : 160,
                                    height: 35,
                                    child: CustomElevatedButton(
                                        onTapFun: () {}, title: myData[i]),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        myDataSelectedInd = i;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        myData[i],
                                        style: TextStyle(
                                            fontFamily: "OnestSemiBold",
                                            color: blackColor,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: myDataSelectedInd == 0
                          ? myIncomeWidget()
                          : myDataSelectedInd == 1
                              ? businessWidget()
                              : myDataSelectedInd == 2
                                  ? cvStatisticsWidget()
                                  : myDataSelectedInd == 3
                                      ? packageWidget()
                                      : myDataSelectedInd == 4
                                          ? maintenanceWidget()
                                          : myDataSelectedInd == 5
                                              ? licenseWidget()
                                              : personalWidget()),
                  const SpaceHeightWidget(height: 150)
                ]),
              );
      }),
    );
  }

  myIncomeWidget() {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlackColor.withOpacity(0.5))),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Income Name",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    "Bonus",
                    style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          for (int i = 0;
              i < _dashboardController.dashboardData.value.myIncome.length;
              i++)
            Container(
              alignment: Alignment.center,
              color: lightDarKBlue.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonDivider(),
                  Container(
                    color:
                        i.isOdd ? whiteColor : lightDarKBlue.withOpacity(0.1),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            _dashboardController
                                .dashboardData.value.myIncome[i].incName,
                            maxLines: 5,
                            style: const TextStyle(
                                fontFamily: "OnestRegular", fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            _dashboardController
                                .dashboardData.value.myIncome[i].bonus,
                            style: const TextStyle(
                                fontFamily: "OnestRegular", fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  businessWidget() {
    return Container(
      padding: const EdgeInsets.only(bottom: 13),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlackColor.withOpacity(0.5))),
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Today",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
              SpaceWidthWidget(width: 20),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Monthly",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              )
            ],
          ),
        ),
        businessDetailsWidget(
          "Activation Business",
          _dashboardController.dashboardData.value.bdActivBuss,
          _dashboardController.dashboardData.value.bdActivBussM,
          "yes",
        ),
        businessDetailsWidget(
          "Retail Business",
          _dashboardController.dashboardData.value.bdRetBuss,
          _dashboardController.dashboardData.value.bdRetBussM,
          "no",
        ),
        businessDetailsWidget(
          "Preferred Customer Business",
          _dashboardController.dashboardData.value.bdPreCustBuss,
          _dashboardController.dashboardData.value.bdPreCustBussM,
          "yes",
        ),
        businessDetailsWidget(
            "Sales Business",
            _dashboardController.dashboardData.value.bdSalesBuss,
            _dashboardController.dashboardData.value.bdSalesBussM,
            "no")
      ]),
    );
  }

  businessDetailsWidget(String title, todayB, montlyB, color) {
    return Container(
      color: color == "yes" ? lightDarKBlue.withOpacity(0.1) : transperantColor,
      padding: const EdgeInsets.all(8),
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
          Row(
            children: [
              if (todayB != "")
                SizedBox(
                  width: 50,
                  child: Text(
                    todayB,
                    style: const TextStyle(
                        fontFamily: "OnestSemiBold", fontSize: 14),
                  ),
                ),
              // SpaceWidthWidget(width: 20),
              todayB == ""
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        montlyB,
                        style: const TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 14),
                      ),
                    )
                  : SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          montlyB,
                          style: const TextStyle(
                              fontFamily: "OnestSemiBold", fontSize: 14),
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }

  cvStatisticsWidget() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlackColor.withOpacity(0.5))),
      child: Column(children: [
        const SpaceHeightWidget(height: 15),
        businessDetailsWidget("New Left CV", "",
            _dashboardController.dashboardData.value.newLeftCv, "yes"),
        businessDetailsWidget("New Right CV", "",
            _dashboardController.dashboardData.value.newRightCv, "no"),
        businessDetailsWidget("Left Carry Forward", "",
            _dashboardController.dashboardData.value.leftCarryFwd, "yes"),
        businessDetailsWidget("Right Carry Forward", "",
            _dashboardController.dashboardData.value.rightCarryFwd, "no"),
        businessDetailsWidget("Net Steps", "",
            _dashboardController.dashboardData.value.netSteps, "yes"),
        const SpaceHeightWidget(height: 15),
      ]),
    );
  }

  packageWidget() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlackColor.withOpacity(0.5))),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Package Name",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Flexible(
                child: Text(
                  _dashboardController.dashboardData.value.pkageName,
                  maxLines: 4,
                  style: const TextStyle(
                      fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          // margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Business Development Bonus",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.mbdBonus,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  maintenanceWidget() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlackColor.withOpacity(0.5))),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Maintained For Current Month",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  _dashboardController.dashboardData.value.mainForCurMnt,
                  style: const TextStyle(
                      fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Maintained For Next Month",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  _dashboardController.dashboardData.value.mainForNxtMnt,
                  style: const TextStyle(
                      fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Recent Months Maintained",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  _dashboardController.dashboardData.value.rentMntsMaintain,
                  style:
                      const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  licenseWidget() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlackColor.withOpacity(0.5))),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Licensee Type",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.licenseType,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Commission(%)",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.commisions,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Licensee Code",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                // "MY.SELANGOR.DESTINA1INT",
                _dashboardController.dashboardData.value.licenseCode,

                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Licensee Name",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.licenseName,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Country",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.country,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "State",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.state,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  personalWidget() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlackColor.withOpacity(0.5))),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "User ID",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                Constants.prefs.getString("user_id").toString().toUpperCase(),
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Name",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.pdName,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Sponsor ID",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                // "--",
                _dashboardController.dashboardData.value.pdSponsorId,

                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Join Date",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                // "28 Jul 2012",
                _dashboardController.dashboardData.value.pdJoinDate,

                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Status",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.pdStatus,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Mobile No",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                _dashboardController.dashboardData.value.pdMobileNo,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
