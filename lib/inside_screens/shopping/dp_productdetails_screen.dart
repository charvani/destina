import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../customer_reviews/reviewlist_screen.dart';
import '../customer_reviews/writereview_screen.dart';
import '../heroanimation_screen.dart';
import 'dp_cartscreen.dart';

class DPProductDetailsScreen extends StatefulWidget {
  final String packageCode;
  const DPProductDetailsScreen({
    super.key,
    required this.packageCode,
  });

  @override
  State<DPProductDetailsScreen> createState() => _DPProductDetailsScreenState();
}

class _DPProductDetailsScreenState extends State<DPProductDetailsScreen> {
  final MainController _dataController = Get.put(MainController());
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
  bool packageLoading = false;

  @override
  void initState() {
    super.initState();
    print("krushna,,,");
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
    Map parameters = {
      "action": "GetDPSingleproductdata",
      "pcode": widget.packageCode,
      "country": Constants.prefs.getString("country_id")
    };
    dynamic res = await _dataController.getDPProductDetails(parameters);
    if (res != null) {
      print("product details data...$res");
      for (int i = 0; i < 4; i++) {
        if (i == 0) {
          carouselImages.add(res["img"]);
        } else {
          carouselImages.add(res["img$i"]);
        }
      }

      reviewDataFun(_dataController.dpProductdata.value.pkid.toString());

      print("carouselIMages length...${carouselImages.length}");
    }
  }

