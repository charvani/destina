import 'package:destina_1_international/authentication_screens/register_screen.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';

class MemberScreen extends StatefulWidget {
  final String fromCountry;
  const MemberScreen({super.key, required this.fromCountry});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  bool ddcTap = true;
  bool ddTap = false;
  List<String> privilegeData = [
    "Buy products at Destina 1 Dealer Price. And continue to build a business to earn more money.",
    "Get all kinds of discounts and special discounts according to Destina 1's business plan sourced from sponsors and create a business group to have continuous sales",
    "Get insurance coverage in hte amount of 1,00,000 baht according to the conditions specified by the company.",
    "Get Montly magazine to receive product, promotion and business information.",
    "Free Health and beauty examination.",
    "Buy products at Destina 1 Dealer Price. And continue to build a business to earn more money.",
    "Get all kinds of discounts and special discounts according to Destina 1's business plan sourced from sponsors and create a business group to have continuous sales",
    "Get insurance coverage in hte amount of 1,00,000 baht according to the conditions specified by the company.",
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
      bottomSheet: Container(
        alignment: Alignment.center,
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 19),
          child: CustomElevatedButton(
              onTapFun: () {
                Get.to(() => RegisterScreen(from: ddcTap ? "ddc" : "dd"));
              },
              title: ddcTap ? "Join as DDC" : "Join as DD"),
        ),
      ),
      body: Container(
        color: lightBlackColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(ddcTap
                            ? "assets/images/member_image.png"
                            : "assets/images/abo_image.png"),
                        fit: BoxFit.cover)),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: whiteColor,
                  ),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Privilege",
                        style: TextStyle(
                            fontSize: 15,
                            color: blackColor,
                            fontFamily: "OnestSemiBold"),
                      ),
                      const SpaceHeightWidget(height: 15),
                      for (int i = 0; i < privilegeData.length; i++)
                        Column(
                          children: [
                            CustomBulletTextWidget(
                              data: privilegeData[i],
                            ),
                            if (i == 3)
                              PrivilegeBanner(
                                days: ddcTap ? "60" : "120",
                              )
                          ],
                        ),
                      const SpaceHeightWidget(height: 15),
                      Text(
                        "Terms of application",
                        style: TextStyle(
                            fontSize: 15,
                            color: blackColor,
                            fontFamily: "OnestSemiBold"),
                      ),
                      const SpaceHeightWidget(height: 10),
                      CustomBulletTextWidget(
                        data: ddcTap
                            ? "Applicants must be 15 years of age or older."
                            : "Applicants must be 18 years of age or older.",
                      ),
                      const SpaceHeightWidget(height: 5),
                    ],
                  ),
                ),
              ),
              const SpaceHeightWidget(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
