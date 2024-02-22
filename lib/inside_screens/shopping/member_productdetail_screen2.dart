import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../heroanimation_screen.dart';

class MemberProductDetailsScreen2 extends StatefulWidget {
  final String from;
  final String packageCode;
  final String fromPack;
  const MemberProductDetailsScreen2({
    super.key,
    required this.from,
    required this.packageCode,
    required this.fromPack,
  });

  @override
  State<MemberProductDetailsScreen2> createState() =>
      _MemberProductDetailsScreen2State();
}

class _MemberProductDetailsScreen2State
    extends State<MemberProductDetailsScreen2> {
  MainController packDetailsController = Get.put(MainController());

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
    print("from...${widget.from}");
    firstQtyController.text = "1";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getRegisterPackageData();
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
  getRegisterPackageData() async {
    Map parameters = {
      // "Action": "GetPackdescr",
      "Action": "GetNPackdescr",

      "pkid": "3",
      "Desc": widget.packageCode,
      "overview": " ",
      "info": "",
      "sessid": "",
      "sesuser": "",
      "PkImg1": "",
      "PkImg2": "",
      "PkImg3": "",
      "PkImg4": "",
      "CountryID": Constants.prefs.getString("country_id"),
      "MallName": widget.packageCode
    };

    dynamic res = await packDetailsController.getPackageDetails(
      parameters,
    );
    for (int i = 0; i < 4; i++) {
      if (i == 0) {
        carouselImages.add(packDetailsController.packageDetailsData.value.img);
      } else if (i == 1) {
        carouselImages.add(packDetailsController.packageDetailsData.value.img1);
      } else if (i == 2) {
        carouselImages.add(packDetailsController.packageDetailsData.value.img2);
      } else {
        carouselImages.add(packDetailsController.packageDetailsData.value.img3);
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Scaffold(
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
            padding: const EdgeInsets.fromLTRB(15, 5, 5, 0),
            // margin: const EdgeInsets.only(bottom: 1),
            height: 90,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: darkBlue),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: whiteColor,
            ),
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
                            // print(
                            //     "${double.parse(packDetailsController.productDetails.value.price.replaceAll(packDetailsController.productDetails.value.currency, "")) * int.parse(firstQtyController.text)}");
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
                              },
                              labelText: '',
                            )),
                        const SpaceWidthWidget(width: 3),
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
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: packageLoading
                          ? loader
                          : IconElevatedButton(
                              onTapFun: () async {
                                FocusManager.instance.primaryFocus?.unfocus();

                                setState(() {
                                  packageLoading = true;
                                });
                                // this register add to cart fun
                                print("add to car fun");
                                Map parameters = {
                                  "action": "addMECartitems",
                                  // "addSGCartitems",
                                  "Pkid": widget.packageCode,
                                  "Country":
                                      Constants.prefs.getString("country_id"),
                                  "Uniqid": uniqId,
                                  "sessid": sessionId,
                                  "ipaddress": Constants.prefs.getString("ip"),
                                  "sprno": Constants.prefs.get("reg_id"),
                                  "Quantity": firstQtyController.text
                                };
                                print("add to cart params...$parameters");
                                dynamic res = await MainController()
                                    .getRegPackAddToCart(parameters);

                                if (res['Msg'].toString().toLowerCase() ==
                                    "success") {
                                  print("res....$res");
                                  setState(() {
                                    packageLoading = false;
                                  });
                                  Timer(const Duration(seconds: 1), () {
                                    // Get.back(result: [true, res['Cnt']]);
                                    Get.back(result: [
                                      true,
                                      int.parse(packDetailsController
                                              .memberMallCartCount.value) +
                                          1
                                    ]);
                                  });
                                } else {
                                  Timer(const Duration(seconds: 1), () {
                                    CommonToast(res['Message']);
                                    Get.back();
                                  });
                                  setState(() {
                                    packageLoading = false;
                                  });
                                }
                                /*
                                //existed add to cart fun
                                Map parameters = {
                                  "Pkid": widget.packageCode,
                                  "pid": pidList.join(":"),
                                  "uniqid": uniqId,
                                  "sessid": sessionId,
                                  "ipaddress": Constants.prefs.getString("ip"),
                                  "sprno": Constants.prefs.getString("user_id"),
                                  "prdtype": "Package",
                                  "qty": firstQtyController.text,
                                  "country":
                                      Constants.prefs.getString("country_id"),
                                };
                                print("add to cart params...$parameters");
                                dynamic res = await MainController()
                                    .getMemberMallAddToCart(parameters);
                                if (res['Msg'].toString().toLowerCase() ==
                                    "success") {
                                  Timer(const Duration(seconds: 1), () {
                                    Get.back();
                                    Get.back(result: [true, res['Cnt']]);
                                  });
                                } else {
                                  Timer(const Duration(seconds: 1), () {
                                    CommonToast(res['Message']);
                                    Get.back();
                                  });
                                }
                                setState(() {
                                  packageLoading = false;
                                }); */
                              },
                              imagePath: 'assets/images/cart_icon.png',
                              labelColor: whiteColor,
                              buttonColor: blackColor,
                              titile: "Add to Cart",
                            ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Obx(() {
          return packDetailsController.loading.value
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
                          units: "1",
                          qty: "1",
                          price: packDetailsController
                              .packageDetailsData.value.mrp,
                          cv: packDetailsController.packageDetailsData.value.cv,
                          productCode: packDetailsController
                              .packageDetailsData.value.pkcode,
                          title: packDetailsController
                              .packageDetailsData.value.pkname,
                        ),
                        const PdfWidget(),
                        if (widget.fromPack == "Kritalia")
                          kritaliaWidget(packDetailsController
                              .packageDetailsData.value.pkname),
                        const SpaceHeightWidget(height: 15),
                        if (packDetailsController
                                    .packageDetailsData.value.pkname ==
                                "UNIWAVE PENDENT" ||
                            packDetailsController
                                    .packageDetailsData.value.pkname ==
                                "UNIWAVE PENDANT")
                          pendentWidget(),
                        if (packDetailsController.packageDetailsData.value.pkname == "UNIWAVE FLASK" ||
                            packDetailsController
                                    .packageDetailsData.value.pkname ==
                                "UNIWAVE STICK" ||
                            packDetailsController
                                    .packageDetailsData.value.pkname ==
                                "UNIWAVE FILTER")
                          flaskWidget(),
                        if (packDetailsController
                                .packageDetailsData.value.pkname ==
                            "UNIWAVE SCALARVIA")
                          scalarviaWidget(),
                        if (packDetailsController
                                .packageDetailsData.value.pkname ==
                            "UNIWAVE INSTANT COFFEE")
                          coffeeWidget(),
                        if (packDetailsController
                                    .packageDetailsData.value.pkname ==
                                "UNIWAVE BIOMATRIX SHIELD" ||
                            packDetailsController
                                    .packageDetailsData.value.pkname ==
                                "UNIWAVE BIO MATRIX SHIELD")
                          biomatrixWidget(),
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
                        const SpaceHeightWidget(height: 115),
                      ]),
                );
        }),
      ),
    );
  }
}
