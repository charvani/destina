import 'dart:convert';

import 'package:destina_1_international/authentication_screens/register_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_call/encryption.dart';

class EnrollPackageScreen extends StatefulWidget {
  const EnrollPackageScreen({super.key});

  @override
  State<EnrollPackageScreen> createState() => _EnrollPackageScreenState();
}

class _EnrollPackageScreenState extends State<EnrollPackageScreen> {
  List enrollInfoImages = [
    "assets/images/virtual_office.png",
    "assets/images/estores.png",
    "assets/images/redemption.png",
    "assets/images/commissions.png",
    "assets/images/mobileapps.png",
    "assets/images/tools.png",
    "assets/images/bussiness_card.png",
  ];
  finalFun() async {
    // final Map<String, dynamic> parameters = {
    //   "action": "GetSalesSingleproductdata",
    //   "pcode": "MYD1SLS09",
    //   "country": "1"
    // };
    // dynamic dear = Encrypt.encryptJsonObjectResponse(json.encode(parameters));
    final Map<String, dynamic> parameters = {
      "action": "HEALTH CARE",
      "pcode": "0",
      "country": "MY"
    };
    dynamic dear = Encrypt.encryptStringResponse(json.encode(parameters));
    print(" de....$dear}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finalFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "EnrollPackage", backNavigation: true),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/enroll_package_banner.png",
            height: 210,
            fit: BoxFit.fill,
          ),
          Container(
            margin: const EdgeInsets.only(top: 0.3),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: darkRedColor,
            child: Text(
              "12 Months Enrollment Package Is Activated For RM55",
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "OnestBold", fontSize: 16, color: whiteColor),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < enrollInfoImages.length; i++)
                Transform.translate(
                  offset: i == 6 ? const Offset(0, -40) : const Offset(0, 0),
                  child: Image.asset(
                    enrollInfoImages[i],
                    height: 160,
                    width: 160,
                  ),
                )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomElevatedButton(
                onTapFun: () {
                  Get.to(() => const RegisterScreen(from: "enroll_package"));
                },
                title: "Submit"),
          ),
          const SpaceHeightWidget(height: 20)
        ]),
      ),
    );
  }
}
