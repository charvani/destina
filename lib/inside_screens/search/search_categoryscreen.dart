import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/common_widgets.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../models/onboarding_model.dart';
import '../productdetails_screen2.dart';
import 'search_itemsscreen.dart';

class SearchCategoryScreen extends StatefulWidget {
  const SearchCategoryScreen({super.key});

  @override
  State<SearchCategoryScreen> createState() => _SearchCategoryScreenState();
}

class _SearchCategoryScreenState extends State<SearchCategoryScreen> {
  List<OnboardModel> productsCategories = [
    OnboardModel(
        image: "assets/images/health_care_wb.png", title: "Wellness Care"),
    // OnboardModel(image: "assets/images/sop_wb.png", title: "Skin Care"),
    // OnboardModel(image: "assets/images/body_care_wb.png", title: "Hair Care"),
    OnboardModel(
        image: "assets/images/a_start_privilege_wb.png",
        title: "Kritalia & Co"),
  ];
  final TextEditingController _seachTextController = TextEditingController();
  final MainController _productController = Get.put(MainController());

  itemsFun(String key) async {
    dynamic data =
        await _productController.getSearchProducts("Getproducts", key);
    print("getSearchProducts  ggg...$data");
  }

  dataFun(String category) async {
    dynamic data = await _productController.getSearchProducts(category, null);
    print("getSearchProducts...$data");
  }

  dynamic krialiaTappedInd;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productController.searchProductItemList.clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: whiteColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          leadingWidth: 35,
          title: Container(
              margin: const EdgeInsets.only(top: 8),
              height: 50,
              child: SearcItemhWidget(
                readOnly: false,
                onFieldSubFun: (val) {
                  print("submit val..$val");
                  Get.to(() => SearchItemsScreen(searchKeyword: val));
                },
                clearFun: () {
                  setState(() {
                    _seachTextController.text = "";
                  });
                },
                onchangeFun: (key) {
                  print("key....$key");

                  setState(() {});
                  if (key.length > 2) {
                    itemsFun(key);
                  }
                  if (key == "") {
                    _productController.searchProductItemList.clear();
                  }
                },
                controller: _seachTextController,
                borderColor: transperantColor,
                hintText: "What are you looking for?",
              )),
          elevation: 0,
        ),
        body: Obx(() {
          return _productController.genealogyLoading.value
              ? loader
              : _productController.searchProductItemList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_productController
                                  .searchProductItemList.isEmpty &&
                              _seachTextController.text.length > 2)
                            const SizedBox(
                              height: 50,
                              child: NotAvailableText(
                                  text: "Related products not available"),
                            ),
                          const SpaceHeightWidget(height: 20),
                          const CommonTitle(titleName: "Popular Searches"),
                          const SpaceHeightWidget(height: 10),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1 / 0.5),
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    // Get.to(() => SearchItemsScreen(
                                    //     categoryString:
                                    //         productsCategories[i].title));
                                    dataFun(productsCategories[i].title);
                                  },
                                  child: Card(
                                    elevation: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: whiteColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              productsCategories[i].image),
                                          CommonTitle(
                                            titleName:
                                                productsCategories[i].title,
                                            size: 12,
                                            fontFamily: "OnestRegular",
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: productsCategories.length,
                            ),
                          )
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                      itemBuilder: (context, i) {
                        return _productController
                                    .searchProductItemList[i].category ==
                                "Kritalia & Co"
                            ? KritaliaItemWidget(
                                tapped: krialiaTappedInd == i ? true : false,
                                amount:
                                    "${_productController.searchProductItemList[i].currency} ${_productController.searchProductItemList[i].dp}",
                                onTapFun: () {
                                  setState(() {
                                    krialiaTappedInd = i;
                                  });

                                  Timer(const Duration(seconds: 1), () async {
                                    Get.to(() => ProductDetailsScreen2(
                                        from: "search",
                                        packageCode: _productController
                                            .searchProductItemList[i]
                                            .packagecode,
                                        fromPack: _productController
                                            .searchProductItemList[i]
                                            .category));
                                  });
                                },
                                imagePath:
                                    // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                    _productController
                                        .searchProductItemList[i].image,
                                titile: _productController
                                    .searchProductItemList[i].packageName)
                            : CategroyItemWidget(
                                amount: double.parse(_productController
                                            .searchProductItemList[i].dp) >
                                        0
                                    ? "${_productController.searchProductItemList[i].currency} ${_productController.searchProductItemList[i].dp}"
                                    : "",
                                onTapFun: () {
                                  Get.to(() => ProductDetailsScreen2(
                                      from: "search",
                                      packageCode: _productController
                                          .searchProductItemList[i].packagecode,
                                      fromPack: _productController
                                          .searchProductItemList[i].category));
                                },
                                imagePath: _productController
                                    .searchProductItemList[i].image,
                                titile: _productController
                                    .searchProductItemList[i].packageName);
                      },
                      itemCount:
                          _productController.searchProductItemList.length);
        }));
  }
}
