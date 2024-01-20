import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import 'membermall_cartscreen.dart';

class MembermallCheckoutScreen extends StatefulWidget {
  final dynamic res;
  const MembermallCheckoutScreen({super.key, required this.res});

  @override
  State<MembermallCheckoutScreen> createState() =>
      _MembermallCheckoutScreenState();
}

class _MembermallCheckoutScreenState extends State<MembermallCheckoutScreen> {
  TextEditingController sponsorController = TextEditingController();

  int itemCount = 4;
  int cartCount = 0;
  int cartItemCount = 0;
  dynamic uniqId;
  dynamic sessionId;
  MainController cartController = Get.put(MainController());
  bool packageLoading = false;
  @override
  void initState() {
    super.initState();

    uniqId = Constants.prefs.getString("uniq_id");
    sessionId = Constants.prefs.getString("ss_id");
    sponsorController.text = "";
  }

  bool screenLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left_rounded),
              onPressed: () {
                Get.back();
              }),
          title: const Text(
            "",
            style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: lightBlackColor)),
          child: Column(children: [
            ViewProfileWidget(
                title: "Your Overall Accumulated CV",
                info: widget.res['OverallCV']),
            ViewProfileWidget(
                title: "Your Current Purchase", info: widget.res['PresentCV']),
            ViewProfileWidget(title: "Total CV", info: widget.res['TotalCV']),
            const SpaceHeightWidget(height: 15),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "You are entitled to enjoy the ",
                  style: TextStyle(
                      fontFamily: "OnestRegular",
                      fontSize: 13,
                      color: middleBlackColor)),
              TextSpan(
                  text: widget.res['pkname'],
                  style: TextStyle(
                      fontFamily: "OnestBold",
                      fontSize: 13,
                      color: blackColor)),
              TextSpan(
                  text: " benefits with the current total CV.",
                  style: TextStyle(
                      fontFamily: "OnestRegular",
                      fontSize: 13,
                      color: middleBlackColor)),
            ])),
            const SpaceHeightWidget(height: 15),
            CustomAutoWidthButton(
                onTapFun: () {
                  Get.back();

                  Get.to(() => const MembermallCartScreen(
                        from: "Continue to Upgrade",
                      ));
                },
                title: "Continue to Upgrade"),
            const SideTitle(title: "or"),
            CustomAutoWidthButton(
                onTapFun: () {
                  Get.back();
                  Get.to(() => const MembermallCartScreen(
                        from: "Continue Without Upgrade",
                      ));
                },
                title: "Continue Without Upgrade"),
            const SpaceHeightWidget(height: 15),
            const SideTitle(
                title:
                    "Please take note that at the end of the month the accumulated CV will be calculated for an auto upgrade as an entitled Shopper by the system."),
          ]),
        )));
  }
}
