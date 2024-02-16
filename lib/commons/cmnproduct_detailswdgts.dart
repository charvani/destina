import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/biomatriximage_model.dart';
import 'colors.dart';
import 'common_widgets.dart';

Widget pendentWidget() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              "assets/images/leaf.png",
              // height: 55,
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SpaceHeightWidget(height: 5),
                CommonTitle(
                  titleName: "Our Discovery of Uniwave Pendent",
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
              titleName: "Before using Uniwave Pendent by Quantes Technology",
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
                  "30 minutes after using Uniwave Pendent by Quantes Technology",
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
                  '3. A proprietary "energisation" process technology based on the principles of Quantum Physics.',
              size: 12,
              fontFamily: "OnestRegular",
            ),
          ],
        ),
      ),
      const SpaceHeightWidget(height: 15),
      const CommonTitle(
        titleName: "THE RESULTS :",
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
    ],
  );
}

List<String> pendentResultData = [
  "A re-balanced biofield & stability.",
  "Significant protection from EMF, including 5G and Geopathic Stress.",
  "Improved Physical performance.",
  "Energy flow and qualitative balance is restored.",
  "Having a quality sleep.",
  "Enhance positivity and creativity.",
  "Rejuvenation of cells.",
  "Increase Energy Levels.",
  "Improve focus and concentration.",
  "Neutralize harmful manmade and natural frequencies transmitted into beneficial energies.",
  "Boost endurance, strength and vitality.",
  "Enhance the body's flexibility.",
  "Strengthen the body's immune system .",
  "Trigger the production of stem cells for new cell formation.",
  "Provide optimum energy for the healthy lifestyle.",
];
Widget flaskWidget() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/leaf.png",
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                CommonTitle(
                  titleName: "What is the Uniwave Flask",
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
      for (int i = 0; i < 3; i++)
        UniwaveProductDetails(
          dataText: i == 0
              ? "Rejuvenation of cells"
              : i == 1
                  ? "Trigger the production of stem cells for new cell formation"
                  : " Provide optimum energy for the healthy lifestyle",
        ),
      const SpaceHeightWidget(height: 18),
      const CommonTitle(
        titleName: "Benefits of Uniwave Flask",
        fontFamily: "OnestSemiBold",
        size: 15.5,
      ),
      const SpaceHeightWidget(height: 8),
      for (int i = 0; i < flaskBenfitsData.length; i++)
        UniwaveProductDetails(
          dataText: flaskBenfitsData[i],
        ),
      const SpaceHeightWidget(height: 15),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset("assets/images/uniwave_flask.jpg"),
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
              titleName: "Energised Water(10 min)",
              fontFamily: "OnestSemiBold",
              size: 14,
            ),
            const CommonTitle(
              titleName:
                  "Same distilled water energised by Uniwave Alkaline Water Flask & Water Stick by Quantes Technology",
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
                    'Transforms regular water into "living Water" for improved blood circulation, enhances the body\'s energy level, reduces inflammation and gives us anti-ageing effects'),
            const SpaceHeightWidget(height: 5),
            const UniwaveRitchTextWidget(
                boldText: "2. Alkaline Balance :",
                plainText:
                    'Neutralizes acidity, ensuring a balanced pH level, particularly beneficial for smokers and alcohol consumers.'),
            const SpaceHeightWidget(height: 5),
            const UniwaveRitchTextWidget(
                boldText: "3. Antioxidant Power :",
                plainText:
                    "Transforms water into a potent antioxidant, combating diseases with an ORP of -380mV to -400mV."),
            const SpaceHeightWidget(height: 5),
            const UniwaveRitchTextWidget(
                boldText: "4. Enhanced Hydration :",
                plainText:
                    'Reduces water molecule size for superior cellular hydration, aiding in detoxification and metabolism.'),
            const SpaceHeightWidget(height: 5),
          ],
        ),
      ),
      const SpaceHeightWidget(height: 15),
      const CommonTitle(
        titleName: "THE RESULTS :",
        fontFamily: "OnestSemiBold",
        size: 15,
      ),
      const SpaceHeightWidget(height: 8),
      for (int i = 0; i < flaskResultData.length; i++)
        UniwaveProductDetails(dataText: flaskResultData[i]),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Image.asset(
      //         "assets/images/leaf.png",
      //         height: 30,
      //       ),
      //       Expanded(
      //         flex: 2,
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: 6),
      //           child: CommonTitle(
      //             titleName: flaskResultData[i],
      //             fontFamily: "OnestSemiBold",
      //             size: 12.5,
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      const SpaceHeightWidget(height: 15),
      Image.asset(
        "assets/images/uniwave_flask2.jpg",
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
            maifanshiWidget()
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
        data: "Improve overall well-being.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Helps alleviate fatigue and improve vitality.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Better sleep by creating a calming and soothing environment.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Better blood circulation, relieve muscle and joint pain, and aid in detoxification.",
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
        data: "Help relieve stress and tension.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Help in better oxygen and nutrient delivery to cells.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Help draw out toxins from the body when applied in massages.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data: "Help in reducing puffiness and improving skin tone.",
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
        data:
            "It can inhibit the growth of harmful bacteria and microorganisms, which may help in preventing infections.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Support the immune system by enhancing the body's ability to fight off infections.",
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
        data: "It helps in cleansing the system and supporting overall health.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Help balance the body's pH levels, creating an environment where harmful pathogens are less likely to thrive.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Help in maintaining kidney health by assisting in the removal of waste and toxins from the bloodstream.",
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
        data:
            "Help remove dead skin cells, leaving your skin smoother and rejuvenated.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Can aid in detoxifying the skin by drawing out impurities and toxins from the pores.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "These minerals can nourish the skin and promote a more radiant appearance.",
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
            "Maintaining healthy bones, muscles, and overall bodily functions.",
        verticalPadding: 0,
      ),
      const CustomBulletTextWidget(
        data:
            "Help neutralize excess acidity in the body, potentially aiding in digestion and reducing acid-related discomfort.",
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
  "Energises water to enhance nutritional uptake",
  "Reduce letharpy",
  "Aids in detoxification of cells",
  "Reduce the acidity in the body",
  "Aids in detoxification of cells",
  "Reduce the acidity in the body",
  "Maintain pH level",
  "Treat acid reflux",
  "Increases energy and well-being",
  "Helps in weight loss",
  "May overcome skin problems",
  "Enhance the immune system",
  "Helps to reduce the effects caused by environmental stress",
  "Reduce the oxidative stress in the cells",
  "Prevent the formation of Free Radicals",
  "Act against cancer cells",
  "Regulate the blood pressure"
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
        UniwaveProductDetails(
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
        UniwaveProductDetails(
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
                  "GFC is a patented technology that is a high protein isolate extracted from colostrum and contains high levels of insulin- like growth factor(IGF) and Epidermal Growth Factor(EGF).",
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 5),
            const CommonTitle(
              titleName:
                  "GFC can stimulate the formation of new stem cells, which will then group to form new epidermis and dermis to replace the old and dying cells in the human body.",
              size: 12,
              fontFamily: "OnestRegular",
            ),
            const SpaceHeightWidget(height: 5),
            const CommonTitle(
              titleName:
                  "Growth Factors have long been known as an effective treatment for various diseases. We developed growth factor concentrate (GFC) from platelets and evaluated their clinical outcome in nasolabial folds.",
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
        "assets/images/scalarvia2.jpg",
        height: 170,
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
              offset: const Offset(20, -10),
              child: Image.asset(
                "assets/images/leaf.png",
                height: 55,
              ),
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
          children: [
            Transform.translate(
              offset: const Offset(10, -10),
              child: Image.asset(
                "assets/images/leaf.png",
                height: 55,
              ),
            ),
            Flexible(
              child: CommonTitle(
                titleName: "What is the Uniwave Biomatrix Sheild",
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
              "The Uniwave Biomatrix Shield is a unique wellness solution that protects your body from the harmful effects of electro-smog exposure from mobile phones, computers, laptops, and televisions.",
          fontFamily: "OnestSemiBold",
          size: 12.5,
          fontColor: middleBlackColor,
          textAlign: TextAlign.center,
        ),
        const SpaceHeightWidget(height: 15),
        CommonTitle(
          titleName:
              "Your Biomatrix Shield goes wherever you go by discreetly attaching to your electronic devices. Thus, the uniwave Biomatrix Shield will help those affected by electro-sensitivesness and act as a preventative measure for your future protection.",
          fontFamily: "OnestSemiBold",
          size: 12.5,
          fontColor: middleBlackColor,
          textAlign: TextAlign.center,
        ),
        const SpaceHeightWidget(height: 15),
        CommonTitle(
          titleName:
              "Using a unique nano stealth technology is an essential radiant absorbent and EMF/EMR harmonizer.",
          fontFamily: "OnestSemiBold",
          size: 12.5,
          fontColor: middleBlackColor,
          textAlign: TextAlign.center,
        ),
        const SpaceHeightWidget(height: 15),
        CommonTitle(
          titleName:
              "This technology helps to absorb and eliminate harmful EMR/EMF radiation emitted form electronic and mobile devices.",
          fontFamily: "OnestSemiBold",
          size: 12.5,
          fontColor: middleBlackColor,
          textAlign: TextAlign.center,
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
                ? "Reduce detection by harmonizing electromagnetic waves from radars"
                : i == 1
                    ? "This technology can neutralize the EMR & EMF Radiation"
                    : "360-degree protection with smart scalar wave technology",
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
              "Dr Om Gandhi (University of Utah) shows how radiation penetrates the skull 5year old children absorb 10 times more EMR & EMF radiation than an adult.",
          fontFamily: "OnestRegular",
          size: 12.5,
          fontColor: middleBlackColor,
        ),
      ],
    ),
  );
}

List<String> biomatrixBenfitsData = [
  "Restores balance & harmony in the body",
  "Harmonize harmful EMF and EMR",
  "Strengthens the body's biofield",
  "Reduces cellular inflammation",
  "Regulates body temperature"
];

List<BiomatrixImageData> bimatrixImageData = [
  BiomatrixImageData(
      imageName: "phone",
      title1: "Mobile Phone",
      title2: "1 BMS centered on the center of the back cover of the phone",
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
    title2: "1 BMS on front(Centerd)",
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
    title1: "Hair Drye",
    title2: "1 BMS on any flat surfaceof dryer",
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
        const Text("Description & Details",
            style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14)),
        CommonTitle(
          titleName: itemName == "Kritalia`s Essence of Love"
              ? "An exquisite collection of heart-themed jewelry that perfectly blends elegance and affection. Featured prominently is a captivating large heart pendant, its silhouette outlined with a multitude of meticulously set, dazzling round-cut diamonds that exude an irresistible sparkle"
              : "This elegant bracelet is a modern twist on the classic charm, offering a sleek and sophisticated design. The highlight of this bracelet is the charming heart-shaped pendant with a smooth enamel finish in a striking shade of turquoise. This pop of color adds a playful yet chic element to the bracelet, making it a standout accessory that will capture attention.",
          fontColor: middleBlackColor,
          size: 12,
          fontFamily: "OnestRegular",
        ),
        const SpaceHeightWidget(height: 10),
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: purpleColor.withOpacity(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("THE KRITALIA EXPERIENCE",
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14)),
              const SpaceHeightWidget(height: 10),
              const Text(
                  "When you choose Kritalia & Co., you become a valued member of the Kritalia family. Since 1937, we’ve prided ourselves on providing premium service, a tradition that continues to this day.",
                  style: TextStyle(fontFamily: "OnestRegular", fontSize: 12)),
              const SpaceHeightWidget(height: 10),
              const CommonDivider(),
              for (int i = 0; i < kritaliaExpData.length; i++)
                KristaliaTileWidget(
                    title: kritaliaExpData[i]['title'],
                    data: kritaliaExpData[i]['des'])
            ],
          ),
        ),
      ],
    ),
  );
}

List<String> productCtgs = [
  "Health Care",
  "Hair Care",
  "Skin Care",
  "Kritalia"
];

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
      this.title
      });

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
                child: Text(
             title ??     productCtgs[index],
                  style: TextStyle(
                      fontFamily: "OnestSemiBold",
                      color: blackColor,
                      fontSize: 14),
                ),
              ),
            ),
    );
  }
}

viewRatingWidget() {
  return Card(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTitle(
                titleName: "Charvani",
                fontColor: middleBlackColor,
                size: 14,
                fontFamily: "OnestBold",
              ),
              CommonTitle(
                titleName: "10 oct 2023",
                fontColor: middleBlackColor.withOpacity(0.6),
                size: 13,
              )
            ],
          ),
          const SpaceHeightWidget(height: 4),
          RatingBar.builder(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 18,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SpaceHeightWidget(height: 4),
          CommonTitle(
            titleName: "Very healthy product for us.",
            fontColor: middleBlackColor,
            size: 14,
            fontFamily: "OnestSemiBold",
          ),
        ],
      ),
    ),
  );
}
