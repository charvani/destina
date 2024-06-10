import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../controllers/main_controller.dart';
import '../inside_screens/about/weburl_screen.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {

  final MainController _dataController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map params = {
        "action": "GetPromotion",
        "category": "all",
        "Title": "0",
        "Imgpath": "0",
        "Descr": "0",
        "url": "0",
        "Countryid": "0",
        "sesuer": "0",
        "Sesid": "0"
      };
      _dataController.getPromotions(params);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          centerTitle: true,
          leading: const SizedBox.shrink(),
          title: Text(
            "Premier Picks",
            style: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 20, color: whiteColor),
          ),
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 40),
              child: CommonOulineTextButton(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  backgroundColor: whiteColor,
                  borderColor: whiteColor.withOpacity(0.1),
                  textColor: darkBlue,
                  onTapFun: () {},
                  title: "Destina 1 International Premier Picks")),
        ),
        body: Obx(() {
          return _dataController.loading.value
              ? SizedBox(
                  height: 400,
                  child: loader,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      _dataController.promotionsData.isNotEmpty
                          ? Wrap(
                              children: [
                                for (int i = 0;
                                    i < _dataController.promotionsData.length;
                                    i++)
                                  GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () async {
                                      if (_dataController
                                              .promotionsData[i].redirecturl !=
                                          "") {
                                        Get.to(() => WebUrlScreen(
                                            from: "",
                                            redirectUrl: _dataController
                                                .promotionsData[i]
                                                .redirecturl));
                                      } else {
                                        CommonToast("Coming soon");
                                      }
                                    },
                                    child: PromotionScreenWidget(
                                        imagePath: _dataController
                                            .promotionsData[i].imgurl,
                                        titile: "",
                                        date: "",
                                        isBigPromotion: false),
                                  )
                              ],
                            )
                          : const SizedBox(
                              height: 400,
                              child: NotAvailableText(
                                  text: "Premier Picks not available")),
                      const SpaceHeightWidget(height: 40)
                    ],
                  ),
                );
        }));
  }
}
