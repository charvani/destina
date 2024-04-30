import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
        // controller.play();

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
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
    });
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
          trendingProWidget()
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
        CustomAutoWidthButton(onTapFun: () {}, title: "Shop Now"),
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
              child: Image.asset(
                "assets/images/kritalia2.jpg",
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
                      // Get.to(() => const LoginScreen());
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
              child: Image.asset(
                "assets/images/Kritalia3.jpg",
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
                      // Get.to(() => const LoginScreen());
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
              itemCount: 4,
              itemBuilder: (context, i, rindex) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // Get.to(() => NewsDetailsScreen(
                    //       newsno: _homeController.newsData[i].sno
                    //           .toString(),
                    //     ));
                  },
                  child: SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CommonCachedNetworkImage(
                          imagePath:
                              // _homeController.newsData[i].imagename,
                              "",
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CommonTitle(
                            titleName:
                                // _homeController.newsData[i].title,
                                "RINGS",
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
                  viewportFraction: 0.5,
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
              itemCount: 4,
              itemBuilder: (context, i, rindex) {
                return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      // Get.to(() => NewsDetailsScreen(
                      //       newsno: _homeController.newsData[i].sno
                      //           .toString(),
                      //     ));
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CommonCachedNetworkImage(
                                imagePath:
                                    // _homeController.newsData[i].imagename,
                                    "",
                                height: 150,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: CommonTitle(
                                  titleName:
                                      // _homeController.newsData[i].title,
                                      "RINGS",
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
                    ));
              },
              options: CarouselOptions(
                  viewportFraction: 0.5,
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
}
