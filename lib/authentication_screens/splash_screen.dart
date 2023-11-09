import 'dart:async';

import 'package:destina_1_international/authentication_screens/login_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/common_widgets.dart';
import 'onboard_screen.dart';
// import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool splashAnimation = true;
  // late VideoPlayerController _controller;
  late bool onboard;
  navgationFun() {
    Get.to(
        () => onboard == false ? const OnboardScreen() : const LoginScreen());
  }

  countyCodeFun() async {
    dynamic countyCodeRes = await MainController().getCountryCode();
    if (countyCodeRes != null) {
      await Constants.prefs.setString("country", countyCodeRes['country']);
      Constants().country = countyCodeRes['country'];
    }
  }

  @override
  void initState() {
    super.initState();
    onboard = Constants.prefs.getBool("onboard") ?? false;
    countyCodeFun();
    Timer(const Duration(seconds: 4), () {
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
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: splashBgColor,
          width: double.infinity,
          child: Image.asset(
            "assets/videos/splash-video.gif",
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: VersionText(),
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
