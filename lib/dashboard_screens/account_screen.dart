import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/authentication_screens/countryselect_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../authentication_screens/login_screen.dart';
import '../commons/constants.dart';
import '../controllers/main_controller.dart';
import '../inside_screens/about/aboutselection_screen.dart';
import '../inside_screens/contactus_screen.dart';
import '../inside_screens/myaccount_screen.dart';
import '../inside_screens/policy/policyselection_screen.dart';
import 'bottombar_screen.dart';

class AccountScreen extends StatefulWidget {
  List<String>? bannerPopUpImages = [];
  dynamic data;
  AccountScreen({super.key, this.bannerPopUpImages, this.data});

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
      // if (widget.bannerPopUpImages!.isNotEmpty) {
      //   _scaffoldKey.currentState!.openDrawer();
      //   Get.to(
      //     () => DashBoardScreen(
      //         // data: widget.data,
      //         // bannerPopUpImages: widget.bannerPopUpImages,
      //         ),
      //   );
      // }
    });

    // Timer(const Duration(seconds: 1), () {
    //   widget.bannerPopUpImages!.clear();
    // });
  }

  @override
  void dispose() {
    // Dispose your TickerControllers here
    _controller.dispose();
    super.dispose();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
        key: _scaffoldKey,
        // drawerScrimColor: whiteColor,
        drawer: const Drawer(
          child:
              //  drawerWidget()
              MyAccountScreen(
                  // data: widget.data,
                  // bannerPopUpImages: widget.bannerPopUpImages,
                  ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: darkBlue,
                      ),
                      // SizedBox(
                      //     height: 200,
                      //     width: double.infinity,
                      //     child: SvgPicture.asset("assets/svg/grey_banner.svg",
                      //         fit: BoxFit.cover)),
                      if (Constants.prefs.getString("user_id") != null &&
                          Constants.prefs.getString("user_id") != "false")
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              icon: Icon(Icons.menu, color: whiteColor)),
                        ),
                    ],
                  ),
                  SafeArea(
                    child: Container(
                        margin: const EdgeInsets.all(15),
                        // height: 110,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: whiteColor),
                            borderRadius: BorderRadius.circular(15),
                            color: whiteColor),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Constants.prefs.getString("profile_image") !=
                                          null &&
                                      Constants.prefs
                                              .getString("profile_image") !=
                                          ""
                                  ? CircleAvatar(
                                      radius: 41,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              Constants.prefs
                                                  .getString("profile_image")!,
                                              errorListener: (error) {
                                        CircleAvatar(
                                          radius: 41,
                                          backgroundColor:
                                              blackColor.withOpacity(0.3),
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundColor: whiteColor,
                                            child: Icon(
                                              Icons.person_rounded,
                                              size: 50,
                                              color: greyColor,
                                            ),
                                          ),
                                        );
                                      }),
                                    )
                                  : CircleAvatar(
                                      radius: 41,
                                      backgroundColor:
                                          blackColor.withOpacity(0.3),
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/logo.png",
                                      height: 55,
                                    ),
                                    Text(
                                      "Welcome to Destina 1 International",
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "OnestSemiBold",
                                          color: blackColor,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => const CountySelectScreen());
                },
                child: Stack(
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
                      return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Get.offAll(() => const BottomBarScreen(
                                  index: 3,
                                ));
                          },
                          child: slideWidget(i + 1));
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
                leadingIcon: Icons.policy_outlined,
                onTapFun: () {
                  Get.to(() => const PolicySelectionScreen());
                },
                title: "Policies",
              ),
              AboutUsScreenWidget(
                leadingIcon: Icons.info_outline_rounded,
                onTapFun: () {
                  Get.to(() => const AboutSelectionScreen());
                },
                title: "About Us",
              ),
              AboutUsScreenWidget(
                leadingIcon: Icons.help_outline,
                onTapFun: () {
                  Get.to(() => const ContactUsScreen());
                },
                title: "Contact Us",
              ),
              // AboutUsScreenWidget(
              //   leadingIcon: FeatherIcons.fileText,
              //   onTapFun: () {
              //     Get.to(() => const PrivacyPolicyScreen());
              //   },
              //   title: "Privacy Policy",
              // ),
              if (Constants.prefs.getString("user_id") != null &&
                  Constants.prefs.getString("user_id") != "false")
                Obx(() {
                  return _logoutController.loading.value
                      ? SizedBox(height: 45, child: loader)
                      : AboutUsScreenWidget(
                          leadingIcon: Icons.logout_rounded,
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
                                Constants.prefs.remove("country_name");
                                Constants.prefs.remove("country_id");
                                Constants.prefs.remove("city");
                                Constants.prefs.remove("user_name");
                                Constants.prefs.remove("profile_image");
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
