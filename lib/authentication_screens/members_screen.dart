import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../inside_screens/packages_screen.dart';

class MemberScreen extends StatefulWidget {
  final String countryId;
  const MemberScreen({super.key, required this.countryId});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  bool ddcTap = false;
  bool ddTap = true;
  bool pcTap = false;
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
  List applicationInfo = [];

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

  final MainController checkController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getData();
      },
    );
  }

  getData() async {
    dynamic res = await checkController.getcheckCountry(widget.countryId);
    if ((double.parse(checkController.checkCountryData.value.pCiRenFee)
                .round() >
            0 &&
        double.parse(checkController.checkCountryData.value.pcRenF).round() >
            0)) {
      pcTap = true;

      ddcTap = false;
      ddTap = false;
    } else if ((double.parse(checkController.checkCountryData.value.dCiRenFee)
                .round() >
            0 &&
        double.parse(checkController.checkCountryData.value.dcRenF).round() >
            0)) {
      pcTap = false;
      ddcTap = true;
      ddTap = false;
    }
    //  else if ((double.parse(checkController.checkCountryData.value.diRenFee)
    //             .round() >
    //         0 &&
    //     double.parse(checkController.checkCountryData.value.dRenF).round() >
    //         0)) {
    //   pcTap = false;
    //   ddcTap = false;
    //   ddTap = true;
    // }
    applicationInfo = [
      {"title": "18 Years and above", "image_path": "assets/images/age.jpe"},
      {
        "title":
            "Must be a Citizen or Permanent Resident of ${checkController.checkCountryData.value.name}",
        "image_path": checkController.checkCountryData.value.countryFlag,
      },
      {
        "title": "",
        //  pcTap
        // ? checkController.checkCountryData.value.pcRenFee
        // : ddcTap
        //     ? checkController.checkCountryData.value.dcRenFee
        //     : checkController.checkCountryData.value.dRenFee,
        "image_path": "assets/images/signupfree.jpe"
      },
    ];
    print("chck country...$res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: lightBlackColor,
        toolbarHeight: 50,
        flexibleSpace: SafeArea(
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
            ],
          ),
        ),
      ),
      body: Obx(() {
        return checkController.loading.value
            ? loader
            // : (
            // (double.parse(checkController.checkCountryData.value.pCiRenFee)
            //                   .round() >
            //               0 &&
            //           double.parse(checkController
            //                       .checkCountryData.value.pcRenF)
            //                   .round() >
            //               0) ||
            //       (double.parse(checkController
            //                       .checkCountryData.value.dCiRenFee)
            //                   .round() >
            //               0 &&
            //           double.parse(checkController
            //                       .checkCountryData.value.dcRenF)
            //                   .round() >
            //               0)
            //         ||
            // (double.parse(checkController.checkCountryData.value.diRenFee)
            //             .round() >
            //         0 &&
            //     double.parse(
            //                 checkController.checkCountryData.value.dRenF)
            //             .round() >
            //         0)
            // )
            : Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 1000,
                      height: 55,
                      color: lightBlackColor,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SpaceWidthWidget(width: 3),
                            if (double.parse(checkController
                                            .checkCountryData.value.pCiRenFee)
                                        .round() >
                                    0 &&
                                double.parse(checkController
                                            .checkCountryData.value.pcRenF)
                                        .round() >
                                    0)
                              CustomMemberButton(
                                  imagePath:
                                      "assets/images/single_employee.png",
                                  textColor: pcTap ? lightDarKBlue : blackColor,
                                  onTapFun: () {
                                    setState(() {
                                      pcTap = true;
                                      ddcTap = false;
                                      ddTap = false;
                                    });
                                  },
                                  activeColor: pcTap
                                      ? lightDarKBlue
                                      : lightBlackColor.withOpacity(0.4),
                                  title: "Become a PC"),
                            const SpaceWidthWidget(width: 7),
                            if (double.parse(checkController
                                            .checkCountryData.value.dCiRenFee)
                                        .round() >
                                    0 &&
                                double.parse(checkController
                                            .checkCountryData.value.dcRenF)
                                        .round() >
                                    0)
                              CustomMemberButton(
                                  imagePath:
                                      "assets/images/single_employee.png",
                                  textColor:
                                      ddcTap ? lightDarKBlue : blackColor,
                                  onTapFun: () {
                                    setState(() {
                                      ddcTap = true;
                                      ddTap = false;
                                      pcTap = false;
                                    });
                                  },
                                  activeColor: ddcTap
                                      ? lightDarKBlue
                                      : lightBlackColor.withOpacity(0.4),
                                  title: "Become a DDC"),
                            const SpaceWidthWidget(width: 7),
                            // if (double.parse(checkController
                            //                 .checkCountryData
                            //                 .value
                            //                 .diRenFee)
                            //             .round() >
                            //         0 &&
                            //     double.parse(
                            //                 checkController.checkCountryData
                            //                     .value.dRenF)
                            //             .round() >
                            //         0)
                            CustomMemberButton(
                                imagePath: "assets/images/team_employee.png",
                                textColor: ddTap ? lightDarKBlue : blackColor,
                                onTapFun: () {
                                  setState(() {
                                    ddTap = true;

                                    ddcTap = false;
                                    pcTap = false;
                                  });
                                },
                                activeColor: ddTap
                                    ? lightDarKBlue
                                    : lightBlackColor.withOpacity(0.4),
                                title: "Become a DD"),
                            const SpaceWidthWidget(width: 7),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // height: 800,
                        color: whiteColor,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (double.parse(checkController
                                              .checkCountryData.value.pCiRenFee)
                                          .round() >
                                      0 &&
                                  double.parse(checkController
                                              .checkCountryData.value.pcRenF)
                                          .round() >
                                      0 &&
                                  (pcTap == true))
                                MemberScreenInfoWidget(
                                  signupFun: () {
                                    Get.to(() => PackageScreen(
                                          from: ddcTap
                                              ? "DDC"
                                              : ddTap
                                                  ? "DD"
                                                  : "PC",
                                          countryId: widget.countryId,
                                        ));
                                  },
                                  amount: checkController
                                      .checkCountryData.value.pcRenFee,
                                  questioningText:
                                      "Why Become a Preferred Customer?",
                                  heading1: "START SHOPPING",
                                  activeColor: darkBlue,
                                  heading2:
                                      "QUALITY PRODUCTS AS A PREFERRED CUSTOMER",
                                  ddcInfo: ddInfo,
                                  applicationInfo: applicationInfo,
                                ),
                              if (double.parse(checkController
                                              .checkCountryData.value.dCiRenFee)
                                          .round() >
                                      0 &&
                                  double.parse(checkController
                                              .checkCountryData.value.dcRenF)
                                          .round() >
                                      0 &&
                                  (ddcTap == true))
                                MemberScreenInfoWidget(
                                  signupFun: () {
                                    Get.to(() => PackageScreen(
                                          from: ddcTap
                                              ? "DDC"
                                              : ddTap
                                                  ? "DD"
                                                  : "PC",
                                          countryId: widget.countryId,
                                        ));
                                  },
                                  amount: checkController
                                      .checkCountryData.value.dcRenFee,
                                  questioningText:
                                      "Why Become a Direct Customer & Become a Distributor?",
                                  heading1: "START YOUR BUSINESS",
                                  activeColor: darkNaviBlueColor,
                                  heading2:
                                      "AS A DESTINA 1 DIRECT CUSTOMER AND BECOME A DISTRIBUTOR",
                                  ddcInfo: ddcInfo,
                                  applicationInfo: applicationInfo,
                                ),
                              if (

                                  // double.parse(checkController
                                  //               .checkCountryData
                                  //               .value
                                  //               .diRenFee)
                                  //           .round() >
                                  //       0 &&
                                  //   double.parse(checkController
                                  //               .checkCountryData.value.dRenF)
                                  //           .round() >
                                  //       0 &&
                                  (ddTap == true))
                                MemberScreenInfoWidget(
                                  signupFun: () {
                                    Get.to(() => PackageScreen(
                                          from: ddcTap
                                              ? "DDC"
                                              : ddTap
                                                  ? "DD"
                                                  : "PC",
                                          countryId: widget.countryId,
                                        ));
                                  },
                                  amount: checkController
                                      .checkCountryData.value.dRenFee,
                                  questioningText: "Why Become a Distributor?",
                                  heading1: "START YOUR BUSINESS",
                                  activeColor: darkRedColor,
                                  heading2: "AS A DESTINA 1 DISTRIBUTOR",
                                  ddcInfo: ddInfo,
                                  applicationInfo: applicationInfo,
                                ),
                              const SpaceHeightWidget(height: 10),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: lightBlackColor),
                                      borderRadius: BorderRadius.circular(8),
                                      color: ddcTap
                                          ? darkNaviBlueColor.withOpacity(0.1)
                                          : ddTap
                                              ? darkRedColor.withOpacity(0.09)
                                              : darkBlue.withOpacity(0.05),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        const SpaceHeightWidget(height: 10),
                                        Text(
                                          "TERMS & CONDITIONS",
                                          style: TextStyle(
                                            fontFamily: "OnestBold",
                                            fontSize: 16,
                                            color: ddcTap
                                                ? darkNaviBlueColor
                                                : ddTap
                                                    ? darkRedColor
                                                    : darkBlue,
                                          ),
                                        ),
                                        const SpaceHeightWidget(height: 10),
                                        for (int i = 0;
                                            i < ddcTerms.length;
                                            i++)
                                          CustomBulletTextWidget(
                                            data: ddcTerms[i],
                                            textColor: ddcTap
                                                ? darkNaviBlueColor
                                                : ddTap
                                                    ? darkRedColor
                                                    : darkBlue,
                                          )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ddcTap || pcTap
                                          ? "I Want to shop Destina1 products and become a distributor later"
                                          : "I want to start my Destina1 business now",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "OnestBold",
                                          fontSize: 16,
                                          color: blackColor),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 19),
                                      child: SizedBox(
                                        height: 45,
                                        width: 200,
                                        child: CommonOulineTextButton(
                                            titleFontSize: 15,
                                            borderColor: ddcTap
                                                ? darkNaviBlueColor
                                                : ddTap
                                                    ? darkRedColor
                                                    : darkBlue,
                                            textColor: whiteColor,
                                            backgroundColor: ddcTap
                                                ? darkNaviBlueColor
                                                : ddTap
                                                    ? darkRedColor
                                                    : darkBlue,
                                            onTapFun: () {
                                              Get.to(() => PackageScreen(
                                                    from: ddcTap
                                                        ? "DDC"
                                                        : ddTap
                                                            ? "DD"
                                                            : "PC",
                                                    countryId: widget.countryId,
                                                  ));
                                            },
                                            title: ddcTap
                                                ? "Become a DDC"
                                                : ddTap
                                                    ? "Become a DD"
                                                    : "Become a PC"),
                                      ),
                                    ),
                                  ),
                                  const SpaceHeightWidget(height: 10)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
        // : SizedBox(
        //     height: 300,
        //     child: notAvailableW,
        //   );
      }),
    );
  }
}
