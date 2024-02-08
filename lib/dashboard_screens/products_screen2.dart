import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/inside_screens/productdetails_screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication_screens/enrollpackage_screen.dart';
import '../authentication_screens/sponsor_check_screen.dart';
import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../controllers/main_controller.dart';
import '../models/onboarding_model.dart';

class ProductsScreen2 extends StatefulWidget {
  final String from;
  final int? index;
  const ProductsScreen2({
    super.key,
    required this.from,
    this.index,
  });

  @override
  State<ProductsScreen2> createState() => _ProductsScreen2State();
}

MainController packageController = Get.put(MainController());

class _ProductsScreen2State extends State<ProductsScreen2> {
  int selectedCategoryIndex = 0;
  dynamic krialiaTappedInd;
  List<OnboardModel> productsCategoriesOnTap = [
    OnboardModel(image: "assets/images/health_care.png", title: "Health Care"),
    OnboardModel(image: "assets/images/sop.png", title: "Skin Care"),
    OnboardModel(image: "assets/images/body_care.png", title: "Hair Care"),
    OnboardModel(image: "assets/packImg/SAPPHIRE.png", title: "Kritalia"),
  ];
  List<OnboardModel> productsCategories = [
    OnboardModel(
        image: "assets/images/health_care_wb.png", title: "Health Care"),
    OnboardModel(image: "assets/images/sop_wb.png", title: "Skin Care"),
    OnboardModel(image: "assets/images/body_care_wb.png", title: "Hair Care"),
    OnboardModel(image: "assets/packImg/SAPPHIRE NO BG.png", title: "Kritalia"),
  ];
  List<String> topBannerImages = [
    "assets/images/products_baground.png",
    "assets/images/products_beauty_banner.jpg",
    "assets/images/hair_care_bg.jpg",
    "assets/packImg/BANNER SAPPHIRE.png",
  ];
  bool isloading = true;

  dataFun(String malVal) async {
    dynamic res = await packageController.getPackages(
        countyId: Constants.prefs.getString("country_id")!,
        packageMalVal: malVal);
    print("getPackages screen data...$res");
  }

  cartcountFun(String action, pid) {
    Map bData = {
      'Uniqid': Constants.prefs.getString("uniq_id"),
      "sessid": Constants.prefs.getString("ss_id"),
      "ipaddress": Constants.prefs.getString("ip"),
      "regid": "0",
      "pcode": pid != "" ? pid : "0",
      "action": action
    };
    packageController.getCartData(bData);
  }

  dynamic cartcount;
  dynamic uniqId, sessionId;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      uniqId = generateRandomString(10);
      await Constants.prefs.setString("uniq_id", uniqId);
      sessionId = generateTimeStamp();
      await Constants.prefs.setString("ss_id", sessionId);

      print("uniqid...$uniqId");
      print("sessionid..$sessionId");
      print("screen from ...${widget.from}");

