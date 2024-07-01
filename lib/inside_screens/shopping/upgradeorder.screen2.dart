import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'upgrade_cartscreen2.dart';
import 'upgrade_productdetails_screen2.dart';

class UpgradeOrderScreen2 extends StatefulWidget {
  const UpgradeOrderScreen2({
    super.key,
  });

  @override
  State<UpgradeOrderScreen2> createState() => _UpgradeOrderScreen2State();
}

class _UpgradeOrderScreen2State extends State<UpgradeOrderScreen2> {
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
      uniqId = generateRandomString(10);
      await Constants.prefs.setString("uniq_id", uniqId);
      dataFun("Wellness Care");
      _dataController.packCartList.clear();
    });
  }

  dataFun(String malVal) async {
    dynamic res = await _dataController.getPackages(
        countyId: Constants.prefs.getString("country_id")!,
        packageMalVal: malVal);
  }

  cartcountFun(String action, pid) {
    Map bData = {
      'Uniqid': Constants.prefs.getString("uniq_id"),
      "sessid": Constants.prefs.getString("ss_id"),
      "ipaddress": Constants.prefs.getString("ip"),
      "regid": Constants.prefs.getString("reg_id"),
      "pcode": pid != "" ? pid : "0",
      "action": action
    };
    _dataController.getCartData(bData);
  }

  dialogFun() {
    Get.dialog(Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < _dataController.packCartList.length; i++)
                CartItemWidget(
                    showQuantity: true,
                    removeFun: () {
                      Get.back();
                      cartcountFun("DeleteUpgItem",
                          _dataController.packCartList[i].pkid);
                    },
                    imagePath: _dataController.packCartList[i].pImage,
                    itemname: _dataController.packCartList[i].pkname,
                    itemsPrice:
                        "${_dataController.packCartList[i].symbol} ${_dataController.packCartList[i].mrp}",
                    productCode: _dataController.packCartList[i].pkcode,
                    itemCount: _dataController.packCartList[i].qty),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ViewProfileWidget(
                    title: "Total CV",
                    info: _dataController.cvVal.value.toString()),
              ),
              const SpaceHeightWidget(height: 10)
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            scrolledUnderElevation: 8,
            backgroundColor: darkBlue,
            title: Text(
              "Upgrade Order",
              style: TextStyle(
                fontSize: 18,
                color: whiteColor,
                fontFamily: "OnestSemiBold",
              ),
            ),
            leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: whiteColor,
                    )))),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return _dataController.cartLoading.value
                    ? loader
                    : _dataController.packCartList.isNotEmpty
                        ? Badge.count(
                            count: _dataController.packCartList.length,
                            child: InkWell(
                              onTap: () {
                                dialogFun();
                              },
                              child: const Icon(
                                Icons.shopping_cart,
                                // color: appthemeColor,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.shopping_cart,
                              // color: appthemeColor,
                            ),
                          );
              }),
              const SpaceWidthWidget(width: 25),
              SizedBox(
                  height: 30,
                  child: CustomAutoWidthButton(
                    onTapFun: () {
                      if (_dataController.packCartList.isNotEmpty) {
                        checkOutFun();
                      }
                    },
                    title: "Checkout",
                  ))
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeightWidget(height: 5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GridView.builder(
                              padding: const EdgeInsets.all(0),
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1 / 1.2),
                              itemBuilder: (context, i) {
                                return productCtgs[selectedInd] ==
                                        "Kritalia & Co"
                                    ? KritaliaItemWidget(
                                        tapped: krialiaTappedInd == i
                                            ? true
                                            : false,
                                        amount: _dataController
                                            .selPackageItemList[i].mrp,
                                        onTapFun: () {
                                          setState(() {
                                            krialiaTappedInd = i;
                                          });

                                          Timer(const Duration(seconds: 1),
                                              () async {
                                            dynamic res = await Get.to(() =>
                                                UpgradeProductDetailsScreen2(
                                                  from: 'upgradeorder',
                                                  packageCode: _dataController
                                                      .selPackageItemList[i]
                                                      .pkcode,
                                                  fromPack:
                                                      productCtgs[selectedInd],
                                                ));
                                            if (res != null) {
                                              if (res[0] == true) {
                                                cartcountFun(
                                                    "GetUpgCartData", "");
                                              }
                                            }
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
                                            dynamic res = await Get.to(() =>
                                                UpgradeProductDetailsScreen2(
                                                  from: 'upgradeorder',
                                                  packageCode: _dataController
                                                      .selPackageItemList[i]
                                                      .pkcode,
                                                  fromPack:
                                                      productCtgs[selectedInd],
                                                ));
                                            if (res != null) {
                                              if (res[0] == true) {
                                                cartcountFun(
                                                    "GetUpgCartData", "");
                                              }
                                            }
                                          });
                                        },
                                        imagePath:
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
        ));

  
  }

  checkOutFun() async {
    Map bData = {
      "rpt": "Upgrade",
      "Uniqid": Constants.prefs.getString("uniq_id"),
      "sessid": Constants.prefs.getString("ss_id"),
      "countryid": Constants.prefs.getString("country_id"),
      "cv": _dataController.cvVal.value
    };
    dynamic resss = await _dataController.getCheckoutCheck(bData);
    if (resss != null) {
      if (resss['result'] != "Fail") {
        Get.to(() => UpgradeOrderCartSceen2(
              packageCode: resss['Pkcode'],
            ));
      } else {
        CommonToast(
            'Required ${double.parse(resss['Pkcode']) - _dataController.cvVal.value} CV to upgrade for next higher packages');
      }
    }
  }
}
