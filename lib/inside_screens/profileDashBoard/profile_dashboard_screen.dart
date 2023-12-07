import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'redeem_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Dashboard", backNavigation: true),
      body: SingleChildScrollView(
        child: Column(children: [
          const SpaceHeightWidget(height: 20),
          Text(
            "e-Money Summary",
            style: TextStyle(
                fontFamily: "OnestSemiBold", color: blackColor, fontSize: 16),
          ),
          const Row(
            children: [
              Expanded(
                child: CommissionWidget(
                  title: "COMMISSION\nEMONEY",
                  amount: "18918.85",
                  amountType: "D1 \$",
                ),
              ),
              Expanded(
                child: CommissionWidget(
                  title: "PREPAID\nEMONEY",
                  amount: "96300.63",
                  amountType: "RM",
                ),
              ),
              Expanded(
                child: CommissionWidget(
                  title: "Country License\nEmoney",
                  amount: "107.6",
                  amountType: "D1 \$",
                ),
              ),
            ],
          ),
          const CommonDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CommissionWidget(
                  title: "PREPAID ECARD",
                  amount: "\n76930.4",
                  amountType: "RM",
                  textColor: blackColor,
                  backgroundColor: whiteColor,
                ),
              ),
              const CommonVerticalDivider(),
              Expanded(
                child: CommissionWidget(
                  title: "REDEMPTION\nEMONEY",
                  amount: "21055.61",
                  amountType: "RP",
                  textColor: blackColor,
                  backgroundColor: whiteColor,
                ),
              ),
              const CommonVerticalDivider(),
              Expanded(
                child: CommissionWidget(
                  title: "DP POINTS",
                  amount: "5100.75",
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
                    points: "0",
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
                    points: "100",
                  ),
                )
              ],
            ),
          ),
          const SpaceHeightWidget(height: 15),
          const RankWidget(),
          const SpaceHeightWidget(height: 15),
          Text(
            "My Immediate Downline",
            style: TextStyle(
                fontFamily: "OnestSemiBold", color: blackColor, fontSize: 16),
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
                                    onTapFun: () {}, title: downlineList[i]),
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
                for (int i = 0; i < 5; i++)
                  const DownLineWidget(
                    title: "DESTINA22",
                    subtitle: "Destina Test",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
      ),
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
          for (int i = 0; i < 5; i++)
            Container(
              alignment: Alignment.center,
              color: lightDarKBlue.withOpacity(0.1),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonDivider(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Customer Acquisition Bonus",
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: "OnestRegular", fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "	842.22",
                            style: TextStyle(
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
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Activation Business",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      "0",
                      style:
                          TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                    ),
                  ),
                  // SpaceWidthWidget(width: 20),
                  SizedBox(
                    width: 50,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Retail Business",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      "0",
                      style:
                          TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                    ),
                  ),
                  // SpaceWidthWidget(width: 20),
                  SizedBox(
                    width: 50,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Preferred Customer Business",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      "0",
                      style:
                          TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                    ),
                  ),
                  // SpaceWidthWidget(width: 20),
                  SizedBox(
                    width: 50,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Sales Business",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      "0",
                      style:
                          TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                    ),
                  ),
                  // SpaceWidthWidget(width: 20),
                  SizedBox(
                    width: 50,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  cvStatisticsWidget() {
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "New Left CV",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "0",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "New Right CV",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "0",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Left Carry Forward",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "0",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Right Carry Forward",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "0",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Net Steps",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "0",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Package Name",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Flexible(
                child: Text(
                  "STOCKIST/DIAMOND TO BLUE DIAMOND MIX UPGRADE PROMO",
                  maxLines: 4,
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          // margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Business Development Bonus",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "1000 Steps Per Day",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Maintained For Current Month",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "NO",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Maintained For Next Month",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "	NO",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Recent Months Maintained",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "",
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Licensee Type",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "Country Licensee",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Commission(%)",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "5 %",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Licensee Code",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "MY.SELANGOR.DESTINA1INT",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Licensee Name",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "DESTINA1",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Country",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "Malaysia",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "State",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "Selangor",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "User ID",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "DESTINA1INT",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Name",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "DESTINA1",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Sponsor ID",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "--",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Join Date",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "28 Jul 2012",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          color: lightDarKBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Status",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "ACTIVE",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Mobile No",
                  maxLines: 2,
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                ),
              ),
              Text(
                "162635294",
                style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
