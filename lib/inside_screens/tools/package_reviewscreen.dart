import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class PackageReviewScreen extends StatefulWidget {
  const PackageReviewScreen({super.key});

  @override
  State<PackageReviewScreen> createState() => _PackageReviewScreenState();
}

class _PackageReviewScreenState extends State<PackageReviewScreen> {
  final MainController _dataController = Get.put(MainController());
  List<String> packTypes = [
    "Retail Package",
    "Preferred Customer Package",
    "Signup Package",
    "Sales Package",
    "Upgrade Package",
    "Redemption Package"
  ];
  int selectedInd = 0;
  dynamic sessionId, actionType;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      dataFun("GetRevRetPackages");
      if (Constants.prefs.getString("ss_id") == null) {
        sessionId = generateTimeStamp();
        await Constants.prefs.setString("ss_id", sessionId);
      } else {
        sessionId = Constants.prefs.getString("ss_id");
      }
    });
  }

  dataFun(String actionType) {
    Map bData = {
      "Action": actionType,
      "CountryID": Constants.prefs.getString("country_id"),
      "MallName": Constants.prefs.getString("reg_id"),
    };
    _dataController.getPackageReviews(bData);
  }

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
                  for (int i = 0; i < packTypes.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 8),
                      child: selectedInd == i
                          ? SizedBox(
                              height: 30,
                              // width:
                              //    packTypes[i].toString(),
                              //.length == 5 ? 100 : 200,
                              child: CustomAutoWidthButton(
                                  onTapFun: () {}, title: packTypes[i]))
                          : SizedBox(
                              height: 30,
                              child: CommonOulineTextButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  onTapFun: () {
                                    setState(() {
                                      selectedInd = i;

                                      if (packTypes[i] == "Retail Package") {
                                        actionType = "GetRevRetPackages";
                                      } else if (packTypes[i] ==
                                          "Preferred Customer Package") {
                                        actionType = "GetRevPCPackages";
                                      } else if (packTypes[i] ==
                                          "Signup Package") {
                                        actionType = "GetRevMDiPackages";
                                      } else if (packTypes[i] ==
                                          "Sales Package") {
                                        actionType = "GetRevSalesPackages";
                                      } else if (packTypes[i] ==
                                          "Upgrade Package") {
                                        actionType = "GetRevUpgPackages";
                                      } else {
                                        actionType = "GetRevRedPackages";
                                      }
                                    });
                                    dataFun(actionType);
                                  },
                                  title: packTypes[i]),
                            ),
                    )
                ],
              ),
            ),
            const SpaceHeightWidget(height: 10),
            Obx(() {
              return _dataController.loading.value
                  ? loader
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.65),
                        itemBuilder: (context, i) {
                          return PackageReviewWidget(
                            imgPath:
                                "https://admin.destina1.com/admin/RetailImages/20151.jpg",
                            //  _dataController.packReviewList[i].pImage,
                            reviewTitle:
                                _dataController.packReviewList[i].revsts,
                            itemName: _dataController.packReviewList[i].pkname,
                            mrpRate: _dataController.packReviewList[i].mrp,
                            packagecode:
                                _dataController.packReviewList[i].pkcode,
                            reviewFun: () {
                              Get.dialog(
                                  reviewDialog(
                                    _dataController.packReviewList[i].pkcode,
                                    _dataController.packReviewList[i].pkid,
                                    _dataController.packReviewList[i].review,
                                  ),
                                  barrierDismissible: false);
                            },
                          );
                        },
                        itemCount: _dataController.packReviewList.length,
                      ),
                    );
            })
          ]),
        ));
  }

  final _fomkey = GlobalKey<FormState>();
  TextEditingController reviewController = TextEditingController();
  bool reviewLoad = false;
  reviewDialog(
    String packCode,
    String packId,
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
                            child: reviewLoad
                                ? loader
                                : CustomAutoWidthButton(
                                    onTapFun: () async {
                                      if (_fomkey.currentState!.validate()) {
                                        myState(() {
                                          reviewLoad = true;
                                        });
                                        Map bData = {
                                          "UserId": Constants.prefs
                                              .getString("user_id"),
                                          "Pwd": Constants.prefs
                                              .getString("password"),
                                          "Pkid": packId,
                                          "Review": reviewController.text,
                                          "Session": sessionId
                                        };
                                        dynamic res = await _dataController
                                            .getPackageReviewUpload(bData);
                                        if (res != null) {
                                          if (res['Msg'] == "SUCCESS") {
                                            CommonToastTrue(res['Message']);
                                          } else {
                                            CommonToast(res['Message']);
                                          }
                                        }
                                        myState(() {
                                          reviewLoad = false;
                                        });
                                        Get.back();
                                        dataFun(actionType);
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
