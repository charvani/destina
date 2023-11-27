import 'package:cached_network_image/cached_network_image.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../models/onboarding_model.dart';
import 'packagedetails_screen.dart';

String jadePackageVal = "19";
String pearlPackageVal = "9";
String familyPremierVal = "36";
String sapphirePackageVal = "10";
String emeraldPackageVal = "12";
String blueDiamondVal = "38";
int selectedCategoryIndex = 0;
List<OnboardModel> productsCategoriesOnTap = [
  OnboardModel(image: "assets/packImg/JADE.png", title: "Jade Package"),
  OnboardModel(image: "assets/packImg/PEARL.png", title: "Pearl Package"),
  OnboardModel(
      image: "assets/packImg/FAMILY PREMIER.png", title: "Family Premier"),
  OnboardModel(image: "assets/packImg/SAPPHIRE.png", title: "Sapphire Package"),
  OnboardModel(image: "assets/packImg/EMERALD.png", title: "Emerald Package"),
  OnboardModel(image: "assets/packImg/BLUE DIAMOND.png", title: "Blue Diamond"),
];
List<OnboardModel> productsCategories = [
  OnboardModel(image: "assets/packImg/JADE NO BG.png", title: "Jade Package"),
  OnboardModel(image: "assets/packImg/PEARL NO BG.png", title: "Pearl Package"),
  OnboardModel(
      image: "assets/packImg/FAMILY PREMIER NO BG.png",
      title: "Family Premier"),
  OnboardModel(
      image: "assets/packImg/SAPPHIRE NO BG.png", title: "Sapphire Package"),
  OnboardModel(
      image: "assets/packImg/EMERALD NO BG.png", title: "Emerald Package"),
  OnboardModel(
      image: "assets/packImg/BLUE DIAMOND NO BG.png", title: "Blue Diamond"),
];
List<String> topBannerImages = [
  "assets/packImg/BANNER JADE.png",
  "assets/packImg/BANNER PEARL.png",
  "assets/packImg/BANNER FAMILY PREMIER.png",
  "assets/packImg/BANNER SAPPHIRE.png",
  "assets/packImg/BANNER EMERALD.png",
  "assets/packImg/BANNER BLUE DIAMOND.png",
];

class PackageScreen extends StatefulWidget {
  final String from;
  final String countryId;
  const PackageScreen({super.key, required this.from, required this.countryId});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

PackageController packageController = Get.put(PackageController());

class _PackageScreenState extends State<PackageScreen> {
  bool isloading = true;
  // List<SelPackageModel> selPackageItemList = [];
  // List<SelPackageModel> relPackageItemList = [];
  dataFun(String malVal) async {
    dynamic res = await packageController.getPackages(
        countyId: widget.countryId, packageMalVal: malVal);
    print("getPackages screen data...$res");

    // if (res['DistSelPackageRpt'].length > 0) {
    //   for (int i = 0; i < res['DistSelPackageRpt'].length; i++) {
    //     selPackageItemList
    //         .add(SelPackageModel.fromJson(res['DistSelPackageRpt'][i]));
    //   }
    // }
    // if (res['DistRelPackageRpt'].length > 0) {
    //   for (int i = 0; i < res['DistRelPackageRpt'].length; i++) {
    //     relPackageItemList
    //         .add(SelPackageModel.fromJson(res['DistRelPackageRpt'][i]));
    //   }
    // }
    // isloading = false;
    // setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun(jadePackageVal);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Packages", backNavigation: true),
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
                            });
                            dataFun(selectedCategoryIndex == 0
                                ? jadePackageVal
                                : selectedCategoryIndex == 1
                                    ? pearlPackageVal
                                    : selectedCategoryIndex == 2
                                        ? familyPremierVal
                                        : selectedCategoryIndex == 3
                                            ? sapphirePackageVal
                                            : selectedCategoryIndex == 4
                                                ? emeraldPackageVal
                                                : blueDiamondVal);
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
                                              childAspectRatio: 1 / 1.35),
                                      itemBuilder: (context, i) {
                                        return CategroyItemWidget(
                                            amount: packageController
                                                .selPackageItemList[i].mrp,
                                            onTapFun: () {
                                              Get.to(() => PackageDetailsScreen(
                                                    from: widget.from,
                                                    packageCode:
                                                        packageController
                                                            .selPackageItemList[
                                                                i]
                                                            .pkcode,
                                                    countryid: widget.countryId,
                                                  ));
                                            },
                                            imagePath:
                                                "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                            // packageController
                                            //     .selPackageItemList[i]
                                            //     .pImage,
                                            titile: packageController
                                                .selPackageItemList[i].pkname);
                                      },
                                      itemCount: packageController
                                          .selPackageItemList.length);
                        })),
                    const SpaceHeightWidget(height: 25),
                    Container(
                        alignment: Alignment.center,
                        child: Obx(() {
                          return packageController.loading.value
                              ? const SizedBox.shrink()
                              : packageController.relPackageItemList.isEmpty
                                  ? const SizedBox.shrink()
                                  : Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            "Recommended for You",
                                            style: TextStyle(
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
                                                    childAspectRatio: 1 / 1.35),
                                            itemBuilder: (context, i) {
                                              return CategroyItemWidget(
                                                  onTapFun: () {
                                                    Get.to(() =>
                                                        PackageDetailsScreen(
                                                          from: widget.from,
                                                          packageCode:
                                                              packageController
                                                                  .relPackageItemList[
                                                                      i]
                                                                  .pkcode,
                                                          countryid:
                                                              widget.countryId,
                                                        ));
                                                  },
                                                  imagePath:
                                                      //  packageController
                                                      //     .relPackageItemList[i]
                                                      //     .img,
                                                      "https://admin.destina1.com/admin/RetailImages/20151.jpg",
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
