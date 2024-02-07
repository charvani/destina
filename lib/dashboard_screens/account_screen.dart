import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/authentication_screens/countryselect_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../authentication_screens/login_screen.dart';
import '../authentication_screens/members_screen.dart';
import '../commons/constants.dart';
import '../controllers/main_controller.dart';
import '../inside_screens/maintenance/maintenance_screen.dart';
import '../inside_screens/myBonus/bussiness_devselection_screen.dart';
import '../inside_screens/myBonus/date_selection_screen.dart';
import '../inside_screens/myBonus/flush_cvscreen.dart';
import '../inside_screens/myBonus/global_leadership_selectionscreen.dart';
import '../inside_screens/myEmoney/ecart_topupreq_screen.dart';
import '../inside_screens/myEmoney/transaction_pass_screen.dart';
import '../inside_screens/myTeams/group_sales_screen.dart';
import '../inside_screens/myTeams/listdate_selection_screen.dart';
import '../inside_screens/myTeams/my_genealogy.dart';
import '../inside_screens/myTeams/myteam_view.dart';
import '../inside_screens/myTeams/team_builderview.dart';
import '../inside_screens/myaccount_screen.dart';
import '../inside_screens/myorder/order_acknowledge_screen.dart';
import '../inside_screens/myorder/orders_reportselection_screen.dart';
import '../inside_screens/privacy_policyscreen.dart';
import '../inside_screens/profile/award_qualifiers.dart';
import '../inside_screens/profile/change_password.dart';
import '../inside_screens/profile/change_trans_pass.dart';
import '../inside_screens/profile/d1voucher_screen.dart';
import '../inside_screens/profile/forgot_transpass.dart';
import '../inside_screens/profile/listof_requests.dart';
import '../inside_screens/profile/profile_update.dart';
import '../inside_screens/profile/update_photo.dart';
import '../inside_screens/profile/view_profile.dart';
import '../inside_screens/profileDashBoard/profile_dashboard_screen.dart';
import '../inside_screens/services/downloads_screen.dart';
import '../inside_screens/services/forms_agreements_screen.dart';
import '../inside_screens/services/kyc_upload.dart';
import '../inside_screens/services/salesstools_screen.dart';
import '../inside_screens/services/trainingtools_screen.dart';
import '../inside_screens/services/upload_id_screen.dart';
import '../inside_screens/shopping/dpmall_screen.dart';
import '../inside_screens/shopping/membermall_screen.dart';
import '../inside_screens/shopping/redemptionmall_screen.dart.dart';
import '../inside_screens/shopping/salesmall_screen.dart';
import '../inside_screens/tools/faqs_screen.dart';
import '../inside_screens/tools/ftaform_reportscreen.dart';
import '../inside_screens/tools/ftareg_formscreen.dart';
import '../inside_screens/tools/package_reviewscreen.dart';
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
                leadingIcon: Icons.settings_outlined,
                onTapFun: () {},
                title: "Settings",
              ),
              // AboutUsScreenWidget(
              //   leadingIcon: Icons.file_copy_outlined,
              //   onTapFun: () {},
              //   title: "FAQ",
              // ),
              AboutUsScreenWidget(
                leadingIcon: FeatherIcons.fileText,
                onTapFun: () {
                  Get.to(() => const PrivacyPolicyScreen());
                },
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
                                Constants.prefs.remove("country_name");
                                Constants.prefs.remove("country_id");
                                Constants.prefs.remove("city");
                                Constants.prefs.remove("user_name");
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

  dynamic selectedString;
  final ScrollController _scrollController = ScrollController();
  Widget drawerWidget() {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        toolbarHeight: 98,
        flexibleSpace: Stack(
          alignment: Alignment.center,
          children: [
            // Container(
            //   color: redColor,
            //   height: 125,
            //   width: double.infinity,
            //   child: SvgPicture.asset(
            //     "assets/images/myaccount_bg.svg",
            //     fit: BoxFit.fill,
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     print("dflkskdlf");
            //     Get.back();
            //   },
            //   child: Container(
            //     alignment: Alignment.topLeft,
            //     width: double.infinity,
            //     margin: const EdgeInsets.only(bottom: 50),
            //     padding: const EdgeInsets.only(left: 5, bottom: 0),
            //     height: 15,
            //     child: Icon(
            //       Icons.keyboard_arrow_left_rounded,
            //       color: blackColor,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const SpaceWidthWidget(width: 10),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: greenColor, width: 5)),
                          child: CircleAvatar(
                            backgroundColor: darkBlue,
                            radius: 33,
                            child: CircleAvatar(
                              backgroundColor: whiteColor,
                              radius: 31,
                              child: const Text(
                                "D1",
                                style: TextStyle(
                                    fontSize: 23, fontFamily: "OnestRegular"),
                              ),
                            ),
                          ),
                        ),
                        const SpaceWidthWidget(width: 15),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              // "Destina1int",
                              Constants.prefs.getString("user_id").toString(),
                              style: const TextStyle(
                                  fontFamily: "OnestSemiBold", fontSize: 18),
                            ),
                            const Text(
                              "Member",
                              style: TextStyle(
                                  fontFamily: "OnestRegular", fontSize: 15),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyAccountWidget(
                traillingFun: () {},
                leadingIcon: Icons.home,
                onTapFun: () {
                  Get.to(() => DashBoardScreen(
                      // data: widget.data,
                      // bannerPopUpImages: widget.bannerPopUpImages,
                      ));
                },
                title: "Dashboard",
              ),
              MyAccountWidget(
                traillingFun: () {
                  commonOnTapFun("Profile");
                },
                leadingIcon: Icons.person,
                onTapFun: () {
                  commonOnTapFun("Profile");
                },
                title: "Profile",
                trailing: (selectedString == "Profile") ? true : false,
              ),
              if (selectedString == "Profile") profileItems(),
              MyAccountWidget(
                traillingFun: () {
                  commonOnTapFun("Services");
                },
                leadingIcon: Icons.handyman_rounded,
                onTapFun: () {
                  commonOnTapFun("Services");
                },
                title: "Services",
                trailing: (selectedString == "Services") ? true : false,
              ),
              if (selectedString == "Services") servicesItems(),
              MyAccountWidget(
                traillingFun: () {
                  commonOnTapFun("My Teams");
                },
                imagePath: "assets/images/organize.png",
                onTapFun: () {
                  commonOnTapFun("My Teams");
                },
                title: "My Teams",
                trailing: (selectedString == "My Teams") ? true : false,
              ),
              if (selectedString == "My Teams") teamItems(),
              MyAccountWidget(
                traillingFun: () {
                  commonOnTapFun("My Order");
                },
                leadingIcon: Icons.fire_truck_rounded,
                onTapFun: () {
                  commonOnTapFun("My Order");
                },
                title: "My Order",
                trailing: (selectedString == "My Order") ? true : false,
              ),
              if (selectedString == "My Order") orderItems(),
              MyAccountWidget(
                traillingFun: () {
                  commonOnTapFun("My eMoney");
                },
                leadingIcon: Icons.account_balance_wallet,
                onTapFun: () {
                  commonOnTapFun("My eMoney");
                },
                title: "My eMoney",
                trailing: (selectedString == "My eMoney") ? true : false,
              ),
              if (selectedString == "My eMoney") eMoneyItems(),
              if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
                MyAccountWidget(
                  traillingFun: () {
                    Get.to(
                        () => const MyDateListSelectionScreen(from: "Upgrade"));
                  },
                  leadingIcon: Icons.credit_card,
                  onTapFun: () {
                    Get.to(
                        () => const MyDateListSelectionScreen(from: "Upgrade"));
                  },
                  title: "Upgrade List",
                ),
              MyAccountWidget(
                traillingFun: () {
                  commonOnTapFun("Shopping");
                },
                leadingIcon: Icons.shopping_cart_rounded,
                onTapFun: () {
                  commonOnTapFun("Shopping");
                },
                title: "Shopping",
                trailing: (selectedString == "Shopping") ? true : false,
              ),
              if (selectedString == "Shopping") shoppingItems(),
              MyAccountWidget(
                traillingFun: () {
                  Get.to(() => const AccountMaintenanceScreen());
                },
                imagePath: "assets/images/view-module.png",
                onTapFun: () {
                  Get.to(() => const AccountMaintenanceScreen());
                },
                title: "Maintenance",
              ),
              if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
                MyAccountWidget(
                  traillingFun: () {
                    commonOnTapFun("My Bonus");
                  },
                  imagePath: "assets/images/bonus.png",
                  onTapFun: () {
                    commonOnTapFun("My Bonus");
                  },
                  title: "My Bonus",
                  trailing: (selectedString == "My Bonus") ? true : false,
                ),
              if (selectedString == "My Bonus") bonusItems(),
              MyAccountWidget(
                traillingFun: () {
                  commonOnTapFun("Tools");
                },
                leadingIcon: Icons.explore_rounded,
                onTapFun: () {
                  commonOnTapFun("Tools");
                },
                title: "Tools",
                trailing: (selectedString == "Tools") ? true : false,
              ),
              if (selectedString == "Tools") toolsItems(),
            ],
          )),
    );
  }

  commonOnTapFun(String from) {
    if (selectedString == from) {
      setState(() {
        selectedString = null;
      });
    } else {
      setState(() {
        selectedString = from;
      });
      if (from == "Tools") {
        _scrollController.animateTo(
          150,
          curve: Curves.ease,
          duration: const Duration(seconds: 1),
        );
      }
    }
  }

  profileItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const ViewProfile());
          },
          title: "View Profile",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const UpdateProfile());
          },
          title: "Profile Update",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const UpdatePhotoScreen());
          },
          title: "Update Photo",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const ChangePasswordScreen());
          },
          title: "Change Password",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const ChangeTransPassScreen());
          },
          title: "Change Tran.Password",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const UpdationReportScreen());
          },
          title: "List of Request",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const ForgotTransPassScreen());
          },
          title: "Forgot Trans Password",
        ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const AwardQualifiersScreen());
            },
            title: "Scheme Awards Qualifiers",
          ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const D1VoucherScreen());
            },
            title: "D1 Voucher",
          ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  servicesItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const SalesToolsScreen());
          },
          title: "Sales & Marketing Tools",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TrainingToolsScreen());
          },
          title: "Training Tools",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const FormsAgreementScreen());
          },
          title: "Forms & Agreement",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const DownloadsScreen());
          },
          title: "Downloads",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const UploadKYCScreen());
          },
          title: "Upload KYC",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const UploadIDScreen());
          },
          title: "Upload ID",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  teamItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const MyGenealogy());
          },
          title: "My Genealogy",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TeamBuilderViewScreen());
          },
          title: "Team Builder View",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const MyTeamViewScreen());
          },
          title: "My Team View",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const MyDateListSelectionScreen(from: "My List View"));
          },
          title: "My List View",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const GroupSalesSelectionScreen());
          },
          title: "Group Sales",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  orderItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const OrdersSectionScreen());
          },
          title: "Orders Report",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const OrderAknowledgeScreen());
          },
          title: "Order Acknowledge",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  eMoneyItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TransactionPasswordScreen(
                  from: "E-Card",
                ));
          },
          title: "E-Card",
        ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "Commission",
                  ));
            },
            title: "Commission eMoney",
          ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "Redemption",
                  ));
            },
            title: "Redemption eMoney",
          ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "Prepaid",
                  ));
            },
            title: "Prepaid eMoney",
          ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "Stockist",
                  ));
            },
            title: "Stockist eMoney",
          ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "Withdrawal",
                  ));
            },
            title: "Withdrawal Status",
          ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const EcardTopupRequestScreen());
          },
          title: "Ecard Topup Request",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TransactionPasswordScreen(
                  from: "Ecard Request",
                ));
          },
          title: "Ecard Request Report",
        ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "D1 Cash Back",
                  ));
            },
            title: "D1 Cash Back Points",
          ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "D1 Credit Rebate",
                  ));
            },
            title: "D1 Credit Rebate Point",
          ),
        if (Constants.prefs.getString("user_type") != "MEMBERSHIP")
          MyAccountItemWidget(
            onTapFun: () {
              Get.to(() => const TransactionPasswordScreen(
                    from: "DP Wallet",
                  ));
            },
            title: "DP Wallet",
          ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  shoppingItems() {
    return Column(
      children: [
        (Constants.prefs.getString("user_type") == "MEMBERSHIP")
            ? MyAccountItemWidget(
                onTapFun: () {
                  Get.to(() => const MembershipMallScreen());
                },
                title: "Membership Mall",
              )
            : Column(
                children: [
                  MyAccountItemWidget(
                    onTapFun: () {
                      Get.to(() => const SalesMallScreen());
                    },
                    title: "Sales Mall",
                  ),
                  MyAccountItemWidget(
                    onTapFun: () {
                      Get.to(() => const RedemptionMallScreen());
                    },
                    title: "Redemption Mall",
                  ),
                  MyAccountItemWidget(
                    onTapFun: () async {
                      Get.to(() => MemberScreen(
                          countryId: Constants.prefs.getString("country_id")!));
                    },
                    title: "Signup Mall",
                  ),
                  MyAccountItemWidget(
                    onTapFun: () {
                      Get.to(() => const DPMallScreen());
                    },
                    title: "Dp Mall",
                  ),
                ],
              ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  bonusItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Retail Bonus",
                ));
          },
          title: "Retail Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Personal Consumption Bonus",
                ));
          },
          title: "Personal Consumption Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Level Consumption Bonus",
                ));
          },
          title: "Level Consumption Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Group Consumption Bonus",
                ));
          },
          title: "Group Consumption Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Customer Acquisition",
                ));
          },
          title: "Customer Acquisition Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Upgrade Acquisition",
                ));
          },
          title: "Upgrade Acquisition Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Rollup Bonus",
                ));
          },
          title: "Rollup Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BuissinessBonusSelectionScreen());
          },
          title: "Business Development Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "TeamBuilder Buisiness",
                ));
          },
          title: "TeamBuilder Buisiness Development Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const GlobalLeadershipSelctionScreen());
          },
          title: "Global Leadership Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Special Bonus",
                ));
          },
          title: "Special Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Special Bonus(Sponsor)",
                ));
          },
          title: "Special Bonus(Sponsor)",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Special Leadership",
                ));
          },
          title: "Special Leadership Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Direct Distributor",
                ));
          },
          title: "Direct Distributor Sales Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Personal Sales",
                ));
          },
          title: "Personal Sales Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const BonusDateSelectionScreen(
                  from: "Activation Bonus",
                ));
          },
          title: "Activation Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const FlushCvReportScreen());
          },
          title: "Flush CV Report",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  toolsItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const FAQsScreen());
          },
          title: "FAQS",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const PackageReviewScreen());
          },
          title: "Package Review",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const FTARegistrationFormScreen());
          },
          title: "FTA Registration Form",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const FTAFormReportScreen());
          },
          title: "FTA Form Report",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }
}