      if (widget.index != null) {
        setState(() {
          selectedCategoryIndex = widget.index!;
        });
        dataFun(widget.index == 0
            ? "Health Care"
            : widget.index == 1
                ? "Skin Care"
                : widget.index == 2
                    ? "Hair Care"
                    : "Kritalia");
      } else {
        print("at else");
        dataFun("Health Care");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Packages",
        backNavigation: false,
        
      ),
      body: Row(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              // width: 150,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < productsCategories.length; i++)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (!packageController.loading.value) {
                            setState(() {
                              selectedCategoryIndex = i;
                              krialiaTappedInd = null;
                            });

                            dataFun(productsCategoriesOnTap[i].title);
                          }
                        },
                        child: selectedCategoryIndex == i
                            ? Container(
                                color: whiteColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 11, vertical: 2),
                                child: HomeScreenProductCategory(
                                  height: i == 0 ? 100 : 90,
                                  width: 60,
                                  imagePath: productsCategoriesOnTap[i].image,
                                  productName: productsCategoriesOnTap[i].title,
                                ),
                              )
                            : Container(
                                color: lightBlackColor.withOpacity(0.05),
                                child: Card(
                                  color: whiteColor,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 11),
                                    child: HomeScreenProductCategory(
                                      height: i == 0 ? 100 : 90,
                                      width: 60,
                                      imagePath: productsCategories[i].image,
                                      productName: productsCategories[i].title,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                  ],
                ),
              )),
          Expanded(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  topBannerImages[selectedCategoryIndex]))),
                    ),
                    const SpaceHeightWidget(height: 10),
                    Container(
                        alignment: Alignment.center,
                        child: Obx(() {
                          return packageController.loading.value
                              ? SizedBox(height: 200, child: loader)
                              : packageController.selPackageItemList.isEmpty
                                  ? SizedBox(height: 100, child: notAvailableW)
                                  : GridView.builder(
                                      padding: const EdgeInsets.all(0),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 1 / 1.45),
                                      itemBuilder: (context, i) {
                                        return selectedCategoryIndex == 3
                                            ? KritaliaItemWidget(
                                                tapped: krialiaTappedInd == i
                                                    ? true
                                                    : false,
                                                amount: packageController
                                                    .selPackageItemList[i].mrp,
                                                onTapFun: () {
                                                  setState(() {
                                                    krialiaTappedInd = i;
                                                  });

                                                  Timer(
                                                      const Duration(
                                                          seconds: 1), () {
                                                    Get.to(() =>
                                                        ProductDetailsScreen2(
                                                          fromPack:
                                                              productsCategories[
                                                                      selectedCategoryIndex]
                                                                  .title,
                                                          from:
                                                              "productsscreen",
                                                          packageCode:
                                                              packageController
                                                                  .selPackageItemList[
                                                                      i]
                                                                  .pkcode,
                                                        ));
                                                  });
                                                },
                                                imagePath:
                                                    // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                                    packageController
                                                        .selPackageItemList[i]
                                                        .pImage,
                                                titile: packageController
                                                    .selPackageItemList[i]
                                                    .pkname)
                                            : CategroyItemWidget(
                                                amount: packageController
                                                    .selPackageItemList[i].mrp,
                                                onTapFun: () {
                                                  Get.to(() =>
                                                      ProductDetailsScreen2(
                                                        fromPack:
                                                            productsCategories[
                                                                    selectedCategoryIndex]
                                                                .title,
                                                        from: "productsscreen",
                                                        packageCode:
                                                            packageController
                                                                .selPackageItemList[
                                                                    i]
                                                                .pkcode,
                                                      ));
                                                },
                                                imagePath:
                                                    // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                                    packageController
                                                        .selPackageItemList[i]
                                                        .pImage,
                                                titile: packageController
                                                    .selPackageItemList[i]
                                                    .pkname);
                                      },
                                      itemCount: packageController
                                          .selPackageItemList.length);
                        })),
                    const SpaceHeightWidget(height: 25),
                    if (widget.from != "DDC")
                      Container(
                          alignment: Alignment.center,
                          child: Obx(() {
                            return packageController.loading.value
                                ? const SizedBox.shrink()
                                : packageController.relPackageItemList.isEmpty
                                    ? const SizedBox.shrink()
                                    : Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              "Recommended for You",
                                              style: TextStyle(
                                                  color: darkBlue,
                                                  fontFamily: "OnestSemiBold",
                                                  fontSize: 16),
                                            ),
                                          ),
                                          GridView.builder(
                                              padding: const EdgeInsets.all(0),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      childAspectRatio:
                                                          1 / 1.35),
                                              itemBuilder: (context, i) {
                                                return CategroyItemWidget(
                                                    onTapFun: () async {
                                                      Get.to(() =>
                                                          ProductDetailsScreen2(
                                                            fromPack:
                                                                productsCategories[
                                                                        selectedCategoryIndex]
                                                                    .title,
                                                            from:
                                                                "productsscreen",
                                                            packageCode:
                                                                packageController
                                                                    .relPackageItemList[
                                                                        i]
                                                                    .pkcode,
                                                          ));
                                                    },
                                                    imagePath: packageController
                                                        .relPackageItemList[i]
                                                        .img,
                                                    // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                                    titile: packageController
                                                        .relPackageItemList[i]
                                                        .pkname);
                                              },
                                              itemCount: packageController
                                                  .relPackageItemList.length),
                                        ],
                                      );
                          })),
                  ],
                ))),
          )
        ],
      ),
    );
  }
}

checkOutFun() async {
  Map bData = {
    "rpt": "Signup",
    "Uniqid": Constants.prefs.getString("uniq_id"),
    "sessid": Constants.prefs.getString("ss_id"),
    "countryid": Constants.prefs.getString("country_id"),
    "cv": packageController.cvVal.value
  };
  dynamic resss = await packageController.getCheckoutCheck(bData);
  if (resss != null) {
    if (resss['result'] != "Fail") {
      Map params = {
        "rpt": "EnrollDetails",
        "Cid": Constants.prefs.getString("country_id"),
        "mid": "0"
      };

      dynamic res = await packageController.getEnrollPack(params);
      print("enroll res..$res");
      print("***********${double.parse(res['EnrollPackageRpt'][0]['RenFee'])}");

      Get.back();
      if (double.parse(res['EnrollPackageRpt'][0]['RenFee']) > 0) {
        Get.off(() => EnrollPackageScreen(
              packageCoded: resss['Pkcode'],
              //  widget
              //     .packageCode,
              countyId: Constants.prefs.getString("country_id") ?? "",
            ));
      } else {
        Get.off(() => SponsorCheckScreen(
              packageCode: resss['Pkcode'],
              countryId: Constants.prefs.getString("country_id") ?? "",
            ));
      }
    } else {
      CommonToast("Please Select Some Products To Qualify For Package Signup");
    }
  }
}

packItemWidget({
  required VoidCallback onTapFun,
  required String imagePath,
  required String title,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTapFun,
    child: Card(
      color: whiteColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        decoration: BoxDecoration(
            border: Border.all(color: lightBlackColor, width: 0.2),
            color: whiteColor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: imagePath,
                height: 100,
                progressIndicatorBuilder: (context, url, progress) => loader,
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/new_logo.png",
                  height: 100,
                ),
              ),
              Text(
                title.capitalizeFirst.toString().replaceAll("d1", "D1"),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    fontSize: 14,
                    color: blackColor),
              )
            ]),
      ),
    ),
  );
}
