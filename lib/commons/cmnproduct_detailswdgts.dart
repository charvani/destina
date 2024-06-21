import 'dart:io';

import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/inside_screens/myEmoney/ecard_reqreport_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../inside_screens/heroanimation_screen.dart';
import '../models/biomatriximage_model.dart';
import 'colors.dart';
import 'common_widgets.dart';
import 'videodisplay_screen.dart';

Widget productBulletImg() {
  return Row(
    children: [
      const SpaceWidthWidget(width: 10),
      Image.asset(
        "assets/images/product_icon_mandal.png",
        height: 45,
      ),
    ],
  );
}

Widget pendentWidget() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productBulletImg(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SpaceHeightWidget(height: 5),
                CommonTitle(
                  titleName: "Our Discovery of Uniwave Pendant",
                  fontColor: greenColor,
                  textAlign: TextAlign.center,
                ),
                CommonTitle(
                  titleName: "by",
                  fontColor: blackColor,
                  fontFamily: "OnestRegular",
                  textAlign: TextAlign.center,
                ),
                CommonTitle(
                  titleName: "Quantes Technology",
                  fontColor: darkBlue,
                  fontFamily: "OnestSemiBold",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        color: lightDarKBlue.withOpacity(0.1),
        child: Column(
          children: [
            const CommonTitle(
              titleName: "The Blood Circulation",
              fontFamily: "OnestSemiBold",
              size: 15.5,
            ),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "BEFORE",
              fontFamily: "OnestSemiBold",
              size: 15,
            ),
            const SpaceHeightWidget(height: 5),
            Image.asset(
              "assets/images/before_blood.png",
              height: 150,
            ),
            const CommonTitle(
              titleName: "Before using Uniwave Pendant by Quantes Technology",
              size: 12,
              fontFamily: "OnestRegular",
              textAlign: TextAlign.center,
            ),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "AFTER",
              fontFamily: "OnestSemiBold",
              size: 15,
            ),
            const SpaceHeightWidget(height: 5),
            Image.asset(
              "assets/images/after_blood.png",
              height: 150,
            ),
            const CommonTitle(
              titleName:
                  "30 minutes after using Uniwave Pendant by Quantes Technology",
              textAlign: TextAlign.center,
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "Our Discovery",
              fontFamily: "OnestSemiBold",
              size: 15.5,
            ),
            const SpaceHeightWidget(height: 8),
            const CommonTitle(
              titleName:
                  "1. Uniwave by Quantes Technology refers to a form of energy outside the convertional electromagnetic spectrum, possessing unique properties that can influence matter at a quantum level. It's practical applications have wider potential in healthcare industry.",
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 5),
            const CommonTitle(
              titleName:
                  "2. The shape has 4 distinct corners, but its edges curve both upward & downward, creating an interesting & uniques design.",
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 5),
            const CommonTitle(
              titleName:
                  '3. A proprietary "energization" process technology based on the principles of Quantum Physics.',
              size: 12,
              fontFamily: "OnestRegular",
            ),
          ],
        ),
      ),
      const SpaceHeightWidget(height: 15),
      const CommonTitle(
        titleName: "BENEFITS :",
        fontFamily: "OnestSemiBold",
        size: 15,
      ),
      const SpaceHeightWidget(height: 8),
      for (int i = 0; i < pendentResultData.length; i++)
        UniwaveProductDetails(
          dataText: pendentResultData[i],
        ),
      const SpaceHeightWidget(height: 15),
      Image.asset(
        "assets/images/prDetails_pendent.png",
        height: 170,
      ),
      const SpaceHeightWidget(height: 15),
      const CommonTitle(
        titleName: "How It Works",
        fontFamily: "OnestSemiBold",
        size: 15,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CommonTitle(
          titleName:
              "Uniwave by Quantes Technology is much needed as most of us are running out of energy due to today's fast-paced, busy lifestyle. There is no time to relax, and there's too much to do! All the radiation emitted from the electronic gadgets, vehicles, and technological advancements we use to get everything done quicker further drains out the energy that is much needed for our daily activities.",
          textAlign: TextAlign.justify,
          size: 12,
          fontFamily: "OnestRegular",
          fontColor: middleBlackColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CommonTitle(
          titleName:
              "Uniwave by Quantes Technology provides optimum energy that helps restore our body's energy levels to an ideal range of 70-90 mV. With Uniwave, we can enjoy increased energy and significant health benefits. It's a fast-acting, natural choice for improving our energy and well-being.",
          textAlign: TextAlign.justify,
          size: 12,
          fontFamily: "OnestRegular",
          fontColor: middleBlackColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: ReviewVideoWidget(
                onTapFun: () async {
                  final Uri url = Uri.parse(
                      "https://www.youtube.com/watch?v=b-QVKZD9jSQ&list=PLSn3vs1mApFHDMlwZgDmI4VGyHT4ximp8");
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                videoUrl:
                    "https://www.youtube.com/watch?v=b-QVKZD9jSQ&list=PLSn3vs1mApFHDMlwZgDmI4VGyHT4ximp8",
                videoImgHeight: 200)),
      ),
    ],
  );
}

