import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/authentication_screens/login_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/productdetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/onboarding_model.dart';
import '../models/productitem_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int carouselIndex = 0;
int promotionCarouselIndex = 0;
int sopCarouselIndex = 0;
List<OnboardModel> productsCategories = [
  OnboardModel(
      image: "assets/images/a_start_privilege.png", title: "A Start Privilege"),
  OnboardModel(image: "assets/images/sop.png", title: "SOP"),
  OnboardModel(image: "assets/images/health_care.png", title: "Health"),
  OnboardModel(image: "assets/images/beauty.png", title: "Beauty"),
  OnboardModel(image: "assets/images/body_care.png", title: "Body Care"),
  OnboardModel(image: "assets/images/others.png", title: "Others"),
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
  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 500), () {
      Get.dialog(AlertDialog(
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
        content: Image.asset("assets/images/add.png"),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.3,
                    image: AssetImage(
                      "assets/images/blue_bg.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Enjoy shopping!",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "OnestSemiBold",
                        color: naviBlue),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none,
                        color: naviBlue,
                      ))
                ],
              ),
            ),
            SearchWidget(
              borderColor: blueColor.withOpacity(0.5),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 15, left: 12, top: 10),
                              // height: 35,
                              // width: 155,
                              child: CustomFixedElevatedButton(
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
                        const CommonTitle(titleName: "Promotion"),
                        SizedBox(
                          height: 28,
                          width: 55,
                          child: CommonOulineTextButton(
                            onTapFun: () {},
                            title: "See all",
                          ),
                        )
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, i, rindex) {
                        return promotionWidget(i + 1);
                      },
                      options: CarouselOptions(
                          aspectRatio: 2.9 / 4.2,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CommonTitle(titleName: "Product category"),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SpaceWidthWidget(width: 5),
                        for (int i = 0; i < productsCategories.length; i++)
                          HomeScreenProductCategory(
                            imagePath: productsCategories[i].image,
                            productName: productsCategories[i].title,
                          )
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CommonTitle(titleName: "New Arrival"),
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
                            image:
                                AssetImage("assets/images/newtag_banner.png"),
                            fit: BoxFit.cover)),
                    child: CarouselSlider.builder(
                        itemCount: 5,
                        itemBuilder: (context, i, rindex) {
                          return HomeScreenNewArrivalItemWidget(
                            onTapFun: () {
                              Get.to(() => const ProductDetailsScreen(
                                    from: "newarrival",
                                  ));
                            },
                            imagePath: i == 0
                                ? promotionItems[0].image
                                : i == 1
                                    ? promotionItems[1].image
                                    : i == 2
                                        ? promotionItems[2].image
                                        : i == 3
                                            ? promotionItems[3].image
                                            : i == 4
                                                ? promotionItems[4].image
                                                : promotionItems[5].image,
                            itemName: i == 0
                                ? promotionItems[0].title
                                : i == 1
                                    ? promotionItems[1].title
                                    : i == 2
                                        ? promotionItems[2].title
                                        : i == 3
                                            ? promotionItems[3].title
                                            : i == 4
                                                ? promotionItems[4].title
                                                : promotionItems[5]
                                                    .title
                                                    .capitalizeFirst
                                                    .toString(),
                            amount: "2465",
                            memberAmount: "2240",
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 23 / 8.5,
                          viewportFraction: 0.8,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2,
                          autoPlayInterval: const Duration(seconds: 2),
                        )),
                  ),
                  SeeNewAllProductsBanner(
                    onTapFun: () {},
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
                                              lightDarKBlue.withOpacity(0.3),
                                          twelvthPurchaseDiscount: "90",
                                          sixthPurchaseDiscount: "50",
                                          elevatedButton: IconElevatedButton(
                                            onTapFun: () {},
                                            imagePath: 'assets/images/gift.png',
                                            labelColor: whiteColor,
                                            buttonColor: woodColor,
                                            titile: "Beyond",
                                          ),
                                        )
                                      : SopCarouselWidget(
                                          imagePath: "assets/images/bag.png",
                                          amount: "2500",
                                          imageContainerColor: biscutColor,
                                          twelvthPurchaseDiscount: "50",
                                          sixthPurchaseDiscount: "50",
                                          elevatedButton: IconElevatedButton(
                                            onTapFun: () {},
                                            imagePath: 'assets/images/gift.png',
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
                                  autoPlayInterval: const Duration(seconds: 2),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CommonTitle(titleName: "Recommended for you"),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    // height: (4 / 2) * 325,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                      itemBuilder: (context, i) {
                        return PromotionItemWidget(
                          onTapFun: () {
                            Get.to(() => const ProductDetailsScreen(
                                  from: "recommended_for_you",
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
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 95,
                  height: 33,
                  child: CustomFixedElevatedButton(
                    onTapFun: () {
                      Get.to(() => const LoginScreen());
                    },
                    title: "See details",
                  ),
                ),
              ),
              const SpaceHeightWidget(height: 10),
              Container(
                alignment: Alignment.center,
                // height: 290,
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisCount: i == 2 ? 1 : 2,
                      // childAspectRatio: i == 2 ? 1.3 : 1 / 1.55
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.55),
                  itemBuilder: (context, index) {
                    return PromotionItemWidget(
                      onTapFun: () {
                        Get.to(() => const ProductDetailsScreen(
                              from: "promotion",
                            ));
                      },
                      imagePath: (i == 1 && index == 0)
                          ? promotionItems[0].image
                          : (i == 1 && index == 1)
                              ? promotionItems[1].image
                              : (i == 2 && index == 0)
                                  ? promotionItems[2].image
                                  : (i == 3 && index == 0)
                                      ? promotionItems[3].image
                                      : (i == 3 && index == 1)
                                          ? promotionItems[4].image
                                          : (i == 4 && index == 0)
                                              ? promotionItems[5].image
                                              : (i == 4 && index == 1)
                                                  ? promotionItems[6].image
                                                  : (i == 5 && index == 0)
                                                      ? promotionItems[7].image
                                                      : (i == 5 && index == 1)
                                                          ? promotionItems[8]
                                                              .image
                                                          : promotionItems[9]
                                                              .image,
                      itemName: (i == 1 && index == 0)
                          ? promotionItems[0].title
                          : (i == 1 && index == 1)
                              ? promotionItems[1].title
                              : (i == 2 && index == 0)
                                  ? promotionItems[2].title
                                  : (i == 3 && index == 0)
                                      ? promotionItems[3].title
                                      : (i == 3 && index == 1)
                                          ? promotionItems[4].title
                                          : (i == 4 && index == 0)
                                              ? promotionItems[5].title
                                              : (i == 4 && index == 1)
                                                  ? promotionItems[6].title
                                                  : (i == 5 && index == 0)
                                                      ? promotionItems[7].title
                                                      : (i == 5 && index == 1)
                                                          ? promotionItems[8]
                                                              .title
                                                          : promotionItems[9]
                                                              .title,
                      amount: "2465",
                      memberAmount: "2240",
                      exclusiveProduct: true,
                    );
                  },
                  itemCount: i == 2 ? 1 : 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text("$i products"),
              ),
            ],
          ),
        ));
  }
}
