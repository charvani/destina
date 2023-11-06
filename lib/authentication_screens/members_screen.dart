import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../dashboard_screens/products_screen.dart';

class MemberScreen extends StatefulWidget {
  final String fromCountry;
  const MemberScreen({super.key, required this.fromCountry});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  bool ddcTap = true;
  bool ddTap = false;
  List ddcInfo = [
    {
      "title": "Resell products for a profit",
      "image_path": "assets/images/resell.jpe"
    },
    {
      "title": "Shop at any DESTINA 1 stocklist nationwide!",
      "image_path": "assets/images/stockist.jpe"
    },
    {
      "title": "Build your business with a strong support system",
      "image_path": "assets/images/build-business.jpe"
    },
    {
      "title": "Earn unlimited income and bonuses",
      "image_path": "assets/images/income.jpe"
    },
    {
      "title":
          "Buy Products and Accumulate the sales to Upgrade your Shopper level",
      "image_path": "assets/images/accumulate.jpe"
    },
  ];
  List ddInfo = [
    {
      "title": "Resell products for a profit",
      "image_path": "assets/images/resell.jpe"
    },
    {
      "title": "Build your business with a strong support system",
      "image_path": "assets/images/build-business.jpe"
    },
    {
      "title": "Earn unlimited income and bonuses",
      "image_path": "assets/images/income.jpe"
    },
    {
      "title": "Physical copy of the D1 Welcome Pack System",
      "image_path": "assets/images/packsystem.jpe"
    },
    {
      "title": "Directly Decide on the Shopper Level to Enjoy Higher Bonuses",
      "image_path": "assets/images/higher-bonus.jpe"
    },
    {
      "title": "Enjoy Many more benefits",
      "image_path": "assets/images/more-benefits.jpe"
    },
  ];
  late List applicationInfo = [
    {"title": "18 Years and above", "image_path": "assets/images/age.jpe"},
    {
      "title":
          "Must be a Citizen or Permanent Resident of ${widget.fromCountry}",
      "image_path": "assets/images/${widget.fromCountry}.png"
    },
    {"title": "RM 55.00", "image_path": "assets/images/signupfree.jpe"},
  ];

  List<String> ddcTerms = [
    "I hereby declare that the above particulars are true and correct and i will adhere to the Terms and Conditions",
    "I affirm that i have read and understand. Direct Sales Contract and Cooling Off Period Terms I/We hereby waive the right to a cooling-off period.",
    "Yes, the DESTINA 1 INTERNATIONAL business model was presented to me in full detail and all my questions have been answered to my full satisfaction.",
    "Yes, the person who introduced me to DESTINA 1 INTERNATIONAL treated me fairly at all times.",
    "I have read and agree to the policies and procedures.",
    "I agree to comply with the Code of Ethics",
    "I accept and understand the Earnings and Income Disclaimer",
    "I acknowledge and understand that the information submitted by me will be kept, maintained and processed securely for the purposes as outlined in the Company's which can be accessed here",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightBlackColor,
          bottom: PreferredSize(
            preferredSize: const Size(1000, 50),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  color: whiteColor,
                  margin: const EdgeInsets.all(0),
                  borderOnForeground: false,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListTile(
                      leading: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ),
                const SpaceHeightWidget(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomMemberButton(
                          imagePath: "assets/images/single_employee.png",
                          textColor: ddcTap ? lightDarKBlue : blackColor,
                          onTapFun: () {
                            setState(() {
                              ddcTap = !ddcTap;
                              ddTap = !ddTap;
                            });
                          },
                          activeColor: ddcTap
                              ? lightDarKBlue
                              : lightBlackColor.withOpacity(0.4),
                          title: "Become a DDC"),
                      const SpaceWidthWidget(width: 12),
                      CustomMemberButton(
                          imagePath: "assets/images/team_employee.png",
                          textColor: ddTap ? lightDarKBlue : blackColor,
                          onTapFun: () {
                            setState(() {
                              ddcTap = !ddcTap;
                              ddTap = !ddTap;
                            });
                          },
                          activeColor: ddTap
                              ? lightDarKBlue
                              : lightBlackColor.withOpacity(0.4),
                          title: "Become an DD"),
                    ],
                  ),
                ),
              ],
            ),
          )),
      // backgroundColor: whiteColor.withOpacity(0.95),

      body: Container(
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ddcTap
                  ? MemberScreenInfoWidget(
                      activeColor: darkNaviBlueColor,
                      titleText: "DIRECT CUSTOMER AND BECOME A DISTRIBUTOR",
                      ddcInfo: ddcInfo,
                      applicationInfo: applicationInfo,
                    )
                  : MemberScreenInfoWidget(
                      activeColor: darkRedColor,
                      titleText: "DISTRIBUTOR",
                      ddcInfo: ddInfo,
                      applicationInfo: applicationInfo,
                    ),
              const SpaceHeightWidget(height: 10),
              Container(
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: lightBlackColor),
                    borderRadius: BorderRadius.circular(8),
                    color: ddcTap
                        ? darkNaviBlueColor.withOpacity(0.1)
                        : darkRedColor.withOpacity(0.09)),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SpaceHeightWidget(height: 10),
                    Text(
                      "TERMS & CONDITIONS",
                      style: TextStyle(
                          fontFamily: "OnestBold",
                          fontSize: 16,
                          color: ddcTap ? darkNaviBlueColor : darkRedColor),
                    ),
                    const SpaceHeightWidget(height: 10),
                    for (int i = 0; i < ddcTerms.length; i++)
                      CustomBulletTextWidget(
                          data: ddcTerms[i],
                          textColor: ddcTap ? darkNaviBlueColor : darkRedColor)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ddcTap
                      ? "I Want to shop Destina1 products and become a distributor later"
                      : "I want to start my Destina1 business now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "OnestBold", fontSize: 16, color: blackColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 19),
                  child: SizedBox(
                    height: 45,
                    width: 200,
                    child: CommonOulineTextButton(
                        titleFontSize: 15,
                        borderColor: ddcTap ? darkNaviBlueColor : darkRedColor,
                        textColor: whiteColor,
                        backgroundColor:
                            ddcTap ? darkNaviBlueColor : darkRedColor,
                        onTapFun: () {
                          Get.to(() =>
                              // RegisterScreen(from: ddcTap ? "ddc" : "dd"));
                              const ProductsScreen(from: "register",));
                        },
                        title: ddcTap ? "Become a DDC" : "Become a DD"),
                  ),
                ),
              ),
              const SpaceHeightWidget(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
