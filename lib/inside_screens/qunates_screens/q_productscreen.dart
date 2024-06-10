import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/common_widgets.dart';
import '../productdetails_screen2.dart';

class QProductsScreen extends StatefulWidget {
  final String from;
  const QProductsScreen({super.key, required this.from});
  @override
  State<QProductsScreen> createState() => _QProductsScreenState();
}

int selectedCategoryIndex = 0;

class _QProductsScreenState extends State<QProductsScreen> {
  MainController productController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun("Wellness Care");
    });
  }

  dataFun(String category) async {
    dynamic data = await productController.getProducts(category, null);

    if (widget.from == "scalarvia") {
      for (int i = 0; i < data['productRpt'].length; i++) {
        if (data['productRpt'][i]['packageName']
            .toString()
            .toLowerCase()
            .contains("scalarvia")) {
          Get.back();
          Get.to(() => ProductDetailsScreen2(
              from: "",
              packageCode: data['productRpt'][i]['packagecode'],
              fromPack: "Wellness Care"));
        }
      }
    }
  }

  dynamic krialiaTappedInd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(
            title:
                widget.from == "scalarvia" ? "" : "Quantes Technology Products",
            backNavigation: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceHeightWidget(height: 10),
              Container(
                  alignment: Alignment.center,
                  child: Obx(() {
                    return productController.loading.value
                        ? SizedBox(height: 500, child: loader)
                        : productController.productItemList.isEmpty
                            ? const SizedBox(
                                height: 100,
                                child: NotAvailableText(
                                  text: "No Products Available",
                                ))
                            : GridView.builder(
                                padding: const EdgeInsets.all(0),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, childAspectRatio: 1),
                                itemBuilder: (context, i) {
                                  return CategroyItemWidget(
                                      amount: double.parse(productController
                                                  .productItemList[i].dp) >
                                              0
                                          ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                                          : "",
                                      onTapFun: () {
                                        Get.to(() => ProductDetailsScreen2(
                                            from: "Quantes Technology",
                                            packageCode: productController
                                                .productItemList[i].packagecode,
                                            fromPack: "Wellness Care"));
                                      },
                                      imagePath: productController
                                          .productItemList[i].image,
                                      titile: productController
                                          .productItemList[i].packageName);
                                },
                                itemCount:
                                    productController.productItemList.length);
                  })),
              const SpaceHeightWidget(height: 40)
            ],
          ),
        ));
  }
}
