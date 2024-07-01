import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../heroanimation_screen.dart';
import 'upgrade_cartscreen.dart';

class UpgradeProductDetailsScreen extends StatefulWidget {
  final String packageCode;
  const UpgradeProductDetailsScreen({
    super.key,
    required this.packageCode,
  });

  @override
  State<UpgradeProductDetailsScreen> createState() =>
      _UpgradeProductDetailsScreenState();
}

class _UpgradeProductDetailsScreenState
    extends State<UpgradeProductDetailsScreen> {
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
    });
  }

  String? videoId;
  List<String> carouselImages = [];
  getData() async {
    Map parameters = {
      "action": "GetUpgSingleproductdata",
      "pcode": widget.packageCode,
      "country": Constants.prefs.getString("country_id")
    };
    dynamic res = await _dataController.getSalesProductDetails(parameters);
    if (res != null) {
      for (int i = 0; i < 4; i++) {
        if (i == 0) {
          carouselImages.add(res["img"]);
        } else {
          carouselImages.add(res["img$i"]);
        }
      }
    }
  }

  getPackageItemsData() async {
    Map parameters = {
      "pkgcode": widget.packageCode,
      "dtype": "Package",
      "qty": firstQtyController.text,
      "uniqid": uniqId,
      "sessid": sessionId,
      "Jointype": "Upgrade"
    };
    dynamic res = await _dataController.getSalesMallProductItems(parameters);
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: whiteColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                packageLoading
                    ? loader
                    : SizedBox(
                        // width: 150,
                        height: 35,
                        child: IconElevatedButton(
                          onTapFun: () async {
                           
                            setState(() {
                              packageLoading = true;
                            });
                            await getPackageItemsData();
                            textEControllerList.clear();

                            for (int i = 0;
                                i <
                                    _dataController.packageDetails.value
                                        .getPkgItemsRpt.length;
                                i++) {
                              textEControllerList.add(TextEditingController());

                              if (_dataController.packageDetails.value
                                      .getPkgItemsRpt[i].compulsory ==
                                  "True") {
                                textEControllerList[i].text = _dataController
                                    .packageDetails.value.getPkgItemsRpt[i].qty;
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
                          buttonColor: darkBlue,
                          titile: "Check Products",
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
                          units: "1",
                          qty: "1",
                          price: _dataController.saleProductDetails.value.mrp,
                          cv: _dataController.saleProductDetails.value.cv,
                          productCode:
                              _dataController.saleProductDetails.value.pkcode,
                          title:
                              _dataController.saleProductDetails.value.pkname,
                        ),
                        const SpaceHeightWidget(height: 10),
                        const CommonDivider(),
                        const SpaceHeightWidget(height: 15),
                        if (_dataController
                                .saleProductDetails.value.overviewRpt[0].info !=
                            "")
                          InfoDescOviewWidget(
                            title: "What It Is",
                            data: _dataController
                                .saleProductDetails.value.overviewRpt[0].info,
                          ),
                        if (_dataController.saleProductDetails.value
                                .overviewRpt[0].overview !=
                            "")
                          InfoDescOviewWidget(
                            title: "Overview",
                            data: _dataController.saleProductDetails.value
                                .overviewRpt[0].overview,
                          ),
                        if (_dataController.saleProductDetails.value
                                .overviewRpt[0].descrip !=
                            "")
                          InfoDescOviewWidget(
                            title: "Description",
                            data: _dataController.saleProductDetails.value
                                .overviewRpt[0].descrip,
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
        return SingleChildScrollView(
          child: Form(
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
                          _dataController.packageDetails.value.head,
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
                            text: _dataController.packageDetails.value.maxQty,
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
                              dataRowMaxHeight: 70,
                              horizontalMargin: 0,
                              columnSpacing: 0,
                              border: TableBorder.all(
                                  color: middleBlackColor.withOpacity(0.15)),
                              columns: [
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt.length;
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
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt[i].pcode,
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
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt[i].name,
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
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt[i].maxquan,
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
                                            readOnly: _dataController
                                                        .packageDetails
                                                        .value
                                                        .getPkgItemsRpt[i]
                                                        .compulsory ==
                                                    "True"
                                                ? true
                                                : false,
                                            inputFormatter: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  2),
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
                                                  int.parse(_dataController
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
                                "Your selected quantity total should be ${_dataController.packageDetails.value.maxQty}",
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
                                                  i <
                                                      textEControllerList
                                                          .length;
                                                  i++) {
                                                if (textEControllerList[i]
                                                        .text !=
                                                    "") {
                                                  countQty = countQty +
                                                      int.parse(
                                                          textEControllerList[i]
                                                              .text);
                                                  pidList.add(
                                                      "${_dataController.packageDetails.value.getPkgItemsRpt[i].pcode}*${textEControllerList[i].text}");
                                                }
                                              }

                                              if (countQty ==
                                                  int.parse(_dataController
                                                      .packageDetails
                                                      .value
                                                      .maxQty)) {
                                                myState(() {
                                                  showQtyErrorText = false;
                                                  loading = true;
                                                });

                                                Map parameters = {
                                                  "Pkid": widget.packageCode,
                                                  "pid": pidList.join(":"),
                                                  "uniqid": uniqId,
                                                  "sessid": sessionId,
                                                  "ipaddress": Constants.prefs
                                                      .getString("ip"),
                                                  "sprno": Constants.prefs
                                                      .getString("user_id"),
                                                  "prdtype": "Package",
                                                };

                                                dynamic res =
                                                    await MainController()
                                                        .getUpgradeMallAddToCart(
                                                            parameters);
                                                if (res['Msg']
                                                        .toString()
                                                        .toLowerCase() ==
                                                    "success") {
                                                  Timer(
                                                      const Duration(
                                                          seconds: 1), () {
                                                    if (mounted) {
                                                      myState(() {
                                                        loading = false;
                                                      });
                                                    }

                                                    Get.back();
                                                    Get.to(
                                                        () => UpgradeCartScreen(
                                                              packCode: widget
                                                                  .packageCode,
                                                            ));
                                                  });
                                                } else {
                                                  Timer(
                                                      const Duration(
                                                          seconds: 1), () {
                                                    if (mounted) {
                                                      myState(() {
                                                        loading = false;
                                                      });
                                                      Get.back();
                                                    }
                                                  });
                                                }
                                              } else {
                                                myState(() {
                                                  showQtyErrorText = true;
                                                });
                                              }
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
          ),
        );
      }),
    );
  }
}
