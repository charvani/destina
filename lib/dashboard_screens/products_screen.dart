import 'package:destina_1_international/inside_screens/productdetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../models/category_items_model.dart';
import '../models/onboarding_model.dart';

class ProductsScreen extends StatefulWidget {
  final String from;
  const ProductsScreen({super.key, required this.from});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

int selectedCategoryIndex = 0;
List<OnboardModel> productsCategoriesOnTap = [
  OnboardModel(
      image: "assets/images/a_start_privilege.png", title: "A Start Privilege"),
  OnboardModel(image: "assets/images/sop.png", title: "SOP"),
  OnboardModel(image: "assets/images/health_care.png", title: "Health"),
  OnboardModel(image: "assets/images/beauty.png", title: "Beauty"),
  OnboardModel(image: "assets/images/body_care.png", title: "Body Care"),
  OnboardModel(image: "assets/images/others.png", title: "Others"),
];
List<OnboardModel> productsCategories = [
  OnboardModel(
      image: "assets/images/a_start_privilege_wb.png",
      title: "A Start Privilege"),
  OnboardModel(image: "assets/images/sop_wb.png", title: "SOP"),
  OnboardModel(image: "assets/images/health_care_wb.png", title: "Health"),
  OnboardModel(image: "assets/images/beauty_wb.png", title: "Beauty"),
  OnboardModel(image: "assets/images/body_care_wb.png", title: "Body Care"),
  OnboardModel(image: "assets/images/others_wb.png", title: "Others"),
];

List<CategoryItemsModel> categoryItems = [
  CategoryItemsModel(
      categroyImage: "assets/images/products_baground.png",
      items: [
        Item(
            image: "assets/images/Product 1-1.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA"),
        Item(
            image: "assets/images/Product 1-3.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA"),
      ]),
  CategoryItemsModel(
      categroyImage: "assets/images/products_sop_banner.jpg",
      items: [
        Item(
            image: "assets/images/Product 2-3.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED PENDANT"),
        Item(
            image: "assets/images/Product 3-1.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
      ]),
  CategoryItemsModel(
      categroyImage: "assets/images/products_health_banner.png",
      items: [
        Item(
            image: "assets/images/Product 3-4.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
      ]),
  CategoryItemsModel(
      categroyImage: "assets/images/products_beauty_banner.jpg",
      items: [
        Item(
            image: "assets/images/Product 3-6.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
      ]),
  CategoryItemsModel(
      categroyImage: "assets/images/products_bodycare_banner.png",
      items: [
        Item(
            image: "assets/images/Product 4-1.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED STICK"),
      ]),
  CategoryItemsModel(
      categroyImage: "assets/images/products_others_banner.png",
      items: [
        Item(
            image: "assets/images/Product 4-2.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED STICK"),
        Item(
            image: "assets/images/Product 6-6.jpg",
            title: "D1 ADVANCE SCALAR ENERGIZED COFFEE(5 IN 1)"),
      ]),
];

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: SearchWidget(
          borderColor: blackColor.withOpacity(0.5),
          hintText: "What are you looking for?",
          onTapFun: () {},
        ),
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
                          setState(() {
                            selectedCategoryIndex = i;
                          });
                        },
                        child: selectedCategoryIndex == i
                            ? Container(
                                color: whiteColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 11, vertical: 2),
                                child: HomeScreenProductCategory(
                                  height: i == 0 ? 100 : 90,
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
                                    categoryItems[selectedCategoryIndex]
                                        .categroyImage))),
                      ),
                      const SpaceHeightWidget(height: 10),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        // height: (4 / 2) * 325,
                        child: GridView.builder(
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.4),
                            itemBuilder: (context, i) {
                              return CategroyItemWidget(
                                  onTapFun: () {
                                    Get.to(() =>  ProductDetailsScreen(from: widget.from,));
                                  },
                                  imagePath:
                                      categoryItems[selectedCategoryIndex]
                                          .items[i]
                                          .image,
                                  titile: categoryItems[selectedCategoryIndex]
                                      .items[i]
                                      .title);
                            },
                            itemCount: categoryItems[selectedCategoryIndex]
                                .items
                                .length),
                      ),
                      const SpaceHeightWidget(height: 40)
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
