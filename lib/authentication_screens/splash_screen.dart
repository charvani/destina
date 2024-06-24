import 'dart:async';
import 'dart:io';

import 'package:destina_1_international/authentication_screens/login_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../commons/common_widgets.dart';
import '../controllers/network_connectivity/network_controller.dart';
import '../controllers/network_connectivity/noInternet_connection.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NetworkController _networkController = Get.put(NetworkController());

  bool splashAnimation = true;
  late bool onboard;
  late String login;
  navgationFun() {
    Get.offAll(
        () => onboard == false ? const OnboardScreen() : const LoginScreen());
    if (_networkController.connectionStatus.value == 0) {
      Get.to(() => const NoInternetConnection());
    }
  }

  countyCodeFun() async {
    dynamic countyCodeRes = await MainController().getCountryCode();
    if (countyCodeRes != null) {
      await Constants.prefs.setString("open_country", countyCodeRes['country']);
      await Constants.prefs.setString("ip", countyCodeRes['ip']);
    }
  }

  versionCheckFun() async {
    Map params = {"Action": "Version", "Version": Constants.appversion};
    dynamic res = await MainController().getVersionCheck(params);
    if (res != null) {
      if (res['Message'] == "SUCCESS") {
        countyCodeFun();
        Timer(const Duration(seconds: 3), () {
          navgationFun();
        });
      } else {
        Timer(const Duration(seconds: 1), () {
          Get.dialog(
              barrierDismissible: false,
              versionDialog(res['Updtae'], res['Message']));
        });
      }
    }
  }

  versionDialog(String updateForcefully, String mesg) {
    return Dialog(
      alignment: Alignment.center,
      child: PopScope(
        canPop: false,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTitle(
                    titleName: "App Update",
                    fontColor: darkRedColor,
                    size: 16,
                    fontFamily: "OnestSemiBold",
                  ),
                ],
              ),
              const SpaceHeightWidget(height: 15),
              CommonTitle(
                titleName: mesg,
                fontColor: darkBlue,
                size: 14,
                fontFamily: "OnestRegular",
              ),
              const SpaceHeightWidget(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (updateForcefully.toLowerCase() == "no")
                    SizedBox(
                      height: 35,
                      child: CustomAutoWidthButton(
                        onTapFun: () {
                          Get.back();
                          countyCodeFun();
                          Timer(const Duration(seconds: 1), () {
                            navgationFun();
                          });
                        },
                        title: "Skip",
                      ),
                    ),
                  const SpaceWidthWidget(width: 10),
                  SizedBox(
                    height: 35,
                    child: CustomAutoWidthButton(
                      onTapFun: () {
                        if (Platform.isAndroid) {
                          const appId = 'com.destina1.international';
                          final url = Uri.parse("market://details?id=$appId");
                          launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      title: "Update Now",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    onboard = Constants.prefs.getBool("onboard") ?? false;
    login = Constants.prefs.getString("user_id") ?? "false";

    versionCheckFun();

    // countyCodeFun();
    // Timer(const Duration(seconds: 3), () {
    //   navgationFun();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBlue,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: splashBgColor,
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/splash_img.png",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VersionText(
                colorT: whiteColor,
              ),
            ),
          ],
        ));
  }
}
