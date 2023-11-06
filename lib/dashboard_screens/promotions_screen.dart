import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/models/promotions_model.dart';
import 'package:flutter/material.dart';

import '../models/onboarding_model.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  List<OnboardModel> products = [
    OnboardModel(image: "assets/images/health.jpg", title: "Health Care"),
    OnboardModel(image: "assets/images/hair.jpg", title: "Hair Care"),
    OnboardModel(image: "assets/images/skin.jpg", title: "Skin Care"),
    OnboardModel(image: "assets/images/hair.jpg", title: "Personal Care"),
  ];

  List<PromotionsModel> promotions = [
    PromotionsModel(
        image: "assets/images/promotion1.png",
        title: "Power play promotion",
        date: "02/11/23 09:00",
        isBigPromotion: false),
    PromotionsModel(
        image: "assets/images/promotion2.png",
        title: "Power play promotion",
        date: "02/11/23 09:00",
        isBigPromotion: false),
    PromotionsModel(
        image: "assets/images/promotion3.png",
        title: "Power play promotion",
        date: "02/11/23 09:00",
        isBigPromotion: false),
    PromotionsModel(
        image: "assets/images/promotion4.png",
        title: "Power play promotion",
        date: "02/11/23 09:00",
        isBigPromotion: false),
    PromotionsModel(
        image: "assets/images/promotion5.png",
        title: "Power play promotion",
        date: "02/11/23 09:00",
        isBigPromotion: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const SizedBox.shrink(),
          title: const Text(
            "Promotion",
            style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 20),
          ),
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 40),
              child: CommonOulineTextButton(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  backgroundColor: darkBlue.withOpacity(0.15),
                  borderColor: darkBlue.withOpacity(0.1),
                  textColor: darkBlue,
                  onTapFun: () {},
                  title: "Destina 1 International Promotion")),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  for (int i = 0; i < promotions.length; i++)
                    PromotionScreenWidget(
                        imagePath: promotions[i].image,
                        titile: promotions[i].title,
                        date: promotions[i].date,
                        isBigPromotion: promotions[i].isBigPromotion)
                ],
              ),
              const SpaceHeightWidget(height: 40)
            ],
          ),
        ));
  }
}
