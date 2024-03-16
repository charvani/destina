import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../service_call/api_call.dart';
import '../../service_call/api_data.dart';
import 'dp_cartscreen.dart';
import 'dp_productdetails_screen.dart';

class DPMallScreen extends StatefulWidget {
  final String? from, billno;

  const DPMallScreen({super.key, this.from, this.billno});

  @override
  State<DPMallScreen> createState() => _DPMallScreenState();
}

class _DPMallScreenState extends State<DPMallScreen> {
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password, countryId, hidUid, countOfCart, uniqId, sessionId;
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
      dataFun();
    });
  }

  dataFun() async {
    Map bData = {
      "Action": "GetDPPackages",
      "CountryID": countryId,
      "MallName": ""
      // uniqId
    };

    dynamic res = await _dataController.getDPMall(bData);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        setState(() {
          countOfCart = res['Cnt'] ?? "0";
        });
      }
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
  }

  oderAgainAddtoCartFun() async {
    Map parameters = {
      "action": "addBYDPCartitems",
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
    dynamic res =
        await _dataController.getDpMallLoadCartItems("DP Mall", cartParams);
    print("d...res...$res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 8,
          backgroundColor: darkBlue,
          title: Text(
            "DP Order",
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
                  Get.back();
                },
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: whiteColor,
                )),
          ),
          actions: const [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     int.parse(countOfCart) > 0
            //         ? Badge.count(
            //             count: int.parse(countOfCart),
            //             child: InkWell(
            //               onTap: () {
            //                 if (countOfCart != "0" && countOfCart != "") {
            //                   Get.to(() => const SalesmallCartScreen());
            //                 } else {}
            //               },
            //               child: Icon(
            //                 Icons.shopping_cart,
            //                 color: appthemeColor,
            //               ),
            //             ),
            //           )
            //         : InkWell(
            //             onTap: () {
            //               if (countOfCart != "0" && countOfCart != "") {
            //                 Get.to(() => const SalesmallCartScreen());
            //               } else {}
            //             },
            //             child: Icon(
            //               Icons.shopping_cart,
            //               color: appthemeColor,
            //             ),
            //           ),
            //     const SpaceWidthWidget(width: 5),
            //     Container(
            //         height: 30,
            //         width: 118,
            //         padding: const EdgeInsets.only(right: 5),
            //         child: CustomAutoWidthButton(
            //             onTapFun: () async {
            //               if (countOfCart != "0" && countOfCart != "") {
            //                 dynamic res =
            //                     await Get.to(() => const SalesmallCartScreen());

            //                 if (res != null) {
            //                   if (res[0] == true) {
            //                     dataFun();
            //                   }
            //                 }
            //               } else {}
            //             },
            //             title: "Checkout"))
            //   ],
            // )
          ]),
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
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : _dataController.salesOrdersList.isEmpty
                ? const NotAvailableText(text: "No data found")
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                      itemBuilder: (context, i) {
                        return CategroyItemWidget(
                          onTapFun: () async {
                            dynamic res =
                                await Get.to(() => DPProductDetailsScreen(
                                      packageCode: _dataController
                                          .salesOrdersList[i].pkcode,
                                    ));
                            if (res != null) {
                              if (res[0] == true) {
                                dataFun();
                              }
                            }
                          },
                          imagePath: _dataController.salesOrdersList[i].pImage,
                          titile: _dataController.salesOrdersList[i].pkname,
                          amount: _dataController.salesOrdersList[i].mrp,
                        );
                      },
                      itemCount: _dataController.salesOrdersList.length,
                    ),
                  );
      }),
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
                          methodName: ApiData().removeDPProduct,
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
      Get.to(() => const DPmallCartScreen(
            from: "dp_mall",
          ));
    }
  }
}
