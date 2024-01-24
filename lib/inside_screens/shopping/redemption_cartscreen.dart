import 'dart:async';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../checkout_screen.dart';

class RedemptionCartScreen extends StatefulWidget {
  const RedemptionCartScreen({
    super.key,
  });

  @override
  State<RedemptionCartScreen> createState() => _RedemptionCartScreenState();
}

class _RedemptionCartScreenState extends State<RedemptionCartScreen> {
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
      // if (uniqId != null && sessionId != null) {
      getData("init");
      // }
    });
  }

  Map cartParams = {};
  bool showProductsSelection = false;
  getData(String from) async {
    if (from != "init") {
      setState(() {
        screenLoad = true;
      });
    }

    // cartParams = {
    //   "Pkid": "",
    //   "pid": "",
    //   "Uniqid": uniqId,
    //   "sessid": sessionId,
    //   "ipaddress": Constants.prefs.get("ip"),
    //   "sprno": Constants.prefs.get("reg_id"),
    //   "prdtype": "Package",
    //   "qty": "1",
    //   "country": Constants.prefs.get("country_id"),
    // };
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
        await cartController.getRedemptionMCartItems(from, cartParams);
    print("cart res...$res");
    if (res['result'] == "Promotion") {
      setState(() {
        showProductsSelection = true;
      });
    } else {
      setState(() {
        showProductsSelection = false;
      });
    }
    if (from != "init") {
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
    // print("my para...${widget.packageCode}....$uniqId...$sessionId");

    // dynamic res = await cartController.getPacktPackageItems(
    //     productCode: widget.packageCode,
    //     uniqId: uniqId,
    //     sessionId: sessionId,
    //     dtype: "Promotion");
    // print("packages data...$res");
  }

  bool screenLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            onPressed: () {
              Get.back();
            }),
        title: const Text(
          "Cart",
          style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 20),
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
                        cartController.loading.value ||
                                cartController.salesMallCartItems.isEmpty
                            ? Container(
                                height: 500,
                                alignment: Alignment.center,
                                child: Center(child: withoutCartCountWidget()))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0;
                                      i <
                                          cartController
                                              .salesMallCartItems.length;
                                      i++)
                                    Column(
                                      children: [
                                        CartItemWidget(
                                          // removeCartOption: true,
                                          imagePath: cartController
                                              .salesMallCartItems[i].pimage,
                                          removeFun: () {
                                            Get.dialog(
                                                barrierDismissible: false,
                                                ConfrimationDialog(
                                                    onTapFun: () async {
                                                      Get.back();
                                                      Map params = {
                                                        "Regid": cartController
                                                            .salesMallCartItems[
                                                                i]
                                                            .sno,
                                                      };
                                                      dynamic res =
                                                          await cartController
                                                              .getRedemptionMallItemRemove(
                                                                  params,
                                                                  cartParams);
                                                      if (res != null) {
                                                        print(
                                                            "remove res..$res");
                                                      }

                                                      // ignore: use_build_context_synchronously

                                                      //           Timer(
                                                      //               const Duration(seconds: 1),
                                                      //               () {
                                                      //             Get.offAll(() =>
                                                      //                 const BottomBarScreen(
                                                      // index: 1,

                                                      //                 ));
                                                      //           });
                                                    },
                                                    title: "Are you sure?"));
                                          },
                                          itemsPrice:
                                              "RP ${cartController.salesMallCartItems[i].mrp}",
                                          itemname: cartController
                                              .salesMallCartItems[i].pkname,
                                          productCode: cartController
                                              .salesMallCartItems[i].pkcode,
                                          itemCount: cartController
                                              .salesMallCartItems[i].qty,
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
                                          const SpaceHeightWidget(height: 10),
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
                                          const SpaceHeightWidget(height: 5),
                                          SizedBox(
                                            height: 35,
                                            width: 200,
                                            child: packageLoading
                                                ? loader
                                                : CustomElevatedButton(
                                                    onTapFun: () async {
                                                      setState(() {
                                                        packageLoading = true;
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
                                                          textEControllerList[i]
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
                                                        packageLoading = false;
                                                      });
                                                      Get.dialog(PackageDilog(),
                                                          barrierDismissible:
                                                              false);
                                                    },
                                                    title: "Select Products"),
                                          ),
                                          const SpaceHeightWidget(height: 15),
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
                                        color: lightDarKBlue.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Order Summary",
                                          style: TextStyle(
                                            fontFamily: "OnestBold",
                                            fontSize: 17,
                                          ),
                                        ),
                                        const SpaceHeightWidget(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Subtotal",
                                              style: TextStyle(
                                                fontFamily: "OnestRegular",
                                                fontSize: 15,
                                              ),
                                            ),
                                            Obx(() {
                                              return cartController
                                                      .loading.value
                                                  ? const Text("RP 0.0")
                                                  : Text(
                                                      "RP ${cartController.salesMallTAmount.value}",
                                                      style: const TextStyle(
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Estimated Total",
                                              style: TextStyle(
                                                fontFamily: "OnestSemiBold",
                                                fontSize: 15,
                                                color: darkBlue,
                                              ),
                                            ),
                                            Obx(() {
                                              return cartController
                                                      .loading.value
                                                  ? const Text("RP 0.0")
                                                  : Text(
                                                      "RP ${cartController.salesMallTAmount.value}",
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
                                      ],
                                    ),
                                  ),
                                  const SpaceHeightWidget(height: 20),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: SizedBox(
                                      width: 200,
                                      height: 35,
                                      child: IconElevatedButton(
                                        onTapFun: () async {
                                          print(
                                              "https://showcase.worldunityfoundation.org/MobileAppCheckout/RedemptionCheckoutParam.html?RegId=$regId&sessid=$sessionId&uniqId=$uniqId");

                                          Get.off(() => CheckOutScreen(
                                              redirectUrl:
                                                  "https://showcase.worldunityfoundation.org/MobileAppCheckout/RedemptionCheckoutParam.html?RegId=$regId&sessid=$sessionId&uniqId=$uniqId"));
                                        },
                                        imagePath:
                                            'assets/images/shopping_cart_img.jpg',
                                        labelColor: whiteColor,
                                        buttonColor: lightDarKBlue,
                                        titile: "Checkout",
                                      ),
                                    ),
                                  ),
                                  const SpaceHeightWidget(height: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 200,
                                      height: 35,
                                      child: IconElevatedButton(
                                        onTapFun: () {
                                          Get.back();
                                          Get.back(result: [true]);
                                        },
                                        imagePath:
                                            'assets/images/arrow_right.png',
                                        labelColor: whiteColor,
                                        titile: "Continue Shopping",
                                        buttonColor: blackColor,
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   alignment: Alignment.center,
                                  //   width: double.infinity,
                                  //   child: SizedBox(
                                  //     width: 200,
                                  //     height: 35,
                                  //     child: IconElevatedButton(
                                  //       onTapFun: () {
                                  //         Get.offAll(() => const BottomBarScreen(
                                  //               index: 1,
                                  //             ));
                                  //       },
                                  //       imagePath: 'assets/images/arrow_right.png',
                                  //       labelColor: whiteColor,
                                  //       buttonColor: lightDarKBlue,
                                  //       titile: "Continue Shopping",
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                        // Container(
                        //   color: lightBlackColor.withOpacity(0.04),
                        //   child: const Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.all(8.0),
                        //         child: CommonTitle(titleName: "Recommended for you"),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   color: lightBlackColor.withOpacity(0.04),
                        //   alignment: Alignment.center,
                        //   // height: (4 / 2) * 325,
                        //   child: GridView.builder(
                        //     padding: const EdgeInsets.all(0),
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                        //     itemBuilder: (context, i) {
                        //       return PromotionItemWidget(
                        //         onTapFun: () {
                        //           Get.to(() => ProductDetailsScreen(
                        //                 from: widget.from,
                        //                 packageCode: "",
                        //               ));
                        //         },
                        //         amountColor: darkBlue,
                        //         imagePath: i == 0
                        //             ? promotionItems[0].image
                        //             : i == 1
                        //                 ? promotionItems[1].image
                        //                 : i == 2
                        //                     ? promotionItems[2].image
                        //                     : i == 3
                        //                         ? promotionItems[3].image
                        //                         : promotionItems[4].image,
                        //         itemName: i == 0
                        //             ? promotionItems[0].title
                        //             : i == 1
                        //                 ? promotionItems[1].title
                        //                 : i == 2
                        //                     ? promotionItems[2].title
                        //                     : i == 3
                        //                         ? promotionItems[3].title
                        //                         : promotionItems[4]
                        //                             .title
                        //                             .capitalize
                        //                             .toString(),
                        //         amount: "2465",
                        //         memberAmount: "2240",
                        //         exclusiveProduct: false,
                        //       );
                        //     },
                        //     itemCount: 4,
                        //   ),
                        // ),

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
      // width: double.infinity,
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
                  borderRadius: BorderRadius.circular(10),
                  color: blackColor.withOpacity(0.8)),
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
                          // "Products In The Package MYSH01",
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
                              // dataRowMinHeight: ,
                              dataRowMaxHeight: 70,
                              horizontalMargin: 0,
                              // dataRowMaxHeight: 100,
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

                                                print("add to car fun");
                                                Map parameters = {
                                                  "Pkid": "",
                                                  "pid": pidList.join(":"),
                                                  "qty": "1",
                                                  "uniqid": uniqId,
                                                  "sessid": sessionId,
                                                  "ipaddress": Constants.prefs
                                                      .getString("ip"),
                                                  "sprno": "0",
                                                  "jointype": "Promotion",
                                                  "action": "addSGPromoitems",
                                                };
                                                print(
                                                    "add to cart params...$parameters");
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
}