List<String> pendentResultData = [
  "A re-balanced biofield & stability.",
  "Significant protection from EMR & EMF Radiation.",
  "Improved Physical performance.",
  "Energy flow and qualitative balance is restored.",
  "Having a quality sleep.",
  "Enhance positivity and creativity.",
  "Enhance the Body's Energy Level.",
  "Improve focus and concentration.",
  "Neutralize harmful manmade and natural frequencies transmitted into beneficial energies.",
  "Boost endurance, strength, and vitality.",
  "Enhance the body's flexibility.",
  "Enhance the body's natural defense system.",
  "Improve the body's stability.",
  "Promotes healthy blood flow."
];
Widget flaskWidget(String itemName) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productBulletImg(),
          const SpaceWidthWidget(width: 5),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                CommonTitle(
                  titleName: "What is the $itemName",
                  fontColor: greenColor,
                  textAlign: TextAlign.center,
                ),
                CommonTitle(
                  titleName: "by",
                  fontColor: blackColor,
                  fontFamily: "OnestRegular",
                  textAlign: TextAlign.center,
                ),
                CommonTitle(
                  titleName: "Quantes Technology?",
                  fontColor: darkBlue,
                  fontFamily: "OnestSemiBold",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
      const SpaceHeightWidget(height: 10),
      // for (int i = 0; i < 3; i++)
      const UniwaveProductDetails(
        dataText:
            // i == 0
            //     ? "Rejuvenation of cells"
            //     : i == 1
            //         ? "Trigger the production of stem cells for new cell formation"
            //         :
            " Provide optimum energy for the healthy lifestyle",
      ),
      // const SpaceHeightWidget(height: 5),
      // CommonTitle(
      //   titleName: "Benefits of $itemName",
      //   fontFamily: "OnestSemiBold",
      //   size: 15.5,
      // ),
      // const SpaceHeightWidget(height: 8),
      // for (int i = 0; i < flaskBenfitsData.length; i++)
      //   UniwaveProductDetails(
      //     dataText: flaskBenfitsData[i],
      //   ),
      const SpaceHeightWidget(height: 15),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(itemName.toLowerCase() == "uniwave flask"
            ? "assets/images/uniwave_flask.jpg"
            : itemName.toLowerCase() == "uniwave stick"
                ? "assets/images/stick1.jpg"
                : "assets/images/filter1.jpg"),
      ),
      const SpaceHeightWidget(height: 15),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        color: lightDarKBlue.withOpacity(0.1),
        child: Column(
          children: [
            Image.asset("assets/images/flask-water-before.png"),
            const SpaceHeightWidget(height: 10),
            CommonTitle(
              titleName: "Dead Water",
              fontFamily: "OnestSemiBold",
              size: 14,
              fontColor: limeColor,
            ),
            const CommonTitle(
              titleName: "Plain Distilled Water",
              fontFamily: "OnestSemiBold",
              size: 14,
            ),
            const CommonTitle(
              titleName: "Before using Uniwave Scalarvia by Quantes Technology",
              fontFamily: "OnestRegular",
              size: 12,
              textAlign: TextAlign.center,
            ),
            const SpaceHeightWidget(height: 15),
            Image.asset("assets/images/flask-water-after.png"),
            const SpaceHeightWidget(height: 10),
            CommonTitle(
              titleName: "Healthy Living Water",
              fontFamily: "OnestSemiBold",
              size: 14,
              fontColor: limeColor,
            ),
            const CommonTitle(
              titleName: "Energized Water(10 min)",
              fontFamily: "OnestSemiBold",
              size: 14,
            ),
            const CommonTitle(
              titleName:
                  "Same distilled water energized by Uniwave Alkaline Water Flask & Water Stick by Quantes Technology",
              fontFamily: "OnestRegular",
              size: 12,
              textAlign: TextAlign.center,
            ),
            const SpaceHeightWidget(height: 15),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "FUNCTIONS :",
              fontFamily: "OnestSemiBold",
              size: 15.5,
            ),
            const SpaceHeightWidget(height: 8),
            const UniwaveRitchTextWidget(
              boldText: "1. Living Water Transformation:",
              plainText:
                  'Transforms regular water into "living Water" promotes healthy blood flow, enhances the body\'s energy levels, supports the body\'s natural balance and comfort, and contributes to maintaining youthful vitality.',
            ),
            const SpaceHeightWidget(height: 5),
            const UniwaveRitchTextWidget(
                boldText: "2. Alkaline Balance :",
                plainText:
                    "This neutralizes acidity, reduces toxicity, and ensures a balanced pH level, particularly beneficial for smokers, alcohol consumers, and individuals who frequently consume fast food."),
            const SpaceHeightWidget(height: 5),
            const UniwaveRitchTextWidget(
                boldText: "3. Antioxidant Power :",
                plainText:
                    "Transforms water into a potent antioxidant with an ORP of -380mV to -400mV."),
            const SpaceHeightWidget(height: 5),
            const UniwaveRitchTextWidget(
                boldText: "4. Enhanced Hydration :",
                plainText:
                    "Reduces water molecule size for optimum hydration and better absorption, aiding detoxification and metabolism."),
            const SpaceHeightWidget(height: 5),
          ],
        ),
      ),
      const SpaceHeightWidget(height: 15),
      const CommonTitle(
        titleName: "BENFITS:",
        fontFamily: "OnestSemiBold",
        size: 15,
      ),
      const SpaceHeightWidget(height: 8),
      for (int i = 0; i < flaskResultData.length; i++)
        UniwaveProductDetails(dataText: flaskResultData[i]),
      const SpaceHeightWidget(height: 15),
      Image.asset(
        itemName.toLowerCase() == "uniwave flask"
            ? "assets/images/uniwave_flask.jpg"
            : itemName.toLowerCase() == "uniwave stick"
                ? "assets/images/stick1.jpg"
                : "assets/images/filter1.jpg",
        height: 170,
      ),
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        color: lightDarKBlue.withOpacity(0.1),
        child: Column(
          children: [
            const CommonTitle(
              titleName:
                  "THE FILTER IN THE UNIWAVE BY QUANTES TECHNOLOGY ALKALINE WATER FLASK CONTAINS 6 MAIN ELEMENTS",
              fontFamily: "OnestSemiBold",
              size: 12,
              textAlign: TextAlign.center,
            ),
            tourmalineWidget(),
            nanoWidget(),
            zatoliteWidget(),
            muyuWidget(),
            clayStoneWidget(),
            maifanshiWidget(),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "How It Works",
              fontFamily: "OnestSemiBold",
              size: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTitle(
                titleName:
                    "The Destina1 Uniwave by Quantes Technology Energized Alkaline Flask lowers normal drinking water's Oxygen Reduction Potential (ORP) by at least 200mV. This process transforms regular water into alkaline water, which has a more vital and beneficial potential for your body.",
                textAlign: TextAlign.justify,
                size: 12,
                fontFamily: "OnestRegular",
                fontColor: middleBlackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ReviewVideoWidget(
                      onTapFun: () async {
                        final Uri url = Uri.parse(
                            "https://www.youtube.com/watch?v=LGyYBeaskgE");
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      videoUrl: "https://www.youtube.com/watch?v=LGyYBeaskgE",
                      videoImgHeight: 200)),
            ),
          ],
        ),
      )
    ],
  );
}

tourmalineWidget() {
  return Column(
    children: [
      const SpaceHeightWidget(height: 10),
      Image.asset(
        "assets/images/stone1.png",
        height: 130,
      ),
      const CommonTitle(
        titleName: "Tourmaline Stone",
        fontFamily: "OnestSemiBold",
        size: 12.5,
      ),
      const SpaceHeightWidget(height: 10),
      const CustomBulletTextWidget(
        data: "Supports overall well-being",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Helps maintain energy levels and vitality",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Promotes a calm and soothing environment for better sleep",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Supports healthy blood flow and promotes comfort in muscles and joints",
        verticalPadding: 0,
      ),
    ],
  );
}

