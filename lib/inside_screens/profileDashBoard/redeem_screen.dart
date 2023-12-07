import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class DashboardRedeemScreen extends StatefulWidget {
  final String title;
  final String points;
  final String rmval;
  const DashboardRedeemScreen(
      {super.key,
      required this.title,
      required this.points,
      required this.rmval});

  @override
  State<DashboardRedeemScreen> createState() => _DashboardRedeemScreenState();
}

class _DashboardRedeemScreenState extends State<DashboardRedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: SingleChildScrollView(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SideTitle(title: "Available Points"),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              widget.points,
                              style:
                                  TextStyle(color: darkRedColor, fontSize: 22),
                            ),
                          )
                        ],
                      ),
                      const SideTitle(
                          title: "Minimum 200 points required to redeem"),
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
                            text: "200 points = ${widget.rmval}",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 13,
                                color: darkRedColor)),
                      ])),
                      const SpaceHeightWidget(height: 15),
                      CustomElevatedButton(
                          onTapFun: () {}, title: "Redeem for ECard Topup"),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
