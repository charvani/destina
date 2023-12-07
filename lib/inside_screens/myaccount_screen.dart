import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/profileScreens/update_photo.dart';
import 'package:destina_1_international/inside_screens/servicesScreens/downloads_screen.dart';
import 'package:destina_1_international/inside_screens/servicesScreens/kyc_upload.dart';
import 'package:destina_1_international/inside_screens/servicesScreens/trainingtools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'myEmoney/ecart_topupreq_screen.dart';
import 'myEmoney/transaction_pass_screen.dart';
import 'myTeams/group_sales_screen.dart';
import 'myTeams/my_genealogy.dart';
import 'myTeams/mylistview_screen.dart';
import 'myTeams/myteam_view.dart';
import 'myTeams/team_builderview.dart';
import 'myorderScreens/order_acknowledge_screen.dart';
import 'myorderScreens/orders_reportselection_screen.dart';
import 'profileDashBoard/profile_dashboard_screen.dart';
import 'profileScreens/award_qualifiers.dart';
import 'profileScreens/change_password.dart';
import 'profileScreens/change_trans_pass.dart';
import 'profileScreens/d1voucher_screen.dart';
import 'profileScreens/forgot_transpass.dart';
import 'profileScreens/listof_requests.dart';
import 'profileScreens/profile_update.dart';
import 'profileScreens/view_profile.dart';
import 'servicesScreens/forms_agreements_screen.dart';
import 'servicesScreens/salesstools_screen.dart';
import 'servicesScreens/upload_id_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  dynamic selectedString;
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
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
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
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Destina1int",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold", fontSize: 18),
                            ),
                            Text(
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyAccountWidget(
            traillingFun: () {},
            leadingIcon: Icons.home,
            onTapFun: () {
              Get.to(() => const DashBoardScreen());
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
          MyAccountWidget(
            traillingFun: () {
              commonOnTapFun("Upgrade");
            },
            leadingIcon: Icons.credit_card,
            onTapFun: () {
              commonOnTapFun("Upgrade");
            },
            title: "Upgrade",
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
              commonOnTapFun("Maintenance");
            },
            imagePath: "assets/images/view-module.png",
            onTapFun: () {
              commonOnTapFun("Maintenance");
            },
            title: "Maintenance",
          ),
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
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const AwardQualifiersScreen());
          },
          title: "Awards Qualifiers",
        ),
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
            Get.to(() => const MyListViewScreen());
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
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TransactionPasswordScreen(
                  from: "Commission",
                ));
          },
          title: "Commission eMoney",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TransactionPasswordScreen(
                  from: "Redemption",
                ));
          },
          title: "Redemption eMoney",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TransactionPasswordScreen(
                  from: "Prepaid",
                ));
          },
          title: "Prepaid eMoney",
        ),
        MyAccountItemWidget(
          onTapFun: () {
            Get.to(() => const TransactionPasswordScreen(
                  from: "Stockist",
                ));
          },
          title: "Stockist eMoney",
        ),
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
          onTapFun: () {},
          title: "Ecard Request Report",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "D1 Cash Back Points",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "D1 Credit Rebate Point",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "DP Wallet",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  shoppingItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Sales Mall",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Redemption Mall",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Signup Mall",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Dp Mall",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }

  bonusItems() {
    return Column(
      children: [
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Retail Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Customer Acquisition Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Upgrade Acquisition Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Rollup Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Business Development Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "TeamBuilder Buisiness Development Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Global Leadership Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Special Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Special Bonus(Sponsor)",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Special Leadership Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Direct Distributor Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Direct Distributor Sales Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Personal Sales Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Activation Bonus",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
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
          onTapFun: () {},
          title: "FAQS",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "Package Review",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "FTA Registration Form",
        ),
        MyAccountItemWidget(
          onTapFun: () {},
          title: "FTA Form Report",
        ),
        const SpaceHeightWidget(height: 13)
      ],
    );
  }
}
