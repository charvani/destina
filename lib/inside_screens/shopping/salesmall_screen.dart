import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/onboarding_model.dart';
import '../productdetails_screen.dart';

class SalesMallScreen extends StatefulWidget {
  final String from;
  const SalesMallScreen({super.key, required this.from});

  @override
  State<SalesMallScreen> createState() => _SalesMallScreenState();
}

class _SalesMallScreenState extends State<SalesMallScreen> {
  List<OnboardModel> promotionItems = [
    OnboardModel(
        image: "assets/images/Product 1-1.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA"),
    OnboardModel(
        image: "assets/images/Product 1-3.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA"),
    OnboardModel(
        image: "assets/images/Product 2-3.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED PENDANT"),
    OnboardModel(
        image: "assets/images/Product 3-1.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
    OnboardModel(
        image: "assets/images/Product 3-4.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
    OnboardModel(
        image: "assets/images/Product 3-6.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
    OnboardModel(
        image: "assets/images/Product 4-1.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED STICK"),
    OnboardModel(
        image: "assets/images/Product 4-2.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED STICK"),
    OnboardModel(
        image: "assets/images/Product 6-6.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED COFFEE(5 IN 1)"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 8,
          leadingWidth: widget.from == "Redemption" ? 20 : null,
          title: Text(
            "${widget.from} Order",
            style: TextStyle(
                fontSize: widget.from == "Redemption" ? 17 : 18,
                fontFamily: "OnestSemiBold"),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.keyboard_arrow_left_rounded)),
          ),
          actions: [
            if (widget.from != "Upgrade")
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.shopping_cart,
                      color: appthemeColor,
                    ),
                  ),
                  const SpaceWidthWidget(width: 5),
                  Container(
                      height: 30,
                      width: 118,
                      padding: const EdgeInsets.only(right: 5),
                      child: CustomAutoWidthButton(
                          onTapFun: () {}, title: "Checkout"))
                ],
              )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          padding: const EdgeInsets.all(0),
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1 / 1.05),
          itemBuilder: (context, i) {
            return CategroyItemWidget(
              onTapFun: () {
                Get.to(() => const ProductDetailsScreen(
                      from: "recommended_for_you",
                      packageCode: "",
                    ));
              },
              imagePath: i == 0
                  ? promotionItems[0].image
                  : i == 1
                      ? promotionItems[1].image
                      : i == 2
                          ? promotionItems[2].image
                          : i == 3
                              ? promotionItems[3].image
                              : promotionItems[4].image,
              titile: i == 0
                  ? promotionItems[0].title
                  : i == 1
                      ? promotionItems[1].title
                      : i == 2
                          ? promotionItems[2].title
                          : i == 3
                              ? promotionItems[3].title
                              : promotionItems[4].title.capitalize.toString(),
              amount: widget.from == "Redemption"
                  ? "RP 23$i"
                  : widget.from == "Dp"
                      ? "1$i DP + RM 1${i}03"
                      : "RM 23$i",
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