muyuWidget() {
  return Column(
    children: [
      const SpaceHeightWidget(height: 10),
      Image.asset(
        "assets/images/stone4.png",
        height: 130,
      ),
      const CommonTitle(
        titleName: "Muyu Jade Stone",
        fontFamily: "OnestSemiBold",
        size: 12.5,
      ),
      const SpaceHeightWidget(height: 10),
      const CustomBulletTextWidget(
        data: "Promotes relaxation and comfort.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Supports healthy oxygen and nutrient flow to cells.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Supports the body's natural cleansing processes.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Promotes a refreshed appearance and healthy skin tone.",
        verticalPadding: 0,
      ),
    ],
  );
}

nanoWidget() {
  return Column(
    children: [
      const SpaceHeightWidget(height: 10),
      Image.asset(
        "assets/images/stone2.png",
        height: 130,
      ),
      const CommonTitle(
        titleName: "Nano Silver Powder",
        fontFamily: "OnestSemiBold",
        size: 12.5,
      ),
      const SpaceHeightWidget(height: 10),
      const CustomBulletTextWidget(
        data: "Helps maintain a balanced microbial environment",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Supports the body's natural defenses",
        verticalPadding: 0,
      ),
    ],
  );
}

zatoliteWidget() {
  return Column(
    children: [
      const SpaceHeightWidget(height: 10),
      Image.asset(
        "assets/images/stone3.png",
        height: 130,
      ),
      const CommonTitle(
        titleName: "Zeolite",
        fontFamily: "OnestSemiBold",
        size: 12.5,
      ),
      const SpaceHeightWidget(height: 10),
      const CustomBulletTextWidget(
        data:
            "Supports the body's natural cleansing processes and overall well-being.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Supports balanced pH levels.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Supports the removal of waste and toxins from the bloodstream.",
        verticalPadding: 0,
      ),
    ],
  );
}

clayStoneWidget() {
  return Column(
    children: [
      const SpaceHeightWidget(height: 10),
      Image.asset(
        "assets/images/stone5.png",
        height: 130,
      ),
      const CommonTitle(
        titleName: "Clay Stone Granules",
        fontFamily: "OnestSemiBold",
        size: 12.5,
      ),
      const SpaceHeightWidget(height: 10),
      const CustomBulletTextWidget(
        data: "Helps exfoliate the skin for a smoother appearance.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Supports the natural cleansing of the skin by removing impurities from the pores.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "These minerals support healthy skin and a more radiant look.",
        verticalPadding: 0,
      ),
    ],
  );
}

maifanshiWidget() {
  return Column(
    children: [
      const SpaceHeightWidget(height: 10),
      Image.asset(
        "assets/images/stone6.png",
        height: 130,
      ),
      const CommonTitle(
        titleName: "Maifanshi Stone",
        fontFamily: "OnestSemiBold",
        size: 12.5,
      ),
      const SpaceHeightWidget(height: 10),
      const CustomBulletTextWidget(
        data:
            "Supports the maintenance of bones, muscles, and overall bodily functions.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Supports balanced acidity levels and comfort in the digestive tract.",
        verticalPadding: 0,
      ),
    ],
  );
}

List<String> flaskBenfitsData = [
  "Stabilizes blood sugar levels",
  "Dandruff and hair health",
  "Improves mood and insomnia",
  "Strengthens immune system",
  "Promotes weight loss",
  "Promotes insulin production by stimulating the pancreas health",
  "Balances your hormone level",
  "Stabilizes the blood pressure"
];

List<String> flaskResultData = [
  "Supports proper hydration",
  "Supports nutrient absorption",
  "Helps maintain energy levels",
  "Supports the body's natural cleansing processes",
  "Supports balanced acidity levels",
  "Supports digestive health",
  "Supports a balanced pH level",
  "Supports comfort in the digestive tract",
  "Promotes skin health",
  "Helps to manage the effects of daily environmental factors",
  "Supports the body's response to oxidative stress",
  "Helps manage the presence of Free Radicals",
  "Supports healthy blood flow",
];
Widget scalarviaWidget() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/leaf.png",
            height: 55,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                titleName: "What is the Uniwave Scalarvia",
                fontColor: greenColor,
                textAlign: TextAlign.center,
              ),
              CommonTitle(
                titleName: "by",
                fontColor: blackColor,
                fontFamily: "OnestRegular",
                textAlign: TextAlign.center,
              ),
              CommonTitle(
                titleName: "Quantes Technology",
                fontColor: darkBlue,
                fontFamily: "OnestSemiBold",
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
      const SpaceHeightWidget(height: 8),
      for (int i = 0; i < scalarviaInfoData.length; i++)
        ScalarviaProductDetails(
          dataText: scalarviaInfoData[i],
        ),
      const SpaceHeightWidget(height: 18),
      const CommonTitle(
        titleName: "Benefits of Uniwave Scalarvia",
        fontFamily: "OnestSemiBold",
        size: 15.5,
      ),
      const SpaceHeightWidget(height: 10),
      for (int i = 0; i < scalarviaBenfitsData.length; i++)
        ScalarviaProductDetails(
          dataText: scalarviaBenfitsData[i],
        ),
      const SpaceHeightWidget(height: 10),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset("assets/images/scalarvia1.jpg"),
      ),
      const SpaceHeightWidget(height: 10),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        color: lightDarKBlue.withOpacity(0.1),
        child: Column(
          children: [
            const CommonTitle(
              titleName: "The Blood Circulation",
              fontFamily: "OnestSemiBold",
              size: 15.5,
            ),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "BEFORE",
              fontFamily: "OnestSemiBold",
              size: 15,
            ),
            const SpaceHeightWidget(height: 5),
            Image.asset(
              "assets/images/before_blood.png",
              height: 150,
            ),
            const CommonTitle(
              titleName: "Before using Uniwave Scalarvia by Quantes Technology",
              size: 12,
              fontFamily: "OnestRegular",
              textAlign: TextAlign.center,
            ),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "AFTER",
              fontFamily: "OnestSemiBold",
              size: 15,
            ),
            const SpaceHeightWidget(height: 5),
            Image.asset(
              "assets/images/after_blood.png",
              height: 150,
            ),
            const CommonTitle(
              titleName:
                  "30 minutes after using Uniwave Scalarvia by Quantes Technology",
              textAlign: TextAlign.center,
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 15),
            const CommonTitle(
              titleName: "What is Growth Factor Concentrate(GFC)?",
              fontFamily: "OnestSemiBold",
              size: 15.5,
            ),
            const SpaceHeightWidget(height: 8),
            const CommonTitle(
              titleName:
                  "GFC is a patented technology that isolates high-protein from colostrum. It contains high insulin-like growth factors (IGF) and Epidermal Growth Factor (EGF).",
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 5),
            const CommonTitle(
              titleName:
                  "GFC supports the natural process of cell renewal, helping to refresh the skin by forming new epidermis and dermis layers.",
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 5),
            const CommonTitle(
              titleName:
                  "Growth factors have been extensively studied for their potential benefits. The growth factor concentrate (GFC), derived from the cow's colostrum, has been evaluated for its effects on skin appearance, hair quality, and hormonal balance.",
              size: 12,
              fontFamily: "OnestRegular",
            ),
          ],
        ),
      ),
      const SpaceHeightWidget(height: 15),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: CommonTitle(
          titleName: "Uniwave by Quantes Technology Key Benefits:",
          fontFamily: "OnestSemiBold",
          size: 15,
          textAlign: TextAlign.center,
        ),
      ),
      const SpaceHeightWidget(height: 8),
      for (int i = 0; i < 7; i++)
        ScalarviaProductDetails(
          dataText: i == 0
              ? "Consists of 100,000 types of decoding technologies."
              : i == 1
                  ? "Enhance the body's natural defense system"
                  : i == 2
                      ? "Supports natural metabolic processes"
                      : i == 3
                          ? "Enhance the Body's Energy Level."
                          : i == 4
                              ? "Promotes healthy blood flow."
                              : i == 5
                                  ? "Enhance vitality, endurance, strength, flexibility, and stability."
                                  : "Support on the focus and concentration",
        ),
      const SpaceHeightWidget(height: 15),
      Image.asset(
        "assets/images/scalarvia2.jpg",
        height: 170,
      ),
      const CommonTitle(
        titleName: "How It Works",
        fontFamily: "OnestSemiBold",
        size: 15,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CommonTitle(
          titleName:
              "Scalarvia benefits from Stevia, a natural sweetener. It is used as an alternative sweetener. Scalarvia has no calories and is 200-300 times sweeter than sugar. It does not affect blood sugar levels, and it is a very low-calorie sweetener that benefits people with higher glucose levels. It is also well suited for daily use as a substitute for sugar.",
          textAlign: TextAlign.justify,
          size: 12,
          fontFamily: "OnestRegular",
          fontColor: middleBlackColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: ReviewVideoWidget(
                onTapFun: () async {
                  final Uri url =
                      Uri.parse("https://www.youtube.com/watch?v=5-OPw274MR8");
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                videoUrl: "https://www.youtube.com/watch?v=5-OPw274MR8",
                videoImgHeight: 200)),
      ),
    ],
  );
}

