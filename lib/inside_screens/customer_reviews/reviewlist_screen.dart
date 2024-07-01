import 'dart:async';
import 'dart:io';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../commons/colors.dart';
import '../../controllers/main_controller.dart';
import 'customer_media.dart';
import 'writereview_screen.dart';

class ReviewListScreen extends StatefulWidget {
  final String pid;
  final String productImage;
  final String productName;
  const ReviewListScreen(
      {super.key,
      required this.pid,
      required this.productImage,
      required this.productName});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  dynamic reviewFilterVal = "";
  dynamic gval = "";
  List<String> reviewDropDown = ["Top Reviews", "Most Recent"];
  String revDropDwnSelected = "Top Reviews";
  final MainController _reviewDataController = Get.put(MainController());
  File? ima;
  dataFun() {
    Map bData = {
      "action": "Report",
      "Pid": widget.pid,
      "Name": revDropDwnSelected == "Top Reviews" ? "4" : "5",
      "Review": null,
      "Rating": null,
      "Images": null,
      "Video": null,
      "Session": null
    };
    _reviewDataController.getReviewData(bData, "init");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      dataFun();
      if (Constants.prefs.getString("ss_id") == null) {
        sessionId = generateTimeStamp();
        await Constants.prefs.setString("ss_id", sessionId);
      } else {
        sessionId = Constants.prefs.getString("ss_id");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Customer Reviews", backNavigation: true),
      body: Obx(() {
        return _reviewDataController.genealogyLoading.value
            ? SizedBox(height: 400, child: loader)
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeightWidget(height: 10),
                        Row(
                          children: [
                            RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: _reviewDataController
                                          .reviewData.value.avgRating !=
                                      ""
                                  ? double.parse(_reviewDataController
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
                              onRatingUpdate: (rating) {},
                            ),
                            const SpaceWidthWidget(width: 10),
                            CommonTitle(
                              titleName:
                                  "${double.parse(_reviewDataController.reviewData.value.avgRating).toDouble().toStringAsFixed(1)} out of 5",
                              size: 14,
                              fontFamily: "OnestRegular",
                              fontColor: lightDarKBlue,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTitle(
                              titleName:
                                  "${_reviewDataController.reviewData.value.totalRating} global ratings",
                              size: 14,
                              fontFamily: "OnestRegular",
                              fontColor: lightDarKBlue,
                            ),
                            SizedBox(
                              height: 30,
                              child: CustomAutoWidthButton(
                                  onTapFun: () {
                                    Get.to(() => WriteReviewScreen(
                                          pid: widget.pid,
                                        ));
                                  },
                                  title: "Write Review"),
                            ),
                          ],
                        ),
                        const SpaceHeightWidget(height: 10),
                        for (int i = 5; i > 0; i--)
                          RatingBarWidget(
                            index: i,
                            percentage: _reviewDataController.reviewData.value
                                .reviewReport2[i - 1].percentage,
                          ),
                        ExpansionTile(
                          shape: const Border(),
                          title: CommonTitle(
                            titleName: "How are ratings calculated?",
                            size: 14,
                            fontFamily: "OnestRegular",
                            fontColor: lightDarKBlue,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: CommonTitle(
                                titleName:
                                    "To calculate the overall star rating and percentage breakdown by star, we don't use a simple average. Instead, our system considers things like how recent a review is and if the reviewer bought the item on Destina 1. It also analyses reviews to verify trustworthiness.",
                                size: 14,
                                fontFamily: "OnestRegular",
                                fontColor: blackColor,
                              ),
                            ),
                          ],
                        ),
                        if (_reviewDataController
                                .reviewData.value.reviewReport3.isNotEmpty ||
                            _reviewDataController
                                .reviewData.value.reviewReport4.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: middleBlackColor.withOpacity(0.25)),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_reviewDataController.reviewData.value
                                      .reviewReport3.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonTitle(
                                          titleName: "Reviews with images",
                                          size: 15,
                                          fontFamily: "OnestSemiBold",
                                          fontColor: blackColor,
                                        ),
                                        ListTile(
                                          onTap: () {
                                            Get.to(() => CustomerMediaScreen(
                                                  videos: _reviewDataController
                                                      .reviewData
                                                      .value
                                                      .reviewReport4,
                                                  photos: _reviewDataController
                                                      .reviewData
                                                      .value
                                                      .reviewReport3,
                                                ));
                                          },
                                          trailing: const Icon(Icons
                                              .keyboard_arrow_right_rounded),
                                          contentPadding: EdgeInsets.zero,
                                          title: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        _reviewDataController
                                                            .reviewData
                                                            .value
                                                            .reviewReport3
                                                            .length;
                                                    i++)
                                                  if (i < 4)
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3),
                                                      child:
                                                          CommonCachedNetworkImage(
                                                        imagePath:
                                                            _reviewDataController
                                                                .reviewData
                                                                .value
                                                                .reviewReport3[
                                                                    i]
                                                                .image,
                                                        height: 60,
                                                      ),
                                                    )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (_reviewDataController.reviewData.value
                                          .reviewReport3.isEmpty &&
                                      _reviewDataController.reviewData.value
                                          .reviewReport4.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonTitle(
                                          titleName: "Reviews with Videos",
                                          size: 15,
                                          fontFamily: "OnestSemiBold",
                                          fontColor: blackColor,
                                        ),
                                        ListTile(
                                          onTap: () {
                                            Get.to(() => CustomerMediaScreen(
                                                  videos: _reviewDataController
                                                      .reviewData
                                                      .value
                                                      .reviewReport4,
                                                  photos: _reviewDataController
                                                      .reviewData
                                                      .value
                                                      .reviewReport3,
                                                ));
                                          },
                                          trailing: const Icon(Icons
                                              .keyboard_arrow_right_rounded),
                                          contentPadding: EdgeInsets.zero,
                                          title: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        _reviewDataController
                                                            .reviewData
                                                            .value
                                                            .reviewReport4
                                                            .length;
                                                    i++)
                                                  if (i < 4)
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3),
                                                      child: ReviewViWidget(
                                                        videoUrl:
                                                            _reviewDataController
                                                                .reviewData
                                                                .value
                                                                .reviewReport4[
                                                                    i]
                                                                .video,
                                                        videoImgHeight: 100,
                                                        videoImgWidth: 100,
                                                      ),
                                                    )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  const SpaceHeightWidget(height: 10),
                                ]),
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: ProfileDropDown(
                                value: revDropDwnSelected,
                                hintText: revDropDwnSelected,
                                onChangedFun: (val) {
                                  setState(() {
                                    revDropDwnSelected = val!;
                                  });
                                  dataFun();
                                },
                                items: reviewDropDown,
                                validationFun: (val) {
                                  return null;
                                },
                              ),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              height: 25,
                              child: CustomAutoWidthButton(
                                onTapFun: () {
                                  filterFun();
                                },
                                title: "Filter",
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeightWidget(height: 5),
                        for (int i = 0;
                            i <
                                _reviewDataController
                                    .reviewData.value.reviewReport1.length;
                            i++)
                          ViewRatingWidget(
                            productImage: widget.productImage,
                            productName: widget.productName,
                            helpfulfun: () {
                              helpfunFun(_reviewDataController
                                  .reviewData.value.reviewReport1[i].pId);
                            },
                            helpfulPersons: _reviewDataController
                                .reviewData.value.reviewReport1[i].helpful,
                            name: _reviewDataController
                                .reviewData.value.reviewReport1[i].name,
                            date: _reviewDataController
                                .reviewData.value.reviewReport1[i].dated,
                            rating: _reviewDataController
                                .reviewData.value.reviewReport1[i].rating,
                            review: _reviewDataController
                                .reviewData.value.reviewReport1[i].review,
                            reviewVideoData: _reviewDataController.reviewData
                                            .value.reviewReport1[i].video !=
                                        "" &&
                                    _reviewDataController.reviewData.value
                                            .reviewReport1[i].video !=
                                        "0"
                                ? _reviewDataController
                                    .reviewData.value.reviewReport1[i].videoUrl
                                : "",
                            reviewImagesData: [
                              for (int j = 0;
                                  j <
                                      _reviewDataController.reviewData.value
                                          .reviewReport3.length;
                                  j++)
                                if (_reviewDataController.reviewData.value
                                        .reviewReport1[i].pId ==
                                    _reviewDataController
                                        .reviewData.value.reviewReport3[j].pId)
                                  _reviewDataController
                                      .reviewData.value.reviewReport3[j].image
                            ],
                            // const ["", ""],
                            reportFun: () {
                              reportFun(_reviewDataController
                                  .reviewData.value.reviewReport1[i].pId);
                            },
                          ),
                        const SpaceHeightWidget(height: 5),
                      ]),
                ),
              );
      }),
    );
  }

  dynamic sessionId;

  helpfunFun(pid) {
    Map bdata = {
      "Action": "AddHelp",
      "Pid": pid,
      "Name": "",
      "Session": sessionId,
    };

    Map reviewDataParams = {
      "action": "Report",
      "Pid": widget.pid,
      "Name": null,
      "Review": null,
      "Rating": null,
      "Images": null,
      "Video": null,
      "Session": null
    };
    _reviewDataController.getHelpFulFun(bdata, reviewDataParams);
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
            _reviewDataController.getReviewReportingFun(params);

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

  filterFun() {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, myState) {
        return ReviewFilter(
          onchangeFun: (val) {
            myState(() {
              reviewFilterVal = val;
            });
          },
          rFVal: reviewFilterVal,
          applyFun: () {
            if (reviewFilterVal != "") {
              Map bData = {
                "action": "Report",
                "Pid": widget.pid,
                "Name": reviewFilterVal == "Image or video reviews only"
                    ? "1"
                    : reviewFilterVal == "Positive reviews"
                        ? "2"
                        : reviewFilterVal == "Critical reviews"
                            ? "3"
                            : "0",
                "Review": null,
                "Rating": null,
                "Images": null,
                "Video": null,
                "Session": null
              };
              _reviewDataController.getReviewData(bData, "init");
              Get.back();
            } else {
              CommonToast("Please select filter type");
            }
          },
        );
      }),
    );
  }
}
