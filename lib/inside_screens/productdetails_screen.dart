import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'heroanimation_screen.dart';

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
  TextEditingController firstQtyController = TextEditingController();
  late YoutubePlayerController _ycontroller;
  List<TextEditingController> textEControllerList = [];
  dynamic uniqId;
  dynamic sessionId;
  final _fomkey = GlobalKey<FormState>();
  final _fomkey1 = GlobalKey<FormState>();
  bool showQtyErrorText = false;
  bool loading = false;
  List<String> pidList = [];
  final _focusNode1 = FocusNode();
  bool packageLoading = false;
  @override
  void initState() {
    super.initState();
    print("from...${widget.from}");
    firstQtyController.text = "1";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getData();
      if (Constants.prefs.getString("uniq_id") == null) {
        uniqId = generateRandomString(10);
        await Constants.prefs.setString("uniq_id", uniqId);
      } else {
        uniqId = Constants.prefs.getString("uniq_id");
      }
      if (Constants.prefs.getString("ss_id") == null) {
        sessionId = generateTimeStamp();
        await Constants.prefs.setString("ss_id", sessionId);
      } else {
        sessionId = Constants.prefs.getString("ss_id");
      }

      print("uniqid...$uniqId");
      print("sessionid..$sessionId");
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

  getPackageItemsData() async {
    print("my para...${widget.packageCode}....$uniqId...$sessionId");

    dynamic res = await productDetailsController.getProductPackageItems(
        productCode: widget.packageCode,
        uniqId: uniqId,
        sessionId: sessionId,
        quantity: firstQtyController.text);
    print("packages data...$res");
  }

  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _focusNode1.unfocus();
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: commonAppBar(
          backNavigation: true,
          title: widget.packageCode,
          // onTapFun: () {
          //   // Get.offAll(() => const BottomBarScreen());
          //   Get.back();
          // },
        ),
        bottomSheet: Obx(() {
          return productDetailsController.productDetails.value.available
              ? Form(
                  key: _fomkey1,
                  child: Container(
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
                          // MainAxisAlignment.center,
                          MainAxisAlignment.spaceBetween,
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
                        Row(
                          children: [
                            const Text("Quantity: "),
                            SizedBox(
                                width: 100,
                                // height: 35,
                                child: RegisterTextField(
                                  focusNode: _focusNode1,
                                  controller: firstQtyController,
                                  hintText: '',
                                  textInputType: TextInputType.number,
                                  validation: (val) {
                                    return null;

                                    // if (val!.isEmpty) {
                                    //   return "Enter Quantity";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                  labelText: '',
                                )),
                          ],
                        ),
                        packageLoading
                            ? loader
                            : SizedBox(
                                width: 110,
                                height: 35,
                                child: IconElevatedButton(
                                  onTapFun: () async {
                                    // if (widget.from == "register") {
                                    print("popup");
                                    // Get.defaultDialog();
                                    setState(() {
                                      packageLoading = true;
                                    });
                                    await getPackageItemsData();
                                    textEControllerList.clear();

                                    for (int i = 0;
                                        i <
                                            productDetailsController
                                                .packageDetails
                                                .value
                                                .getPkgItemsRpt
                                                .length;
                                        i++) {
                                      textEControllerList
                                          .add(TextEditingController());

                                      if (productDetailsController
                                              .packageDetails
                                              .value
                                              .getPkgItemsRpt[i]
                                              .compulsory ==
                                          "True") {
                                        textEControllerList[i].text =
                                            productDetailsController
                                                .packageDetails
                                                .value
                                                .getPkgItemsRpt[i]
                                                .qty;
                                      }
                                    }

                                    setState(() {
                                      packageLoading = false;
                                    });
                                    Get.dialog(PackageDilog(),
                                        barrierDismissible: false);
                                  },
                                  imagePath: 'assets/images/cart_icon.png',
                                  labelColor: whiteColor,
                                  buttonColor: blackColor,
                                  titile: "Add",
                                ),
                              )
                      ],
                    ),
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
                        if (carouselImages.isNotEmpty)
                          CommonCarousel(
                            onTapFun: () {
                              Get.to(() => HeroAnimationScreen(
                                    tagData: carouselImages[carouselIndex],
                                  ));
                            },
                            autoPlay: false,
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
                          productCode: productDetailsController
                              .productDetails.value.pcode,
                          title: productDetailsController
                              .productDetails.value.name,
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
                                      fontFamily: "OnestSemiBold",
                                      fontSize: 14),
                                ),
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        decoration: BoxDecoration(
                                            color:
                                                lightDarKBlue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: const EdgeInsets.all(10),
                                        width: double.infinity,
                                        child: HtmlWidget(
                                            productDetailsController
                                                .productDetails
                                                .value
                                                .tabcontent[i]
                                                .content),
                                      ))
                                ],
                              ),
                              const CommonDivider()
                            ],
                          ),
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
                                      fontFamily: "OnestSemiBold",
                                      fontSize: 16),
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i <
                                      productDetailsController.productDetails
                                          .value.similarProducts.length;
                                  i++)
                                SizedBox(
                                  width: 150,
                                  child: PromotionItemWidget(
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
                                    exclusiveProduct: false,
                                  ),
                                )
                            ],
                          ),
                        ),
                        const SpaceHeightWidget(height: 65),
                      ]),
                );
        }),
      ),
    );
  }

  Dialog PackageDilog() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: blackColor.withOpacity(0.8),
      child: StatefulBuilder(builder: (context, myState) {
        return Form(
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
                        productDetailsController.packageDetails.value.head,
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
                          text: productDetailsController
                              .packageDetails.value.maxQty,
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
                            dataRowMaxHeight: 60,
                            horizontalMargin: 0,
                            // dataRowMaxHeight: 100,
                            columnSpacing: 0,
                            border: TableBorder.all(
                                color: middleBlackColor.withOpacity(0.15)),
                            columns: [
                              DataColumn(
                                  label: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                      productDetailsController.packageDetails
                                          .value.getPkgItemsRpt.length;
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
                                      productDetailsController.packageDetails
                                          .value.getPkgItemsRpt[i].pcode,
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
                                      productDetailsController.packageDetails
                                          .value.getPkgItemsRpt[i].name,
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
                                      productDetailsController.packageDetails
                                          .value.getPkgItemsRpt[i].maxquan,
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
                                          readOnly: productDetailsController
                                                      .packageDetails
                                                      .value
                                                      .getPkgItemsRpt[i]
                                                      .compulsory ==
                                                  "True"
                                              ? true
                                              : false,
                                          focusNode: _focusNode,
                                          inputFormatter: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(2),
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
                                                int.parse(
                                                    productDetailsController
                                                        .packageDetails
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
                              "Your selected quantity total should be ${productDetailsController.packageDetails.value.maxQty}",
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
                                                i < textEControllerList.length;
                                                i++) {
                                              if (textEControllerList[i].text !=
                                                  "") {
                                                countQty = countQty +
                                                    int.parse(
                                                        textEControllerList[i]
                                                            .text);
                                                pidList.add(
                                                    "${productDetailsController.packageDetails.value.getPkgItemsRpt[i].pcode}@${textEControllerList[i].text}");
                                              }
                                            }

                                            if (countQty ==
                                                int.parse(
                                                    productDetailsController
                                                        .packageDetails
                                                        .value
                                                        .maxQty)) {
                                              myState(() {
                                                showQtyErrorText = false;
                                                loading = true;
                                              });

                                              print("add to car fun");
                                              Map parameters = {
                                                "Action": "addCartitems",
                                                "Pkid": widget.packageCode,
                                                "pid": pidList.join(":"),
                                                "uniqid": uniqId,
                                                "sessid": sessionId,
                                                "ipaddress": Constants.prefs
                                                    .getString("ip"),
                                                "sprno": "0",
                                                "prdtype": "Package",
                                                "Quantity":
                                                    firstQtyController.text
                                              };
                                              print(
                                                  "add to cart params...$parameters");
                                              dynamic res =
                                                  await MainController()
                                                      .getAddToCart(parameters);
                                              if (res['Msg']
                                                      .toString()
                                                      .toLowerCase() ==
                                                  "success") {
                                                // ignore: use_build_context_synchronously
                                                MotionToast.success(
                                                  title: const Text(
                                                      "Congartulations!"),
                                                  description: const Text(
                                                      "Products added successfully to your cart."),
                                                ).show(context);
                                              }
                                              Timer(const Duration(seconds: 1),
                                                  () {
                                                myState(() {
                                                  loading = false;
                                                });
                                                Get.back();

                                                Get.off(() => CartScreen(
                                                    from: widget.from));
                                              });
                                            } else {
                                              myState(() {
                                                showQtyErrorText = true;
                                              });
                                            }

                                            // await Constants.prefs.setInt("cart_count", 1);
                                            // Get.back();
                                            // Get.to(() => const EnrollPackageScreen());
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
        );
      }),
    );
  }
}