List<String> scalarviaInfoData = [
  "Contains Stevia Extract",
  " Uniwave by Quantes Technology",
  "Contains Growth Factor Concentrate (GFC)",
  "Contains 200 drops",
  'Contains "NO SUGAR"',
  "Free of calories"
];
List<String> scalarviaBenfitsData = [
  "Stabilizes blood sugar levels",
  "Dandruff and hair health",
  "Improves mood and insomnia",
  "Strengthens immune system",
  "Promotes weight loss",
  "Promotes insulin production by stimulating the pancreas health",
  "Balances your hormone level",
  "Stabilizes the blood pressure"
];
Widget coffeeWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            Transform.translate(
              offset: const Offset(0, -10),
              child: productBulletImg(),
              // Image.asset(
              //   "assets/images/leaf.png",
              //   height: 55,
              // ),
            ),
            Flexible(
              child: CommonTitle(
                titleName: "What is the Uniwave Instant Coffee Premix 5in1",
                fontColor: greenColor,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SpaceHeightWidget(height: 5),
            CommonTitle(
              titleName: "by",
              fontColor: blackColor,
              fontFamily: "OnestRegular",
              textAlign: TextAlign.center,
            ),
            CommonTitle(
              titleName: "Quantes Technology",
              fontColor: darkBlue,
              fontFamily: "OnestSemiBold",
              textAlign: TextAlign.center,
            )
          ],
        ),
        const SpaceHeightWidget(height: 15),
        CommonTitle(
          titleName:
              "Blended especially with coffee beans of excellent quality and other healthy ingredients with no artificial coloring and preservations. You can enjoy pure coffee and absorb the excellent effects the healthy ingredients could bring to your health. It is also free of sugar and is therefore suitable for those who want to limit their sugar intake when consuming instant coffee.",
          fontFamily: "OnestSemiBold",
          size: 12.5,
          fontColor: middleBlackColor,
          textAlign: TextAlign.center,
        ),
        const SpaceHeightWidget(height: 18),
        const CommonTitle(
          titleName: "Benefits of Uniwave Instant Coffee Premix 5in1 :",
          fontFamily: "OnestSemiBold",
          size: 15.5,
          textAlign: TextAlign.center,
        ),
        const SpaceHeightWidget(height: 10),
        for (int i = 0; i < coffeeBenfitsData.length; i++)
          UniwaveProductDetails(
            dataText: coffeeBenfitsData[i],
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset("assets/images/coffee1.jpg"),
        ),
        const SpaceHeightWidget(height: 10),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          color: lightDarKBlue.withOpacity(0.1),
          child: Column(
            children: [
              const CommonTitle(
                titleName: "The Blood Circulation",
                fontFamily: "OnestSemiBold",
                size: 15.5,
              ),
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                titleName: "BEFORE",
                fontFamily: "OnestSemiBold",
                size: 15,
              ),
              const SpaceHeightWidget(height: 5),
              Image.asset(
                "assets/images/before_blood.png",
                height: 150,
              ),
              const CommonTitle(
                titleName:
                    "Before using Uniwave Instant Coffee Premix 5in1 by Quantes Technology",
                size: 12,
                fontFamily: "OnestRegular",
                textAlign: TextAlign.center,
              ),
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                titleName: "AFTER",
                fontFamily: "OnestSemiBold",
                size: 15,
              ),
              const SpaceHeightWidget(height: 5),
              Image.asset(
                "assets/images/after_blood.png",
                height: 150,
              ),
              const CommonTitle(
                titleName:
                    "30 minutes after using Uniwave Instant Coffee Premix 5in1 by Quantes Technology",
                textAlign: TextAlign.center,
                size: 12,
                fontFamily: "OnestRegular",
              ),
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                titleName:
                    "Uniwave Instant Coffee Premix 5in1 with Healthy Ingredients:",
                fontFamily: "OnestSemiBold",
                size: 15.5,
              ),
              const SpaceHeightWidget(height: 8),
              const UniwaveRitchTextWidget(
                  boldText: "Ceylon Cinnamon :",
                  plainText:
                      "A spice that fights cancer, and helps control blood pressure."),
              const SpaceHeightWidget(height: 8),
              const UniwaveRitchTextWidget(
                  boldText: "Black Pepper :",
                  plainText:
                      "A spice with no calories, its aids in weight loss, and is rich in antioxidants."),
              const SpaceHeightWidget(height: 8),
              const UniwaveRitchTextWidget(
                  boldText: "Turmeric :",
                  plainText:
                      "Known for its disease-fighting abilities, it supports liver health, and aids digestion."),
              const SpaceHeightWidget(height: 8),
              const UniwaveRitchTextWidget(
                  boldText: "Fiber Creme :",
                  plainText:
                      "A diary alternative that's high in fiber and free from gluten, cholestrol, making it a healthy creamer option."),
              const SpaceHeightWidget(height: 8),
              const UniwaveRitchTextWidget(
                  boldText: "Robusta Coffee :",
                  plainText:
                      "A bitter, low-acidity coffee that promotes weight loss, and enhances brain function."),
              const SpaceHeightWidget(height: 8),
              const UniwaveRitchTextWidget(
                  boldText: "Arabica Coffee :",
                  plainText:
                      "A coffee variety that keeps you alert and hydrated, and helps maintain healthy skin."),
              const SpaceHeightWidget(height: 8),
            ],
          ),
        ),
        const SpaceHeightWidget(height: 15),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CommonTitle(
            titleName: "Uniwave by Quantes Technology Key Benefits:",
            fontFamily: "OnestSemiBold",
            size: 15,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonTitle(
            titleName:
                "It has 100,000 different kinds of decoding technologies. Boosting the immune system, enhance the metabolism, and recharge the body cells.",
            fontFamily: "OnestSemiBold",
            size: 12,
            fontColor: middleBlackColor,
          ),
        ),
        const SpaceHeightWidget(height: 8),
        for (int i = 0; i < 3; i++)
          UniwaveProductDetails(
            dataText: i == 0
                ? "Provide Optimum Energy for Healthy Lifestyle"
                : i == 1
                    ? "Supports Rejuventaion of Cells and Repair the Damaged Cells."
                    : "Trigger the Production of Stem Cells for New Cell Formation.",
          ),
        const SpaceHeightWidget(height: 15),
        Image.asset(
          "assets/images/coffee2.jpg",
          height: 170,
        ),
      ],
    ),
  );
}

