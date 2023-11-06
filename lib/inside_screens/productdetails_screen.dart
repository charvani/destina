import 'package:destina_1_international/authentication_screens/enrollpackage_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:destina_1_international/dashboard_screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String from;
  const ProductDetailsScreen({super.key, required this.from});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int carouselIndex = 0;
  int currentProductCartCount = 0;
  int? badgeCount;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    badgeCount = Constants.prefs.getInt("cart_count") ?? 0;
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
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        margin: const EdgeInsets.only(bottom: 1),
        height: 60,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: whiteColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: (widget.from == "register")
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            if (widget.from != "register")
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() => CartScreen(
                        from:
                            widget.from != "" ? widget.from : "productDetails",
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    badgeCount! > 0
                        ? Badge.count(
                            count: badgeCount ?? 0,
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: blackColor.withOpacity(0.75),
                            ),
                          )
                        : Icon(
                            Icons.shopping_bag_outlined,
                            color: blackColor.withOpacity(0.75),
                          ),
                    const Text(
                      "Cart",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: "OnestRegular",
                      ),
                    )
                  ],
                ),
              ),
            currentProductCartCount == 0
                ? SizedBox(
                    width: 110,
                    height: 35,
                    child: IconElevatedButton(
                      onTapFun: () async {
                        if (widget.from == "register") {
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
                        } else {
                          currentProductCartCount = currentProductCartCount + 1;
                          await Constants.prefs
                              .setInt("cart_count", badgeCount! + 1);
                          badgeCount = Constants.prefs.getInt("cart_count");
                          print("my adddd,,$badgeCount");

                          setState(() {});
                        }
                      },
                      imagePath: 'assets/images/cart_icon.png',
                      labelColor: whiteColor,
                      buttonColor: blackColor,
                      titile: "Add",
                    ),
                  )
                : Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: blackColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () async {
                              currentProductCartCount =
                                  currentProductCartCount - 1;
                              await Constants.prefs
                                  .setInt("cart_count", badgeCount! - 1);
                              badgeCount = Constants.prefs.getInt("cart_count");
                              print("my minus,,$badgeCount");

                              setState(() {});
                            },
                            icon: Icon(
                              Icons.remove_outlined,
                              color: whiteColor,
                              size: 15,
                            )),
                        Text(
                          currentProductCartCount.toString(),
                          style: TextStyle(
                              color: whiteColor, fontFamily: "OnestRegular"),
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () async {
                              currentProductCartCount =
                                  currentProductCartCount + 1;
                              await Constants.prefs
                                  .setInt("cart_count", badgeCount! + 1);
                              badgeCount = Constants.prefs.getInt("cart_count");
                              print("my ++,,,$badgeCount");
                              setState(() {});
                            },
                            icon: Icon(
                              size: 15,
                              Icons.add,
                              color: whiteColor,
                            ))
                      ],
                    ),
                  ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CommonCarousel(
            onchangedFun: (index, res) {
              setState(() {
                carouselIndex = index;
              });
            },
            currentIndex: carouselIndex,
          ),
          const SpaceHeightWidget(height: 30),
          const ProductAmountDetailsWidget(
            // retialPrice: "1500",
            // memberPrice: "1450",
            cv: "",
            productCode: "D1MR002",
            title: "D1 Advance Scalar Energized Flask",
          ),
          const SpaceHeightWidget(height: 10),
          const CommonDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: greenColor,
                  radius: 13,
                  child: Icon(
                    Icons.done,
                    color: whiteColor,
                    size: 19,
                  ),
                ),
                const SpaceWidthWidget(width: 10),
                const Text(
                  "Stock status: In stock",
                  style: TextStyle(fontFamily: "OnestRegular"),
                )
              ],
            ),
          ),
          const CommonDivider(),
          const SpaceHeightWidget(height: 15),

          for (int i = 0; i < 3; i++)
            Column(
              children: [
                ExpansionTile(
                  textColor: lightDarKBlue,
                  // collapsedBackgroundColor: redColor,
                  title: Text(
                    i == 0
                        ? "WHAT IS IT"
                        : i == 1
                            ? "Overview"
                            : "Description",
                    style: const TextStyle(
                        fontFamily: "OnestSemiBold", fontSize: 14),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: lightDarKBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: const Text(
                            "ldkjflksjf fjsdlkfjls klkjflsjf kdlfkjadk kdfnslka"),
                      ),
                    )
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
          const SpaceHeightWidget(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 13),
                ))
              ],
            ),
          ),
          const SpaceHeightWidget(height: 15),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Similar Products",
              style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 16),
            ),
          ),
          SizedBox(
            height: (2 / 2) * 290,
            child: GridView.builder(
                physics:
                    const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                itemBuilder: (context, i) {
                  return PromotionItemWidget(
                    onTapFun: () {
                      Get.to(() => const ProductDetailsScreen(
                            from: "similarProducts",
                          ));
                    },
                    amountColor: darkBlue,
                    imagePath: i == 0
                        ? "assets/images/Product 1-1.jpg"
                        : "assets/images/Product 1-3.jpg",
                    itemName: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA",
                    amount: "2465",
                    memberAmount: "",
                    exclusiveProduct: false,
                  );
                }),
          ),

          const SpaceHeightWidget(height: 65),
        ]),
      ),
    );
  }
}
