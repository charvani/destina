import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';

class PackageReviewScreen extends StatefulWidget {
  const PackageReviewScreen({super.key});

  @override
  State<PackageReviewScreen> createState() => _PackageReviewScreenState();
}

class _PackageReviewScreenState extends State<PackageReviewScreen> {
  List<String> faqTypes = [
    "Retail Package",
    "Preferred Customer Package",
    "Signup Package",
    "Sales Package",
    "Upgrade Package",
    "Redemption Package"
  ];
  int selectedInd = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Package Review", backNavigation: true),
      body: SingleChildScrollView(
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < faqTypes.length; i++)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    child: selectedInd == i
                        ? SizedBox(
                            height: 30,
                            // width:
                            //    faqTypes[i].toString(),
                            //.length == 5 ? 100 : 200,
                            child: CustomAutoWidthButton(
                                onTapFun: () {}, title: faqTypes[i]))
                        : SizedBox(
                            height: 30,
                            child: CommonOulineTextButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                onTapFun: () {
                                  setState(() {
                                    selectedInd = i;
                                  });
                                },
                                title: faqTypes[i]),
                          ),
                  )
              ],
            ),
          ),
          const SpaceHeightWidget(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.68),
                itemBuilder: (context, index) {
                  return PackageReviewWidget(
                    imgPath: "assets/images/logo.png",
                    reviewTitle: index.isEven ? 'Edit Review' : "Write Review",
                    itemName: 'D1MR001 (D1 ADVANCE SCALAR ENERGIZED PENDANT)',
                    mrpRate: 'RM 104.45',
                    packagecode: 'MYD1PR018',
                    reviewFun: () {
                      Get.dialog(reviewDialog(
                        'MYD1PR018',
                        index.isEven ? 'Edit Review' : " ",
                      ));
                    },
                  );
                }),
          )
        ]),
      ),
    );
  }

  final _fomkey = GlobalKey<FormState>();
  TextEditingController reviewController = TextEditingController();
  reviewDialog(
    String packCode,
    String reviewText,
  ) {
    reviewController.text = reviewText;
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
                          "REVIEW FOR PACKAGE $packCode",
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 12,
                              color: whiteColor),
                        ),
                        IconButton(
                            onPressed: () {
                              // if (loading != true) {
                              Get.back();
                              // }
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
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonTitle(
                            titleName: "Review",
                            size: 13,
                          ),
                          AccountTextField(
                            minLines: 3,
                            onchangeFun: (val) {},
                            outsideFun: (val) async {},
                            textInputType: TextInputType.multiline,
                            hintText: "",
                            controller: reviewController,
                            validation: (val) {
                              if (val!.isEmpty) {
                                return "Enter review";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SpaceHeightWidget(height: 10),
                          Container(
                            height: 35,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: CustomAutoWidthButton(
                                onTapFun: () {
                                  if (_fomkey.currentState!.validate()) {
                                    print("fffff");
                                  }
                                },
                                title: "Submit"),
                          ),
                          const SpaceHeightWidget(height: 10),
                        ]),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
