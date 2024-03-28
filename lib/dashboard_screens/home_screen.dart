import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/authentication_screens/login_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../commons/constants.dart';
import '../inside_screens/notifications_screen.dart';
import '../inside_screens/productdetails_screen2.dart';
import '../inside_screens/search/search_categoryscreen.dart';
import '../inside_screens/services/upload_id_screen.dart';
import '../models/onboarding_model.dart';

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
  // OnboardModel(image: "assets/images/sop.png", title: "Skin Care"),
  // OnboardModel(image: "assets/images/body_care.png", title: "Hair Care"),
  OnboardModel(
      image: "assets/images/a_start_privilege.png", title: "Kritalia & Co"),
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

class _HomeScreenState extends State<HomeScreen> {
  final MainController _homeController = Get.put(MainController());
  final ScrollController _scrollController = ScrollController();

  MainController productController = Get.put(MainController());
  List<String> brandImags = ["brand_u", "brand_q", "brand_s", "brand_k"];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      popupFun();
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
                            imagePath: widget.bannerPopUpImages![i],
                            loaderHeight: 600,
                          )
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
    dataFun("Health Care");
  }

  dataFun(String category) async {
    dynamic data = await productController.getProducts(category, null);
    print("product screen data...$data");
    if (mounted) {
      setState(() {});
    }
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
              if (Constants.prefs.getString("user_id") == null ||
                  Constants.prefs.getString("user_id") == "false")
                CustomFixedElevatedButton(
                  onTapFun: () {
                    Get.to(() => const LoginScreen());
                  },
                  title: "Sign Up / Sign in",
                ),
              IconButton(
                  onPressed: () {
                    Get.to(() => const NotificationScreen());
                  },
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
                  onTapFun: () {
                    Get.to(() => const SearchCategoryScreen());
                  },
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceHeightWidget(height: 15),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 8, vertical: 12),
                      //   child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(18),
                      //       child: Stack(
                      //         alignment: Alignment.bottomLeft,
                      //         children: [
                      //           // Image.asset(
                      //           //   "assets/images/home_signup_slider.png",
                      //           //   height: 140,
                      //           //   width: double.infinity,
                      //           //   fit: BoxFit.fill,
                      //           // ),
                      //           if (Constants.prefs.getString("user_id") ==
                      //                   null ||
                      //               Constants.prefs.getString("user_id") ==
                      //                   "false")
                      //             Container(
                      //               margin: const EdgeInsets.only(
                      //                   bottom: 8, left: 12, top: 0),
                      //               height: 28,
                      //               width: 148,
                      //               child: CustomAutoWidthButton(
                      //                 onTapFun: () {
                      //                   Get.to(() => const LoginScreen());
                      //                 },
                      //                 title: "Sign Up / Sign in",
                      //               ),
                      //             )
                      //         ],
                      //       )),
                      // ),
                      // const FreeDeliveryBanner(
                      //   amount: "699",
                      // ),
                      // const SpaceHeightWidget(height: 15),
                      SizedBox(
                        height: 110,
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
                              titleName: "Premier Picks",
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
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              titleName: "Best Sellers",
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
                                      text: "Best Sellers not available",
                                    ))
                                : CarouselSlider.builder(
                                    itemCount: productController
                                        .productItemList.length,
                                    itemBuilder: (context, i, rindex) {
                                      return HomeScreenNewArrivalItemWidget(
                                        onTapFun: () {
                                          Get.to(() => ProductDetailsScreen2(
                                                from: "Best Sellers",
                                                packageCode: productController
                                                    .productItemList[i]
                                                    .packagecode,
                                                fromPack: 'Health Care',
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
                      // Stack(
                      //   alignment: Alignment.bottomCenter,
                      //   children: [
                      //     const SopWidget(),
                      //     Column(
                      //       children: [
                      //         CarouselSlider.builder(
                      //             itemCount: 2,
                      //             itemBuilder: (context, i, rindex) {
                      //               return Padding(
                      //                 padding: const EdgeInsets.only(right: 8),
                      //                 child: i == 0
                      //                     ? SopCarouselWidget(
                      //                         imagePath:
                      //                             "assets/images/woman_shopping.png",
                      //                         amount: "6000",
                      //                         imageContainerColor:
                      //                             lightAppthemeColor
                      //                                 .withOpacity(0.3),
                      //                         twelvthPurchaseDiscount: "90",
                      //                         sixthPurchaseDiscount: "50",
                      //                         elevatedButton:
                      //                             IconElevatedButton(
                      //                           onTapFun: () {},
                      //                           imagePath:
                      //                               'assets/images/gift.png',
                      //                           labelColor: whiteColor,
                      //                           buttonColor: woodColor,
                      //                           titile: "Beyond",
                      //                         ),
                      //                       )
                      //                     : SopCarouselWidget(
                      //                         imagePath:
                      //                             "assets/images/bag.png",
                      //                         amount: "2500",
                      //                         imageContainerColor: biscutColor,
                      //                         twelvthPurchaseDiscount: "50",
                      //                         sixthPurchaseDiscount: "50",
                      //                         elevatedButton:
                      //                             IconElevatedButton(
                      //                           onTapFun: () {},
                      //                           imagePath:
                      //                               'assets/images/gift.png',
                      //                           labelColor: greenColor,
                      //                           buttonColor: lightAmberColor,
                      //                           titile: "Basic",
                      //                         ),
                      //                       ),
                      //               );
                      //             },
                      //             options: CarouselOptions(
                      //                 // height: 250,
                      //                 aspectRatio: 16 / 10,
                      //                 viewportFraction: 0.94,
                      //                 autoPlay: false,
                      //                 enableInfiniteScroll: false,
                      //                 // enlargeCenterPage: true,
                      //                 // enlargeFactor: 0.3,
                      //                 autoPlayInterval:
                      //                     const Duration(seconds: 2),
                      //                 onPageChanged: (index, i) {
                      //                   setState(() {
                      //                     sopCarouselIndex = index;
                      //                   });
                      //                 })),
                      //         const SpaceHeightWidget(height: 10),
                      //         Container(
                      //           width: double.infinity,
                      //           alignment: Alignment.center,
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             mainAxisSize: MainAxisSize.max,
                      //             children: [
                      //               for (int i = 0; i < 2; i++)
                      //                 (i == sopCarouselIndex)
                      //                     ? ActiveDot(
                      //                         fillColor: lightDarKBlue,
                      //                       )
                      //                     : const SopInactiveDot(),
                      //             ],
                      //           ),
                      //         ),
                      //         const SpaceHeightWidget(height: 13),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      const SpaceHeightWidget(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTitle(
                              titleName: "News",
                              fontColor: darkBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: CarouselSlider.builder(
                            itemCount: 4,
                            itemBuilder: (context, i, rindex) {
                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  // Get.to(() => const WebUrlScreen(
                                  //       from: "",
                                  //       redirectUrl: "",
                                  //     ));
                                },
                                child: SizedBox(
                                  width: 250,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const CommonCachedNetworkImage(
                                        imagePath: "dd",
                                        height: 150,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: CommonTitle(
                                          titleName:
                                              "News from destina to customer for reference to take products ans beliefe",
                                          fontFamily: "OnestRegular",
                                          size: 14,
                                          fontColor: middleBlackColor,
                                          textoverFlow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                viewportFraction: 0.65,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                autoPlayInterval: const Duration(seconds: 2),
                                onPageChanged: (index, reason) {})),
                      ),

                      const SpaceHeightWidget(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTitle(
                              titleName: "Announcements",
                              fontColor: darkBlue,
                            ),
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
                              titleName: "Featured Products",
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
                                    text: "Featured products not available",
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
                                              Get.to(() =>
                                                  ProductDetailsScreen2(
                                                    from: "Featured",
                                                    packageCode:
                                                        productController
                                                            .productItemList[i]
                                                            .packagecode,
                                                    fromPack: "Health care",
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
                              titleName: "Featured Brands",
                              fontColor: darkBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        width: 500,
                        child: CarouselSlider.builder(
                            itemCount: 4,
                            itemBuilder: (context, i, rindex) {
                              return Image.asset(
                                "assets/images/${brandImags[i]}.png",
                                fit: BoxFit.fill,
                              );
                            },
                            options: CarouselOptions(
                                autoPlayCurve: Curves.easeInToLinear,
                                viewportFraction: 0.6,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                autoPlayInterval: const Duration(seconds: 2),
                                onPageChanged: (index, reason) {})),
                      ),
                      const SpaceHeightWidget(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonTitle(
                              titleName: "Trending On Socialmedia #Destina1",
                              fontColor: darkBlue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SpaceWidthWidget(width: 10),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: const Color(0XFF285AEB),
                              child: Image.asset(
                                "assets/images/facebook1.png",
                                color: whiteColor,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 28,
                              child: Image.asset(
                                "assets/images/instagram2.png",
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: blackColor,
                              child: Image.asset(
                                "assets/images/tiktock1.png",
                                color: whiteColor,
                                height: 28,
                              ),
                            ),
                          ),
                          const SpaceWidthWidget(width: 5),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: whiteColor,
                              child: Image.asset(
                                "assets/images/youtube2.png",
                                // color: whiteColor,
                                // height: 45,
                              ),
                            ),
                          ),

                          // Expanded(
                          //   child: Container(
                          //     decoration: const BoxDecoration(
                          //       color: Color(0XFF285AEB),
                          //     ),
                          //     child: Center(
                          //       child: Image.asset(
                          //         "assets/images/facebook1.png",
                          //         color: whiteColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     decoration: const BoxDecoration(
                          //         gradient: LinearGradient(colors: [
                          //       Color(0XFFfdf497),
                          //       Color(0XFFfdf497),
                          //       Color(0XFFfd5949),
                          //       Color(0XFFd6249f),
                          //       Color(0XFF285AEB),
                          //     ])),
                          //     child: Center(
                          //       child: Image.asset(
                          //         height: 25,
                          //         color: whiteColor,
                          //         "assets/images/instagram1.png",
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     decoration:
                          //         const BoxDecoration(color: Colors.black),
                          //     child: Center(
                          //       child: Image.asset(
                          //         height: 25,
                          //         "assets/images/tiktock1.png",
                          //         color: whiteColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     decoration:
                          //         const BoxDecoration(color: Colors.red),
                          //     child: Center(
                          //       child: Image.asset(
                          //         // height: 25,
                          //         "assets/images/youtube2.jpg",
                          //         // color: whiteColor,
                          //       ),
                          //     ),
                          //   ),
                          // )
                          // Expanded(
                          //   child: Container(
                          //     decoration: const BoxDecoration(
                          //       color: Color(0XFF285AEB),
                          //     ),
                          //     child: Center(
                          //       child: Image.asset(
                          //         "assets/images/facebook1.png",
                          //         color: whiteColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     decoration: const BoxDecoration(
                          //         gradient: LinearGradient(colors: [
                          //       Color(0XFFfdf497),
                          //       Color(0XFFfdf497),
                          //       Color(0XFFfd5949),
                          //       Color(0XFFd6249f),
                          //       Color(0XFF285AEB),
                          //     ])),
                          //     child: Center(
                          //       child: Image.asset(
                          //         height: 25,
                          //         color: whiteColor,
                          //         "assets/images/instagram1.png",
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     decoration:
                          //         const BoxDecoration(color: Colors.black),
                          //     child: Center(
                          //       child: Image.asset(
                          //         height: 25,
                          //         "assets/images/tiktock1.png",
                          //         color: whiteColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     decoration:
                          //         const BoxDecoration(color: Colors.red),
                          //     child: Center(
                          //       child: Image.asset(
                          //         // height: 25,
                          //         "assets/images/youtube2.jpg",
                          //         // color: whiteColor,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: CarouselSlider.builder(
                            itemCount: trendingData.length,
                            itemBuilder: (context, i, rindex) {
                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  // Get.to(() => const WebUrlScreen(
                                  //       from: "",
                                  //       redirectUrl: "",
                                  //     ));
                                },
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () async {
                                    final Uri url =
                                        Uri.parse(trendingData[i]['click_url']);
                                    if (!await launchUrl(url)) {
                                      throw Exception('Could not launch $url');
                                    }
                                  },
                                  child: SizedBox(
                                      width: 300,
                                      child: trendingData[i]['type'] == "image"
                                          ? CommonCachedNetworkImage(
                                              imagePath: trendingData[i]
                                                  ['thumbnail_img'],
                                              height: 200,
                                            )
                                          : Stack(
                                              children: [
                                                CommonCachedNetworkImage(
                                                  imagePath: trendingData[i]
                                                      ['thumbnail_img'],
                                                  height: 200,
                                                ),
                                                const Icon(
                                                    Icons.play_arrow_rounded)
                                              ],
                                            )),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                viewportFraction: 0.64,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                autoPlayInterval: const Duration(seconds: 2),
                                onPageChanged: (index, reason) {})),
                      ),
                      const SpaceHeightWidget(height: 10),
                      // productController.loading.value
                      //     ? loader
                      //     : productController.productItemList.isEmpty
                      //         ? const SizedBox(
                      //             height: 100,
                      //             child: NotAvailableText(
                      //               text: "Best seller products not available",
                      //             ))
                      //         : SingleChildScrollView(
                      //             scrollDirection: Axis.horizontal,
                      //             child: Row(
                      //               children: [
                      //                 for (int i = 0;
                      //                     i <
                      //                         productController
                      //                             .productItemList.length;
                      //                     i++)
                      //                   SizedBox(
                      //                     width: 150,
                      //                     height: 190,
                      //                     child: PromotionItemWidget(
                      //                       onTapFun: () {
                      //                         Get.to(() =>
                      //                             ProductDetailsScreen2(
                      //                               from: "Best_seller",
                      //                               packageCode:
                      //                                   productController
                      //                                       .productItemList[i]
                      //                                       .packagecode,
                      //                               fromPack: "Health care",
                      //                             ));
                      //                       },
                      //                       amountColor: darkBlue,
                      //                       imagePath: productController
                      //                           .productItemList[i].image,
                      //                       itemName: productController
                      //                           .productItemList[i]
                      //                           .packageName
                      //                           .capitalizeFirst
                      //                           .toString(),
                      //                       amount: productController
                      //                                   .productItemList[i]
                      //                                   .dp !=
                      //                               0.0
                      //                           ? "${productController.productItemList[i].currency} ${productController.productItemList[i].dp}"
                      //                           : "",
                      //                       exclusiveProduct: false,
                      //                     ),
                      //                   )
                      //               ],
                      //             ),
                      //           ),
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
          "assets/images/home_banner$i.jpg",
          fit: BoxFit.fill,
        ));
  }

  Widget promotionWidget(int i) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.offAll(() => const BottomBarScreen(
              index: 3,
            ));
      },
      child: ClipRRect(
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
          )),
    );
  }

  trendingSocialMFun() {
    // type of data - video or image, clicking url, and thumbnail image.
  }
  List trendingData = [
    {
      "type": "video",
      "click_url":
          "https://www.facebook.com/Destina1int/videos/1033698247756287",
      "thumbnail_img":
          "https://www.facebook.com/Destina1int/videos/1033698247756287"
    },
    {
      "type": "image",
      "click_url":
          "https://www.facebook.com/photo/?fbid=823679919801413&set=pb.100064782363963.-2207520000",
      "thumbnail_img": "https://beta.destina1.com/images/fb-event04.jpg"
    },
    {
      "type": "video",
      "click_url":
          "https://www.facebook.com/Destina1int/videos/7662481057114753",
      "thumbnail_img":
          "https://www.facebook.com/Destina1int/videos/7662481057114753"
    },
    {
      "type": "video",
      "click_url":
          "https://www.facebook.com/Destina1int/videos/1254033921930559/",
      "thumbnail_img":
          "https://www.facebook.com/Destina1int/videos/1254033921930559/"
    },
  ];
}
