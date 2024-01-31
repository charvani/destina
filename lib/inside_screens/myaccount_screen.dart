import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/inside_screens/profile/update_photo.dart';
import 'package:destina_1_international/inside_screens/services/downloads_screen.dart';
import 'package:destina_1_international/inside_screens/services/kyc_upload.dart';
import 'package:destina_1_international/inside_screens/services/trainingtools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../authentication_screens/members_screen.dart';
import 'maintenance/maintenance_screen.dart';
import 'myBonus/bussiness_devselection_screen.dart';
import 'myBonus/date_selection_screen.dart';
import 'myBonus/flush_cvscreen.dart';
import 'myBonus/global_leadership_selectionscreen.dart';
import 'myEmoney/ecart_topupreq_screen.dart';
import 'myEmoney/transaction_pass_screen.dart';
import 'myTeams/group_sales_screen.dart';
import 'myTeams/listdate_selection_screen.dart';
import 'myTeams/my_genealogy.dart';
import 'myTeams/myteam_view.dart';
import 'myTeams/team_builderview.dart';
import 'myorder/order_acknowledge_screen.dart';
import 'myorder/orders_reportselection_screen.dart';
import 'profile/award_qualifiers.dart';
import 'profile/change_password.dart';
import 'profile/change_trans_pass.dart';
import 'profile/d1voucher_screen.dart';
import 'profile/forgot_transpass.dart';
import 'profile/listof_requests.dart';
import 'profile/profile_update.dart';
import 'profile/view_profile.dart';
import 'profileDashBoard/profile_dashboard_screen.dart';
import 'services/forms_agreements_screen.dart';
import 'services/salesstools_screen.dart';
import 'services/upload_id_screen.dart';
import 'shopping/dpmall_screen.dart';
import 'shopping/membermall_screen.dart';
import 'shopping/redemptionmall_screen.dart.dart';
import 'shopping/salesmall_screen.dart';
import 'tools/faqs_screen.dart';
import 'tools/ftaform_reportscreen.dart';
import 'tools/ftareg_formscreen.dart';
import 'tools/package_reviewscreen.dart';

class MyAccountScreen extends StatefulWidget {
  List<String>? bannerPopUpImages = [];
  dynamic data;
  MyAccountScreen({super.key, this.bannerPopUpImages, this.data});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  dynamic selectedString;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if (widget.bannerPopUpImages!.isNotEmpty) {
        
      //   Get.to(
      //     () => DashBoardScreen(
      //       data: widget.data,
      //       bannerPopUpImages: widget.bannerPopUpImages,
      //     ),
      //   );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        toolbarHeight: 98,
        flexibleSpace: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: redColor,
              height: 125,
              width: double.infinity,
              child: SvgPicture.asset(
                "assets/images/myaccount_bg.svg",
                fit: BoxFit.fill,
              ),
            ),
            InkWell(
              onTap: () {
                print("dflkskdlf");
                Get.back();
              },
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 50),
                padding: const EdgeInsets.only(left: 5, bottom: 0),
                height: 15,
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: blackColor,
                ),
              ),
            ),
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
                        data: widget.data,
                        bannerPopUpImages: widget.bannerPopUpImages,
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
