import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../commons/colors.dart';
import 'customer_media.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  dynamic gval, reviewFilterVal = "";
  List<String> reviewDropDown = ["Top Reviews", "Most Recent"];
  String revDropDwnSelected = "Top Reviews";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Customer Reviews", backNavigation: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SpaceHeightWidget(height: 10),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                  titleName: "5 out of 5",
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
                  titleName: "712 global ratings",
                  size: 14,
                  fontFamily: "OnestRegular",
                  fontColor: lightDarKBlue,
                ),
                SizedBox(
                  height: 30,
                  child: CustomAutoWidthButton(
                      onTapFun: () {
                        Get.dialog(addReviewandRatingDialog());
                      },
                      title: "Write Review"),
                ),
              ],
            ),
            const SpaceHeightWidget(height: 10),
            for (int i = 5; i > 0; i--)
              RatingBarWidget(
                index: i,
                percentage: i * 10,
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
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: middleBlackColor.withOpacity(0.25)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTitle(
                      titleName: "Reviews with images",
                      size: 15,
                      fontFamily: "OnestSemiBold",
                      fontColor: blackColor,
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(() => const CustomerMediaScreen());
                      },
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: CommonCachedNetworkImage(
                                imagePath: "",
                                height: 60,
                              ),
                            )
                        ],
                      ),
                    )
                  ]),
            ),
            const SpaceHeightWidget(height: 10),
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
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            StatefulBuilder(builder: (context, myState) {
                          return ReviewFilter(
                              onchangeFun: (val) {
                                myState(() {
                                  reviewFilterVal = val;
                                });
                              },
                              rFVal: reviewFilterVal);
                        }),
                      );
                    },
                    title: "Filter",
                  ),
                ),
              ],
            ),
            const SpaceHeightWidget(height: 5),
            ViewRatingWidget(
              reviewVideoData: "",
              reviewImagesData: const ["", ""],
              reportFun: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      StatefulBuilder(builder: (context, myState) {
                    return RportWidget(
                        onchangeFun: (val) {
                          myState(() {
                            gval = val;
                          });
                        },
                        gVal: gval);
                  }),
                );
              },
            ),
            const SpaceHeightWidget(height: 5),
            ViewRatingWidget(
              reviewVideoData: "https://www.youtube.com/watch?v=wAMzvlCwTKU",
              reviewImagesData: const ["", ""],
              reportFun: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      StatefulBuilder(builder: (context, myState) {
                    return RportWidget(
                        onchangeFun: (val) {
                          myState(() {
                            gval = val;
                          });
                        },
                        gVal: gval);
                  }),
                );
              },
            ),
            const SpaceHeightWidget(height: 5),
            ViewRatingWidget(
              reviewImagesData: const [],
              reviewVideoData: "https://www.youtube.com/watch?v=wAMzvlCwTKU",
              reportFun: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      StatefulBuilder(builder: (context, myState) {
                    return RportWidget(
                        onchangeFun: (val) {
                          myState(() {
                            gval = val;
                          });
                        },
                        gVal: gval);
                  }),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }

  addReviewandRatingDialog() {
//     return Dialog(
//       backgroundColor: whiteColor,
//       child: Container(
//         decoration: BoxDecoration(
//             color: whiteColor, borderRadius: BorderRadius.circular(13)),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   color: darkBlue,
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(13),
//                       topRight: Radius.circular(13))),
//               alignment: Alignment.center,
//               width: double.infinity,
//               height: 45,
//               child: CommonTitle(
//                 titleName: "Add Review",
//                 size: 16,
//                 fontColor: whiteColor,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 key: _fomkey2,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const CommonTitle(
//                       titleName: "Your Name",
//                       size: 14,
//                     ),
//                     RegisterTextField(
//                       // inputFormatter: [FilteringTextInputFormatter.digitsOnly],
//                       controller: nameController,
//                       hintText: '',
//                       textInputType: TextInputType.name,
//                       onchangeFun: (val) {
//                         setState(() {});
//                       },
//                       validation: (val) {
//                         return null;
//                       },
//                       labelText: '',
//                     ),
//                     const CommonTitle(
//                       titleName: "Review",
//                       size: 14,
//                     ),
//                     AccountTextField(
//                       minLines: 3,
//                       onchangeFun: (val) {},
//                       outsideFun: (val) async {},
//                       textInputType: TextInputType.multiline,
//                       hintText: "",
//                       controller: reviewController,
//                       validation: (val) {
//                         if (val!.isEmpty) {
//                           return "Enter your review";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     const CommonTitle(
//                       titleName: "Rating",
//                       size: 14,
//                     ),
//                     RatingBar.builder(
//                       initialRating: 3,
//                       minRating: 1,
//                       direction: Axis.horizontal,
//                       allowHalfRating: false,
//                       itemCount: 5,
//                       itemSize: 25,
//                       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       itemBuilder: (context, _) => const Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (rating) {
//                         print(rating);
//                       },
//                     ),
//                     const SpaceHeightWidget(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                             height: 35,
//                             child: CustomAutoWidthButton(
//                                 onTapFun: () {
//                                   Get.back();
//                                 },
//                                 title: "Submit")),
//                       ],
//                     ),
//                     const SpaceHeightWidget(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
  }
}
