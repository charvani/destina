import 'dart:async';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../service_call/api_call.dart';
import '../../service_call/api_data.dart';
import 'member_productdetail_screen2.dart';
import 'membermall_cartscreen.dart';
import 'membermall_upgradescreen.dart';

class MembershipMallScreen2 extends StatefulWidget {
  const MembershipMallScreen2({
    super.key,
  });

  @override
  State<MembershipMallScreen2> createState() => _MembershipMallScreen2State();
}

class _MembershipMallScreen2State extends State<MembershipMallScreen2> {
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password, countryId, hidUid, uniqId, sessionId;
  @override
  void initState() {
    super.initState();
    // countOfCart = "0";
    userId = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");
    countryId = Constants.prefs.getString("country_id");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // if (Constants.prefs.getString("uniq_id") == null) {
      //   uniqId = generateRandomString(10);
      //   await Constants.prefs.setString("uniq_id", uniqId);
      // } else {
      //   uniqId = Constants.prefs.getString("uniq_id");
      // }
      uniqId = generateRandomString(10);
      await Constants.prefs.setString("uniq_id", uniqId);
      sessionId = generateTimeStamp();
      await Constants.prefs.setString("ss_id", sessionId);
      dataFun("Health Care");
    });
  }

  dataFun(String malVal) async {
    dynamic res = await _dataController.getPackages(
        countyId: Constants.prefs.getString("country_id")!,
        packageMalVal: malVal);
    print("getPackages screen data...$res");
  }

  actionFun() async {
    Map bParams = {
      "Pkid": "",
      "pid": "",
      "Uniqid": uniqId,
      "sessid": Constants.prefs.get("ss_id"),
      "ipaddress": Constants.prefs.get("ip"),
      "sprno": Constants.prefs.get("user_id"),
      "prdtype": "Package",
      "qty": "1",
      "country": Constants.prefs.get("country_id"),
    };
    dynamic res = await _dataController.getMemberMCheckOut(bParams);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        if (res['result'] == "Upgrade") {
          Get.to(() => MembermallUpgradeScreen(
                res: res,
              ));
        } else {
          Get.to(() => const MembermallCartScreen());
        }
      }
    }
  }

  Map cartParams = {};

  bool cartLoad = false;
  getCartData() async {
    setState(() {
      cartLoad = true;
    });

    cartParams = {
      "Uniqid": uniqId,
      "sessid": sessionId,
      "ipaddress": "GetCartData",
      "sprno": Constants.prefs.get("reg_id"),
      "pcode": "",
      "amt": "0",
      "amttype": "",
    };
    print("cart params...$cartParams");
    dynamic res =
        await _dataController.getMemberMCartItems("screen", cartParams);
    print("cart res...$res");
    setState(() {
      cartLoad = false;
    });
  }

  int selectedInd = 0;
  dynamic krialiaTappedInd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        scrolledUnderElevation: 8,
        centerTitle: false,
        title: Transform.translate(
          offset: const Offset(-30, 0),
          child: Text(
            "Membership Order",
            style: TextStyle(
              fontSize: 16,
              color: whiteColor,
              fontFamily: "OnestSemiBold",
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: InkWell(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                print("ooooo");
                Get.back();
              },
              child:
                  Icon(Icons.keyboard_arrow_left_rounded, color: whiteColor)),
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
                  ? SizedBox(height: 20, width: 20, child: loader)
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
                                          actionFun();
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
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                        itemBuilder: (context, i) {
                          return productCtgs[selectedInd] == "Kritalia & Co"
                              ? KritaliaItemWidget(
                                  tapped: krialiaTappedInd == i ? true : false,
                                  amount:
                                      _dataController.selPackageItemList[i].mrp,
                                  onTapFun: () {
                                    setState(() {
                                      krialiaTappedInd = i;
                                    });

                                    Timer(const Duration(seconds: 1), () async {
                                      dynamic res = await Get.to(() =>
                                          MemberProductDetailsScreen2(
                                            // packageCode: _dataController
                                            //     .salesOrdersList[i].pkcode,
                                            from: 'membership',
                                            packageCode: _dataController
                                                .selPackageItemList[i].pkcode,
                                            fromPack: productCtgs[selectedInd],
                                          ));

                                      if (res != null) {
                                        if (res[0] == true) {
                                          getCartData();
                                          // _dataController.memberMallCartCount
                                          //     .value = res[1].toString() ?? "0";
                                          setState(() {});
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
                                  amount:
                                      _dataController.selPackageItemList[i].mrp,
                                  onTapFun: () async {
                                    dynamic res = await Get.to(() =>
                                        MemberProductDetailsScreen2(
                                          from: 'membership',
                                          packageCode: _dataController
                                              .selPackageItemList[i].pkcode,
                                          fromPack: productCtgs[selectedInd],
                                          // packageCode: _dataController
                                          //     .salesOrdersList[i].pkcode,
                                        ));

                                    if (res != null) {
                                      if (res[0] == true) {
                                        getCartData();
                                        // _dataController.memberMallCartCount
                                        //     .value = res[1].toString() ?? "0";
                                        setState(() {});
                                      }
                                    }
                                  },
                                  imagePath:
                                      // "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                                      _dataController
                                          .selPackageItemList[i].pImage,
                                  titile: _dataController
                                      .selPackageItemList[i].pkname);
                        },
                        itemCount: _dataController.selPackageItemList.length);
          })),
        ],
      ),

      // Obx(() {
      //   return _dataController.loading.value
      //       ? loader
      //       : _dataController.salesOrdersList.isEmpty
      //           ? const NotAvailableText(text: "No data found")
      //           : Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: GridView.builder(
      //                 padding: const EdgeInsets.all(0),
      //                 shrinkWrap: true,
      //                 gridDelegate:
      //                     const SliverGridDelegateWithFixedCrossAxisCount(
      //                         crossAxisCount: 2, childAspectRatio: 1 / 1.1),
      //                 itemBuilder: (context, i) {
      //                   return CategroyItemWidget(
      //                     onTapFun: () async {
      //                       dynamic res =
      //                           await Get.to(() => MemberProductDetailsScreen2(
      //                                 packageCode: _dataController
      //                                     .salesOrdersList[i].pkcode,
      //                               ));

      //                       if (res != null) {
      //                         if (res[0] == true) {
      //                           _dataController.memberMallCartCount.value =
      //                               res[1] ?? "0";
      //                           setState(() {});
      //                         }
      //                       }
      //                     },
      //                     imagePath: _dataController.salesOrdersList[i].pImage,
      //                     titile: _dataController.salesOrdersList[i].pkname,
      //                     amount: _dataController.salesOrdersList[i].mrp,
      //                   );
      //                 },
      //                 itemCount: _dataController.salesOrdersList.length,
      //               ),
      //             );
      // }),
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
                          methodName: ApiData().removeMemberProduct,
                          params: params);
                      if (res != null) {
                        if (res['Msg'] == "SUCCESS") {
                          getCartData();
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
}
