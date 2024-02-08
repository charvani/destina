import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'sales_productdetailsscreen2.dart';

class SalesMallScreen2 extends StatefulWidget {
  const SalesMallScreen2({
    super.key,
  });

  @override
  State<SalesMallScreen2> createState() => _SalesMallScreen2State();
}

class _SalesMallScreen2State extends State<SalesMallScreen2> {
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password, countryId, hidUid, countOfCart, uniqId;
  int selectedInd = 0;
  dynamic krialiaTappedInd;

  @override
  void initState() {
    super.initState();
    countOfCart = "0";
    userId = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");
    countryId = Constants.prefs.getString("country_id");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (Constants.prefs.getString("uniq_id") == null) {
        uniqId = generateRandomString(10);
        await Constants.prefs.setString("uniq_id", uniqId);
      } else {
        uniqId = Constants.prefs.getString("uniq_id");
      }
      // dataFun();
      dataFun("Health Care");
    });
  }

  dataFun(String malVal) async {
    dynamic res = await _dataController.getPackages(
        countyId: Constants.prefs.getString("country_id")!,
        packageMalVal: malVal);
    print("getPackages screen data...$res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        scrolledUnderElevation: 8,
        title: Text(
          "Sales Order",
          style: TextStyle(
            fontSize: 18,
            color: whiteColor,
            fontFamily: "OnestSemiBold",
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: InkWell(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                print("ooooo");
                Get.back();
              },
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: whiteColor,
              )),
        ),
      ),
      body: Column(
        children: [
          const SpaceHeightWidget(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < productCtgs.length; i++)
                  ProductCatScrollWidget(
                      index: i,
                      selInd: selectedInd,
                      onTapFun: () {
                        setState(() {
                          selectedInd = i;
                        });
                        dataFun(productCtgs[i]);
                      }),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            return _dataController.loading.value
                ? SizedBox(height: 200, child: loader)
                : _dataController.selPackageItemList.isEmpty
                    ? SizedBox(height: 100, child: notAvailableW)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            padding: const EdgeInsets.all(0),
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.2),
                            itemBuilder: (context, i) {
                              return productCtgs[selectedInd] == "Kritalia"
                                  ? KritaliaItemWidget(
                                      tapped:
                                          krialiaTappedInd == i ? true : false,
                                      amount: _dataController
                                          .selPackageItemList[i].mrp,
                                      onTapFun: () {
                                        setState(() {
                                          krialiaTappedInd = i;
                                        });

                                        Timer(const Duration(seconds: 1),
                                            () async {
                                          Get.to(() =>
                                              SalesProductDetailsScreen2(
                                                from: 'salesmall',
                                                packageCode: _dataController
                                                    .selPackageItemList[i]
                                                    .pkcode,
                                                fromPack:
                                                    productCtgs[selectedInd],
                                              ));
                                        });
                                      },
                                      imagePath:
                                          // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                          _dataController
                                              .selPackageItemList[i].pImage,
                                      titile: _dataController
                                          .selPackageItemList[i].pkname)
                                  : CategroyItemWidget(
                                      amount: _dataController
                                          .selPackageItemList[i].mrp,
                                      onTapFun: () async {
                                        Timer(const Duration(seconds: 1),
                                            () async {
                                          Get.to(() =>
                                              SalesProductDetailsScreen2(
                                                from: 'salesmall',
                                                packageCode: _dataController
                                                    .selPackageItemList[i]
                                                    .pkcode,
                                                fromPack:
                                                    productCtgs[selectedInd],
                                              ));
                                        });
                                      },
                                      imagePath:
                                          // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                          _dataController
                                              .selPackageItemList[i].pImage,
                                      titile: _dataController
                                          .selPackageItemList[i].pkname);
                            },
                            itemCount:
                                _dataController.selPackageItemList.length),
                      );
          })),
        ],
      ),
    );
  }
}
