import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../authentication_screens/login_screen.dart';
import '../commons/constants.dart';
import '../controllers/main_controller.dart';
import '../inside_screens/myaccount_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

bool amountFontSize = false;
late Timer timer;

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int carouselIndex = 3;
  final MainController _logoutController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 12.0, end: 18.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Run the animation
    _controller.repeat(reverse: true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Timer(const Duration(milliseconds: 500), () {
      //   Get.to(() => const PersonalDetailsScreen());
      // });
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const Drawer(
          child: MyAccountScreen(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: SvgPicture.asset("assets/svg/grey_banner.svg",
                              fit: BoxFit.cover)),
                      if (Constants.prefs.getString("user_id") != null &&
                          Constants.prefs.getString("user_id") != "false")
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              icon: Icon(Icons.menu, color: woodColor)),
                        ),
                    ],
                  ),
                  SafeArea(
                    child: Container(
                        margin: const EdgeInsets.all(15),
                        height: 110,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: woodColor),
                            borderRadius: BorderRadius.circular(15),
                            color: whiteColor),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 41,
                                backgroundColor: blackColor.withOpacity(0.3),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: whiteColor,
                                  child: Icon(
                                    Icons.person_rounded,
                                    size: 50,
                                    color: greyColor,
                                  ),
                                ),
                              ),
                              const SpaceWidthWidget(width: 15),
                              Flexible(
                                child: Text(
                                    "Welcome to Destina 1 International",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        color: blackColor,
                                        fontSize: 17)),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Stack(
                // alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/join_banner.png",
                            ),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    top: -30,
                    right: -5,
                    child: Image.asset(
                      "assets/videos/join_family.gif",
                      alignment: Alignment.topRight,
                      height: 190,
                    ),
                  ),
                  Positioned(
                      top: 40,
                      // bottom: 5,
                      left: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Join Destina 1 family",
                                style: TextStyle(
                                    fontFamily: "OnestRegular",
                                    fontSize: 12,
                                    color: whiteColor),
                              ),
                              Text(
                                "Starting at only",
                                style: TextStyle(
                                    fontFamily: "OnestSemiBold",
                                    fontSize: 14,
                                    color: whiteColor),
                              ),
                              const SpaceHeightWidget(height: 10),
                              if (Constants.prefs.getString("user_id") ==
                                      null ||
                                  Constants.prefs.getString("user_id") ==
                                      "false")
                                CustomFixedElevatedButton(
                                  onTapFun: () {
                                    Get.to(() => const LoginScreen());
                                  },
                                  title: "Sign Up / Sign in",
                                ),
                            ],
                          ),
                          // const SpaceWidthWidget(width: 5),
                          Column(
                            children: [
                              const SpaceHeightWidget(height: 16),
                              AnimatedBuilder(
                                  animation: _animation,
                                  builder: (context, child) {
                                    return Text(
                                      'RM 100',
                                      style: TextStyle(
                                          fontSize: _animation.value,
                                          color: lightYellow),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
              Container(
                // height: 40,
                width: double.infinity,
                margin: const EdgeInsets.all(10),

                child: Text(
                  "Destina 1 member promotions",
                  style: TextStyle(
                      fontFamily: "OnestBold", fontSize: 13, color: blackColor),
                ),
              ),
              SizedBox(
                height: 100,
                width: 500,
                child: CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, i, rindex) {
                      return slideWidget(i + 1);
                    },
                    options: CarouselOptions(
                        pageSnapping: false,
                        viewportFraction: 0.9,
                        padEnds: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        onPageChanged: (index, reason) {
                          setState(() {
                            carouselIndex = index;
                          });
                        })),
              ),
              const SpaceHeightWidget(height: 10),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (int i = 0; i < 5; i++)
                      (i == carouselIndex)
                          ? const ActiveDot()
                          : const InactiveDot(),
                  ],
                ),
              ),
              const SpaceHeightWidget(height: 20),
              Divider(
                color: lightAppThemeColor,
                thickness: 2,
                height: 0,
              ),
              AboutUsScreenWidget(
                leadingIcon: Icons.settings_outlined,
                onTapFun: () {},
                title: "Settings",
              ),
              AboutUsScreenWidget(
                leadingIcon: Icons.file_copy_outlined,
                onTapFun: () {},
                title: "FAQ",
              ),
              AboutUsScreenWidget(
                leadingIcon: FeatherIcons.fileText,
                onTapFun: () {},
                title: "Privacy Policy",
              ),
              if (Constants.prefs.getString("user_id") != null &&
                  Constants.prefs.getString("user_id") != "false")
                Obx(() {
                  return _logoutController.loading.value
                      ? SizedBox(height: 45, child: loader)
                      : AboutUsScreenWidget(
                          leadingIcon: FeatherIcons.logOut,
                          onTapFun: () async {
                            Map bdata = {
                              "UserId": Constants.prefs.getString("user_id"),
                              "Pwd": Constants.prefs.getString("password"),
                            };
                            dynamic res =
                                await _logoutController.getLogout(bdata);
                            if (res != null) {
                              if (res['Msg'] == "SUCCESS") {
                                Constants.prefs.remove("user_id");
                                Constants.prefs.remove("password");
                                CommonToastTrue("Successfully logout");
                                Get.offAll(() => const LoginScreen());
                              }
                            }
                          },
                          title: "Logout",
                        );
                }),
              const SpaceHeightWidget(height: 45),
              const VersionText(),
              const SpaceHeightWidget(height: 10),
            ],
          ),
        ));
  }

  Widget slideWidget(int i) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/images/membership_banner$i.png",
          fit: BoxFit.fill,
        ));
  }
}
