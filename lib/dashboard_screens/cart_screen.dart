import 'package:destina_1_international/authentication_screens/login_screen.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:destina_1_international/service_call/api_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

import '../commons/colors.dart';
import '../inside_screens/checkout_screen.dart';
import '../models/onboarding_model.dart';

class CartScreen extends StatefulWidget {
  final String from;
  const CartScreen({super.key, required this.from});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController sponsorController = TextEditingController();
  double opacityVal = 0.6;
  int itemCount = 4;
  List<OnboardModel> promotionItems = [
    OnboardModel(
        image: "assets/images/Product 1-1.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA"),
    OnboardModel(
        image: "assets/images/Product 1-3.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA"),
    OnboardModel(
        image: "assets/images/Product 2-3.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED PENDANT"),
    OnboardModel(
        image: "assets/images/Product 3-1.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
    OnboardModel(
        image: "assets/images/Product 3-4.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
    OnboardModel(
        image: "assets/images/Product 3-6.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
    OnboardModel(
        image: "assets/images/Product 4-1.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED STICK"),
    OnboardModel(
        image: "assets/images/Product 4-2.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED STICK"),
    OnboardModel(
        image: "assets/images/Product 6-6.jpg",
        title: "D1 ADVANCE SCALAR ENERGIZED COFFEE(5 IN 1)"),
  ];

  int cartCount = 0;
  int cartItemCount = 0;
  dynamic uniqId;
  dynamic sessionId;
  MainController cartController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    print("I am from.....${widget.from}");
    // cartCount = Constants.prefs.getInt("cart_count") ?? 0;
    // cartItemCount = cartCount;
    uniqId = Constants.prefs.getString("uniq_id");
    sessionId = Constants.prefs.getString("ss_id");
    sponsorController.text = "";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUniqIdFun();
      // if (uniqId != null && sessionId != null) {
      // getData();
      // }
    });
  }

  checkUniqIdFun() async {
    cartParams = {
      "Action": "NCheckUnId",
      "Pkid": "0",
      "pid": "0",
      "Quantity": "0",
      "uniqid": Constants.prefs.getString("uniq_id"),
      "sessid": Constants.prefs.getString("ss_id"),
      "ipaddress": Constants.prefs.getString("ip"),
      "sprno": "0",
      "prdtype": "Package",
    };
    dynamic res = await cartController.getCartItems(cartParams, "init");
    print("gettting res...$res");
    if (res != null) {
      if (res['productDataRpt'][0]['ProductType'] == "Old Id") {
        getData("init");
      } else {
        uniqId = generateRandomString(10);
        await Constants.prefs.setString("uniq_id", uniqId);
        sessionId = generateTimeStamp();
        await Constants.prefs.setString("ss_id", sessionId);
        getData("init");
      }
    }
  }

  Map cartParams = {};
  getData(String from) async {
    cartParams = {
      "Action": "getNcartitems",
      // "getcartitems",
      "Pkid": "0",
      "pid": "0",
      "Quantity": "0",
      "uniqid": Constants.prefs.getString("uniq_id"),
      "sessid": Constants.prefs.getString("ss_id"),
      "ipaddress": Constants.prefs.getString("ip"),
      "sprno": "0",
      "prdtype": "Package",
    };
    dynamic res = await cartController.getCartItems(cartParams, from);
    print("cart res...$res");
  }

