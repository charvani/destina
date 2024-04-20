import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../inside_screens/productdetails_screen2.dart';
import '../models/onboarding_model.dart';

class ProductsScreen2 extends StatefulWidget {
  final int? index;
  final String from;
  const ProductsScreen2({super.key, required this.from, this.index});
  @override
  State<ProductsScreen2> createState() => _ProductsScreen2State();
}

int selectedCategoryIndex = 0;

List<OnboardModel> productsCategoriesOnTap = [
  OnboardModel(image: "assets/images/health_care.png", title: "Health Care"),
  // OnboardModel(image: "assets/images/sop.png", title: "Skin Care"),
  // OnboardModel(image: "assets/images/body_care.png", title: "Hair Care"),
  OnboardModel(
      image: "assets/images/a_start_privilege.png", title: "Kritalia & Co"),
];
List<OnboardModel> productsCategories = [
  OnboardModel(image: "assets/images/health_care_wb.png", title: "Health Care"),
  // OnboardModel(image: "assets/images/sop_wb.png", title: "Skin Care"),
  // OnboardModel(image: "assets/images/body_care_wb.png", title: "Hair Care"),
  OnboardModel(
      image: "assets/images/a_start_privilege_wb.png", title: "Kritalia & Co"),
];
List<String> topBannerImages = [
  "assets/images/products_baground.png",
  // "assets/images/products_beauty_banner.jpg",
  // "assets/images/hair_care_bg.jpg",
  "assets/images/kritalia_banner.jpg",
];

class _ProductsScreen2State extends State<ProductsScreen2> {
  MainController productController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.index != null) {
        setState(() {
          selectedCategoryIndex = widget.index!;
        });
        dataFun(widget.index == 0
            ? "Health Care"
            :
            // : widget.index == 1
            //     ? "Skin Care"
            //     : widget.index == 2
            //         ? "Hair Care"
            //         :
            "Kritalia & Co");
      } else {
        print("at else");
        dataFun("Health Care");
      }
      // dataFun("All");
    });
  }

  dataFun(String category) async {
    dynamic data = await productController.getProducts(category, null);
    print("product screen data...$data");
  }

  dynamic krialiaTappedInd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            // commonAppBar(title: "Products", backNavigation: false),
            AppBar(
          backgroundColor: darkBlue,
          leading: const SizedBox.shrink(),
          leadingWidth: 0,
          centerTitle: true,
          title: Text(
            "Products",
            style: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 20, color: whiteColor),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 8),
          //   height: 50,
          //   child: SearchWidget(
          //     borderColor: transperantColor,
          //     hintText: "What are you looking for?",
          //     onTapFun: () {
          //       Get.to(() => const SearchCategoryScreen());
          //     },
          //   ),
          // ),
          elevation: 0,
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
                                  image: AssetImage(
                                      topBannerImages[selectedCategoryIndex]))),
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
                                            return
                                                //  productsCategories[
                                                //                 selectedCategoryIndex]
                                                //             .title ==
                                                //         "Kritalia & Co"
                                                //     ? KritaliaItemWidget(
                                                //         tapped:
                                                //             krialiaTappedInd == i
                                                //                 ? true
                                                //                 : false,
                                                //         amount:
                                                //             "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}",
                                                //         onTapFun: () {
                                                //           setState(() {
                                                //             krialiaTappedInd = i;
                                                //           });

                                                //           Timer(
                                                //               const Duration(
                                                //                   seconds: 1),
                                                //               () async {
                                                //             Get.to(() =>
                                                //                 ProductDetailsScreen2(
                                                //                   from: widget.from,
                                                //                   packageCode:
                                                //                       productController
                                                //                           .productItemList[
                                                //                               i]
                                                //                           .packagecode,
                                                //                   fromPack:
                                                //                       productsCategories[
                                                //                               selectedCategoryIndex]
                                                //                           .title,
                                                //                 ));
                                                //           });
                                                //         },
                                                //         imagePath:
                                                //             // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                                //             productController
                                                //                 .productItemList[i]
                                                //                 .image,
                                                //         titile: productController
                                                //             .productItemList[i]
                                                //             .packageName)
                                                //     :

                                                CategroyItemWidget(
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
                                                                productsCategories[
                                                                        selectedCategoryIndex]
                                                                    .title,
                                                          ));
                                                    },
                                                    imagePath: productController
                                                        .productItemList[i]
                                                        .image,
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
