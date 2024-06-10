import 'dart:async';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../service_call/api_data.dart';
import '../checkout_screen.dart';

class UpgradeOrderCartSceen2 extends StatefulWidget {
  final String packageCode;
  const UpgradeOrderCartSceen2({
    super.key,
    required this.packageCode,
  });

  @override
  State<UpgradeOrderCartSceen2> createState() => _UpgradeOrderCartSceen2State();
}

class _UpgradeOrderCartSceen2State extends State<UpgradeOrderCartSceen2> {
  TextEditingController sponsorController = TextEditingController();

  int itemCount = 4;
  int cartCount = 0;
  int cartItemCount = 0;
  dynamic uniqId;
  dynamic sessionId, regId;
  MainController cartController = Get.put(MainController());
  bool packageLoading = false;
  @override
  void initState() {
    super.initState();

    uniqId = Constants.prefs.getString("uniq_id");
    sessionId = Constants.prefs.getString("ss_id");
    regId = Constants.prefs.getString("reg_id");

    sponsorController.text = "";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData("init");
    });
  }

  Map cartParams = {};
  bool showProductsSelection = false;
  getData(String from) async {
    if (from == "add to cart") {
      setState(() {
        screenLoad = true;
      });
    }

    cartParams = {
      "rpt": "GetUpgPackageDet ",
      "cname": Constants.prefs.getString("uniq_id"),
      "mname": Constants.prefs.getString("country_id")
    };

    dynamic res = await cartController.getRegisterCartItems(from, cartParams);

    if (int.parse(res['Itemcnt']) == 1) {
      if (int.parse(res['PrCnt']) > 0) {
        setState(() {
          showProductsSelection = true;
        });
      }
    } else {
      setState(() {
        showProductsSelection = false;
      });
    }
    if (from == "add to cart") {
      setState(() {
        screenLoad = false;
      });
    }
  }

  bool checkOutShow = false;
  bool readOnly = false;
  final _fomkey = GlobalKey<FormState>();
  List<TextEditingController> textEControllerList = [];

  getPackageItemsData() async {
    Map params = {
      "rpt": "GetPromoPack",
      "cname": widget.packageCode,
      "mname": "0"
    };
    dynamic res = await cartController.getPacktPackageItems(
        productCode: widget.packageCode,
        uniqId: uniqId,
        sessionId: sessionId,
        dtype: "Promotion",
        params: params);
  }

  bool screenLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBlue,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: whiteColor,
            ),
            onPressed: () {
              Get.back();
            }),
        title: Text(
          "Cart",
          style: TextStyle(
              fontFamily: "OnestSemiBold", fontSize: 20, color: whiteColor),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
              child: SizedBox(
            width: double.infinity,
            child: screenLoad
                ? SizedBox(height: 400, child: loader)
                : Obx(() {
                    return Column(
                      children: [
                        cartController.loading.value
                            ? Container(
                                height: 500,
                                alignment: Alignment.center,
                                child: Center(child: loader))
                            : cartController.registerCartItems.isEmpty
                                ? Container(
                                    height: 500,
                                    alignment: Alignment.center,
                                    child:
                                        Center(child: withoutCartCountWidget()))
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i <
                                              cartController
                                                  .registerCartItems.length;
                                          i++)
                                        Column(
                                          children: [
                                            CartItemWidget(
                                              showQuantity: true,
                                              removeCartOption: true,
                                              imagePath: cartController
                                                  .registerCartItems[i].pImage,
                                              removeFun: () {},
                                              itemsPrice:
                                                  "${cartController.registerCartItems[i].symbol} ${cartController.registerCartItems[i].mrp}",
                                              itemname: cartController
                                                  .registerCartItems[i].pkname,
                                              productCode: cartController
                                                  .registerCartItems[i].pkcode,
                                              itemCount: cartController
                                                  .registerCartItems[i].qty,
                                            ),
                                            const CommonDivider(),
                                          ],
                                        ),
                                      const SpaceHeightWidget(height: 10),
                                      if (showProductsSelection)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "You qualified to receive an ADD ON products!",
                                                // textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: "OnestSemiBold",
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SpaceHeightWidget(
                                                  height: 10),
                                              const Text(
                                                "You are eligible for the following promotion:",
                                                // textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: "OnestRegular",
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const Text(
                                                "Be sure to select your preferred choice in the given catalogue.",
                                                // textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: "OnestRegular",
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SpaceHeightWidget(
                                                  height: 5),
                                              SizedBox(
                                                height: 35,
                                                width: 200,
                                                child: packageLoading
                                                    ? loader
                                                    : CustomElevatedButton(
                                                        onTapFun: () async {
                                                          setState(() {
                                                            loading = false;
                                                          });
                                                          await getPackageItemsData();
                                                          textEControllerList
                                                              .clear();

                                                          for (int i = 0;
                                                              i <
                                                                  cartController
                                                                      .packPackageDetails
                                                                      .value
                                                                      .getPkgItemsRpt
                                                                      .length;
                                                              i++) {
                                                            textEControllerList.add(
                                                                TextEditingController());
                                                            if (cartController
                                                                    .packPackageDetails
                                                                    .value
                                                                    .getPkgItemsRpt[
                                                                        i]
                                                                    .compulsory ==
                                                                "True") {
                                                              textEControllerList[
                                                                          i]
                                                                      .text =
                                                                  cartController
                                                                      .packPackageDetails
                                                                      .value
                                                                      .getPkgItemsRpt[
                                                                          i]
                                                                      .qty;
                                                            }
                                                          }

                                                          setState(() {
                                                            packageLoading =
                                                                false;
                                                          });
                                                          Get.dialog(
                                                              PackageDilog(),
                                                              barrierDismissible:
                                                                  false);
                                                        },
                                                        title:
                                                            "Select Products"),
                                              ),
                                              const SpaceHeightWidget(
                                                  height: 15),
                                              const CommonDivider(),
                                            ],
                                          ),
                                        ),
                                      const SpaceHeightWidget(height: 15),
                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 20),
                                        decoration: BoxDecoration(
                                            color:
                                                lightDarKBlue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Order Summary",
                                              style: TextStyle(
                                                  fontFamily: "OnestBold",
                                                  fontSize: 17,
                                                  color: darkBlue),
                                            ),
                                            const SpaceHeightWidget(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Order Subtotal",
                                                  style: TextStyle(
                                                    fontFamily: "OnestRegular",
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Obx(() {
                                                  return cartController
                                                          .loading.value
                                                      ? Text(
                                                          "${cartController.registerCartItems[0].symbol} 0.0")
                                                      : Text(
                                                          "${cartController.registerCartItems[0].symbol} ${cartController.totalAmount.value}",
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                "OnestRegular",
                                                            fontSize: 15,
                                                          ),
                                                        );
                                                }),
                                              ],
                                            ),
                                            const SpaceHeightWidget(height: 10),
                                            const CommonDivider(),
                                            const SpaceHeightWidget(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total Amount",
                                                  style: TextStyle(
                                                    fontFamily: "OnestSemiBold",
                                                    fontSize: 15,
                                                    color: darkBlue,
                                                  ),
                                                ),
                                                Obx(() {
                                                  return cartController
                                                          .loading.value
                                                      ? Text(
                                                          "${cartController.registerCartItems[0].symbol} 0.0")
                                                      : Text(
                                                          "${cartController.registerCartItems[0].symbol} ${cartController.totalAmount.value}",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "OnestSemiBold",
                                                            fontSize: 15,
                                                            color: darkBlue,
                                                          ),
                                                        );
                                                }),
                                              ],
                                            ),
                                            const SpaceHeightWidget(height: 20),
                                            SizedBox(
                                              width: 200,
                                              height: 33,
                                              child: IconElevatedButton(
                                                onTapFun: () async {
                                                  Get.off(() => CheckOutScreen(
                                                      redirectUrl:
                                                          "https://${ApiData().checkOutUrlDomain}/MobileAppCheckout/UpgradeCheckoutParam.html?RegId=$regId&sessid=$sessionId&uniqId=$uniqId"));
                                                },
                                                imagePath:
                                                    'assets/images/shopping_cart_img.jpg',
                                                labelColor: whiteColor,
                                                buttonColor: blackColor,
                                                titile: "Checkout",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SpaceHeightWidget(height: 20),
                                    ],
                                  ),
                        const SpaceHeightWidget(height: 40)
                      ],
                    );
                  }),
          )),
        ),
      ),
    );
  }

  Widget withoutCartCountWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceHeightWidget(height: 10),
        Transform.flip(
          flipX: true,
          child: Image.asset(
            "assets/images/cart_draw.png",
            height: 150,
          ),
        ),
        const SpaceHeightWidget(height: 20),
        Text(
          "Your Destina 1 cart is empty",
          style: TextStyle(
              fontFamily: "OnestRegular",
              fontSize: 15,
              color: blackColor.withOpacity(0.7)),
        ),
        const SpaceHeightWidget(height: 3),
        Text(
          "Shop today's deals",
          style: TextStyle(
              fontFamily: "OnestRegular",
              fontSize: 15,
              color: blackColor.withOpacity(0.7)),
        ),
        const SpaceHeightWidget(height: 10),
        SizedBox(
          height: 30,
          child: CommonOulineTextButton(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            onTapFun: () {
              Get.offAll(() => const BottomBarScreen(
                    index: 1,
                  ));
            },
            title: "Shopping",
            titleFontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget signInReqWidget() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/signin_cartbanner.png",
              ),
              opacity: 0.7)),
      child: Row(
        children: [
          const SpaceWidthWidget(width: 80),
          Flexible(
            child: Text(
              "Already an account? Sign in now for special promotion.",
              maxLines: 3,
              style: TextStyle(
                  color: blackColor,
                  fontFamily: "OnestSemiBold",
                  fontSize: 12.5),
            ),
          ),
          SizedBox(
              width: 95,
              height: 35,
              child: CustomElevatedButton(onTapFun: () {}, title: "Sign in")),
          const SpaceWidthWidget(width: 5)
        ],
      ),
    );
  }

  bool loading = false;
  bool showQtyErrorText = false;
  List<String> pidList = [];

  Dialog PackageDilog() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: blackColor.withOpacity(0.8),
      child: StatefulBuilder(builder: (context, myState) {
        return SingleChildScrollView(
          child: Form(
            key: _fomkey,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: darkBlue),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Customize Packages",
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 16,
                              color: whiteColor),
                        ),
                        IconButton(
                            onPressed: () {
                              if (loading != true) {
                                Get.back();
                              }
                            },
                            icon: Icon(
                              Icons.close,
                              size: 16,
                              color: whiteColor,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: whiteColor,
                    ),
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeightWidget(height: 5),
                        Text(
                          cartController.packPackageDetails.value.head,
                          style: TextStyle(
                              fontFamily: "OnestSemiBold",
                              fontSize: 12,
                              color: blackColor),
                        ),
                        const SpaceHeightWidget(height: 5),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text:
                                "Products Selected Should Be Of Total Quantity : ",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 12,
                                color: blackColor),
                          ),
                          TextSpan(
                            text:
                                cartController.packPackageDetails.value.maxQty,
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 14,
                                color: redColor),
                          )
                        ])),
                        const SpaceHeightWidget(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              dataRowMaxHeight: 70,
                              horizontalMargin: 0,
                              columnSpacing: 0,
                              border: TableBorder.all(
                                  color: middleBlackColor.withOpacity(0.15)),
                              columns: [
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "S.No",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Product\nCode",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Name",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Maximum\nQuantity",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                              ],
                              rows: [
                                for (int i = 0;
                                    i <
                                        cartController.packPackageDetails.value
                                            .getPkgItemsRpt.length;
                                    i++)
                                  DataRow(cells: [
                                    DataCell(Container(
                                      width: 10,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2),
                                      child: Text(
                                        (i + 1).toString(),
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2),
                                      child: Text(
                                        cartController.packPackageDetails.value
                                            .getPkgItemsRpt[i].pcode,
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                      width: 160,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2, vertical: 2),
                                      child: Text(
                                        cartController.packPackageDetails.value
                                            .getPkgItemsRpt[i].name,
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                      width: 100,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2),
                                      child: Text(
                                        cartController.packPackageDetails.value
                                            .getPkgItemsRpt[i].maxquan,
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                        width: 100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.2),
                                        child: RegisterTextField(
                                            readOnly: cartController
                                                        .packPackageDetails
                                                        .value
                                                        .getPkgItemsRpt[i]
                                                        .compulsory ==
                                                    "True"
                                                ? true
                                                : false,
                                            inputFormatter: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  2),
                                              // FilteringTextInputFormatter.allow(
                                              //     RegExp("[1-28]"))
                                            ],
                                            padding: 8,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            controller: textEControllerList[i],
                                            hintText: "0",
                                            textInputType: TextInputType.number,
                                            validation: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter Quantity";
                                              } else if (int.parse(val) >
                                                  int.parse(cartController
                                                      .packPackageDetails
                                                      .value
                                                      .maxQty)) {
                                                return "Not allowed";
                                              } else {
                                                return null;
                                              }
                                            },
                                            labelText: ""))),
                                  ])
                              ]),
                        ),
                        if (showQtyErrorText)
                          Column(
                            children: [
                              const SpaceHeightWidget(height: 8),
                              Text(
                                "Your selected quantity total should be ${cartController.packPackageDetails.value.maxQty}",
                                style: TextStyle(
                                    fontFamily: "OnestSemiBold",
                                    fontSize: 14,
                                    color: redColor),
                              )
                            ],
                          ),
                        const SpaceHeightWidget(height: 20),
                        loading
                            ? loader
                            : Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        height: 30,
                                        width: 130,
                                        child: CustomElevatedButton(
                                            onTapFun: () async {
                                              pidList.clear();
                                              int countQty = 0;
                                              for (int i = 0;
                                                  i <
                                                      textEControllerList
                                                          .length;
                                                  i++) {
                                                if (textEControllerList[i]
                                                        .text !=
                                                    "") {
                                                  countQty = countQty +
                                                      int.parse(
                                                          textEControllerList[i]
                                                              .text);
                                                  pidList.add(
                                                      "${cartController.packPackageDetails.value.getPkgItemsRpt[i].pcode}@${textEControllerList[i].text}");
                                                }
                                              }

                                              if (countQty ==
                                                  int.parse(cartController
                                                      .packPackageDetails
                                                      .value
                                                      .maxQty)) {
                                                myState(() {
                                                  showQtyErrorText = false;
                                                  loading = true;
                                                });

                                                Map parameters = {
                                                  "Pkid": widget.packageCode,
                                                  "pid": pidList.join(":"),
                                                  "qty": "1",
                                                  "uniqid": uniqId,
                                                  "sessid": sessionId,
                                                  "ipaddress": Constants.prefs
                                                      .getString("ip"),
                                                  "sprno": regId,
                                                  "jointype": "Promotion",
                                                  "action": "addSGPromoitems",
                                                };
                                         
                                                dynamic res =
                                                    await cartController
                                                        .getPackAddToCart(
                                                            parameters);
                                                if (res['Msg']
                                                        .toString()
                                                        .toLowerCase() ==
                                                    "success") {
                                                  CommonToastTrue(
                                                      "Successfully added to your cart.");

                                                  myState(() {
                                                    loading = false;
                                                  });
                                                  Get.back();
                                                  getData("add to cart");
                                                } else {
                                                  Timer(
                                                      const Duration(
                                                          seconds: 1),
                                                      () async {
                                                    myState(() {
                                                      loading = false;
                                                    });
                                                    Get.back();
                                                  });
                                                }
                                              } else {
                                                myState(() {
                                                  showQtyErrorText = true;
                                                });
                                              }

                                              // await Constants.prefs.setInt("cart_count", 1);
                                              // Get.back();
                                              // Get.to(() => const EnrollPackageScreen());
                                            },
                                            title: "Add To Cart")),
                                    const SpaceWidthWidget(width: 10),
                                    SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: CustomElevatedButton(
                                          onTapFun: () {
                                            Get.back();
                                          },
                                          title: "Cancel"),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  incrdcrFun(String from, String itemcount, String packCode) async {
    Map parameters = {
      "action": "addSGCartitems",
      "Pkid": packCode,
      "Country": Constants.prefs.getString("country_id"),
      "Uniqid": uniqId,
      "sessid": sessionId,
      "ipaddress": Constants.prefs.getString("ip"),
      "sprno": "0",
      "Quantity": from == "increment"
          ? "${int.parse(itemcount) + 1}"
          : "${int.parse(itemcount) - 1}"
    };

    dynamic res = await MainController().getRegPackAddToCart(parameters);
    if (res['Msg'].toString().toLowerCase() == "success") {
      getData("not init");
    }
  }
}
