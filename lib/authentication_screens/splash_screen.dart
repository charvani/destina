import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
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

  navgationFun() {
    Get.to(() => const OnboardScreen());
  }

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/videos/splash_video.mp4')
    //   ..initialize().then((_) {
    //     setState(() {});
    //     _controller.play();
    //   });
    // Timer(const Duration(seconds: 1), () {
    //   setState(() {
    //     splashAnimation = false;
    //   });
    // });
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