  reviewDataFun(String pid) async {
    print("at reviewDataFun");
    Map bData = {
      "action": "Report",
      "Pid": pid,
      "Name": null,
      "Review": null,
      "Rating": null,
      "Images": null,
      "Video": null,
      "Session": null
    };
    await _dataController.getReviewData(bData, "init");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        backNavigation: true,
        title: widget.packageCode,
        // onTapFun: () {
        //   // Get.offAll(() => const BottomBarScreen());
        //   Get.back();
        // },
      ),
      bottomSheet: Form(
        key: _fomkey1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: 90,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: darkBlue),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Quantity: "),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            firstQtyController.text =
                                (int.parse(firstQtyController.text) + 1)
                                    .toString();
                          });
                        },
                        child: const CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                      ),
                      const SpaceWidthWidget(width: 3),
                      SizedBox(
                          width: 60,
                          // height: 35,
                          child: RegisterTextField(
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: firstQtyController,
                            hintText: '',
                            textInputType: TextInputType.number,
                            onchangeFun: (val) {
                              setState(() {});
                            },
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
                      const SpaceWidthWidget(width: 3),
                      InkWell(
                        onTap: () {
                          // print(
                          //     "${double.parse(productDetailsController.productDetails.value.price.replaceAll(productDetailsController.productDetails.value.currency, "")) * int.parse(firstQtyController.text)}");
                          if (int.parse(firstQtyController.text) > 1) {
                            setState(() {
                              firstQtyController.text =
                                  (int.parse(firstQtyController.text) - 1)
                                      .toString();
                            });
                          }
                        },
                        child: const CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.remove,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  packageLoading
                      ? loader
                      : SizedBox(
                          // width: 150,
                          height: 35,
                          child: IconElevatedButton(
                            onTapFun: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (int.parse(firstQtyController.text) > 0) {
                                setState(() {
                                  packageLoading = true;
                                });
                                print("add to car fun");
                                Map parameters = {
                                  "Pkid": widget.packageCode,
                                  "pid": "1",
                                  "uniqid": uniqId,
                                  "sessid": sessionId,
                                  "ipaddress": Constants.prefs.getString("ip"),
                                  "sprno": Constants.prefs.getString("reg_id"),
                                  "prdtype": "Package",
                                  "qty": firstQtyController.text,
                                };
                                print("add to cart params...$parameters");
                                dynamic res = await MainController()
                                    .getDPMallAddToCart(parameters);

                                setState(() {
                                  packageLoading = false;
                                });
                                if (res != null) {
                                  print("res...$res");
                                  if (res['Msg'] == "SUCCESS") {
                                    Timer(const Duration(seconds: 1), () {
                                      Get.to(() => const DPmallCartScreen());
                                    });
                                  } else {
                                    CommonToast(res['Message']);
                                  }
                                }
                              } else {
                                CommonToast("Please enter valid quantity");
                              }
                            },
                            imagePath: 'assets/images/cart_icon.png',
                            labelColor: whiteColor,
                            buttonColor: blackColor,
                            titile: "Add to cart",
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        return _dataController.loading.value
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
                        qty: "1",
                        units: "1",
                        price: _dataController.dpProductdata.value.dpPrice,
                        cv: _dataController.dpProductdata.value.cv,
                        productCode: _dataController.dpProductdata.value.pkcode,
                        title: _dataController.dpProductdata.value.pkname,
                      ),
                      const PdfWidget(),
                      const SpaceHeightWidget(height: 10),
                      const CommonDivider(),
                      const SpaceHeightWidget(height: 15),
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
                              "Destina 1 packages are satisfied with the guarantee",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold", fontSize: 13),
                            ))
                          ],
                        ),
                      ),
                      const SpaceHeightWidget(height: 10),
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
                      ratingReviewWidget(),
                      const SpaceHeightWidget(height: 105),
                    ]),
              );
      }),
    );
  }

  dynamic gval = "";
  Widget ratingReviewWidget() {
    return ExpansionTile(
      initiallyExpanded: true,
      shape: const Border(),
      title: CommonTitle(
        titleName: "Customer Reviews",
        fontColor: darkBlue,
        size: 16,
      ),
      children: [
        _dataController.genealogyLoading.value
            ? loader
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating:
                              _dataController.reviewData.value.avgRating != ""
                                  ? double.parse(_dataController
                                          .reviewData.value.avgRating)
                                      .toDouble()
                                  : 0.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SpaceWidthWidget(width: 10),
                        CommonTitle(
                          titleName:
                              "${double.parse(_dataController.reviewData.value.avgRating).toDouble().toStringAsFixed(1)} out of 5",
                          size: 14,
                          fontFamily: "OnestRegular",
                          fontColor: lightDarKBlue,
                        ),
                      ],
                    ),
                    CommonTitle(
                      titleName:
                          "${_dataController.reviewData.value.totalRating} global ratings",
                      size: 14,
                      fontFamily: "OnestRegular",
                      fontColor: lightDarKBlue,
                    ),
                    const SpaceHeightWidget(height: 10),
                    for (int i = 0;
                        i <
                            _dataController
                                .reviewData.value.reviewReport1.length;
                        i++)
                      if (i < 2)
                        ViewRatingWidget(
                          productName:
                              _dataController.packageDetailsData.value.pkname,
                          productImage: carouselImages.isNotEmpty
                              ? carouselImages[0]
                              : "",
                          helpfulfun: () {
                            helpfunFun(
                                _dataController
                                    .reviewData.value.reviewReport1[i].pId,
                                _dataController.packageDetailsData.value.pkid);
                          },
                          helpfulPersons: _dataController
                              .reviewData.value.reviewReport1[i].helpful,
                          name: _dataController
                              .reviewData.value.reviewReport1[i].name,
                          date: _dataController
                              .reviewData.value.reviewReport1[i].dated,
                          rating: _dataController
                              .reviewData.value.reviewReport1[i].rating,
                          review: _dataController
                              .reviewData.value.reviewReport1[i].review,
                          reviewVideoData: _dataController.reviewData.value
                                      .reviewReport1[i].video !=
                                  ""
                              ? _dataController
                                  .reviewData.value.reviewReport1[i].videoUrl
                              : "",
                          reviewImagesData: [
                            for (int j = 0;
                                j <
                                    _dataController
                                        .reviewData.value.reviewReport3.length;
                                j++)
                              if (_dataController
                                      .reviewData.value.reviewReport1[i].pId ==
                                  _dataController
                                      .reviewData.value.reviewReport3[j].pId)
                                _dataController
                                    .reviewData.value.reviewReport3[j].image
                          ],
                          reportFun: () {
                            reportFun(_dataController
                                .reviewData.value.reviewReport1[i].pId);
                          },
                        ),
                    const SpaceHeightWidget(height: 15),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomAutoWidthButton(
                              onTapFun: () {
                                Get.to(() => WriteReviewScreen(
                                      pid: _dataController
                                          .packageDetailsData.value.pkid,
                                    ));
                              },
                              title: "Write Review"),
                          if (_dataController
                              .reviewData.value.reviewReport1.isNotEmpty)
                            CustomAutoWidthButton(
                                onTapFun: () {
                                  Get.to(() => ReviewListScreen(
                                      productName: _dataController
                                          .packageDetailsData.value.pkname,
                                      productImage: carouselImages.isNotEmpty
                                          ? carouselImages[0]
                                          : "",
                                      pid: _dataController
                                          .packageDetailsData.value.pkid));
                                },
                                title: "View All"),
                        ],
                      ),
                    ),
                    const SpaceHeightWidget(height: 25)
                  ],
                ),
              )
      ],
    );
  }

  helpfunFun(pid, productId) {
    Map bdata = {
      "Action": "AddHelp",
      "Pid": pid,
      "Name": "",
      "Session": "",
    };

    Map reviewDataParams = {
      "action": "Report",
      "Pid": productId,
      "Name": null,
      "Review": null,
      "Rating": null,
      "Images": null,
      "Video": null,
      "Session": null
    };
    _dataController.getHelpFulFun(bdata, reviewDataParams);
  }

  bool reportloading = false;
  reportFun(pid) {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, myState) {
        return RportWidget(
          submitLoading: reportloading,
          onchangeFun: (val) {
            myState(() {
              gval = val;
            });
            print("gValue.....$val");
          },
          gVal: gval,
          submitFun: () {
            myState(() {
              reportloading = true;
            });

            Map params = {
              "Action": "AddReport",
              "Pid": pid,
              "Name": gval == "Off topic"
                  ? "1"
                  : gval == "Inappropriate"
                      ? "2"
                      : gval == "Fake"
                          ? "3"
                          : "4",
              "Review": "",
              "Rating": "",
              "Images": "",
              "Video": "",
              "Session": "",
            };
            _dataController.getReviewReportingFun(params);

            Timer(const Duration(seconds: 1), () {
              myState(() {
                reportloading = false;
              });
              Get.back();
            });
          },
        );
      }),
    );
  }
}
