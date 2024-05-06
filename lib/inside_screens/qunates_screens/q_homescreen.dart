import 'package:cached_network_image/cached_network_image.dart';
import 'package:destina_1_international/commons/cmnproduct_detailswdgts.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../commons/colors.dart';
import '../about/aboutus_screen.dart';
import '../about/testimonial_screen.dart';

class QHomeScreen extends StatefulWidget {
  const QHomeScreen({super.key});

  @override
  State<QHomeScreen> createState() => _QHomeScreenState();
}

class _QHomeScreenState extends State<QHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Quantes Technology"),
      body: SingleChildScrollView(
        child: Column(children: [
          CachedNetworkImage(
              imageUrl:
                  "https://www.destina1.com/images/quantes-technology-banner.jpg"),
          const SpaceHeightWidget(height: 15),
          CachedNetworkImage(
            imageUrl:
                "https://www.destina1.com/images/LOGO-QUANTES-TECHNOLOGY.png",
            height: 80,
          ),
          const SpaceHeightWidget(height: 15),
          CommonTitle(
            titleName: "OPTIMUM ENERGY FOR HEALTHY LIFESTYLE",
            fontColor: darkBlue,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName:
                  "Quantes Technology has 100,000 different kinds of decoding technologies. Boosting the immune system, enhance the metabolism,and recharge the body cells",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
              textAlign: TextAlign.justify,
            ),
          ),
          CustomAutoWidthButton(onTapFun: () {}, title: "DISCOVER"),
          const SpaceHeightWidget(height: 20),
          CommonTitle(
            titleName: "HEALTH KEY JOURNEY",
            fontColor: darkBlue,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName:
                  "Uniwave by Quantes Technology provides a transformative and holistic approach to health, blending sustainable products with enduring results into your lifestyle for a seamless and impactful wellness journey.",
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
                  crossAxisCount: 2, childAspectRatio: 1 / 2),
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
              titleName:
                  "UNDERSTANDING BENEFITS OF UNIWAVE BY QUANTES TECHNOLOGY",
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
                  titleName: "Uniwave by Quantes Technology Key Benefits:",
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
                  "1. Provide Optimum Energy for Healthy Lifestyle\n2. Supports Rejuvenation of Cells and Repair the Damaged Cells\n3. Trigger the Production of Stem Cells for New Cell Formation",
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
              size: 14,
            ),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 2.35),
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
                      const SpaceHeightWidget(height: 5),
                      CommonTitle(
                        titleName: managingHealthData[i]['desc'],
                        fontColor: middleBlackColor,
                        fontFamily: "OnestRegular",
                        size: 14,
                        textAlign: TextAlign.justify,
                      ),
                    ]),
                  ),
                );
              }),
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
      "title": "Optimum Energy",
      "desc":
          "Uniwave by Quantes Technology boosts cell energy to 70-90 millivolts, optimizing metabolism and enhancing overall energy, leading to peak vitality."
    },
    {
      "image": "https://www.destina1.com/images/04-img.jpg",
      "title": "Healthy Lifestyle",
      "desc":
          "Uniwave by Quantes Technology provides a transformative and holistic approach to health, blending sustainable products with enduring results into your lifestyle for a seamless and impactful wellness journey."
    },
    {
      "image": "https://www.destina1.com/images/02img.jpeg",
      "title": "Rejuvenation of Cell",
      "desc":
          "Uniwave by Quantes Technology boosts cellular energy and nutrient absorption, enhancing cell membrane permeability for improved repair and regeneration. This leads to healthier cells, promoting greater overall wellness and vitality."
    },
    {
      "image": "https://www.destina1.com/images/01img.jpeg",
      "title": "New Cell Formation",
      "desc":
          "Uniwave by Quantes Technology boosts cellular energy and communication, fostering new cell formation and growth. This process supports tissue repair and regeneration, enhancing overall health through cellular renewal."
    }
  ];
  List managingHealthData = [
    {
      "image": "https://www.destina1.com/images/health.jpg",
      "title": "Uniwave - The Holistic Approach",
      "desc":
          "Uniwave by Quantes Technology offers groundbreaking technology and is your gateway to a healthier life. Achieve your health goals effortlessly and feel the difference as you embark on a vibrant journey to wellness."
    },
    {
      "image": "https://www.destina1.com/images/lifestyle.jpg",
      "title": "6 Key Lifestyle Components",
      "desc":
          "Evaluate your results in the six key lifestyle components critical to health management success - Diet, Physical Activity, Mindset, Stress, Sleep and Meal Habits."
    },
    {
      "image": "https://www.destina1.com/images/science.jpeg",
      "title": "Science Behind Uniwave by Quantes Technology",
      "desc":
          "Uniwave by Quantes Technology grew from core principles and decades of industry research that enabled Uniwave to become one of the world's top selling brand."
    },
    {
      "image": "https://www.destina1.com/images/item.jpg",
      "title": "Uniwave by Quantes Technology - The Wholistic Approach",
      "desc":
          "It has 100,000 different kinds of decoding technologies. Boosting the immune system, enhance the metabolism,and recharge the body cells"
    }
  ];
}