List<String> coffeeBenfitsData = [
  "Reduces the risk of cancer",
  "Immune System Support",
  "Improve cardiovascular health",
  "Anti-inflammatory Properties",
  "Has Antioxidant benefits",
  "Promotes weight Loss"
];
Widget biomatrixWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productBulletImg(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                    titleName: "What is the Uniwave Biomatrix Sheild",
                    fontColor: greenColor,
                    textAlign: TextAlign.center,
                  ),
                  CommonTitle(
                    titleName: "by",
                    fontColor: blackColor,
                    fontFamily: "OnestRegular",
                    textAlign: TextAlign.center,
                  ),
                  CommonTitle(
                    titleName: "Quantes Technology",
                    fontColor: darkBlue,
                    fontFamily: "OnestSemiBold",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
        const SpaceHeightWidget(height: 15),
        for (int i = 0; i < 4; i++)
          UniwaveProductDetails(
            dataText: i == 0
                ? "The Uniwave Biomatrix Shield is a unique solution designed to protect your body from the harmful effects of electromagnetic radiation emitted from mobile phones, computers, laptops, and televisions."
                : i == 1
                    ? "This shield discreetly attaches to your electronic devices, so it can go with you wherever you are. It benefits those affected by electrosensitivity and is a preventative measure against radiation."
                    : i == 2
                        ? "The Uniwave Biomatrix Shield uses advanced nano stealth technology as an essential radiant absorbent and EMF/EMR harmonizer."
                        : "The Uniwave Biomatrix Shield helps absorb and eliminate harmful electromagnetic radiation from your electronic devices, keeping you safer from radiation.",
          ),
        const SpaceHeightWidget(height: 18),
        const CommonTitle(
          titleName: "Uniwave by Quantes Technology Key Benefits:",
          fontFamily: "OnestSemiBold",
          size: 15.5,
          textAlign: TextAlign.center,
        ),
        const SpaceHeightWidget(height: 10),
        for (int i = 0; i < 3; i++)
          UniwaveProductDetails(
            dataText: i == 0
                ? "Helps harmonize electromagnetic waves"
                : i == 1
                    ? "Supports the neutralization of EMR & EMF radiation"
                    : "Provides comprehensive protection barrier with Smart Uniwave Technology",
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset("assets/images/biomatrix.jpg"),
        ),
        const CommonTitle(
          titleName: "Biomatrix Shield usage guidelines:",
          fontFamily: "OnestSemiBold",
          size: 15,
          textAlign: TextAlign.center,
        ),
        const SpaceHeightWidget(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CommonTitle(
                      titleName: "How Many",
                      size: 12,
                    ),
                    Row(
                      children: [
                        CommonTitle(
                          titleName: "BiomartixShield",
                          size: 12,
                          fontFamily: "OnestRegular",
                        ),
                        CommonTitle(
                          titleName: "(BMS)?",
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    CommonTitle(
                      titleName: "Where Do I Stick the",
                      size: 12,
                    ),
                    Row(
                      children: [
                        CommonTitle(
                          titleName: "BiomartixShield",
                          size: 12,
                          fontFamily: "OnestRegular",
                        ),
                        CommonTitle(
                          titleName: "(BMS)?",
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SpaceHeightWidget(height: 10),
        for (int i = 0; i < bimatrixImageData.length; i++)
          BiomatrixImageWidget(
            count: bimatrixImageData[i].count,
            imagename: bimatrixImageData[i].imageName,
            title1: bimatrixImageData[i].title1,
            title2: bimatrixImageData[i].title2,
          ),
        const SpaceHeightWidget(height: 15),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CommonTitle(
            titleName: "Biomatrix Shield Key Benefits :",
            fontFamily: "OnestSemiBold",
            size: 15,
            textAlign: TextAlign.center,
          ),
        ),
        const SpaceHeightWidget(height: 8),
        for (int i = 0; i < biomatrixBenfitsData.length; i++)
          UniwaveProductDetails(dataText: biomatrixBenfitsData[i]),
        const SpaceHeightWidget(height: 15),
        Image.asset(
          "assets/images/radiation.png",
          height: 170,
        ),
        const SpaceHeightWidget(height: 10),
        CommonTitle(
          titleName:
              "Dr Om Gandhi (University of Utah) shows how radiation that penetrates the skull of 5-year-old children absorbs 10 times more EMR & EMF radiation than an adult.",
          fontFamily: "OnestRegular",
          size: 12.5,
          fontColor: middleBlackColor,
        ),
        const SpaceHeightWidget(height: 10),
        const CommonTitle(
          titleName: "How It Works",
          fontFamily: "OnestSemiBold",
          size: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonTitle(
            titleName:
                "The Uniwave by Quantes Technology from the \"Uniwave Bio Matrix Shield\" will support the body's natural biofield against environmental factors, preventing electromagnetic radiation from affecting one's health. \"Uniwave Bio Matrix Shield is the first-line defense against electro pollution. \" It can be used on any appliance or device emitting electromagnetic frequencies (EMF) or electromagnetic radiation (EMR), such as mobile phones, home phones, cars, microwaves, computers, game consoles, home appliances, etc.",
            textAlign: TextAlign.justify,
            size: 12,
            fontFamily: "OnestRegular",
            fontColor: middleBlackColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonTitle(
            titleName:
                "If it plugs and plays on DC or AC currents, protect it with \"Uniwave Bio Matrix Shield.\"",
            textAlign: TextAlign.justify,
            size: 12,
            fontFamily: "OnestRegular",
            fontColor: middleBlackColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ReviewVideoWidget(
                  onTapFun: () async {
                    final Uri url = Uri.parse(
                        "https://www.youtube.com/watch?v=KauxvsIwVGc&list=PLSn3vs1mApFHDMlwZgDmI4VGyHT4ximp8&index=1");
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  videoUrl:
                      "https://www.youtube.com/watch?v=KauxvsIwVGc&list=PLSn3vs1mApFHDMlwZgDmI4VGyHT4ximp8&index=1",
                  videoImgHeight: 200)),
        ),
      ],
    ),
  );
}

List<String> biomatrixBenfitsData = [
  "Promotes a balanced and harmonious condition",
  "Helps harmonize EMF and EMR radiation",
  "Supports the body's natural biofield",
  "Promotes comfort at the cellular level",
  "Helps maintain a stable body temperature"
];

List<BiomatrixImageData> bimatrixImageData = [
  BiomatrixImageData(
      imageName: "phone",
      title1: "Mobile Phone",
      title2: "1 BMS centered on the back cover of the phone",
      count: "1"),
  BiomatrixImageData(
      imageName: "cordless_phone",
      title1: "Cordless Phone",
      title2: "1 BMS on base station, 1BMS on phone, both close to antenna",
      count: "2"),
  BiomatrixImageData(
    title1: "Desktop Computer",
    title2:
        "1 BMS on computer tower (top, front, or side), 1 BMs on display monitor (centered on top or bottom)",
    count: "2",
    imageName: "desktop",
  ),
  BiomatrixImageData(
    title1: "Laptop Computer",
    title2: "1 BMS top-centered on the outside of the display panel",
    count: "1",
    imageName: "laptop",
  ),
  BiomatrixImageData(
    title1: "Automobile",
    title2: "1 BMS on driver side dashboard, 1 BMS on passenger side dashboard",
    count: "2",
    imageName: "automobile",
  ),
  BiomatrixImageData(
    title1: "Vacuum Cleaner",
    title2: "1 BMS on handle, 1 BMS on housing",
    count: "2",
    imageName: "vaccum_cleaner",
  ),
  BiomatrixImageData(
    title1: "Toaster",
    title2: "1 BMS on front(Centered)",
    count: "1",
    imageName: "toaster",
  ),
  BiomatrixImageData(
    title1: "Alarm Clock",
    title2: "1 BMS on front-face or top of alarm clock",
    count: "1",
    imageName: "alarm",
  ),
  BiomatrixImageData(
    title1: "Coffee Maker",
    title2: "1 BMS close to on/off switch",
    count: "1",
    imageName: "coffe_maker",
  ),
  BiomatrixImageData(
    title1: "Game Station",
    title2:
        "1 BMS centered on top of console, 1 BMS on bottom of each control unit",
    count: "2",
    imageName: "game_station",
  ),
  BiomatrixImageData(
    title1: "Television",
    title2: "1 BMS centered above TV screen, 1 BMS centered below TV screen",
    count: "2",
    imageName: "tv",
  ),
  BiomatrixImageData(
    title1: "Refrigerator",
    title2: "1 BMS each on the top and bottom center of refrigerator front",
    count: "2",
    imageName: "refrigerator",
  ),
  BiomatrixImageData(
    title1: "Microwave",
    title2:
        "1 BMS each on the top left and right front corners, close to door seats",
    count: "2",
    imageName: "microwave",
  ),
  BiomatrixImageData(
    title1: "Hair Dryer",
    title2: "1 BMS on any flat surface of dryer",
    count: "1",
    imageName: "hair_dryer",
  ),
];

List kritaliaExpData = [
  {
    "title": "Complimentary Shipping & Returns",
    "des": "We offer complimentary shipping and returns on all kritalia"
  },
  {
    "title": "Pink Box",
    "des": "Every kritalia & Co. purchase will arrive wrapped in kritalia"
  },
  {
    "title": "Visit a Store",
    "des": "Visit a Kritalia & Co. store to discover the latest designs"
  }
];

kritaliaWidget(String itemName) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Description & Details:",
            style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14)),
        htmlDataWidget(itemName),
        const SpaceHeightWidget(height: 10),
      ],
    ),
  );
}

