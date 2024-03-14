import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/policy/socialmedia_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cancellation_policy.dart';
import 'codeof_etics_screen.dart';
import 'disclaimer_screen.dart';
import 'distubutorship_screen.dart';
import 'income_earningscreen.dart';
import 'privacy_policyscreen.dart';
import 'returnpolicy_screen.dart';
import 'shippingpolicy_screen.dart';
import 'terms_conditons_screen.dart';

class PolicySelectionScreen extends StatefulWidget {
  const PolicySelectionScreen({super.key});

  @override
  State<PolicySelectionScreen> createState() => _PolicySelectionScreenState();
}

class _PolicySelectionScreenState extends State<PolicySelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Policies"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutUsScreenWidget(
              leadingIcon: Icons.privacy_tip_outlined,
              onTapFun: () {
                Get.to(() => const PrivacyPolicyScreen());
              },
              title: "Privacy Policy",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.article_outlined,
              onTapFun: () {
                Get.to(() => const TermsAndConditions());
              },
              title: "Terms and Conditions",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.abc,
              image: "assets/images/delivery-truck.png",
              onTapFun: () {
                Get.to(() => const ShippingPolicyScreen());
              },
              title: "Shipping Policy",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.policy_outlined,
              image: "assets/images/product-return.png",
              onTapFun: () {
                Get.to(() => const ReturnPolicyScreen());
              },
              title: "Return Policy",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.free_cancellation_outlined,
              onTapFun: () {
                Get.to(() => const CancellationPolicyScreen());
              },
              title: "Cancellation Policy",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.privacy_tip_outlined,
              onTapFun: () {
                Get.to(() => const DisclaimerScreen());
              },
              title: "Disclaimer",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.code_rounded,
              onTapFun: () {
                Get.to(() => const CodeOfEthicsScreen());
              },
              title: "Code of Ethics",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.attach_money_rounded,
              onTapFun: () {
                Get.to(() => const IncomeandEarningsScreen());
              },
              title: "Income & Earnings",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.personal_video_outlined,
              onTapFun: () {
                Get.to(() => const SocialMediaScreen());
              },
              title: "Social Media Policy",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.rule_sharp,
              onTapFun: () {
                Get.to(() => const DistributorshipRulesScreen());
              },
              title: "Distributorship Rules And Regulations",
            ),
          ],
        ),
      ),
    );
  }
}
