import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/authentication_screens/login_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:destina_1_international/inside_screens/productdetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../inside_screens/services/upload_id_screen.dart';
import '../models/onboarding_model.dart';
import '../models/productitem_model.dart';

class HomeScreen extends StatefulWidget {
  List<String>? bannerPopUpImages = [];
  dynamic data;
  HomeScreen({super.key, this.bannerPopUpImages, this.data});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int carouselIndex = 0;
int promotionCarouselIndex = 0;
int sopCarouselIndex = 0;
List<OnboardModel> productsCategories = [
  OnboardModel(image: "assets/images/health_care.png", title: "Health Care"),
  OnboardModel(image: "assets/images/sop.png", title: "Skin Care"),
  OnboardModel(image: "assets/images/body_care.png", title: "Hair Care"),
  OnboardModel(image: "assets/images/a_start_privilege.png", title: "kritalia"),
];
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

List<ProductItemModel> healthProductItmes = [
  ProductItemModel(
      imagePath: "assets/images/health1.jpg",
      productCode: "D1MR002",
      title: "D1 ADVANCE SCALAR ENERGIZED FLASK"),
  ProductItemModel(
      imagePath: "assets/images/health2.jpg",
      productCode: "D1MR003",
      title: "D1 ADVANCE SCALAR ENERGIZED STICK"),
];
List<ProductItemModel> hairProductItmes = [
  ProductItemModel(
      imagePath: "assets/images/hair.jpg",
      productCode: "D1MR016",
      title: "D1 PHYTOMILK ASE VOLUMIZING HAIR SHAMPOO"),
  ProductItemModel(
      imagePath: "assets/images/hair.jpg",
      productCode: "D1MR017",
      title: "D1 PHYTOMILK ASE NURTURING HAIR CONDITIONER"),
];
List<ProductItemModel> skinProductItmes = [
  ProductItemModel(
      imagePath: "assets/images/skin.jpg",
      productCode: "D1MR009",
      title: "D1 AMIPREY GENTLE CLEANSER ASE"),
  ProductItemModel(
      imagePath: "assets/images/skin.jpg",
      productCode: "D1MR010",
      title: "D1 AMIPREY AGE-DEFYING MIST ASE"),
];
List<ProductItemModel> personalProductItems = [
  ProductItemModel(
      imagePath: "assets/images/health3.jpg",
      productCode: "D1MR004",
      title: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA"),
  ProductItemModel(
      imagePath: "assets/images/health4.jpg",
      productCode: "D1MR005",
      title: "DI ADVANCE SCALAR ENERGIZED BIO MATRIX SHIELD"),
];

class _HomeScreenState extends State<HomeScreen> {
  final MainController _homeController = Get.put(MainController());
  final ScrollController _scrollController = ScrollController();

  MainController productController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      popupFun();

      dataFun("Health Care");
    });
  }

  popupFun() {
    print("da....${widget.data}");
    if (widget.bannerPopUpImages!.isNotEmpty) {
      print(widget.bannerPopUpImages!.length);

      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 53),
              titlePadding: EdgeInsets.zero,
              title: Container(
                  width: double.maxFinite,
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SizedBox(
                      height: 25,
                      child: CustomAutoWidthButton(
                        onTapFun: () {
                          Get.back();
                          widget.bannerPopUpImages!.clear();
                          widget.data = null;
                        },
                        title: "Close Ads",
                        changeColor: true,
                        bcolor: darkRedColor,
                      ),
                    ),
                  )
                  // IconButton(
                  //     onPressed: () {
                  //       Get.back();
                  //     },
                  //     icon: Icon(
                  //       Icons.cancel_outlined,
                  //       color: redColor,
                  //     )),
                  ),
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 3, right: 3, bottom: 18),
              content: Scrollbar(
                thickness: 8,
                thumbVisibility: true,
                trackVisibility: true,
                interactive: true,
                radius: const Radius.circular(10),
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0;
                            i < widget.bannerPopUpImages!.length;
                            i++)
                          CommonCachedNetworkImage(
                              imagePath: widget.bannerPopUpImages![i])
                      ],
                    ),
                  ),
                ),
              )));
    }

    if (widget.data != null) {
      Timer(const Duration(microseconds: 500), () {
        if (widget.data['result1'].toString().toLowerCase() == "pending") {
          Get.dialog(AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 10),
              titlePadding: EdgeInsets.zero,
              title: Container(
                width: double.maxFinite,
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: redColor,
                    )),
              ),
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 3, right: 3, bottom: 18),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonTitle(
                      titleName: "Destina 1 International alerts!!!!",
                      fontColor: darkRedColor,
                    ),
                    const SpaceHeightWidget(height: 15),
                    SideTitle(title: widget.data['UploadIdMsg'])
                  ],
                ),
              )));
        } else if (widget.data['result1'] == "No Id") {
          Get.dialog(
              barrierDismissible: false,
              AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  titlePadding: EdgeInsets.zero,
                  contentPadding: const EdgeInsets.only(
                      top: 0, left: 3, right: 3, bottom: 18),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SpaceHeightWidget(height: 20),
                        CommonTitle(
                          titleName: "Account Locked!!!!",
                          fontColor: darkRedColor,
                        ),
                        const SpaceHeightWidget(height: 15),
                        const SideTitle(
                            title:
                                "Account Locked - Upload Your Valid government Issued ID."),
                        const SpaceHeightWidget(height: 10),
                        const SideTitle(
                            title:
                                "click the below button to unlock your account!!!"),
                        const SpaceHeightWidget(height: 15),
                        CustomAutoWidthButton(
                            bcolor: greenColor,
                            onTapFun: () {
                              Get.back();
                              Get.off(() => const UploadIDScreen());
                            },
                            title: "Click Here To Unlock Your Account")
                      ],
                    ),
                  )));
        }
      });
      Timer(const Duration(microseconds: 700), () {
        if (widget.data['RenewaAlert'] != "No") {
          Get.dialog(
              barrierDismissible: false,
              AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  titlePadding: EdgeInsets.zero,
                  title: Container(
                    width: double.maxFinite,
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: redColor,
                        )),
                  ),
                  contentPadding: const EdgeInsets.only(
                      top: 0, left: 3, right: 3, bottom: 18),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonTitle(
                          titleName: "Destina 1 International alerts!!!!",
                          fontColor: darkRedColor,
                        ),
                        const SpaceHeightWidget(height: 15),
                        SideTitle(title: widget.data['RenNotifyMsg'])
                      ],
                    ),
                  )));
        }
      });
    }
  }

  dataFun(String category) async {
    dynamic data = await productController.getProducts(category);
    print("product screen data...$data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: darkBlue,
            title: Text(
              "Enjoy shopping!",
              style: TextStyle(
                  fontSize: 17, fontFamily: "OnestSemiBold", color: whiteColor),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: whiteColor,
                  ))
            ]),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(color: darkBlue
                    // image: DecorationImage(
                    //     opacity: 0.3,
                    //     image: AssetImage(
                    //       "assets/images/blue_bg.jpg",
                    //     ),
                    //     fit: BoxFit.cover)
                    ),
              ),
              Column(children: [
                SearchWidget(
                  borderColor: transperantColor,
                  hintText: "Search",
                  onTapFun: () {},
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.785,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.asset(
                                  "assets/images/home_signup_slider.png",
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                if (Constants.prefs.getString("user_id") ==
                                        null ||
                                    Constants.prefs.getString("user_id") ==
                                        "false")
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 30, left: 12, top: 0),
                                    height: 28,
                                    width: 148,
                                    child: CustomAutoWidthButton(
                                      onTapFun: () {
                                        Get.to(() => const LoginScreen());
                                      },
                                      title: "Sign Up / Sign in",
                                    ),
                                  )
                              ],
                            )),
                      ),
                      const FreeDeliveryBanner(
                        amount: "699",
                      ),
                      const SpaceHeightWidget(height: 15),
                      SizedBox(
                        height: 100,
                        width: 500,
                        child: CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, i, rindex) {
                              return slideWidget(i + 1);
                            },
                            options: CarouselOptions(
                                viewportFraction: 0.95,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                autoPlayInterval: const Duration(seconds: 2),
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    carouselIndex = index;
                                  });
                                })),
                      ),
                      const SpaceHeightWidget(height: 10),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            for (int i = 0; i < 5; i++)
                              (i == carouselIndex)
                                  ? const ActiveDot()
                                  : const InactiveDot(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTitle(
                              titleName: "Promotion",
                              fontColor: lightDarKBlue,
                            ),
                            SizedBox(
                              height: 25,
                              width: 93,
                              child: CustomAutoWidthButton(
                                  onTapFun: () {
                                    Get.offAll(() => const BottomBarScreen(
                                          index: 3,
                                        ));
                                  },
                                  title: "See all"),
                            ),
                          ],
                        ),
                      ),
                      CarouselSlider.builder(
                          itemCount: 5,
                          itemBuilder: (context, i, rindex) {
                            return promotionWidget(i + 1);
                          },
                          options: CarouselOptions(
                              // aspectRatio: 2.9 / 4.2,
                              // aspectRatio: 2.5 / 4,
                              viewportFraction: 0.95,
                              enlargeCenterPage: true,
                              // autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              onPageChanged: (index, reason) {
                                setState(() {
                                  promotionCarouselIndex = index;
                                });
                              })),
                      const SpaceHeightWidget(height: 10),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            for (int i = 0; i < 5; i++)
                              (i == promotionCarouselIndex)
                                  ? const ActiveDot()
                                  : const InactiveDot(),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTitle(
                              titleName: "Product category",
                              fontColor: lightDarKBlue,
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SpaceWidthWidget(width: 5),
                            for (int i = 0; i < productsCategories.length; i++)
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Get.offAll(() => BottomBarScreen(
                                        index: 1,
                                        productIndex: i,
                                      ));
                                },
                                child: HomeScreenProductCategory(
                                  imagePath: productsCategories[i].image,
                                  productName: productsCategories[i].title,
                                ),
                              )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTitle(
                              titleName: "New Arrival",
                              fontColor: lightDarKBlue,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(bottom: 18),
                        width: double.infinity,
                        height: 425,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/newtag_banner.png"),
                                fit: BoxFit.cover)),
                        child: productController.loading.value
                            ? loader
                            : productController.productItemList.isEmpty
                                ? const SizedBox(
                                    height: 100,
                                    child: NotAvailableText(
                                      text: "New arrival not available",
                                    ))
                                : CarouselSlider.builder(
                                    itemCount: productController
                                        .productItemList.length,
                                    itemBuilder: (context, i, rindex) {
                                      return HomeScreenNewArrivalItemWidget(
                                        onTapFun: () {
                                          Get.to(() => ProductDetailsScreen(
                                                from: "newarrival",
                                                packageCode: productController
                                                    .productItemList[i]
                                                    .packagecode,
                                              ));
                                        },
                                        imagePath: productController
                                            .productItemList[i].image,
                                        itemName: productController
                                            .productItemList[i]
                                            .packageName
                                            .capitalizeFirst
                                            .toString(),
                                        amount: productController
                                                    .productItemList[i].dp !=
                                                0.0
                                            ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                                            : "",
                                      );
                                    },
                                    options: CarouselOptions(
                                      aspectRatio: 23 / 8.5,
                                      viewportFraction: 0.8,
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.2,
                                      autoPlayInterval:
                                          const Duration(seconds: 2),
                                    )),
                      ),
                      SeeNewAllProductsBanner(
                        onTapFun: () {
                          Get.offAll(() => const BottomBarScreen(
                                index: 1,
                              ));
                        },
                      ),
                      const SpaceHeightWidget(height: 13),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const SopWidget(),
                          Column(
                            children: [
                              CarouselSlider.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, i, rindex) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: i == 0
                                          ? SopCarouselWidget(
                                              imagePath:
                                                  "assets/images/woman_shopping.png",
                                              amount: "6000",
                                              imageContainerColor:
                                                  lightAppthemeColor
                                                      .withOpacity(0.3),
                                              twelvthPurchaseDiscount: "90",
                                              sixthPurchaseDiscount: "50",
                                              elevatedButton:
                                                  IconElevatedButton(
                                                onTapFun: () {},
                                                imagePath:
                                                    'assets/images/gift.png',
                                                labelColor: whiteColor,
                                                buttonColor: woodColor,
                                                titile: "Beyond",
                                              ),
                                            )
                                          : SopCarouselWidget(
                                              imagePath:
                                                  "assets/images/bag.png",
                                              amount: "2500",
                                              imageContainerColor: biscutColor,
                                              twelvthPurchaseDiscount: "50",
                                              sixthPurchaseDiscount: "50",
                                              elevatedButton:
                                                  IconElevatedButton(
                                                onTapFun: () {},
                                                imagePath:
                                                    'assets/images/gift.png',
                                                labelColor: greenColor,
                                                buttonColor: lightAmberColor,
                                                titile: "Basic",
                                              ),
                                            ),
                                    );
                                  },
                                  options: CarouselOptions(
                                      // height: 250,
                                      aspectRatio: 16 / 10,
                                      viewportFraction: 0.94,
                                      autoPlay: false,
                                      enableInfiniteScroll: false,
                                      // enlargeCenterPage: true,
                                      // enlargeFactor: 0.3,
                                      autoPlayInterval:
                                          const Duration(seconds: 2),
                                      onPageChanged: (index, i) {
                                        setState(() {
                                          sopCarouselIndex = index;
                                        });
                                      })),
                              const SpaceHeightWidget(height: 10),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    for (int i = 0; i < 2; i++)
                                      (i == sopCarouselIndex)
                                          ? ActiveDot(
                                              fillColor: lightDarKBlue,
                                            )
                                          : const SopInactiveDot(),
                                  ],
                                ),
                              ),
                              const SpaceHeightWidget(height: 13),
                            ],
                          ),
                        ],
                      ),
                      const SpaceHeightWidget(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTitle(
                              titleName: "Recommended for you",
                              fontColor: darkBlue,
                            ),
                          ),
                        ],
                      ),
                      productController.loading.value
                          ? loader
                          : productController.productItemList.isEmpty
                              ? const SizedBox(
                                  height: 100,
                                  child: NotAvailableText(
                                    text: "Recommended products not available",
                                  ))
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int i = 0;
                                          i <
                                              productController
                                                  .productItemList.length;
                                          i++)
                                        SizedBox(
                                          width: 150,
                                          height: 190,
                                          child: PromotionItemWidget(
                                            onTapFun: () {
                                              Get.to(() => ProductDetailsScreen(
                                                    from: "recommended_for_you",
                                                    packageCode:
                                                        productController
                                                            .productItemList[i]
                                                            .packagecode,
                                                  ));
                                            },
                                            amountColor: darkBlue,
                                            imagePath: productController
                                                .productItemList[i].image,
                                            itemName: productController
                                                .productItemList[i]
                                                .packageName
                                                .capitalizeFirst
                                                .toString(),
                                            amount: productController
                                                        .productItemList[i]
                                                        .dp !=
                                                    0.0
                                                ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                                                : "",
                                            exclusiveProduct: false,
                                          ),
                                        )
                                    ],
                                  ),
                                ),

                      // Container(
                      //     alignment: Alignment.center,
                      //     child: GridView.builder(
                      //       padding: const EdgeInsets.all(0),
                      //       physics:
                      //           const NeverScrollableScrollPhysics(),
                      //       shrinkWrap: true,
                      //       gridDelegate:
                      //           const SliverGridDelegateWithFixedCrossAxisCount(
                      //               crossAxisCount: 2,
                      //               childAspectRatio: 1 / 1.1),
                      //       itemBuilder: (context, i) {
                      //         return PromotionItemWidget(
                      //           onTapFun: () {
                      //             Get.to(() => ProductDetailsScreen(
                      //                   from: "recommended_for_you",
                      //                   packageCode: productController
                      //                       .productItemList[i]
                      //                       .packagecode,
                      //                 ));
                      //           },
                      //           amountColor: darkBlue,
                      //           imagePath: productController
                      //               .productItemList[i].image,
                      //           itemName: productController
                      //               .productItemList[i]
                      //               .packageName
                      //               .capitalizeFirst
                      //               .toString(),
                      //           amount: productController
                      //                       .productItemList[i].dp !=
                      //                   0.0
                      //               ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                      //               : "",
                      //           exclusiveProduct: false,
                      //         );
                      //       },
                      //       itemCount: productController
                      //           .productItemList.length,
                      //     ),
                      //   ),

                      const SpaceHeightWidget(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTitle(
                              titleName: "Best Seller",
                              fontColor: darkBlue,
                            ),
                          ),
                        ],
                      ),
                      productController.loading.value
                          ? loader
                          : productController.productItemList.isEmpty
                              ? const SizedBox(
                                  height: 100,
                                  child: NotAvailableText(
                                    text: "Best seller products not available",
                                  ))
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int i = 0;
                                          i <
                                              productController
                                                  .productItemList.length;
                                          i++)
                                        SizedBox(
                                          width: 150,
                                          height: 190,
                                          child: PromotionItemWidget(
                                            onTapFun: () {
                                              Get.to(() => ProductDetailsScreen(
                                                    from: "Best_seller",
                                                    packageCode:
                                                        productController
                                                            .productItemList[i]
                                                            .packagecode,
                                                  ));
                                            },
                                            amountColor: darkBlue,
                                            imagePath: productController
                                                .productItemList[i].image,
                                            itemName: productController
                                                .productItemList[i]
                                                .packageName
                                                .capitalizeFirst
                                                .toString(),
                                            amount: productController
                                                        .productItemList[i]
                                                        .dp !=
                                                    0.0
                                                ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                                                : "",
                                            exclusiveProduct: false,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                      const SpaceHeightWidget(height: 40)
                    ],
                  ),
                )
              ]),
            ],
          ),
        ));
  }

  Widget slideWidget(int i) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/images/cars$i.png",
          fit: BoxFit.fill,
        ));
  }

  Widget promotionWidget(int i) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/promotion$i.png",
                ),
                fit: BoxFit.fill),
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: SizedBox(
          //         width: 95,
          //         height: 33,
          //         child: CustomFixedElevatedButton(
          //           onTapFun: () {
          //             Get.to(() => const LoginScreen());
          //           },
          //           title: "See details",
          //         ),
          //       ),
          //     ),
          //     const SpaceHeightWidget(height: 10),
          //     Container(
          //       alignment: Alignment.center,
          //       // height: 290,
          //       child: GridView.builder(
          //         padding: const EdgeInsets.all(0),
          //         physics: const NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             // crossAxisCount: i == 2 ? 1 : 2,
          //             // childAspectRatio: i == 2 ? 1.3 : 1 / 1.55
          //             crossAxisCount: 2,
          //             childAspectRatio: 1 / 1.35),
          //         itemBuilder: (context, index) {
          //           return PromotionItemWidget(
          //             onTapFun: () {
          //               Get.to(() => const ProductDetailsScreen(
          //                     from: "promotion",
          //                     packageCode: "",
          //                   ));
          //             },
          //             imagePath: (i == 1 && index == 0)
          //                 ? promotionItems[0].image
          //                 : (i == 1 && index == 1)
          //                     ? promotionItems[1].image
          //                     : (i == 2 && index == 0)
          //                         ? promotionItems[2].image
          //                         : (i == 3 && index == 0)
          //                             ? promotionItems[3].image
          //                             : (i == 3 && index == 1)
          //                                 ? promotionItems[4].image
          //                                 : (i == 4 && index == 0)
          //                                     ? promotionItems[5].image
          //                                     : (i == 4 && index == 1)
          //                                         ? promotionItems[6].image
          //                                         : (i == 5 && index == 0)
          //                                             ? promotionItems[7].image
          //                                             : (i == 5 && index == 1)
          //                                                 ? promotionItems[8]
          //                                                     .image
          //                                                 : promotionItems[9]
          //                                                     .image,
          //             itemName: (i == 1 && index == 0)
          //                 ? promotionItems[0].title
          //                 : (i == 1 && index == 1)
          //                     ? promotionItems[1].title
          //                     : (i == 2 && index == 0)
          //                         ? promotionItems[2].title
          //                         : (i == 3 && index == 0)
          //                             ? promotionItems[3].title
          //                             : (i == 3 && index == 1)
          //                                 ? promotionItems[4].title
          //                                 : (i == 4 && index == 0)
          //                                     ? promotionItems[5].title
          //                                     : (i == 4 && index == 1)
          //                                         ? promotionItems[6].title
          //                                         : (i == 5 && index == 0)
          //                                             ? promotionItems[7].title
          //                                             : (i == 5 && index == 1)
          //                                                 ? promotionItems[8]
          //                                                     .title
          //                                                 : promotionItems[9]
          //                                                     .title,
          //             amount: "3${i}5",
          //             exclusiveProduct: true,
          //           );
          //         },
          //         itemCount: i == 2 ? 1 : 2,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 10, bottom: 10),
          //       child: Text("$i products"),
          //     ),
          //   ],
          // ),
        ));
  }
}
