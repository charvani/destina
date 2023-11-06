import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../inside_screens/checkout_screen.dart';
import '../inside_screens/productdetails_screen.dart';
import '../models/onboarding_model.dart';

class CartScreen extends StatefulWidget {
  final String from;
  const CartScreen({super.key, required this.from});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

TextEditingController couponController = TextEditingController();
double opacityVal = 0.6;

class _CartScreenState extends State<CartScreen> {
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
  @override
  void initState() {
    super.initState();
    print("I am from.....${widget.from}");
    cartCount = Constants.prefs.getInt("cart_count") ?? 0;
    cartItemCount = cartCount;
  }

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
        // actions: [
        //   SizedBox(
        //     height: 25,
        //     width: 50,
        //     child: CommonOulineTextButton(onTapFun: () {}, title: "Edit"),
        //   ),
        //   const SpaceWidthWidget(width: 5)
        // ],
      ),
      bottomNavigationBar: (cartCount > 0)
          ? Container(
              decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: lightBlackColor, width: 1.5)),
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "฿  ",
                              style: TextStyle(
                                color: lightDarKBlue,
                                fontSize: 11.5,
                              )),
                          TextSpan(
                              text: "4877",
                              style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                color: lightDarKBlue,
                                fontSize: 17,
                              )),
                        ])),
                        Text("Save ฿ 435 when you Sign Up.",
                            style: TextStyle(
                              fontFamily: "OnestRegular",
                              color: blackColor.withOpacity(0.5),
                              fontSize: 10,
                            ))
                      ],
                    ),
                    SizedBox(
                        height: 35,
                        width: 120,
                        child: CustomElevatedButton(
                            onTapFun: () {
                              Get.to(() => const CheckOutScreen());
                            },
                            title: "Checkout"))
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              (cartCount == 0)
                  ? withoutCartCountWidget()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.from != "after_enroll") signInReqWidget(),
                        const SpaceHeightWidget(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: lightDarKBlue.withOpacity(0.1),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: lightDarKBlue,
                                  size: 20,
                                ),
                              ),
                              const SpaceWidthWidget(width: 10),
                              Text(
                                "Deliver in 1-3 business days",
                                style: TextStyle(
                                    fontFamily: "OnestLight",
                                    color: lightDarKBlue,
                                    fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        const CommonDivider(),
                        for (int i = 0; i < 2; i++)
                          Column(
                            children: [
                              CartItemWidget(
                                productCode: "534565",
                                memberPrice: "4354",
                                imagePath: "assets/images/health.jpg",
                                itemname:
                                    "D1 ADVANCE SCALAR ENERGIZED SCALARVIA",
                                itemsPrice: "5257",
                                itemCount: cartItemCount,
                                removeFun: () async {
                                  cartItemCount = cartItemCount - 1;
                                  await Constants.prefs
                                      .setInt("cart_count", cartCount - 1);
                                  cartCount =
                                      Constants.prefs.getInt("cart_count")!;
                                  print("my minus,,$cartCount");

                                  setState(() {});
                                },
                                addFun: () async {
                                  cartItemCount = cartItemCount + 1;
                                  await Constants.prefs
                                      .setInt("cart_count", cartCount + 1);
                                  cartCount =
                                      Constants.prefs.getInt("cart_count")!;
                                  print("my ++,,,$cartCount");
                                  setState(() {});
                                },
                                actualItemPrice: '1897',
                              ),
                              const CommonDivider(),
                            ],
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: CommonTitle(
                                  titleName: "Coupon Code",
                                  fontFamily: "OnestSemiBold",
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      // height: 35,
                                      child: TextFormField(
                                        controller: couponController,
                                        // cursorHeight: 12,
                                        onChanged: (val) {
                                          print("get...$val");
                                          if (val != "" ||
                                              couponController.text != "") {
                                            setState(() {
                                              opacityVal = 1;
                                            });
                                          } else {
                                            setState(() {
                                              opacityVal = 0.5;
                                            });
                                          }
                                        },
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 10,
                                            color: blackColor),
                                        decoration: InputDecoration(
                                          hintText: "Enter promo code",
                                          hintStyle: TextStyle(
                                              fontFamily: "OnestSemiBold",
                                              fontSize: 10,
                                              color:
                                                  blackColor.withOpacity(0.5)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 8),
                                          isDense: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: lightAmberColor,
                                                  width: 1)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: woodColor, width: 1)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: woodColor, width: 1)),
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
                                        onTapFun: () {},
                                        title: "Confirm",
                                        backgroundColor: woodColor,
                                        borderColor: woodColor,
                                        textColor: whiteColor,
                                        titleFontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
              Container(
                color: lightBlackColor.withOpacity(0.04),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonTitle(titleName: "Recommended for you"),
                    ),
                  ],
                ),
              ),
              Container(
                color: lightBlackColor.withOpacity(0.04),
                alignment: Alignment.center,
                // height: (4 / 2) * 325,
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                  itemBuilder: (context, i) {
                    return PromotionItemWidget(
                      onTapFun: () {
                        Get.to(() => ProductDetailsScreen(
                              from: widget.from,
                            ));
                      },
                      amountColor: darkBlue,
                      imagePath: i == 0
                          ? promotionItems[0].image
                          : i == 1
                              ? promotionItems[1].image
                              : i == 2
                                  ? promotionItems[2].image
                                  : i == 3
                                      ? promotionItems[3].image
                                      : promotionItems[4].image,
                      itemName: i == 0
                          ? promotionItems[0].title
                          : i == 1
                              ? promotionItems[1].title
                              : i == 2
                                  ? promotionItems[2].title
                                  : i == 3
                                      ? promotionItems[3].title
                                      : promotionItems[4]
                                          .title
                                          .capitalize
                                          .toString(),
                      amount: "2465",
                      memberAmount: "2240",
                      exclusiveProduct: false,
                    );
                  },
                  itemCount: 4,
                ),
              ),
              const SpaceHeightWidget(height: 40)
            ],
          ),
        )),
      ),
    );
  }

  Widget withoutCartCountWidget() {
    return Column(
      children: [
        const SpaceHeightWidget(height: 10),
        Transform.flip(
          flipX: true,
          child: Image.asset(
            "assets/images/cart_draw.png",
            height: 90,
          ),
        ),
        const SpaceHeightWidget(height: 20),
        Text(
          "Your Destina 1 cart is empty",
          style: TextStyle(
              fontFamily: "OnestRegular",
              fontSize: 13,
              color: blackColor.withOpacity(0.7)),
        ),
        const SpaceHeightWidget(height: 3),
        Text(
          "Shop today's deals",
          style: TextStyle(
              fontFamily: "OnestRegular",
              fontSize: 13,
              color: blackColor.withOpacity(0.7)),
        ),
        const SpaceHeightWidget(height: 10),
        SizedBox(
          height: 30,
          child: CommonOulineTextButton(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            onTapFun: () {},
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
}
