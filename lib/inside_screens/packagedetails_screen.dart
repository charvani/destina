import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../authentication_screens/enrollpackage_screen.dart';
import '../authentication_screens/sponsor_check_screen.dart';
import 'heroanimation_screen.dart';

class PackageDetailsScreen extends StatefulWidget {
  final String from;
  final String packageCode;
  final String? countryid;
  const PackageDetailsScreen(
      {super.key,
      required this.from,
      required this.packageCode,
      this.countryid});
  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  MainController packDetailsController = Get.put(MainController());
  int carouselIndex = 0;
  int currentProductCartCount = 0;
  int? badgeCount;
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

  getPackageItemsData() async {
    print("my para...${widget.packageCode}....$uniqId...$sessionId");

    dynamic res = await packDetailsController.getPacktPackageItems(
        productCode: widget.packageCode,
        uniqId: uniqId,
        sessionId: sessionId,
        dtype: "Package");

    print("packages data...$res");
  }

  getRegisterPackageData() async {
    Map parameters = {
      "Action": "GetPackdescr",
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
      "CountryID": widget.countryid,
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
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: lightBlackColor,
            toolbarHeight: 0,
            bottom: PreferredSize(
              preferredSize: const Size(1000, 50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                color: whiteColor,
                margin: const EdgeInsets.all(0),
                borderOnForeground: false,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListTile(
                      leading: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      title: Text(
                        widget.packageCode,
                        style: const TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 19),
                      )),
                ),
              ),
            )),
        bottomSheet: Obx(() {
          return packDetailsController.loading.value
              ? const SizedBox.shrink()
              : Container(
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
                              width: 150,
                              height: 35,
                              child: IconElevatedButton(
                                onTapFun: () async {
                                  // if (widget.from == "register") {
                                  print("popup");
                                  // Get.defaultDialog();
                                  if (mounted) {
                                    setState(() {
                                      packageLoading = true;
                                    });
                                  }

                                  await getPackageItemsData();
                                  textEControllerList.clear();

                                  for (int i = 0;
                                      i <
                                          packDetailsController
                                              .packPackageDetails
                                              .value
                                              .getPkgItemsRpt
                                              .length;
                                      i++) {
                                    textEControllerList
                                        .add(TextEditingController());

                                    if (packDetailsController
                                            .packPackageDetails
                                            .value
                                            .getPkgItemsRpt[i]
                                            .compulsory ==
                                        "True") {
                                      textEControllerList[i].text =
                                          packDetailsController
                                              .packPackageDetails
                                              .value
                                              .getPkgItemsRpt[i]
                                              .qty;
                                    }
                                  }
                                  if (mounted) {
                                    setState(() {
                                      packageLoading = false;
                                    });
                                  }

                                  Get.dialog(PackageDilog(),
                                      barrierDismissible: false);
                                },
                                imagePath: 'assets/images/cart_icon.png',
                                labelColor: whiteColor,
                                buttonColor: blackColor,
                                titile: "Add to Cart",
                              ),
                            )
                    ],
                  ),
                );
        }),
        body: Obx(() {
          return packDetailsController.loading.value || (carouselImages.isEmpty)
              ? loader
              : SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (carouselImages.isNotEmpty &&
                            carouselImages.length == 4)
                          CommonCarousel(
                            onTapFun: () {
                              Get.to(() => HeroAnimationScreen(
                                    tagData: carouselImages[carouselIndex],
                                  ));
                            },
                            autoPlay: false,
                            images: carouselImages,
                            onchangedFun: (index, res) {
                              if (mounted) {
                                setState(() {
                                  carouselIndex = index;
                                });
                              }
                            },
                            currentIndex: carouselIndex,
                          ),
                        const SpaceHeightWidget(height: 30),
                        ProductAmountDetailsWidget(
                          price: packDetailsController
                              .packageDetailsData.value.mrp,
                          cv: packDetailsController.packageDetailsData.value.cv,
                          productCode: packDetailsController
                              .packageDetailsData.value.pkcode,
                          title: packDetailsController
                              .packageDetailsData.value.pkname,
                        ),
                        const SpaceHeightWidget(height: 10),
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
                                      ? "What It Is"
                                      : i == 1
                                          ? "Overview"
                                          : "Description",
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
                                        child: HtmlWidget(i == 0
                                            ? packDetailsController
                                                .packageDetailsData.value.info
                                            : i == 1
                                                ? packDetailsController
                                                    .packageDetailsData
                                                    .value
                                                    .overview
                                                : packDetailsController
                                                    .packageDetailsData
                                                    .value
                                                    .desc),
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
                                "Destina 1 packages are satisfied with the guarantee",
                                style: TextStyle(
                                    fontFamily: "OnestSemiBold", fontSize: 13),
                              ))
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
        return SingleChildScrollView(
          child: Form(
            key: _fomkey,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blackColor.withOpacity(0.8)),
              child: SingleChildScrollView(
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
                            packDetailsController.packPackageDetails.value.head,
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
                              text: packDetailsController
                                  .packPackageDetails.value.maxQty,
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
                                dataRowMaxHeight: 70,
                                horizontalMargin: 0,
                                // dataRowMaxHeight: 100,
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
                                          packDetailsController.packPackageDetails
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
                                          packDetailsController.packPackageDetails
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
                                          packDetailsController.packPackageDetails
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
                                          packDetailsController.packPackageDetails
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
                                              readOnly: packDetailsController
                                                          .packPackageDetails
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
                                                        packDetailsController
                                                            .packPackageDetails
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
                                  "Your selected quantity total should be ${packDetailsController.packPackageDetails.value.maxQty}",
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
                                                        "${packDetailsController.packPackageDetails.value.getPkgItemsRpt[i].pcode}@${textEControllerList[i].text}");
                                                  }
                                                }
          
                                                if (countQty ==
                                                    int.parse(
                                                        packDetailsController
                                                            .packPackageDetails
                                                            .value
                                                            .maxQty)) {
                                                  if (mounted) {
                                                    myState(() {
                                                      showQtyErrorText = false;
                                                      loading = true;
                                                    });
                                                  }
          
                                                  print("add to packcart fun");
                                                  Map parameters = {
                                                    "Pkid": widget.packageCode,
                                                    "pid": pidList.join(":"),
                                                    "qty": "1",
                                                    "uniqid": uniqId,
                                                    "sessid": sessionId,
                                                    "ipaddress": Constants.prefs
                                                        .getString("ip"),
                                                    "sprno": "0",
                                                    "jointype": "Package",
                                                    "action": "addSGCartitems",
                                                  };
                                                  print(
                                                      "add to cart params...$parameters");
                                                  dynamic res =
                                                      await MainController()
                                                          .getPackAddToCart(
                                                              parameters);
                                                  if (res['Msg']
                                                          .toString()
                                                          .toLowerCase() ==
                                                      "success") {
                                                    // ignore: use_build_context_synchronously
                                                    MotionToast.success(
                                                      title: const Text(
                                                          "Congartulations!"),
                                                      description: const Text(
                                                          "Packages added successfully"),
                                                    ).show(context);
                                                    Map params = {
                                                      "rpt": "EnrollDetails",
                                                      "Cid": widget.countryid,
                                                      "mid": "0"
                                                    };
          
                                                    dynamic res =
                                                        await packDetailsController
                                                            .getEnrollPack(
                                                                params);
                                                    print("enroll res..$res");
                                                    print(
                                                        "***********${double.parse(res['EnrollPackageRpt'][0]['RenFee'])}");
                                                    if (mounted) {
                                                      myState(() {
                                                        loading = false;
                                                      });
                                                    }
                                                    Get.back();
                                                    if (double.parse(
                                                            res['EnrollPackageRpt']
                                                                [0]['RenFee']) >
                                                        0) {
                                                      Get.off(() =>
                                                          EnrollPackageScreen(
                                                            packageCoded: widget
                                                                .packageCode,
                                                            countyId:
                                                                widget.countryid!,
                                                          ));
                                                    } else {
                                                      Get.off(() =>
                                                          SponsorCheckScreen(
                                                            packageCode: widget
                                                                .packageCode,
                                                            countryId:
                                                                widget.countryid!,
                                                          ));
                                                    }
                                                  } else {
                                                    Timer(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      if (mounted) {
                                                        myState(() {
                                                          loading = false;
                                                        });
                                                      }
                                                    });
                                                  }
                                                } else {
                                                  if (mounted) {
                                                    myState(() {
                                                      showQtyErrorText = true;
                                                    });
                                                  }
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
          ),
        );
      }),
    );
  }
}
