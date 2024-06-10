import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'button_shape.dart';

class MyGenealogy extends StatefulWidget {
  const MyGenealogy({super.key});

  @override
  State<MyGenealogy> createState() => _MyGenealogyState();
}

class _MyGenealogyState extends State<MyGenealogy> {
  List data = [
    {"active": true, "type": "male", "id": "DESTINA1"},
    {"active": true, "type": "female", "id": "DESTINA2"},
    {"active": true, "type": "business", "id": "DESTINA3"},
    {"active": true, "type": "male", "id": "DESTINA4"},
    {"active": true, "type": "female", "id": "DESTINA5"},
    {"active": true, "type": "business", "id": "DESTINA6"},
    {"active": false, "type": "male", "id": "DESTINA7"},
    {"active": false, "type": "female", "id": "DESTINA8"},
    {"active": false, "type": "business", "id": "DESTINA9"},
  ];
  ScrollController leftScrollController = ScrollController();
  ScrollController rightScrollController = ScrollController();
  final MainController _datacontroller = Get.put(MainController());
  int? selectedInt;
  dynamic userid;
  @override
  void initState() {
    super.initState();
    userid = Constants.prefs.getString("user_id");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "UserId": userid,
      "Pwd": Constants.prefs.getString("password"),
      "TreeViewIDno": Constants.prefs.getString("user_id")
    };
    _datacontroller.getGenealogyData(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Genealogy View", backNavigation: true),
      body: Obx(() {
        return _datacontroller.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(children: [
                
                  const SpaceHeightWidget(height: 15),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/active_male.png",
                        height: 55,
                      ),
                      Text(
                        userid.toString().toUpperCase(),
                        style: const TextStyle(
                            fontFamily: "OnestRegular", fontSize: 11),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipPath(
                        clipper: HexagonalClipper(),
                        child: Container(
                          height: 30,
                          width: 130,
                          color: lightDarKBlue,
                          child: Center(
                              child: Text(
                            "LEFT TEAM",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 12,
                                color: whiteColor),
                          )),
                        ),
                      ),
                      Image.asset(
                        "assets/images/team_arrow.png",
                        height: 30,
                      ),
                      ClipPath(
                        clipper: HexagonalClipper(),
                        child: Container(
                          height: 30,
                          width: 130,
                          color: pinkColor,
                          child: Center(
                              child: Text(
                            "RIGHT TEAM",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 12,
                                color: whiteColor),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Divider(
                      color: middleBlackColor,
                      thickness: 2,
                    ),
                  ),
                  (_datacontroller.myGenelogoyListData.isEmpty)
                      ? const NotAvailableText(text: "No data found")
                      : Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 320,
                                  child: Scrollbar(
                                    scrollbarOrientation:
                                        ScrollbarOrientation.left,
                                    controller: leftScrollController,
                                    interactive: true,
                                    radius: const Radius.circular(15),
                                    trackVisibility: true,
                                    thumbVisibility: true,
                                    thickness: 7,
                                    child: SingleChildScrollView(
                                      controller: leftScrollController,
                                      child: Column(children: [
                                        for (int i = 0;
                                            i <
                                                _datacontroller
                                                    .myGenelogoyListData.length;
                                            i++)
                                          if (_datacontroller
                                                  .myGenelogoyListData[i]
                                                  .position ==
                                              "Left")
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    _datacontroller
                                                                .genealogyLoading
                                                                .value &&
                                                            selectedInt == i
                                                        ? SizedBox(
                                                            height: 70,
                                                            child: loader)
                                                        : GestureDetector(
                                                            behavior:
                                                                HitTestBehavior
                                                                    .translucent,
                                                            onTap: () async {
                                                              setState(() {
                                                                selectedInt = i;
                                                              });
                                                              Map bdata = {
                                                                "UserId": Constants
                                                                    .prefs
                                                                    .getString(
                                                                        "user_id"),
                                                                "Pwd": Constants
                                                                    .prefs
                                                                    .getString(
                                                                        "password"),
                                                                "TreeViewIDno":
                                                                    _datacontroller
                                                                        .myGenelogoyListData[
                                                                            i]
                                                                        .idno
                                                              };
                                                              await _datacontroller
                                                                  .getGenealogyPopupData(
                                                                      bdata);
                                                              Get.dialog(
                                                                  detialsDilog());

                                                              setState(() {
                                                                selectedInt =
                                                                    null;
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                CommonCachedNetworkImage(
                                                                  height: 70,
                                                                  imagePath:
                                                                      'https://admin.destina1.com/images/Genealogy/${_datacontroller.myGenelogoyListData[i].mStatus}.png',
                                                                ),
                                                                idTextStyle(
                                                                    _datacontroller
                                                                        .myGenelogoyListData[
                                                                            i]
                                                                        .idno)
                                                              ],
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                const SpaceHeightWidget(
                                                    height: 8)
                                              ],
                                            )
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SizedBox(
                                  height: 320,
                                  child: Scrollbar(
                                    scrollbarOrientation:
                                        ScrollbarOrientation.right,
                                    controller: rightScrollController,
                                    interactive: true,
                                    radius: const Radius.circular(15),
                                    trackVisibility: true,
                                    thumbVisibility: true,
                                    thickness: 7,
                                    child: SingleChildScrollView(
                                      controller: rightScrollController,
                                      child: Column(children: [
                                        for (int i = 0;
                                            i <
                                                _datacontroller
                                                    .myGenelogoyListData.length;
                                            i++)
                                          if (_datacontroller
                                                  .myGenelogoyListData[i]
                                                  .position ==
                                              "Right")
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    _datacontroller
                                                                .genealogyLoading
                                                                .value &&
                                                            selectedInt == i
                                                        ? SizedBox(
                                                            height: 70,
                                                            child: loader)
                                                        : GestureDetector(
                                                            behavior:
                                                                HitTestBehavior
                                                                    .translucent,
                                                            onTap: () async {
                                                              setState(() {
                                                                selectedInt = i;
                                                              });
                                                              Map bdata = {
                                                                "UserId": Constants
                                                                    .prefs
                                                                    .getString(
                                                                        "user_id"),
                                                                "Pwd": Constants
                                                                    .prefs
                                                                    .getString(
                                                                        "password"),
                                                                "TreeViewIDno":
                                                                    _datacontroller
                                                                        .myGenelogoyListData[
                                                                            i]
                                                                        .idno
                                                              };
                                                              await _datacontroller
                                                                  .getGenealogyPopupData(
                                                                      bdata);
                                                              Get.dialog(
                                                                  detialsDilog());

                                                              setState(() {
                                                                selectedInt =
                                                                    null;
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                CommonCachedNetworkImage(
                                                                  height: 70,
                                                                  imagePath:
                                                                      'https://admin.destina1.com/images/Genealogy/${_datacontroller.myGenelogoyListData[i].mStatus}.png',
                                                                ),
                                                                idTextStyle(
                                                                    _datacontroller
                                                                        .myGenelogoyListData[
                                                                            i]
                                                                        .idno)
                                                              ],
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                const SpaceHeightWidget(
                                                    height: 8)
                                              ],
                                            )
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  const SpaceHeightWidget(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 19,
                            ),
                            idTextStyle("CLICK ON IMAGE TO VIEW TREE"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeightWidget(height: 10),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/active_male.png",
                              height: 55,
                            ),
                            idTextStyle("ACTIVE MALE"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/inactive_male.png",
                              height: 55,
                            ),
                            idTextStyle("INACTIVE MALE"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/active_female.png",
                              height: 55,
                            ),
                            idTextStyle("ACTIVE FEMALE"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/inactive_female.png",
                              height: 55,
                            ),
                            idTextStyle("INACTIVE FEMALE"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/active_bussinessid.png",
                              height: 55,
                            ),
                            idTextStyle("BUSINESS ID"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/inactive_businessid.png",
                              height: 55,
                            ),
                            idTextStyle("INACTIVE BUSINESS ID"),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SpaceHeightWidget(height: 45)
                ]),
              );
      }),
    );
  }

  idTextStyle(String id) {
    return Text(
      id,
      style: const TextStyle(fontFamily: "OnestRegular", fontSize: 11),
    );
  }

  BoxDecoration dec = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: lightBlackColor.withOpacity(0.5)));
  Dialog detialsDilog() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: blackColor.withOpacity(0.8),
      child: StatefulBuilder(builder: (context, myState) {
        return Container(
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
                    IconButton(
                        onPressed: () {
                          Get.back();
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
                    const SpaceHeightWidget(height: 20),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const CommonTitle(
                                  titleName: "Member Details",
                                  size: 13,
                                ),
                                const SpaceHeightWidget(height: 5),
                                Container(
                                  width: 350,
                                  padding: const EdgeInsets.all(5),
                                  decoration: dec,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                          title: "Distributor Id",
                                          info: _datacontroller
                                              .geneologyPopupData
                                              .value
                                              .distributorId,
                                        ),
                                        ViewProfileWidget(
                                            title: "Full Name",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .fullName),
                                        ViewProfileWidget(
                                            title: "Join Date",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .joinDate),
                                        ViewProfileWidget(
                                            title: "Sponsor Id",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .sponsorId),
                                        ViewProfileWidget(
                                            title: "Package Name",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .packageNAme),
                                        ViewProfileWidget(
                                            title: "Rank Status",
                                            info: _datacontroller
                                                        .geneologyPopupData
                                                        .value
                                                        .rankstatus ==
                                                    "0"
                                                ? "----"
                                                : _datacontroller
                                                    .geneologyPopupData
                                                    .value
                                                    .rankstatus),
                                      ]),
                                ),
                              ],
                            ),
                            const SpaceWidthWidget(width: 15),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CommonTitle(
                                  titleName: "Team Count",
                                  size: 13,
                                ),
                                const SpaceHeightWidget(height: 5),
                                Container(
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  decoration: dec,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                            title: "Directs",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .directs),
                                        ViewProfileWidget(
                                            title: "Left Count",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .leftCount),
                                        ViewProfileWidget(
                                            title: "Right Count",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .rightCount),
                                        ViewProfileWidget(
                                            title: "Total Count",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .totalCount),
                                      ]),
                                ),
                              ],
                            ),
                            const SpaceWidthWidget(width: 15),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CommonTitle(
                                  titleName: "Accountable CV",
                                  size: 13,
                                ),
                                const SpaceHeightWidget(height: 5),
                                Container(
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  decoration: dec,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                            title: "Personal CV",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .personalCv),
                                        ViewProfileWidget(
                                            title: "Left CV",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .leftCv),
                                        ViewProfileWidget(
                                            title: "Right CV",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .rightCv),
                                        ViewProfileWidget(
                                            title: "Total CV",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .totalCv),
                                      ]),
                                ),
                              ],
                            ),
                            const SpaceWidthWidget(width: 15),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CommonTitle(
                                  titleName: "Carry Forward Details",
                                  size: 13,
                                ),
                                const SpaceHeightWidget(height: 5),
                                Container(
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  decoration: dec,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                            title: "Left CV",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .cfLeftCv),
                                        ViewProfileWidget(
                                            title: "Right CV",
                                            info: _datacontroller
                                                .geneologyPopupData
                                                .value
                                                .cfRightCv),
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        )),
                    const SpaceHeightWidget(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
