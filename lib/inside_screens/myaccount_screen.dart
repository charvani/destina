import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'moneysummary_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        toolbarHeight: 98,
        flexibleSpace: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: redColor,
              height: 125,
              width: double.infinity,
              child: SvgPicture.asset(
                "assets/images/myaccount_bg.svg",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Image.asset(
                  //   "assets/images/arrow_left.png",
                  //   height: 30,
                  // ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const SpaceWidthWidget(width: 10),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: greenColor, width: 5)),
                          child: CircleAvatar(
                            backgroundColor: darkBlue,
                            radius: 33,
                            child: CircleAvatar(
                              backgroundColor: whiteColor,
                              radius: 31,
                              child: const Text(
                                "D1",
                                style: TextStyle(
                                    fontSize: 23, fontFamily: "OnestRegular"),
                              ),
                            ),
                          ),
                        ),
                        const SpaceWidthWidget(width: 15),
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Destina1int",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold", fontSize: 18),
                            ),
                            Text(
                              "Member",
                              style: TextStyle(
                                  fontFamily: "OnestRegular", fontSize: 15),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyAccountWidget(
            leadingIcon: Icons.home,
            onTapFun: () {
              Get.to(() => const MoneySummaryScreen());
            },
            title: "Dashboard",
          ),
          MyAccountWidget(
            leadingIcon: Icons.person,
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "Profile",
          ),
          MyAccountWidget(
            leadingIcon: Icons.handyman_rounded,
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "Services",
          ),
          MyAccountWidget(
            imagePath: "assets/images/organize.png",
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "My Teams",
          ),
          MyAccountWidget(
            // imagePath: "assets/images/organize.png",
            leadingIcon: Icons.fire_truck_rounded,
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "My Order",
          ),
          MyAccountWidget(
            // imagePath: "assets/images/organize.png",
            leadingIcon: Icons.account_balance_wallet,
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "My eMoney",
          ),
          MyAccountWidget(
            // imagePath: "assets/images/organize.png",
            leadingIcon: Icons.credit_card,
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "Upgrade",
          ),
          MyAccountWidget(
            // imagePath: "assets/images/organize.png",
            leadingIcon: Icons.shopping_cart_rounded,
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "Shopping",
          ),
          MyAccountWidget(
            imagePath: "assets/images/view-module.png",
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "Maintenance",
          ),
          MyAccountWidget(
            imagePath: "assets/images/bonus.png",
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "My Bonus",
          ),
          MyAccountWidget(
            leadingIcon: Icons.explore_rounded,
            onTapFun: () {
              // Get.to(() => const MyAccountScreen());
            },
            title: "Tools",
          ),
        ],
      )),
    );
  }
}
