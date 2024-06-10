import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/inside_screens/about/weburl_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupEnrollPackageScreen extends StatefulWidget {
  final String countyId;
  final String regId;

  const PopupEnrollPackageScreen({
    super.key,
    required this.countyId,
    required this.regId,
  });

  @override
  State<PopupEnrollPackageScreen> createState() =>
      _PopupEnrollPackageScreenState();
}

class _PopupEnrollPackageScreenState extends State<PopupEnrollPackageScreen> {
  MainController enrollController = Get.put(MainController());
  List enrollInfoImages = [
    "assets/images/virtual_office.png",
    "assets/images/estores.png",
    "assets/images/redemption.png",
    "assets/images/commissions.png",
    "assets/images/mobileapps.png",
    "assets/images/tools.png",
    "assets/images/bussiness_card.png",
  ];
  dataFun() async {
    Map params = {"rpt": "  EnrollDetails", "Cid": widget.countyId, "mid": "0"};
    dynamic res = await enrollController.getEnrollPack(params);
  }

  @override
  void initState() {
    super.initState();
    dataFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "EnrollPackage", backNavigation: true),
      body: Obx(() {
        return enrollController.loading.value
            ? SizedBox(
                height: 300,
                child: loader,
              )
            : SingleChildScrollView(
                child: Column(children: [
                  Image.asset(
                    "assets/images/enroll_package_banner.png",
                    height: 210,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 0.3),
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    color: darkRedColor,
                    child: Text(
                      // "12 Months Enrollment Package Is Activated For RM55",
                      enrollController
                              .enrollData.value.enrollPackageRpt.isNotEmpty
                          ? enrollController
                              .enrollData.value.enrollPackageRpt[0].renMonths
                          : "",
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "OnestBold",
                          fontSize: 16,
                          color: whiteColor),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for (int i = 0;
                          i <
                              enrollController
                                  .enrollData.value.iconDetails.length;
                          i++)
                        Transform.translate(
                            offset:
                              
                                const Offset(0, 0),
                            child: CommonCachedNetworkImage(
                              imagePath: enrollController
                                  .enrollData.value.iconDetails[i].iconPath,
                              height: 160,
                            )
                          
                            )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomElevatedButton(
                        onTapFun: () {
                          Get.to(() => WebUrlScreen(
                              from: "",
                              redirectUrl:
                                  "https://destina1.com/MobileAppCheckout/RenewPaymentCheckoutParam.html?RegId=${widget.regId}&Country=${widget.countyId}"));
                        },
                        title: "Submit"),
                  ),
                  const SpaceHeightWidget(height: 20)
                ]),
              );
      }),
    );
  }
}
