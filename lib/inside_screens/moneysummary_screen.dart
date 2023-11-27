import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class MoneySummaryScreen extends StatefulWidget {
  const MoneySummaryScreen({super.key});

  @override
  State<MoneySummaryScreen> createState() => _MoneySummaryScreenState();
}

class _MoneySummaryScreenState extends State<MoneySummaryScreen> {
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
      appBar: commonAppBar(title: "e-Money Summary", backNavigation: true),
      body: SingleChildScrollView(
        child: Column(children: [
          const SpaceHeightWidget(height: 10),
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
                    onTapFun: () {},
                    title: "D1 CASH BACK POINTS",
                    points: "0",
                  ),
                ),
                const CommonVerticalDivider(
                  height: 100,
                ),
                Expanded(
                  child: RedeemWidget(
                    onTapFun: () {},
                    title: "D1 CASH BACK POINTS",
                    points: "0",
                  ),
                )
              ],
            ),
          ),
          const RankWidget(),
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
                  Column(
                    children: [
                      ListTile(
                        dense: false,
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: greenColor.withOpacity(0.5),
                                  width: 2.5)),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: lightDarKBlue,
                          ),
                        ),
                        title: const Text(
                          "DESTINA22",
                          style: TextStyle(
                              fontFamily: "OnestSemiBold", fontSize: 13),
                        ),
                        subtitle: const Text(
                          "Destina Test",
                          style: TextStyle(
                              fontFamily: "OnestRegular", fontSize: 11),
                        ),
                        trailing: Image.asset(
                          "assets/images/share_mail.png",
                          height: 33,
                        ),
                      ),
                      const CommonDivider()
                    ],
                  )
              ],
            ),
          ),
          const SpaceHeightWidget(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < myData.length; i++)
                  i == myDataSelectedInd
                      ? SizedBox(
                          width: 100,
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          const SpaceHeightWidget(height: 150)
        ]),
      ),
    );
  }
}
