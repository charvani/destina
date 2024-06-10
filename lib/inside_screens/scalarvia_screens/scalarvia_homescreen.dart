import 'package:cached_network_image/cached_network_image.dart';
import 'package:destina_1_international/commons/cmnproduct_detailswdgts.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../commons/colors.dart';
import '../../controllers/main_controller.dart';
import '../about/aboutus_screen.dart';
import '../about/testimonial_screen.dart';
import '../productdetails_screen2.dart';

class SHomeScreen extends StatefulWidget {
  const SHomeScreen({super.key});

  @override
  State<SHomeScreen> createState() => _SHomeScreenState();
}

class _SHomeScreenState extends State<SHomeScreen> {
  MainController productController = Get.put(MainController());
  dataFun() async {
    dynamic data = await productController.getProducts("Wellness Care", null);

    for (int i = 0; i < data['productRpt'].length; i++) {
      if (data['productRpt'][i]['packageName']
          .toString()
          .toLowerCase()
          .contains("scalarvia")) {
        Get.to(() => ProductDetailsScreen2(
            from: "",
            packageCode: data['productRpt'][i]['packagecode'],
            fromPack: "Wellness Care"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Uniwave Scalarvia"),
      body: SingleChildScrollView(
        child: Column(children: [
          CachedNetworkImage(
              imageUrl: "https://www.destina1.com/images/new-banner1.png"),
          const SpaceHeightWidget(height: 15),
          CachedNetworkImage(
            imageUrl: "https://www.destina1.com/images/LOGO-SCALARVIA.png",
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "TRANSFORM YOUR HEALTH WITH SCALARVIA: SWEETEN NATURALLY, ENERGIZE CELLS, LIVE VIBRANTLY",
              fontColor: darkBlue,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName:
                  "Discover the power of Scalarvia, your ally in managing sugar levels and enhancing cellular health. Indulge in the sweetness of nature and fuel your vitality sugar-free.",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          Obx(() {
            return productController.loading.value
                ? loader
                : CustomAutoWidthButton(
                    onTapFun: () {
                      dataFun();
                    },
                    title: "DISCOVER");
          }),
          const SpaceHeightWidget(height: 20),
          CommonTitle(
            titleName: "STEVIA SCALARVIA KEY BENEFITS",
            fontColor: darkBlue,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName:
                  "It has 100,000 different kinds of decoding technologies. Boosting the immune system, enhance the metabolism,and recharge the body cells",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemCount: healthData.length,
              itemBuilder: (context, i) {
                return Card(
                  margin: const EdgeInsets.all(3),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(children: [
                      CommonCachedNetworkImage(
                          imagePath: healthData[i]['image']),
                      const SpaceHeightWidget(height: 5),
                      CommonTitle(
                        titleName: healthData[i]['title'],
                        fontColor: darkBlue,
                        size: 14,
                        textAlign: TextAlign.center,
                      ),
                      const SpaceHeightWidget(height: 5),
                      CommonTitle(
                        titleName: healthData[i]['desc'],
                        fontColor: middleBlackColor,
                        fontFamily: "OnestRegular",
                        size: 14,
                        textAlign: TextAlign.justify,
                      ),
                    ]),
                  ),
                );
              }),
          const SpaceHeightWidget(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName: "WHAT IS THE UNIWAVE SCALARVIA BY QUANTES TECHNOLOGY?",
              fontColor: darkBlue,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName:
                  "Millions of people in Malaysia try to manage their health and lifestyle. Most fail. We are constantly bombarded with advice about health management with our Uniwave Quantes Technology products.",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReviewVideoWidget(
                onTapFun: () async {
                  final Uri url =
                      Uri.parse("https://www.youtube.com/watch?v=0FVOFpeijag");
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                videoUrl: "https://www.youtube.com/watch?v=0FVOFpeijag",
                videoImgHeight: 180),
          ),
          const SpaceHeightWidget(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTitle(
                  titleName: "What is the Uniwave by Quantes Technology?",
                  fontColor: lightDarKBlue.withOpacity(0.7),
                  textAlign: TextAlign.start,
                  size: 14,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "It has 100,000 different kinds of decoding technologies. Boosting the immune system,enhance the metabolism,and recharge the body cells",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
            ),
          ),
          const SpaceHeightWidget(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTitle(
                  titleName: "Benefits of Uniwave Scalarvia:",
                  fontColor: lightDarKBlue.withOpacity(0.7),
                  textAlign: TextAlign.start,
                  size: 14,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "1. Stabilizes blood sugar level\n2. Dandruff and hair health\n3.Improves mood and insomnia\n4.Strengthens immune system\n5.Promotes weight loss\n6.Promotes insulin production by stimulating the pancreas health\n7.Balances your hormone level\n8. Stabilizes the blood pressure",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
            ),
          ),
          const SpaceHeightWidget(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName: "EXPERIENCE THE HEALTHY LIFESTYLE",
              fontColor: darkBlue,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "Uniwave Stevia blends technology with the natural sweetness of stevia to offer a personalized wellness program. Designed to help you meet your health goals, Scalarvia makes living healthier easy and delightful, enriching your journey to vitality with the joy of nature's sweetness.",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemCount: managingHealthData.length,
              itemBuilder: (context, i) {
                return Card(
                  margin: const EdgeInsets.all(3),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(children: [
                      CommonCachedNetworkImage(
                        imagePath: managingHealthData[i]['image'],
                        height: 150,
                      ),
                      const SpaceHeightWidget(height: 5),
                      CommonTitle(
                        titleName: managingHealthData[i]['title'],
                        fontColor: darkBlue,
                        size: 14,
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                );
              }),
          const SpaceHeightWidget(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName: "UNDERSTANDING BENEFITS OF GROWTH FACTOR CONCENTRATE",
              fontColor: darkBlue,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "Unveiling the Future of Hormonal Balance, Stem Cell Revitalization, and Immune Fortification",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          const SpaceHeightWidget(height: 5),
          const CommonCachedNetworkImage(
            imagePath: "https://www.destina1.com/images/growth-factor.jpg",
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName: "What is Growth Factor Concentrate (GFC™)?",
              fontColor: darkBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "Growth Factor Concentrate (GFC™) is a patented technology derived from colostrum, containing high levels of growth factors like IGF and EGF. It promotes new stem cell formation, rejuvenating the skin by replacing old cells, and has shown effectiveness in clinical treatments, including improving nasolabial folds.",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName: "Growth Factor Concentrate (GFC™) Key Benefits",
              fontColor: darkBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "1. Stimulates New Stem Cell Formation: GFC encourages the generation of new stem cells\n2. Skin & Hair Rejuvenation: GFC helps replace old and dying cells, improving skin texture, elasticity, and overall appearance.\n3. Rich in Growth Factors: High levels of insulin-like growth factor (IGF) and epidermal growth factor (EGF) in GFC contribute to aiding the body's healing and repair processes.\n4. Hormonal Balancing: Help balance hormones, contributing to improved overall health and potentially mitigating conditions related to hormonal imbalances.\n5. Immune Boosting: Support the immune system, making it more effective in fighting infections and diseases.",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          const SpaceHeightWidget(height: 20),
          CommonTitle(
            titleName: "TESTIMONIALS",
            fontColor: darkBlue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "Our Uniwave community is a close-knit group of highly passionate individuals, constantly motivating each other to reach their health goals. We've collected real life stories of their health management journeys to motivate you!",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomAutoWidthButton(
                onTapFun: () {
                  Get.to(() => const TestimonialScreen());
                },
                title: "READ NOW"),
          ),
          const SpaceHeightWidget(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                  child: CommonCachedNetworkImage(
                      imagePath:
                          "https://www.destina1.com/images/UnderstandWeightManagement.png")),
              Expanded(
                child: Column(
                  children: [
                    const SpaceHeightWidget(height: 20),
                    CommonTitle(
                      titleName: "INFO HUB",
                      fontColor: darkBlue,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CommonTitle(
                        titleName:
                            "Find out more about our company and products.",
                        fontColor: middleBlackColor,
                        fontFamily: "OnestRegular",
                        size: 14,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomAutoWidthButton(
                          onTapFun: () {
                            Get.to(() => const AboutUsScreen());
                          },
                          title: "ABOUT US"),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SpaceHeightWidget(height: 25)
        ]),
      ),
    );
  }

  List healthData = [
    {
      "image": "https://www.destina1.com/images/03-img.jpg",
      "title": "High Antioxidants",
      "desc":
          "Quantes Technology can stimulate the formation of new stem cells, which will then group to form new epidermis and dermis to replace the old and dying cells in the human body."
    },
    {
      "image": "https://www.destina1.com/images/04-img.jpg",
      "title": "Zero Sugar",
      "desc":
          "Scalarvia contains no sugar, making it an excellent option for maintaining blood sugar levels and supporting a healthy diet. Scalarvia also helps to avoid spikes in blood glucose levels."
    },
    {
      "image": "https://www.destina1.com/images/02img.jpeg",
      "title": "Alkaline Nature",
      "desc":
          "Aids in maintaining a balanced pH level, contributing to bone, muscle, and cardiovascular health."
    },
    {
      "image": "https://www.destina1.com/images/01img.jpeg",
      "title": "Zero Calories",
      "desc":
          "Supports weight management goals, providing nutritional benefits without added calories."
    }
  ];
  List managingHealthData = [
    {
      "image": "https://www.destina1.com/images/blood-sugar.jpeg",
      "title": "Stabilizes blood sugar level",
    },
    {
      "image": "https://www.destina1.com/images/healthy-hair.jpeg",
      "title": "Enhance Dandruff and hair health",
    },
    {
      "image": "https://www.destina1.com/images/improves-insomnia.jpeg",
      "title": "Improves mood and insomnia",
    },
    {
      "image": "https://www.destina1.com/images/immune-system.jpeg",
      "title": "Strengthens immune system",
    },
    {
      "image": "https://www.destina1.com/images/weight-loss.jpeg",
      "title": "Promotes weight loss",
    },
    {
      "image": "https://www.destina1.com/images/promotes-insulin.jpeg",
      "title": "Promotes insulin production by stimulating the pancreas health",
    },
    {
      "image": "https://www.destina1.com/images/balance-hormones.jpeg",
      "title": "Balances hormone level",
    },
    {
      "image": "https://www.destina1.com/images/blood-pressure.jpeg",
      "title": "Stabilizes the blood pressure",
    }
  ];
}
