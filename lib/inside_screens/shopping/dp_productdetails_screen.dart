import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  final _focusNode1 = FocusNode();
  bool packageLoading = false;

  @override
  void initState() {
    super.initState();
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

      print("carouselIMages length...${carouselImages.length}");
    }
  }

  final _focusNode = FocusNode();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("Quantity: "),
                  SizedBox(
                      width: 50,
                      // height: 35,
                      child: RegisterTextField(
                        controller: firstQtyController,
                        hintText: '',
                        textInputType: TextInputType.number,
                        validation: (val) {
                          return null;
                        },
                        labelText: '',
                      )),
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
                        price: _dataController.dpProductdata.value.dpPrice,
                        cv: _dataController.dpProductdata.value.cv,
                        productCode: _dataController.dpProductdata.value.pkcode,
                        title: _dataController.dpProductdata.value.pkname,
                      ),
                      const SpaceHeightWidget(height: 10),
                      const CommonDivider(),
                      const SpaceHeightWidget(height: 15),
                      // for (int i = 0; i < 3; i++)
                      //   Column(
                      //     children: [
                      //       ExpansionTile(
                      //         textColor: lightDarKBlue,
                      //         // collapsedBackgroundColor: redColor,
                      //         title: Text(
                      //           i == 0
                      //               ? "What It Is"
                      //               : i == 1
                      //                   ? "Overview"
                      //                   : "Description",
                      //           style: const TextStyle(
                      //               fontFamily: "OnestSemiBold", fontSize: 14),
                      //         ),
                      //         children: [
                      //           // if (_dataController.dpProductdata.value
                      //           //     .overviewRpt.isNotEmpty)
                      //           Padding(
                      //               padding: const EdgeInsets.only(bottom: 10),
                      //               child: Container(
                      //                 margin: const EdgeInsets.only(
                      //                     right: 10, left: 10),
                      //                 decoration: BoxDecoration(
                      //                     color: lightDarKBlue.withOpacity(0.1),
                      //                     borderRadius:
                      //                         BorderRadius.circular(5)),
                      //                 padding: const EdgeInsets.all(10),
                      //                 width: double.infinity,
                      //                 child: const HtmlWidget(""
                      //                     // i == 0
                      //                     //   ? _dataController
                      //                     //       .dpProductdata
                      //                     //       .value
                      //                     //       .overviewRpt[0]
                      //                     //       .info
                      //                     //   : i == 1
                      //                     //       ? _dataController
                      //                     //           .dpProductdata
                      //                     //           .value
                      //                     //           .overviewRpt[0]
                      //                     //           .overview
                      //                     //       : _dataController
                      //                     //           .dpProductdata
                      //                     //           .value
                      //                     //           .overviewRpt[0]
                      //                     //           .descrip
                      //                     ),
                      //               ))
                      //         ],
                      //       ),
                      //       const CommonDivider()
                      //     ],
                      //   ),
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
                      const SpaceHeightWidget(height: 65),
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
                      const SpaceHeightWidget(height: 65),
                    ]),
              );
      }),
    );
  }
}
