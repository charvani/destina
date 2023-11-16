import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../commons/common_widgets.dart';
import '../commons/constants.dart';
import 'login_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

int page = 0;
List<OnboardModel> onboardData = [
  OnboardModel(
      image: "assets/images/onboard1.png",
      title: "The fastest single scalar growth"),
  OnboardModel(
      image: "assets/images/onboard2.png",
      title: "The fastest double scalar growth"),
  OnboardModel(
      image: "assets/images/onboard3.png",
      title: "The fastest triple scalar growth")
];

class _OnboardScreenState extends State<OnboardScreen> {
  final _pageController = PageController();
  @override
  void initState() {
    super.initState();
    Constants.prefs.setBool("onboard", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: onboardData.length,
              onPageChanged: (val) {
                setState(() {
                  page = val;
                });
              },
              itemBuilder: (context, i) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    onboardData[i].image,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.fill,
                  ),
                );
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: onboardData.length,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                    spacing: 8.0,
                    radius: 10.0,
                    dotWidth: 13.0,
                    dotHeight: 13.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: whiteColor,
                    activeDotColor: blackColor),
                // effect: WormEffect(
                //   ra
                // ),
              ),
              // Container(
              //   width: double.infinity,
              //   alignment: Alignment.center,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       for (int i = 0; i < onboardData.length; i++)
              //         (i == page) ? const ActiveDot() : const InactiveDot(),
              //     ],
              //   ),
              // ),
              SpaceHeightWidget(
                  height: MediaQuery.of(context).size.height * 0.035),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomElevatedButton(
                    onTapFun: () {
                      if ((onboardData.length - page) == 1) {
                        Get.offAll(() => const LoginScreen());
                      } else {
                        setState(() {
                          page = page + 1;
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.ease);
                        });
                      }
                    },
                    title: ((onboardData.length - page) == 1)
                        ? "GET START WITH DESTINA"
                        : "NEXT"),
              ),
              // Stack(
              //   alignment: Alignment.center,
              //   children: [
              // SpaceHeightWidget(
              //     height: MediaQuery.of(context).size.height * 0.20),
              //     if ((onboardData.length - page) == 1)
              //       UnderLineTextButton(
              //         onTapFun: () {},
              //         titile: "gdggg",
              //       )
              //   ],
              // ),
              // const SpaceHeightWidget(height: 10)
            ],
          ),
        ],
      ),
    );
  }
}
