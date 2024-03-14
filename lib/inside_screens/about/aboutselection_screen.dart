import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../aboutus_screen.dart';
import 'brand_screen.dart';
import 'd1global_selctionscreen.dart';
import 'dvideos_screen.dart';
import 'testimonial_screen.dart';
import 'weburl_screen.dart';

class AboutSelectionScreen extends StatefulWidget {
  const AboutSelectionScreen({super.key});

  @override
  State<AboutSelectionScreen> createState() => _AboutSelectionScreenState();
}

class _AboutSelectionScreenState extends State<AboutSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "About Us"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutUsScreenWidget(
              leadingIcon: Icons.info_outline,
              onTapFun: () {
                Get.to(() => const AboutUsScreen());
              },
              title: "About",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.newspaper,
              onTapFun: () {
                Get.to(() => const WebUrlScreen(
                      redirectUrl: "https://beta.destina1.com/MANews.html#/",
                      from: "News",
                    ));
              },
              title: "News",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.chat_bubble_outline,
              onTapFun: () {
                Get.to(() => const TestimonialScreen());
              },
              title: "Testimonials",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.event,
              image: "assets/images/product-return.png",
              onTapFun: () {
                // Get.to(() => const ReturnPolicyScreen());
              },
              title: "Events",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.branding_watermark_outlined,
              onTapFun: () {
                Get.to(() => const BrandSelectionScreen());
              },
              title: "Brands",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.video_stable_rounded,
              onTapFun: () {
                Get.to(() => const D1VideosScreen());
              },
              title: "D1 Videos",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.link_rounded,
              onTapFun: () {
                Get.to(() => const D1GlobalScreen());
              },
              title: "Connect D1 GLOBAL",
            ),
          ],
        ),
      ),
    );
  }
}