List<String> productCtgs = ["Wellness Care", "Kritalia & Co"];

class ProductCatScrollWidget extends StatelessWidget {
  final int selInd;
  final VoidCallback onTapFun;
  final int index;
  final String? title;
  const ProductCatScrollWidget(
      {super.key,
      required this.selInd,
      required this.onTapFun,
      required this.index,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: index == selInd
          ? SizedBox(
              height: 35,
              child: CustomFixedElevatedButton(
                  tColor: whiteColor,
                  color: darkBlue,
                  onTapFun: () {},
                  title: title ?? productCtgs[index]),
            )
          : InkWell(
              onTap: onTapFun,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: middleBlackColor)),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Center(
                  child: Text(
                    title ?? productCtgs[index],
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        color: blackColor,
                        fontSize: 12),
                  ),
                ),
              ),
            ),
    );
  }
}

class ViewRatingWidget extends StatelessWidget {
  final String productImage;
  final String productName;
  final VoidCallback reportFun;
  final VoidCallback helpfulfun;
  final String? reviewVideoData;
  final List<String>? reviewImagesData;
  final String name;
  final String date;
  final String review;
  final String rating;
  final String helpfulPersons;
  const ViewRatingWidget({
    super.key,
    required this.productImage,
    required this.productName,
    required this.reportFun,
    required this.helpfulfun,
    this.reviewImagesData,
    this.reviewVideoData,
    required this.date,
    required this.name,
    required this.rating,
    required this.review,
    required this.helpfulPersons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTitle(
                  titleName: name,
                  fontColor: middleBlackColor,
                  size: 14,
                  fontFamily: "OnestBold",
                ),
                CommonTitle(
                  titleName: date,
                  fontColor: middleBlackColor.withOpacity(0.6),
                  size: 13,
                )
              ],
            ),
            const SpaceHeightWidget(height: 4),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: double.parse(rating),
                  minRating: 1,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 18,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            const SpaceHeightWidget(height: 4),
            CommonTitle(
              titleName: review,
              fontColor: middleBlackColor,
              size: 14,
              fontFamily: "OnestSemiBold",
            ),
            const SpaceHeightWidget(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (reviewVideoData! != "")
                    SizedBox(
                      child: ReviewViWidget(
                        videoUrl: reviewVideoData!,
                        videoImgHeight: 100,
                      ),
                    ),
                  if (reviewImagesData!.isNotEmpty)
                    for (int i = 0; i < reviewImagesData!.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Get.to(() => HeroAnimationScreen(
                                  tagData: reviewImagesData![i],
                                ));
                          },
                          child: CommonCachedNetworkImage(
                            imagePath: reviewImagesData![i],
                            height: 100,
                            width: 80,
                            boxfit: BoxFit.fill,
                          ),
                        ),
                      ),
                ],
              ),
            ),
            const SpaceHeightWidget(height: 6),
            if (helpfulPersons != "0" && helpfulPersons != "")
              CommonTitle(
                titleName: "$helpfulPersons people found this helpful",
                size: 12,
                fontColor: middleBlackColor,
                fontFamily: "OnestRegular",
              ),
            const SpaceHeightWidget(height: 5),
            (true == true)
                ? SizedBox(
                    height: 25,
                    child: CustomAutoWidthButton(
                        onTapFun: helpfulfun, title: "Helpful"))
                : Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: greenColor,
                        child: Icon(
                          Icons.done_rounded,
                          size: 15,
                          color: whiteColor,
                        ),
                      ),
                      const SpaceWidthWidget(width: 2),
                      CommonTitle(
                        titleName: "Thank you for your feedback",
                        size: 12,
                        fontColor: greenColor,
                        fontFamily: "OnestSemiBold",
                      )
                    ],
                  ),
            const SpaceHeightWidget(height: 5),
            SizedBox(
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconElevatedButton(
                    buttonColor: darkBlue,
                    imagePath: '',
                    idata: Icons.share,
                    onTapFun: () async {
                      String imgUrl = "";
                      if (reviewImagesData!.isNotEmpty) {
                        imgUrl = reviewImagesData![0];
                      } else if (productImage != "") {
                        imgUrl = productImage;
                      }
                      if (imgUrl != "") {
                        final url = Uri.parse(imgUrl);
                        final response = await http.get(url);
                        final bytes = response.bodyBytes;
                        final temp = await getTemporaryDirectory();
                        final path = "${temp.path}/image.jpg";
                        File(path).writeAsBytesSync(bytes);
                        if (reviewVideoData != "") {
                          await Share.shareXFiles([XFile(path)],
                              text:
                                  "Product Name: $productName \nReview: $review \nVideo Review: $reviewVideoData \nApp link(Android): https://www.destina1.com");
                        } else {
                          await Share.shareXFiles([XFile(path)],
                              text:
                                  "Product Name: $productName \nReview: $review \nApp link(Android): https://www.destina1.com");
                        }
                      } else {
                        if (reviewVideoData != "") {
                          await Share.shareXFiles([],
                              text:
                                  "Product Name: $productName \nReview: $review \nVideo Review: $reviewVideoData \nApp link(Android): https://www.destina1.com");
                        } else {
                          await Share.shareXFiles([],
                              text:
                                  "Product Name: $productName \nReview: $review \nApp link(Android): https://www.destina1.com");
                        }
                      }
                    },
                    labelColor: whiteColor,
                    titile: 'Share',
                  ),
                  CustomAutoWidthButton(onTapFun: reportFun, title: "Report")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<dynamic> reportOptions = [
  {"title": "Off topic", "subtitle": "Not about the product"},
  {"title": "Inappropriate", "subtitle": "Disrespectful, hateful, obscene"},
  {"title": "Fake", "subtitle": "Paid for, inauthentic"},
  {"title": "Other", "subtitle": "Something else"},
];

class RportWidget extends StatelessWidget {
  final bool submitLoading;
  final VoidCallback submitFun;
  final Function(dynamic)? onchangeFun;
  final String gVal;
  const RportWidget(
      {super.key,
      required this.onchangeFun,
      required this.submitLoading,
      required this.gVal,
      required this.submitFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTitle(
              titleName: "Report this review",
              fontColor: darkBlue,
              size: 16,
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close))
          ],
        ),
        Row(
          children: [
            CommonTitle(
              titleName: "Optional: Why are you reporting this?",
              fontColor: middleBlackColor,
              size: 14,
              fontFamily: "OnestRegular",
            )
          ],
        ),
        for (int i = 0; i < reportOptions.length; i++)
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: reportOptions[i]['title'],
            groupValue: gVal,
            onChanged: onchangeFun,
            title: CommonTitle(
              titleName: reportOptions[i]['title'],
              size: 14,
              fontColor: blackColor,
              fontFamily: "OnestRegular",
            ),
            subtitle: CommonTitle(
              titleName: reportOptions[i]['subtitle'],
              size: 14,
              fontColor: middleBlackColor,
              fontFamily: "OnestRegular",
            ),
          ),
        RichText(
            text: TextSpan(
                text: "We'll check if this review meets our ",
                style: TextStyle(
                  fontSize: 14,
                  color: blackColor,
                  fontFamily: "OnestRegular",
                ),
                children: [
              TextSpan(
                  text: 'community guidelines.',
                  style: TextStyle(
                    fontSize: 13.5,
                    color: lightDarKBlue.withOpacity(0.8),
                    fontFamily: "OnestSemiBold",
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              TextSpan(
                text: " If it doesn't, we'll remove it.",
                style: TextStyle(
                  fontSize: 14,
                  color: blackColor,
                  fontFamily: "OnestRegular",
                ),
              )
            ])),
        const SpaceHeightWidget(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
              child: submitLoading
                  ? loader
                  : CustomAutoWidthButton(onTapFun: submitFun, title: "Submit"),
            ),
          ],
        )
      ]),
    );
  }
}

