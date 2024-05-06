import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../kritalia_screens/k_homescreen.dart';
import '../qunates_screens/q_homescreen.dart';
import 'weburl_screen.dart';

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
                    // redirectUrl:
                    //     // "https://beta.destina1.com/MAquantes-technology.html#/",
                    //     "https://www.destina1.com/MAquantes-technology.html#/",
                    // from: "Quantes Technology",
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
                Get.to(() => const WebUrlScreen(
                      redirectUrl:
                          "https://www.destina1.com/MAuniwave-scalarvia.html",
                      // "https://beta.destina1.com/MAuniwave-scalarvia.html",
                      from: "Uniwave Scalarvia",
                    ));
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
                // Get.to(() => const WebUrlScreen(
                //       redirectUrl:
                //           "https://www.destina1.com/MAkritaliaCo.html#/",
                //       // "https://beta.destina1.com/MAkritaliaCo.html#/",
                //       from: "Kritalia & CO",
                //     ));
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
