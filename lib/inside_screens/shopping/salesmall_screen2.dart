import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/shopping/salescart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../service_call/api_call.dart';
import '../../service_call/api_data.dart';
import 'sales_productdetailsscreen2.dart';

class SalesMallScreen2 extends StatefulWidget {
  final String? from, billno;
  const SalesMallScreen2({super.key, this.from, this.billno});

  @override
  State<SalesMallScreen2> createState() => _SalesMallScreen2State();
}

class _SalesMallScreen2State extends State<SalesMallScreen2> {
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password, countryId, hidUid, countOfCart, uniqId, sessionId;
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
      if (Constants.prefs.getString("ss_id") == null) {
        sessionId = generateTimeStamp();
        await Constants.prefs.setString("ss_id", sessionId);
      } else {
        sessionId = Constants.prefs.getString("ss_id");
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
    if (res != null) {
      print("at res...........");
      if (widget.from == "order_again") {
        print("at order_again...........");
        oderAgainAddtoCartFun();
      } else {
        cartItemsFun();
      }
    }
  }

  oderAgainAddtoCartFun() async {
    Map parameters = {
      "action": "addBYSACartitems",
      "Pkid": "0",
      "Country": Constants.prefs.getString("country_id"),
      "Uniqid": uniqId,
      "sessid": sessionId,
      "ipaddress": widget.billno,
      "sprno": Constants.prefs.getString("reg_id"),
      "Quantity": "0"
    };
    print("add to cart params...$parameters");
    dynamic res = await MainController().getRegPackAddToCart(parameters);
    if (res['Msg'].toString().toLowerCase() == "success") {
      cartItemsFun();
    }
  }

  cartItemsFun() async {
    Map cartParams = {
      "Uniqid": uniqId,
      "sessid": sessionId,
      "ipaddress": "GetCartData",
      "sprno": Constants.prefs.get("reg_id"),
      "pcode": "",
      "amt": "0",
      "amttype": "",
    };
    print("cart params...$cartParams");
    dynamic res = await _dataController.getMallCartItems(
      "salemall products",
      cartParams,
      ApiData().checkOutSalesCartItems,
    );
    print("d...res...$res");
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
              return _dataController.loading.value
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _dataController.salesMallCartItems.isNotEmpty
                            ? Badge.count(
                                count:
                                    _dataController.salesMallCartItems.length,
                                child: InkWell(
                                  onTap: () {
                                    dialogFun();
                                  },
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: appthemeColor,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: appthemeColor,
                                ),
                              ),
                        const SpaceWidthWidget(width: 15),
                        Obx(() {
                          return _dataController.genealogyLoading.value
                              ? SizedBox(width: 50, child: loader)
                              : Container(
                                  height: 30,
                                  width: 118,
                                  padding: const EdgeInsets.only(right: 5),
                                  child: CustomAutoWidthButton(
                                      onTapFun: () async {
                                        if (_dataController
                                            .salesMallCartItems.isNotEmpty) {
                                          checkoutFun();
                                        }
                                      },
                                      title: "Checkout"));
                        })
                      ],
                    );
            }),
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

  dialogFun() {
    Get.dialog(Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0;
                  i < _dataController.salesMallCartItems.length;
                  i++)
                CartItemWidget(
                    showQuantity: true,
                    removeFun: () async {
                      Get.back();
                      Map params = {
                        "Regid": _dataController.salesMallCartItems[i].sno,
                      };
                      dynamic res = await ApiCall().postMethodFun(
                          methodName: ApiData().removeSalesProduct,
                          params: params);
                      if (res != null) {
                        if (res['Msg'] == "SUCCESS") {
                          cartItemsFun();
                        } else {
                          CommonToast(res['Message']);
                        }
                      }
                    },
                    imagePath: _dataController.salesMallCartItems[i].pimage,
                    itemname: _dataController.salesMallCartItems[i].pkname,
                    itemsPrice:
                        "${_dataController.salesMallCartItems[i].symbol} ${_dataController.salesMallCartItems[i].mrp}",
                    productCode: _dataController.salesMallCartItems[i].pkcode,
                    itemCount: _dataController.salesMallCartItems[i].qty)
            ],
          ),
        ),
      ),
    ));
  }

  checkoutFun() {
    if (_dataController.salesMallCartItems.isNotEmpty) {
      Get.to(() => const SalesmallCartScreen(
            from: "sales_mall",
          ));
    }
  }
}
