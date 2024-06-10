import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../kritalia_screens/k_homescreen.dart';
import '../qunates_screens/q_homescreen.dart';
import '../scalarvia_screens/scalarvia_homescreen.dart';

class BrandSelectionScreen extends StatefulWidget {
  const BrandSelectionScreen({super.key});

  @override
  State<BrandSelectionScreen> createState() => _BrandSelectionScreenState();
}

class _BrandSelectionScreenState extends State<BrandSelectionScreen> {
  List<String> imags = ["brand_q", "brand_s", "brand_k"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Brands", backNavigation: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const SpaceHeightWidget(height: 15),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(() => const QHomeScreen(
                   
                    ));
              },
              child: Image.asset(
                "assets/images/brand_q.png",
              ),
            ),
            const SpaceHeightWidget(height: 15),
            const CommonDivider(),
            const SpaceHeightWidget(height: 10),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(() => const SHomeScreen()
                   
                    );
              },
              child: Image.asset(
                "assets/images/brand_s.png",
                height: 150,
              ),
            ),
            const CommonDivider(),
            const SpaceHeightWidget(height: 35),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(() => const KritaliaHomeScreen());
               
              },
              child: Image.asset(
                "assets/images/brand_k.png",
              ),
            ),
            const SpaceHeightWidget(height: 50),
            const CommonDivider(),
          ]),
        ),
      ),
    );
  }
}