List<String> filterOptions = [
  "Image or video reviews only",
  "Positive reviews",
  "Critical reviews",
  "Clear All"
];

class ReviewFilter extends StatelessWidget {
  final Function(dynamic)? onchangeFun;
  final VoidCallback applyFun;
  final String rFVal;
  const ReviewFilter(
      {super.key,
      required this.onchangeFun,
      required this.rFVal,
      required this.applyFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeightWidget(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTitle(
                  titleName: "Filter",
                  fontColor: darkBlue,
                  size: 16,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            for (int i = 0; i < filterOptions.length; i++)
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                value: filterOptions[i],
                groupValue: rFVal,
                onChanged: onchangeFun,
                title: CommonTitle(
                  titleName: filterOptions[i],
                  size: 14,
                  fontColor: blackColor,
                  fontFamily: "OnestRegular",
                ),
              ),
            const SpaceHeightWidget(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  child:
                      CustomAutoWidthButton(onTapFun: applyFun, title: "Apply"),
                ),
              ],
            )
          ]),
    );
  }
}

class PdfWidget extends StatefulWidget {
  final String category;
  const PdfWidget({super.key, required this.category});

  @override
  State<PdfWidget> createState() => _PdfWidgetState();
}

class _PdfWidgetState extends State<PdfWidget> {
  double? progressVal;
  bool progressbar = false;
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();