  bool checkOutShow = false;
  bool readOnly = false;
  final _fomkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left_rounded),
              color: whiteColor,
              onPressed: () {
                Get.back();
                // getData();
                // checkUniqIdFun();
              }),
          title: Text(
            "Cart",
            style: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 20, color: whiteColor),
          ),
          // actions: [
          //   SizedBox(
          //     height: 25,
          //     width: 50,
          //     child: CommonOulineTextButton(onTapFun: () {}, title: "Edit"),
          //   ),
          //   const SpaceWidthWidget(width: 5)
          // ],
        ),
        // bottomNavigationBar: (cartCount > 0)
        //     ? Container(
        //         decoration: BoxDecoration(
        //             color: whiteColor,
        //             border: Border.all(color: lightBlackColor, width: 1.5)),
        //         height: 60,
        //         width: double.infinity,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   RichText(
        //                       text: TextSpan(children: [
        //                     TextSpan(
        //                         text: "฿  ",
        //                         style: TextStyle(
        //                           color: lightDarKBlue,
        //                           fontSize: 11.5,
        //                         )),
        //                     TextSpan(
        //                         text: "4877",
        //                         style: TextStyle(
        //                           fontFamily: "OnestSemiBold",
        //                           color: lightDarKBlue,
        //                           fontSize: 17,
        //                         )),
        //                   ])),
        //                   Text("Save ฿ 435 when you Sign Up.",
        //                       style: TextStyle(
        //                         fontFamily: "OnestRegular",
        //                         color: blackColor.withOpacity(0.5),
        //                         fontSize: 10,
        //                       ))
        //                 ],
        //               ),
        //               SizedBox(
        //                   height: 35,
        //                   width: 120,
        //                   child: CustomElevatedButton(
        //                       onTapFun: () {
        //                         Get.to(() => const CheckOutScreen());
        //                       },
        //                       title: "Checkout"))
        //             ],
        //           ),
        //         ),
        //       )
        //     : const SizedBox.shrink(),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
              child: SizedBox(
            width: double.infinity,
            child: Obx(() {
              return Form(
                key: _fomkey,
                child: Column(
                  children: [
                    cartController.loading.value ||
                            cartController.cartItemsList.isEmpty
                        ? Container(
                            height: 500,
                            alignment: Alignment.center,
                            child: Center(child: withoutCartCountWidget()))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.from != "after_enroll" &&
                                  Constants.prefs.getString("user_id") == null)
                                signInReqWidget(),
                              // const SpaceHeightWidget(height: 8),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 5),
                              //   child: Row(
                              //     children: [
                              //       CircleAvatar(
                              //         radius: 14,
                              //         backgroundColor:
                              //             lightDarKBlue.withOpacity(0.1),
                              //         child: Icon(
                              //           Icons.location_on_outlined,
                              //           color: lightDarKBlue,
                              //           size: 20,
                              //         ),
                              //       ),
                              //       const SpaceWidthWidget(width: 10),
                              //       Text(
                              //         "Deliver in 1-3 business days",
                              //         style: TextStyle(
                              //             fontFamily: "OnestLight",
                              //             color: lightDarKBlue,
                              //             fontSize: 10),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // const CommonDivider(),
                              for (int i = 0;
                                  i < cartController.cartItemsList.length;
                                  i++)
                                Column(
                                  children: [
                                    CartItemWidget(
                                      decrementFun: () {
                                        if (int.parse(cartController
                                                .cartItemsList[i]
                                                .packQuantity) >
                                            1) {
                                          incrdcrFun(
                                              "decrement",
                                              cartController.cartItemsList[i]
                                                  .packQuantity,
                                              cartController.cartItemsList[i]
                                                  .packageCode);
                                        }
                                      },
                                      incrementFun: () {
                                        incrdcrFun(
                                            "increment",
                                            cartController
                                                .cartItemsList[i].packQuantity,
                                            cartController
                                                .cartItemsList[i].packageCode);
                                      },
                                      imagePath:
                                          cartController.cartItemsList[i].image,
                                      removeFun: () {
                                        Get.dialog(
                                            barrierDismissible: false,
                                            ConfrimationDialog(
                                                onTapFun: () async {
                                                  Get.back();
                                                  Map params = {
                                                    "Action":
                                                        "removecartitems_MA",
                                                    "Pkid": cartController
                                                        .cartItemsList[i]
                                                        .packId,
                                                    "pid": "0",
                                                    "Quantity": "0",
                                                    "uniqid": Constants.prefs
                                                        .getString("uniq_id"),
                                                    "sessid": Constants.prefs
                                                        .getString("ss_id"),
                                                    "ipaddress": Constants.prefs
                                                        .getString("ip"),
                                                    "sprno": "0",
                                                    "prdtype": "Package"
                                                  };
                                                  dynamic res =
                                                      await cartController
                                                          .getRemoveCartItem(
                                                              params,
                                                              cartParams);
                                                  // ignore: use_build_context_synchronously
                                                  MotionToast.success(
                                                    title: const Text(
                                                        "Your cart item removed"),
                                                    description: const Text(""),
                                                  ).show(context);

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
                                          "${cartController.cartItemsList[i].symbol} ${cartController.cartItemsList[i].packMrp}",
                                      itemname: cartController
                                          .cartItemsList[i].packageName,
                                      productCode: cartController
                                          .cartItemsList[i].packageCode,
                                      itemCount: cartController
                                          .cartItemsList[i].packQuantity,
                                    ),
                                    // CartItemWidget(
                                    //   productCode: "534565",
                                    //   memberPrice: "4354",
                                    //   imagePath: "assets/images/health.jpg",
                                    //   itemname:
                                    //       "D1 ADVANCE SCALAR ENERGIZED SCALARVIA",
                                    //   itemsPrice: "5257",
                                    //   itemCount: cartItemCount,
                                    //   removeFun: () async {
                                    //     cartItemCount = cartItemCount - 1;
                                    //     await Constants.prefs
                                    //         .setInt("cart_count", cartCount - 1);
                                    //     cartCount =
                                    //         Constants.prefs.getInt("cart_count")!;
                                    //     print("my minus,,$cartCount");

                                    //     setState(() {});
                                    //   },
                                    //   addFun: () async {
                                    //     cartItemCount = cartItemCount + 1;
                                    //     await Constants.prefs
                                    //         .setInt("cart_count", cartCount + 1);
                                    //     cartCount =
                                    //         Constants.prefs.getInt("cart_count")!;
                                    //     print("my ++,,,$cartCount");
                                    //     setState(() {});
                                    //   },
                                    //   actualItemPrice: '1897',
                                    // ),
                                    const CommonDivider(),
                                  ],
                                ),

                              const SpaceHeightWidget(height: 10),
                              OrderSummaryWidget(
                                  estimatedT: cartController.totalAmount.value
                                      .toString(),
                                  subT: cartController.totalAmount.value
                                      .toString(),
                                  symbol:
                                      cartController.cartItemsList[0].symbol),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: CommonTitle(
                                        titleName: "Check Sponsor",
                                        fontFamily: "OnestSemiBold",
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            // height: 35,
                                            child: TextFormField(
                                              readOnly: readOnly,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller: sponsorController,
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return "Enter your sponsor id";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              // cursorHeight: 12,
                                              onChanged: (val) {
                                                if (val != "" ||
                                                    sponsorController.text !=
                                                        "") {
                                                  setState(() {
                                                    opacityVal = 1;
                                                  });
                                                } else {
                                                  setState(() {
                                                    opacityVal = 0.7;
                                                  });
                                                }
                                              },
                                              style: TextStyle(
                                                  fontFamily: "OnestRegular",
                                                  fontSize: 12,
                                                  color: blackColor),
                                              decoration: InputDecoration(
                                                hintText: "Sponsor Id :",
                                                hintStyle: TextStyle(
                                                    fontFamily: "OnestSemiBold",
                                                    fontSize: 12,
                                                    color: blackColor
                                                        .withOpacity(0.5)),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 8),
                                                isDense: true,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide(
                                                        color: lightAmberColor,
                                                        width: 1)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            color: woodColor,
                                                            width: 1)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            color: woodColor,
                                                            width: 1)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SpaceWidthWidget(width: 10),
                                        SizedBox(
                                          width: 80,
                                          height: 35,
                                          child: Opacity(
                                            opacity: opacityVal,
                                            child: CommonOulineTextButton(
                                              onTapFun: () async {
                                                if (_fomkey.currentState!
                                                    .validate()) {
                                                  dynamic res =
                                                      await cartController
                                                          .getCheckSponsor(
                                                              sponsorController
                                                                  .text);
                                                  print("getting res...$res");
                                                  if (res["Msg"]
                                                          .toString()
                                                          .toLowerCase() ==
                                                      "success") {
                                                    setState(() {
                                                      checkOutShow = true;
                                                      readOnly = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      checkOutShow = false;
                                                    });
                                                  }
                                                }
                                              },
                                              title: "Submit",
                                              backgroundColor: blackColor,
                                              borderColor: blackColor,
                                              textColor: whiteColor,
                                              titleFontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SpaceHeightWidget(height: 15),
                              if (checkOutShow)
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: 200,
                                    height: 30,
                                    child: IconElevatedButton(
                                      onTapFun: () async {
                                        Map parameters = {
                                          "Action": "checkoutitems_MA",
                                          "Pkid": "0",
                                          "pid": "0",
                                          "Quantity": "0",
                                          "uniqid": uniqId,
                                          "sessid": sessionId,
                                          "ipaddress":
                                              Constants.prefs.getString("ip"),
                                          "sprno": sponsorController.text,
                                          "prdtype": "Package"
                                        };
                                        dynamic res = await cartController
                                            .getCheckOutCart(parameters);
                                        print("res....$res");
                                        if (res['Msg']
                                                .toString()
                                                .toLowerCase() ==
                                            "success") {
                                          Get.off(() => CheckOutScreen(
                                              fromScreen: "OpenCart",
                                              redirectUrl:
                                                  "https://${ApiData().checkOutUrlDomain}/checkwebitems.html?countrycode=MY&sprno=${sponsorController.text.trim()}&sessid=$sessionId&uniqId=$uniqId"));
                                        }
                                      },
                                      imagePath:
                                          'assets/images/shopping_cart_img.jpg',
                                      labelColor: whiteColor,
                                      buttonColor: blackColor,
                                      titile: "Checkout",
                                    ),
                                  ),
                                ),
                              const SpaceHeightWidget(height: 20),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: IconElevatedButton(
                                    onTapFun: () {
                                      Get.offAll(() => const BottomBarScreen(
                                            index: 1,
                                          ));
                                    },
                                    imagePath: 'assets/images/arrow_right.png',
                                    labelColor: whiteColor,
                                    buttonColor: blackColor,
                                    titile: "Continue Shopping",
                                  ),
                                ),
                              )
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
                ),
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
          child: CustomAutoWidthButton(
              onTapFun: () {
                Get.offAll(() => const BottomBarScreen(
                      index: 1,
                    ));
              },
              title: "Shopping"),
        ),
      ],
    );
  }

  bool incrementLoading = false;
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
              child: CustomElevatedButton(
                  onTapFun: () {
                    Get.to(() => const LoginScreen());
                  },
                  title: "Sign in")),
          const SpaceWidthWidget(width: 5)
        ],
      ),
    );
  }

  incrdcrFun(String from, String itemcount, String packCode) async {
    print("add to car fun");
    Map parameters = {
      "action": "addRTCartitems",
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
    print("add to cart params...$parameters");
    dynamic res = await MainController().getRegPackAddToCart(parameters);
    if (res['Msg'].toString().toLowerCase() == "success") {
      getData("not init");
    }
  }
}
