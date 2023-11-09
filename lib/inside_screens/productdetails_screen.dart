import 'package:destina_1_international/authentication_screens/enrollpackage_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String from;
  final String packageCode;
  const ProductDetailsScreen(
      {super.key, required this.from, required this.packageCode});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  MainController productDetailsController = Get.put(MainController());
  int carouselIndex = 0;
  int currentProductCartCount = 0;
  int? badgeCount;
  TextEditingController controller = TextEditingController();
  late YoutubePlayerController _ycontroller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  String? videoId;
  List<String> carouselImages = [];
  getData() async {
    // badgeCount = Constants.prefs.getInt("cart_count") ?? 0;
    dynamic res =
        await productDetailsController.getProductDetails(widget.packageCode);
    print("product details data...$res");
    for (int i = 0; i < res['productImages'].length; i++) {
      carouselImages.add(res['productImages'][i]["url"]);
    }
    videoId = YoutubePlayer.convertUrlToId(res['VideoUrl']);
    if (videoId != "" && videoId != null) {
      _ycontroller = YoutubePlayerController(
          initialVideoId: videoId!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
          ));
    }

    // res['VideoUrl'];
    print("carouselIMages length...${carouselImages.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        backNavigation: true,
        onTapFun: () {
          Get.offAll(() => const BottomBarScreen());
        },
      ),
      bottomSheet: Obx(() {
        return productDetailsController.productDetails.value.available
            ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                margin: const EdgeInsets.only(bottom: 1),
                height: 60,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: whiteColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:
                      // (widget.from == "register")
                      //     ?
                      MainAxisAlignment.center,
                  // : MainAxisAlignment.spaceBetween,
                  children: [
                    // if (widget.from != "register")
                    //   GestureDetector(
                    //     behavior: HitTestBehavior.translucent,
                    //     onTap: () {
                    //       Get.to(() => CartScreen(
                    //             from:
                    //                 widget.from != "" ? widget.from : "productDetails",
                    //           ));
                    //     },
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         badgeCount! > 0
                    //             ? Badge.count(
                    //                 count: badgeCount ?? 0,
                    //                 child: Icon(
                    //                   Icons.shopping_bag_outlined,
                    //                   color: blackColor.withOpacity(0.75),
                    //                 ),
                    //               )
                    //             : Icon(
                    //                 Icons.shopping_bag_outlined,
                    //                 color: blackColor.withOpacity(0.75),
                    //               ),
                    //         const Text(
                    //           "Cart",
                    //           style: TextStyle(
                    //             fontSize: 11,
                    //             fontFamily: "OnestRegular",
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // currentProductCartCount == 0
                    //     ?

                    SizedBox(
                      width: 110,
                      height: 35,
                      child: IconElevatedButton(
                        onTapFun: () async {
                          // if (widget.from == "register") {
                          print("popup");
                          // Get.defaultDialog();
                          Get.dialog(PackageDilog(
                            quantityController: controller,
                            addtoCartFun: () async {
                              await Constants.prefs.setInt("cart_count", 1);
                              Get.back();
                              Get.to(() => const EnrollPackageScreen());
                            },
                          ));
                          // } else {
                          //   currentProductCartCount = currentProductCartCount + 1;
                          //   await Constants.prefs
                          //       .setInt("cart_count", badgeCount! + 1);
                          //   badgeCount = Constants.prefs.getInt("cart_count");
                          //   print("my adddd,,$badgeCount");

                          //   setState(() {});
                          // }
                        },
                        imagePath: 'assets/images/cart_icon.png',
                        labelColor: whiteColor,
                        buttonColor: blackColor,
                        titile: "Add",
                      ),
                    )
                    // : Container(
                    //     height: 35,
                    //     width: 120,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: blackColor,
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         IconButton(
                    //             padding: const EdgeInsets.all(0),
                    //             onPressed: () async {
                    //               currentProductCartCount =
                    //                   currentProductCartCount - 1;
                    //               await Constants.prefs
                    //                   .setInt("cart_count", badgeCount! - 1);
                    //               badgeCount = Constants.prefs.getInt("cart_count");
                    //               print("my minus,,$badgeCount");

                    //               setState(() {});
                    //             },
                    //             icon: Icon(
                    //               Icons.remove_outlined,
                    //               color: whiteColor,
                    //               size: 15,
                    //             )),
                    //         Text(
                    //           currentProductCartCount.toString(),
                    //           style: TextStyle(
                    //               color: whiteColor, fontFamily: "OnestRegular"),
                    //         ),
                    //         IconButton(
                    //             padding: const EdgeInsets.all(0),
                    //             onPressed: () async {
                    //               currentProductCartCount =
                    //                   currentProductCartCount + 1;
                    //               await Constants.prefs
                    //                   .setInt("cart_count", badgeCount! + 1);
                    //               badgeCount = Constants.prefs.getInt("cart_count");
                    //               print("my ++,,,$badgeCount");
                    //               setState(() {});
                    //             },
                    //             icon: Icon(
                    //               size: 15,
                    //               Icons.add,
                    //               color: whiteColor,
                    //             ))
                    //       ],
                    //     ),
                    //   ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      }),
      body: Obx(() {
        return productDetailsController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonCarousel(
                        images: carouselImages,
                        onchangedFun: (index, res) {
                          setState(() {
                            carouselIndex = index;
                          });
                        },
                        currentIndex: carouselIndex,
                      ),
                      const SpaceHeightWidget(height: 30),
                      ProductAmountDetailsWidget(
                        // retialPrice: "1500",
                        // memberPrice: "1450",
                        price: productDetailsController
                                .productDetails.value.available
                            ? productDetailsController
                                .productDetails.value.price
                            : "",
                        cv: productDetailsController.productDetails.value.cv,
                        productCode:
                            productDetailsController.productDetails.value.pcode,
                        title:
                            productDetailsController.productDetails.value.name,
                      ),
                      const SpaceHeightWidget(height: 10),
                      const CommonDivider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: productDetailsController
                                      .productDetails.value.available
                                  ? greenColor
                                  : redColor,
                              radius: 13,
                              child: Icon(
                                productDetailsController
                                        .productDetails.value.available
                                    ? Icons.done
                                    : Icons.close,
                                color: whiteColor,
                                size: 19,
                              ),
                            ),
                            const SpaceWidthWidget(width: 10),
                            Text(
                              productDetailsController
                                      .productDetails.value.available
                                  ? "Stock status: In stock"
                                  : "Stock status: Not available",
                              style:
                                  const TextStyle(fontFamily: "OnestRegular"),
                            )
                          ],
                        ),
                      ),
                      const CommonDivider(),
                      const SpaceHeightWidget(height: 15),

                      for (int i = 0;
                          i <
                              productDetailsController
                                  .productDetails.value.tabcontent.length;
                          i++)
                        Column(
                          children: [
                            ExpansionTile(
                              textColor: lightDarKBlue,
                              // collapsedBackgroundColor: redColor,
                              title: Text(
                                productDetailsController
                                    .productDetails.value.tabcontent[i].title,
                                style: const TextStyle(
                                    fontFamily: "OnestSemiBold", fontSize: 14),
                              ),
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, left: 10),
                                      decoration: BoxDecoration(
                                          color: lightDarKBlue.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      child: HtmlWidget(productDetailsController
                                          .productDetails
                                          .value
                                          .tabcontent[i]
                                          .content),
                                      // child: Document()
                                      // child: HtmlElementView(
                                      //     viewType: productDetailsController
                                      //         .productDetails
                                      //         .value
                                      //         .tabcontent[i]
                                      //         .content),
                                    ))
                              ],
                            ),
                            const CommonDivider()
                          ],
                        ),
                      // GestureDetector(
                      //   behavior: HitTestBehavior.translucent,
                      //   onTap: () {},
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               "Product details",
                      //               style: TextStyle(
                      //                   fontFamily: "OnestSemiBold",
                      //                   fontSize: 18,
                      //                   color: blackColor),
                      //             ),
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   "See details",
                      //                   style: TextStyle(
                      //                       fontSize: 13,
                      //                       fontFamily: "OnestRegular",
                      //                       color: blackColor.withOpacity(0.5)),
                      //                 ),
                      //                 const SpaceWidthWidget(width: 5),
                      //                 Icon(
                      //                   Icons.keyboard_arrow_right_rounded,
                      //                   color: blackColor.withOpacity(0.5),
                      //                 )
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //         const SpaceHeightWidget(height: 5),
                      //         const Padding(
                      //           padding: EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "This product is not medical device, and not intended for use in the Diagnosis, Treat or Cure any disease, or in the mitigation, or prevention of disease.",
                      //             style:
                      //                 TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        width: double.infinity,
                        height: 50,
                        color: blueColor.withOpacity(0.2),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/award.png",
                            ),
                            const SpaceWidthWidget(width: 10),
                            const Flexible(
                                child: Text(
                              "Destina 1 products are satisfied with the guarantee",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold", fontSize: 13),
                            ))
                          ],
                        ),
                      ),
                      if (videoId != "" && videoId != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SpaceHeightWidget(height: 10),
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Video",
                                style: TextStyle(
                                    fontFamily: "OnestSemiBold", fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: YoutubePlayer(
                                  controller: _ycontroller,
                                  showVideoProgressIndicator: true,
                                ),
                              ),
                            ),
                          ],
                        ),

                      const SpaceHeightWidget(height: 15),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Similar Products",
                          style: TextStyle(
                              fontFamily: "OnestSemiBold", fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: (2 / 2) * 290,
                        child: GridView.builder(
                            physics: const ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            shrinkWrap: true,
                            itemCount: 2,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.2),
                            itemBuilder: (context, i) {
                              return PromotionItemWidget(
                                onTapFun: () {
                                  Get.to(() => const ProductDetailsScreen(
                                        from: "similarProducts",
                                        packageCode: "",
                                      ));
                                },
                                amountColor: darkBlue,
                                imagePath: i == 0
                                    ? "assets/images/Product 1-1.jpg"
                                    : "assets/images/Product 1-3.jpg",
                                itemName:
                                    "D1 ADVANCE SCALAR ENERGIZED SCALARVIA",
                                amount: "2465",
                                memberAmount: "",
                                exclusiveProduct: false,
                              );
                            }),
                      ),

                      const SpaceHeightWidget(height: 65),
                    ]),
              );
      }),
    );
  }
}
