import 'dart:async';

import 'package:destina_1_international/authentication_screens/login_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/common_widgets.dart';
import '../controllers/network_connectivity/network_controller.dart';
import '../controllers/network_connectivity/noInternet_connection.dart';
import 'onboard_screen.dart';
// import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NetworkController _networkController = Get.put(NetworkController());
  // final NetworkController _networkController = Get.find<NetworkController>();

  bool splashAnimation = true;
  // late VideoPlayerController _controller;
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
      await Constants.prefs.setString(
          "open_country",
          // countyCodeRes['country']
          "MY");
      await Constants.prefs.setString("ip", countyCodeRes['ip']);
    }
  }

  @override
  void initState() {
    super.initState();
    onboard = Constants.prefs.getBool("onboard") ?? false;
    login = Constants.prefs.getString("user_id") ?? "false";

    countyCodeFun();
    Timer(const Duration(seconds: 3), () {
      navgationFun();
    });
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
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
                // "assets/videos/splash-video.gif",
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
        )
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     if (_controller.value.isInitialized)
        //       AspectRatio(
        //         aspectRatio: 1 / 2,
        //         child: VideoPlayer(_controller),
        //       ),
        //     const Center(child: Text(""))
        //   ],
        // )
        // Lottie.asset("assets/lotties/splash_video.lottie.json")
        //  Center(child: AnimatedContainer(
        //   duration:const Duration(seconds: 1),
        //   padding: const EdgeInsets.all(10.0),
        //   height: splashAnimation?80:300,
        //   child: Image.asset("assets/images/logo.png"),
        // ))
        );
  }
}
