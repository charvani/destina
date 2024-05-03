import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../productdetails_screen2.dart';
import 'k_contactus_screen.dart';
import 'k_products_screen.dart';

class KritaliaHomeScreen extends StatefulWidget {
  const KritaliaHomeScreen({super.key});

  @override
  State<KritaliaHomeScreen> createState() => _KritaliaHomeScreenState();
}

class _KritaliaHomeScreenState extends State<KritaliaHomeScreen> {
  late VideoPlayerController controller = VideoPlayerController.asset("");
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  videoFun() {
    controller = VideoPlayerController.networkUrl(
      Uri.parse('https://www.destina1.com/images/Kritalia&CO/Kritalia&CO.mp4'),
    )..initialize().then((_) {
        controller.setVolume(0);
        controller.play();

        setState(() {});
      });
  }

  void _playNextVideo() {
    // Here, you can load the next video URL and play it
    // For simplicity, I'm just restarting the current video
    controller.seekTo(Duration.zero);
    controller.play();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      videoFun();
      controller.addListener(() {
        if (controller.value.position == controller.value.duration) {
          // Video completed, play another video
          _playNextVideo();
        }
      });
      dynamic openCountry = Constants.prefs.getString("open_country")!;

      if (openCountry == "MY" || openCountry == "US") {
        trendingProFun(openCountry);
      }
    });
  }

  trendingProFun(openCountry) {
    if (openCountry == "MY") {
      trendingPro = [
        {
          "image": "https://admin.destina1.com/admin/RetailImages/KRC141.jpg",
          "pcode": "KRC14",
        },
        {
          "image": "https://admin.destina1.com/admin/RetailImages/KRB031.jpg",
          "pcode": "KRB03",
        },
        {
          "image": "https://admin.destina1.com/admin/RetailImages/KRR031.jpg",
          "pcode": "KRR03",
        },
        {
          "image": "https://admin.destina1.com/admin/RetailImages/KRB021.jpg",
          "pcode": "KRB02",
        },
      ];
    } else {
      trendingPro = [
        {
          "image": "https://admin.destina1.com/admin/RetailImages/16091.jpg",
          "pcode": "USKRB17",
        },
        {
          "image": "https://admin.destina1.com/admin/RetailImages/16171.png",
          "pcode": "USKRB25",
        },
        {
          "image": "https://admin.destina1.com/admin/RetailImages/16221.jpg",
          "pcode": "USKRB30",
        },
        {
          "image": "https://admin.destina1.com/admin/RetailImages/16281.jpg",
          "pcode": "USKRB36",
        },
      ];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Kritalia & CO", backNavigation: true),
      body: SingleChildScrollView(
          child: Column(
        children: [
          videoWidget(),
          intoWideget(),
          arrivalsWidget(),
          shopCatWidget(),
          trendingProWidget(),
          artGiftWidget(),
          contactSerWidget(),
          kExperienceWidget(),
          const SpaceHeightWidget(height: 20)
        ],
      )),
    );
  }

  videoWidget() {
    return Column(
      children: [
        const SpaceHeightWidget(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                )
              : Container(
                  color: redColor,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTitle(
                  titleName: "Discover Elegance Redefined with Kritalia&Co.",
                  fontColor: darkBlue,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CommonTitle(
            titleName:
                "A Legacy of Craftsmanship Since 1963. Embrace the season's enchantment and the timeless allure that lies beyond with our exquisite collection. Explore our most cherished creations and find your perfect piece to illuminate your journey of good health with brilliance.",
            size: 14,
            fontFamily: "OnestRegular",
            textAlign: TextAlign.justify,
          ),
        ),
        CustomAutoWidthButton(
            onTapFun: () {
              Get.to(() => const KProductsScreen2(
                    from: "Kritalia & CO",
                  ));
            },
            title: "Shop Now"),
      ],
    );
  }

  intoWideget() {
    return Column(
      children: [
        const SpaceHeightWidget(height: 10),
        Image.asset("assets/images/kritalia1.png"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CommonTitle(
            titleName:
                "Each piece in our curated selection is a testament to unparalleled artistry and a beacon of innovation, promising to elevate every moment into a celebration of unmatched style and grace. From the whispers of the past to the bold statements of the present, let Kritalia be your companion in weaving stories of elegance, passion, and unparalleled sophistication.",
            size: 16,
            fontFamily: "OnestSemiBold",
            fontColor: kriColor,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  arrivalsWidget() {
    return Column(
      children: [
        const SpaceHeightWidget(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.65), BlendMode.saturation),
              // child: Image.asset(
              //   "assets/images/kritalia2.jpg",
              //   height: 250,
              // ),
              child: CachedNetworkImage(
                imageUrl:
                    "https://www.destina1.com/images/new-arrival-image.jpg",
                height: 250,
              ),
            ),
            Column(
              children: [
                const SpaceHeightWidget(height: 5),
                CommonTitle(
                  titleName: "New Arrivals",
                  fontColor: whiteColor,
                  size: 22,
                  textAlign: TextAlign.center,
                ),
                const SpaceHeightWidget(height: 5),
                SizedBox(
                  height: 35,
                  width: 120,
                  child: CommonOulineTextButton(
                    titleFontSize: 16,
                    textColor: whiteColor,
                    borderColor: whiteColor,
                    onTapFun: () {
                      Get.to(() => const KProductsScreen2(
                            from: "Kritalia & CO",
                          ));
                    },
                    title: "SHOP NOW",
                  ),
                )
              ],
            )
          ],
        ),
        const SpaceHeightWidget(height: 15),
        Stack(
          alignment: Alignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.65), BlendMode.saturation),
              child: CachedNetworkImage(
                imageUrl:
                    "https://www.destina1.com/images/best-seller-image.jpg",
                height: 250,
              ),
            ),
            Column(
              children: [
                const SpaceHeightWidget(height: 5),
                CommonTitle(
                  titleName: "Best Seller",
                  fontColor: whiteColor,
                  size: 22,
                  textAlign: TextAlign.center,
                ),
                const SpaceHeightWidget(height: 5),
                SizedBox(
                  height: 35,
                  width: 120,
                  child: CommonOulineTextButton(
                    titleFontSize: 16,
                    textColor: whiteColor,
                    borderColor: whiteColor,
                    onTapFun: () {
                      Get.to(() => const KProductsScreen2(
                            from: "Kritalia & CO",
                          ));
                    },
                    title: "SHOP NOW",
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  List<dynamic> shopCategories = [
    {
      "image": "https://admin.destina1.com/admin/RetailImages/KRC111.jpg",
      "name": "NECKLACES"
    },
    {
      "image": "https://admin.destina1.com/admin/RetailImages/KRR021.jpg",
      "name": "RINGS"
    },
    {
      "image": "https://admin.destina1.com/admin/RetailImages/KRC061.jpg",
      "name": "JEWELLERY SETS"
    },
    {
      "image": "https://admin.destina1.com/admin/RetailImages/KRB011.jpg",
      "name": "BRACELETS"
    },
  ];
  shopCatWidget() {
    return Column(
      children: [
        const SpaceHeightWidget(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTitle(
                titleName: "Shop by Category",
                fontColor: darkBlue,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CommonTitle(
                  titleName: "Brilliant design and unparalleled craftsmanship.",
                  size: 14,
                  fontFamily: "OnestRegular",
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        // Obx(() {
        //   return
        //  _homeController.newsData.isEmpty
        //     ? const NotAvailableText(text: "News not available")
        //     :
        SizedBox(
          child: CarouselSlider.builder(
              itemCount: shopCategories.length,
              itemBuilder: (context, i, rindex) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.to(() => KProductsScreen2(
                          index: i,
                          from: shopCategories[i]['name'],
                        ));
                  },
                  child: SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonCachedNetworkImage(
                          imagePath: shopCategories[i]['image'],
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CommonTitle(
                            titleName: shopCategories[i]['name'],
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
                  viewportFraction: 0.35,
                  aspectRatio: 16 / 8.5,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, reason) {})),
        ),
        // }),
        const SpaceHeightWidget(height: 10),
      ],
    );
  }

  List<dynamic> trendingPro = [
    {
      "image": "https://admin.destina1.com/admin/RetailImages/16091.jpg",
      "pcode": "D1USKRB17",
    },
    {
      "image": "https://admin.destina1.com/admin/RetailImages/16171.png",
      "pcode": "D1USKRB25",
    },
    {
      "image": "https://admin.destina1.com/admin/RetailImages/16221.jpg",
      "pcode": "D1USKRB30",
    },
    {
      "image": "https://admin.destina1.com/admin/RetailImages/16281.jpg",
      "pcode": "D1USKRB36",
    },
  ];
  trendingProWidget() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTitle(
              titleName: "Trending Products",
              fontColor: darkBlue,
            ),
          ],
        ),
        // Obx(() {
        //   return
        //  _homeController.newsData.isEmpty
        //     ? const NotAvailableText(text: "News not available")
        //     :
        const SpaceHeightWidget(height: 5),
        SizedBox(
          child: CarouselSlider.builder(
              itemCount: trendingPro.length,
              itemBuilder: (context, i, rindex) {
                return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.to(() => ProductDetailsScreen2(
                            from: "trending products",
                            packageCode: trendingPro[i]['pcode'],
                            fromPack: "Kritalia & Co",
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: lightDarKBlue.withOpacity(0.5),
                                    width: 0.5)),
                            width: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CommonCachedNetworkImage(
                                  imagePath: trendingPro[i]['image'],
                                  height: 150,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: darkRedColor,
                            height: 20,
                            width: 40,
                            child: CommonTitle(
                              titleName: "New",
                              size: 14,
                              fontColor: whiteColor,
                            ),
                          )
                        ],
                      ),
                    ));
              },
              options: CarouselOptions(
                  viewportFraction: 0.4,
                  aspectRatio: 16 / 7,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, reason) {})),
        ),
        // }),
        const SpaceHeightWidget(height: 15),
      ],
    );
  }

  List<dynamic> aftOfGift = [
    {
      "image": "https://www.destina1.com/images/gift-for-her.jpg",
      "name": "Gifts For Her"
    },
    {
      "image": "https://www.destina1.com/images/WEDDING-GIFTS.jpg",
      "name": "Wedding Gifts"
    },
    {
      "image": "https://www.destina1.com/images/gift-for-him.jpg",
      "name": "Gifts For Him"
    },
  ];
  artGiftWidget() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTitle(
              titleName: "The Art of Gifting",
              fontColor: darkBlue,
            ),
          ],
        ),
        // Obx(() {
        //   return
        //  _homeController.newsData.isEmpty
        //     ? const NotAvailableText(text: "News not available")
        //     :
        const SpaceHeightWidget(height: 5),
        SizedBox(
          child: CarouselSlider.builder(
              itemCount: aftOfGift.length,
              itemBuilder: (context, i, rindex) {
                return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.to(() => const KProductsScreen2(
                            from: "Kritalia & CO",
                          ));
                    },
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonCachedNetworkImage(
                            imagePath: aftOfGift[i]['image'],
                            height: 150,
                          ),
                          const SpaceHeightWidget(height: 3),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CommonTitle(
                              titleName: aftOfGift[i]['name'],
                              fontFamily: "OnestRegular",
                              size: 15,
                              fontColor: middleBlackColor,
                              textoverFlow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ));
              },
              options: CarouselOptions(
                  viewportFraction: 0.65,
                  aspectRatio: 16 / 8.5,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, reason) {})),
        ),
        // }),
        const SpaceHeightWidget(height: 10),
      ],
    );
  }

  contactSerWidget() {
    return Column(
      children: [
        const SpaceHeightWidget(height: 10),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CommonCachedNetworkImage(
                imagePath:
                    "https://www.destina1.com/images/at-your-servcice.jpg")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTitle(
                  titleName: "At Your Service",
                  fontColor: darkBlue,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CommonTitle(
            titleName:
                "Enhance your gifting with Kritalia & Co. Client Advisors. Find the perfect, personalized present with our expert guidance, ensuring each gift is unique and memorable.",
            size: 14,
            fontFamily: "OnestRegular",
            textAlign: TextAlign.justify,
          ),
        ),
        CustomAutoWidthButton(
            onTapFun: () {
              Get.to(() => const KContactUsScreen());
            },
            title: "Contact Us"),
      ],
    );
  }

  kExperienceWidget() {
    return Column(
      children: [
        const SpaceHeightWidget(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTitle(
                  titleName: "The Kritalia Experience",
                  fontColor: darkBlue,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.local_shipping_outlined,
                size: 45,
                color: middleBlackColor,
              ),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                titleName: "Complimentary Shipping & Returns",
                fontColor: darkBlue,
                textAlign: TextAlign.center,
                size: 14,
              ),
              const SpaceHeightWidget(height: 3),
              CommonTitle(
                titleName:
                    "We offer complimentary shipping for selected products and orders",
                fontColor: middleBlackColor,
                textAlign: TextAlign.center,
                size: 14,
                fontFamily: "OnestRegular",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.supervisor_account_outlined,
                size: 45,
                color: middleBlackColor,
              ),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                titleName: "Kritalia At Your Service",
                fontColor: darkBlue,
                textAlign: TextAlign.center,
                size: 14,
              ),
              const SpaceHeightWidget(height: 3),
              CommonTitle(
                titleName: "Our client care experts are always here to help",
                fontColor: middleBlackColor,
                textAlign: TextAlign.center,
                size: 14,
                fontFamily: "OnestRegular",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.shield_outlined,
                size: 45,
                color: middleBlackColor,
              ),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                titleName: "Book an Appointment",
                fontColor: darkBlue,
                textAlign: TextAlign.center,
                size: 14,
              ),
              const SpaceHeightWidget(height: 3),
              CommonTitle(
                titleName:
                    "We are happy to help with in-store or virtual appointments",
                fontColor: middleBlackColor,
                textAlign: TextAlign.center,
                size: 14,
                fontFamily: "OnestRegular",
              ),
            ],
          ),
        ),
        CustomAutoWidthButton(
            onTapFun: () {
              Get.to(() => const KContactUsScreen());
            },
            title: "Contact Us"),
      ],
    );
  }
}
