import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/common_widgets.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../productdetails_screen2.dart';

class SearchItemsScreen extends StatefulWidget {
  final String? searchKeyword;
  final String? categoryString;
  const SearchItemsScreen({super.key, this.categoryString, this.searchKeyword});

  @override
  State<SearchItemsScreen> createState() => _SearchItemsScreenState();
}

class _SearchItemsScreenState extends State<SearchItemsScreen> {
  MainController productController = Get.put(MainController());
  dynamic krialiaTappedInd;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.categoryString != null) {
        _seachTextController.text = widget.categoryString!;
        dataFun(widget.categoryString!);
      } else {
        _seachTextController.text = widget.searchKeyword!;
      }
    });
  }

  dataFun(String category) async {
    dynamic data = await productController.getProducts(category, null);
  }

  final TextEditingController _seachTextController = TextEditingController();

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
              readOnly: true,
              onFieldSubFun: (val) {
                Get.to(() => SearchItemsScreen(searchKeyword: val));
              },
              clearFun: () {
                setState(() {
                  _seachTextController.text = "";
                });
              },
              onchangeFun: (key) {
                setState(() {});
              },
              controller: _seachTextController,
              borderColor: transperantColor,
              hintText: "What are you looking for?",
            )),
        elevation: 0,
      ),
      body: Obx(() {
        return productController.loading.value
            ? loader
            : productController.productItemList.isEmpty
                ? const Center(
                    child: SizedBox(
                        height: 400,
                        child: NotAvailableText(
                          text: "Products not available",
                        )),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                    itemBuilder: (context, i) {
                      return widget.categoryString == "Kritalia & Co"
                          ? KritaliaItemWidget(
                              tapped: krialiaTappedInd == i ? true : false,
                              amount:
                                  "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}",
                              onTapFun: () {
                                setState(() {
                                  krialiaTappedInd = i;
                                });

                                Timer(const Duration(seconds: 1), () async {
                                  Get.to(() => ProductDetailsScreen2(
                                      from: "search",
                                      packageCode: productController
                                          .productItemList[i].packagecode,
                                      fromPack: widget.categoryString!));
                                });
                              },
                              imagePath:
                                  // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                  productController.productItemList[i].image,
                              titile: productController
                                  .productItemList[i].packageName)
                          : CategroyItemWidget(
                              amount: productController.productItemList[i].dp >
                                      0
                                  ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                                  : "",
                              onTapFun: () {
                                Get.to(() => ProductDetailsScreen2(
                                    from: "search",
                                    packageCode: productController
                                        .productItemList[i].packagecode,
                                    fromPack: widget.categoryString!));
                              },
                              imagePath:
                                  productController.productItemList[i].image,
                              titile: productController
                                  .productItemList[i].packageName);
                    },
                    itemCount: productController.productItemList.length);
      }),
    );
  }
}