    // widget.category == "Kritalia & Co"
    //     ? const SizedBox.shrink()
    //     : Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 CommonTitle(
    //                   titleName: "Download Broucher:",
    //                   fontColor: darkBlue,
    //                   size: 16,
    //                 ),
    //                 SizedBox(
    //                   // width: 130,
    //                   height: 30,
    //                   child: IconElevatedButton(
    //                     onTapFun: () {
    //                       if (progressbar == false) {
    //                         FileDownloader.downloadFile(
    //                             url:
    //                                 "https://admin.destina1.com/Resources/Mini%20Book%20web.pdf",
    //                             name:
    //                                 "https://admin.destina1.com/Resources/Mini%20Book%20web.pdf"
    //                                     .split('MemberDownloads/')
    //                                     .last, //(optional)
    //                             onProgress: (String? name, double? onProgress) {
    //                               setState(() {
    //                                 progressbar = true;
    //                                 progressVal = onProgress;
    //                                 if (progressVal == 100.0) {
    //                                   progressbar = false;
    //                                 }
    //                               });
    //                             },
    //                             onDownloadCompleted: (String path) {
    //                               CommonToastTrue("Successfully donwloaded");
    //                             },
    //                             onDownloadError: (String error) {
    //                               CommonToast(error);
    //                             });
    //                       }
    //                     },
    //                     idata: Icons.picture_as_pdf_outlined,
    //                     imagePath: '',
    //                     labelColor: whiteColor,
    //                     buttonColor: blackColor,
    //                     titile: "Download",
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             if (progressbar)
    //               Column(
    //                 children: [
    //                   const SpaceHeightWidget(height: 10),
    //                   LinearProgressIndicator(
    //                     borderRadius: BorderRadius.circular(10),
    //                     value: progressVal! / 100.00,
    //                   ),
    //                   const SpaceHeightWidget(height: 10)
    //                 ],
    //               ),
    //           ],
    //         ),
    //       );
  }
}

class RatingBarWidget extends StatelessWidget {
  final int index;
  final String percentage;
  const RatingBarWidget(
      {super.key, required this.index, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonTitle(
            titleName: "$index star",
            size: 14,
            fontFamily: "OnestRegular",
            fontColor: lightDarKBlue,
          ),
          const SpaceWidthWidget(width: 10),
          Expanded(
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(3.5),
              minHeight: 20,
              value: double.parse(percentage),
              backgroundColor: lightBlackColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.amber,
              ),
            ),
          ),
          const SpaceWidthWidget(width: 10),
          SizedBox(
            width: 43,
            child: CommonTitle(
              titleName: "$percentage%",
              size: 14,
              fontFamily: "OnestRegular",
              fontColor: lightDarKBlue,
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewVideoWidget extends StatefulWidget {
  final String videoUrl;
  final double videoImgHeight;
  final VoidCallback? onTapFun;
  const ReviewVideoWidget(
      {super.key,
      required this.videoUrl,
      required this.videoImgHeight,
      this.onTapFun});

  @override
  State<ReviewVideoWidget> createState() => _ReviewVideoWidgetState();
}

class _ReviewVideoWidgetState extends State<ReviewVideoWidget> {
  late YoutubePlayerController _ycontroller;
  String videoId = "";
  String thumbNailImg = "";

  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    thumbNailImg = YoutubePlayer.getThumbnail(videoId: videoId);

    _ycontroller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
            autoPlay: false, mute: false, hideThumbnail: false));
    super.initState();
  }

  @override
  void dispose() {
    _ycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTapFun ??
            () {
              Get.dialog(Dialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                backgroundColor: whiteColor,
                insetPadding: const EdgeInsets.all(10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: YoutubePlayer(
                    controller: _ycontroller,
                    showVideoProgressIndicator: true,
                  ),
                ),
              ));
            },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: widget.videoImgHeight,
                  child: YoutubePlayer(
                    bottomActions: const [],
                    topActions: const [],
                    controller: _ycontroller,
                    showVideoProgressIndicator: true,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: darkRedColor,
                  radius: 18,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: whiteColor,
                    size: 35,
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class ReviewViWidget extends StatefulWidget {
  final String videoUrl;
  final double videoImgHeight;
  final double? videoImgWidth;
  const ReviewViWidget(
      {super.key,
      required this.videoUrl,
      required this.videoImgHeight,
      this.videoImgWidth});

  @override
  State<ReviewViWidget> createState() => _ReviewViWidgetState();
}

class _ReviewViWidgetState extends State<ReviewViWidget> {
  File? img;
  infoFun() async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: widget.videoUrl,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxHeight:
          64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    if (fileName != null) {
      if (mounted) {
        setState(() {
          img = File(fileName);
        });
      }
    }
  }

  @override
  void initState() {
    infoFun();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Get.to(() => VideoDisplayScreen(
                videoUrl: widget.videoUrl,
              ));
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    child: (img != null)
                        ? Image.file(
                            img!,
                            height: 100,
                            width: 160,
                            fit: BoxFit.cover,
                          )
                        : const CommonCachedNetworkImage(
                            imagePath: "",
                            height: 100,
                          )),
                CircleAvatar(
                  backgroundColor: darkRedColor,
                  radius: 18,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: whiteColor,
                    size: 35,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
