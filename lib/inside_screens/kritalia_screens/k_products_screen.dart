import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/common_widgets.dart';
import '../../models/onboarding_model.dart';
import '../productdetails_screen2.dart';

class KProductsScreen2 extends StatefulWidget {
  final String from;
  final int? index;
  const KProductsScreen2({
    super.key,
    required this.from,
    this.index,
  });
  @override
  State<KProductsScreen2> createState() => _KProductsScreen2State();
}

String selectedCategory = "";
dynamic selectedCategoryIndex;

List<OnboardModel> productsCategoriesOnTap = [
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRC111.jpg",
      title: "NECKLACES"),
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRR021.jpg",
      title: "RINGS"),
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRC061.jpg",
      title: "JEWELLERY SETS"),
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRB011.jpg",
      title: "BRACELETS"),
];
List<OnboardModel> productsCategories = [
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRC111.jpg",
      title: "NECKLACES"),
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRR021.jpg",
      title: "RINGS"),
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRC061.jpg",
      title: "JEWELLERY SETS"),
  OnboardModel(
      image: "https://admin.destina1.com/admin/RetailImages/KRB011.jpg",
      title: "BRACELETS"),
];
List<String> topBannerImages = [
  "assets/images/kritalia_banner.jpg",
  "assets/images/kritalia_banner.jpg",
  "assets/images/kritalia_banner.jpg",
  "assets/images/kritalia_banner.jpg",
];

class _KProductsScreen2State extends State<KProductsScreen2> {
  MainController productController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.index != null) {
        selectedCategoryIndex = widget.index;
        setState(() {
          selectedCategoryIndex = widget.index;
        });
        dataFun(widget.from);
      } else {
        dynamic data = productController.getProducts("Kritalia & CO", null);
      }

    });
  }

  dataFun(String category) async {
    dynamic data = await productController.getKritaliaProducts(category);
  }

  dynamic krialiaTappedInd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            commonAppBar(backNavigation: true, title: "Kritalia & CO Products"),
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
                            if (!productController.loading.value) {
                              setState(() {
                                selectedCategoryIndex = i;
                              });
                              dataFun(productsCategories[selectedCategoryIndex]
                                  .title);
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
                                        width: 60,
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
                          margin: const EdgeInsets.only(top: 1),
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(selectedCategoryIndex !=
                                          null
                                      ? topBannerImages[selectedCategoryIndex]
                                      : "assets/images/kritalia_banner.jpg"))),
                        ),
                        const SpaceHeightWidget(height: 10),
                        Container(
                            alignment: Alignment.center,
                            child: Obx(() {
                              return productController.loading.value
                                  ? loader
                                  : productController.productItemList.isEmpty
                                      ? const SizedBox(
                                          height: 100,
                                          child: NotAvailableText(
                                            text: "Packages not available",
                                          ))
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
                                                amount: double.parse(
                                                            productController
                                                                .productItemList[
                                                                    i]
                                                                .dp) >
                                                        0
                                                    ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                                                    : "",
                                                onTapFun: () {
                                                  Get.to(() =>
                                                      ProductDetailsScreen2(
                                                        from: widget.from,
                                                        packageCode:
                                                            productController
                                                                .productItemList[
                                                                    i]
                                                                .packagecode,
                                                        fromPack:
                                                            "Kritalia & Co",
                                                      ));
                                                },
                                                imagePath: productController
                                                    .productItemList[i].image,
                                                titile: productController
                                                    .productItemList[i]
                                                    .packageName);
                                          },
                                          itemCount: productController
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
