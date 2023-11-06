import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../dashboard_screens/bottombar_screen.dart';
import 'countryselect_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/images/login_background.png",
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 20,
                              color: naviBlue),
                        ),
                        Text(
                          "Hope you enjoy shopping with us",
                          style: TextStyle(
                              fontFamily: "OnestRegular",
                              fontSize: 18,
                              color: naviBlue),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CommonUnderlineTextForm(
                          onChangeFun: (val) {},
                          validation: (val) {
                            if (val!.isEmpty) {
                              return "*Please enter ABO/Member number/Phone number";
                            } else {
                              return null;
                            }
                          },
                          hintText: "ABO/Member/Phone no.",
                        ),
                        const SpaceHeightWidget(height: 40),
                        CustomElevatedButton(
                            onTapFun: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            title: "Send SMS"),
                        const SpaceHeightWidget(height: 20),
                        CustomBorderElevatedButton(
                            bgcolor: whiteColor,
                            onTapFun: () {
                              Get.to(() => const CountySelectScreen());
                            },
                            title: "Register Member/ABO Member"),
                        const SpaceHeightWidget(height: 30),
                        const Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Or sign in with"),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        const SpaceHeightWidget(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/lineapp.png")),
                            SpaceWidthWidget(width: 10),
                            CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/google.png")),
                          ],
                        ),
                        const SpaceHeightWidget(height: 40),
                        UnderLineTextButton(
                            onTapFun: () {
                              Get.to(() => const BottomBarScreen());
                            },
                            titile: "Shop now",
                            fontSize: 20),
                        const SpaceHeightWidget(height: 55),
                        UnderLineTextButton(
                            onTapFun: () {},
                            titile: "Privacy policy",
                            fontSize: 14),
                        const SpaceHeightWidget(height: 40),
                      ],
                    ),
                    const SpaceHeightWidget(height: 20),
                    const VersionText()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
