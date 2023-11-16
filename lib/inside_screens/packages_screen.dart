import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../inside_screens/productdetails_screen.dart';
import '../models/onboarding_model.dart';

class PackagesScreen extends StatefulWidget {
  final String from;
  const PackagesScreen({super.key, required this.from});
  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

int selectedCategoryIndex = 0;

List<OnboardModel> productsCategoriesOnTap = [
  OnboardModel(image: "assets/images/health_care.png", title: "Jade Package"),
  OnboardModel(image: "assets/images/sop.png", title: "Pearl Package"),
  OnboardModel(image: "assets/images/body_care.png", title: "Family Premier"),
  OnboardModel(image: "assets/images/beauty.png", title: "Sapphire Package"),
  OnboardModel(image: "assets/images/beauty.png", title: "Emerald Package"),
  OnboardModel(image: "assets/images/beauty.png", title: "Blue Diamond"),
];
List<OnboardModel> productsCategories = [
  OnboardModel(
      image: "assets/images/health_care_wb.png", title: "Jade Package"),
  OnboardModel(image: "assets/images/sop_wb.png", title: "Pearl Package"),
  OnboardModel(
      image: "assets/images/body_care_wb.png", title: "Family Premier"),
  OnboardModel(image: "assets/images/beauty_wb.png", title: "Sapphire Package"),
  OnboardModel(image: "assets/images/beauty_wb.png", title: "Emerald Package"),
  OnboardModel(image: "assets/images/beauty_wb.png", title: "Blue Diamond"),
];
List<String> topBannerImages = [
  "assets/images/products_baground.png",
  "assets/images/products_beauty_banner.jpg",
  "assets/images/hair_care_bg.jpg",
  "assets/images/products_others_banner.png",
  "assets/images/products_others_banner.png",
  "assets/images/products_others_banner.png",
];

class _PackagesScreenState extends State<PackagesScreen> {
  MainController packageController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun("Health Care");
      // dataFun("All");
    });
  }

  dataFun(String category) async {
    dynamic data = await packageController.getProducts(category);
    print("product screen data...$data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: const SizedBox.shrink(),
        //   leadingWidth: 0,
        //   title: SearchWidget(
        //     borderColor: blackColor.withOpacity(0.5),
        //     hintText: "What are you looking for?",
        //     onTapFun: () {},
        //   ),
        //   elevation: 0,
        // ),
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
                                  ? "Health Care"
                                  : selectedCategoryIndex == 1
                                      ? "Skin Care"
                                      : selectedCategoryIndex == 2
                                          ? "Hair Care"
                                          : "Personal Care");
                            }
                          },
                          child: selectedCategoryIndex == i
                              ? Container(
                                  color: whiteColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 2),
                                  child: HomeScreenProductCategory(
                                    height: i == 0 ? 100 : 90,
                                    imagePath: productsCategoriesOnTap[i].image,
                                    productName:
                                        productsCategoriesOnTap[i].title,
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
                                        imagePath: productsCategories[i].image,
                                        productName:
                                            productsCategories[i].title,
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
                                  ? loader
                                  : packageController.productItemList.isEmpty
                                      ? SizedBox(
                                          height: 100, child: notAvailableW)
                                      : GridView.builder(
                                          padding: const EdgeInsets.all(0),
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 1 / 1.5),
                                          itemBuilder: (context, i) {
                                            return CategroyItemWidget(
                                                onTapFun: () {
                                                  Get.to(() =>
                                                      ProductDetailsScreen(
                                                        from: widget.from,
                                                        packageCode:
                                                            packageController
                                                                .productItemList[
                                                                    i]
                                                                .packagecode,
                                                      ));
                                                },
                                                imagePath: packageController
                                                    .productItemList[i].image,
                                                titile: packageController
                                                    .productItemList[i]
                                                    .packageName);
                                          },
                                          itemCount: packageController
                                              .productItemList.length);
                            })),
                        const SpaceHeightWidget(height: 40)
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
