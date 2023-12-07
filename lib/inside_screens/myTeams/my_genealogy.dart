import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: "Genealogy View For Destina1int", backNavigation: true),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 60,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CommonFormFieldwidget(
                    hintText: "Search",
                    onChangeFun: (val) {
                      print("vall...$val");
                    },
                    prefixIcon: Icon(
                      FeatherIcons.search,
                      size: 18,
                      color: blackColor.withOpacity(0.3),
                    ),
                  ),
                ),
                const SpaceWidthWidget(width: 20),
                Expanded(
                  child:
                      CustomElevatedButton(onTapFun: () {}, title: "View Tree"),
                )
              ],
            ),
          ),
          const SpaceHeightWidget(height: 10),
          Column(
            children: [
              Image.asset(
                "assets/images/active_male.png",
                height: 55,
              ),
              const Text(
                "DESTINA1INT",
                style: TextStyle(fontFamily: "OnestRegular", fontSize: 11),
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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 320,
                    child: Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.left,
                      controller: leftScrollController,
                      // interactive: true,
                      radius: const Radius.circular(15),
                      trackVisibility: true,
                      thumbVisibility: true,
                      thickness: 7,
                      child: SingleChildScrollView(
                        // controller: ,
                        child: Column(children: [
                          for (int i = 0; i < data.length; i++)
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Get.dialog(detialsDilog());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (data[i]['type'] == "male")
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/arrow_right.png",
                                          color: data[i]['active'] == false
                                              ? middleBlackColor
                                              : whiteColor,
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              (data[i]['active'] == true)
                                                  ? "assets/images/active_male.png"
                                                  : "assets/images/inactive_male.png",
                                              height: 55,
                                            ),
                                            idTextStyle(data[i]['id'])
                                          ],
                                        ),
                                      ],
                                    ),
                                  if (data[i]['type'] == "female")
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/arrow_right.png",
                                          color: data[i]['active'] == false
                                              ? middleBlackColor
                                              : whiteColor,
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              data[i]['active'] == true
                                                  ? "assets/images/active_female.png"
                                                  : "assets/images/inactive_female.png",
                                              height: 55,
                                            ),
                                            idTextStyle(data[i]['id'])
                                          ],
                                        ),
                                      ],
                                    ),
                                  if (data[i]['type'] == "business")
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/arrow_right.png",
                                          color: data[i]['active'] == false
                                              ? middleBlackColor
                                              : whiteColor,
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              data[i]['active'] == true
                                                  ? "assets/images/active_bussinessid.png"
                                                  : "assets/images/inactive_businessid.png",
                                              height: 55,
                                            ),
                                            idTextStyle(data[i]['id'])
                                          ],
                                        ),
                                      ],
                                    ),
                                  const SpaceHeightWidget(height: 8)
                                ],
                              ),
                            )
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  height: 320,
                  child: Scrollbar(
                    controller: rightScrollController,
                    // interactive: true,
                    radius: const Radius.circular(15),
                    trackVisibility: true,
                    thumbVisibility: true,
                    thickness: 7,
                    child: ListView.builder(
                        controller: rightScrollController,
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Get.dialog(detialsDilog());
                            },
                            child: Column(
                              children: [
                                if (data[i]['type'] == "male")
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/arrow_right.png",
                                        color: data[i]['active'] == false
                                            ? middleBlackColor
                                            : whiteColor,
                                        height: 20,
                                      ),
                                      Image.asset(
                                        (data[i]['active'] == true)
                                            ? "assets/images/active_male.png"
                                            : "assets/images/inactive_male.png",
                                        height: 55,
                                      ),
                                    ],
                                  ),
                                if (data[i]['type'] == "female")
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/arrow_right.png",
                                        color: data[i]['active'] == false
                                            ? middleBlackColor
                                            : whiteColor,
                                        height: 20,
                                      ),
                                      Image.asset(
                                        data[i]['active'] == true
                                            ? "assets/images/active_female.png"
                                            : "assets/images/inactive_female.png",
                                        height: 55,
                                      ),
                                    ],
                                  ),
                                if (data[i]['type'] == "business")
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/arrow_right.png",
                                        color: data[i]['active'] == false
                                            ? middleBlackColor
                                            : whiteColor,
                                        height: 20,
                                      ),
                                      Image.asset(
                                        data[i]['active'] == true
                                            ? "assets/images/active_bussinessid.png"
                                            : "assets/images/inactive_businessid.png",
                                        height: 55,
                                      ),
                                    ],
                                  ),
                                idTextStyle(data[i]['id'])
                              ],
                            ),
                          );
                        }),
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
      ),
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
                                  width: 250,
                                  padding: const EdgeInsets.all(5),
                                  decoration: dec,
                                  child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                            title: "Distributor Id",
                                            info: "DestinaInt123"),
                                        ViewProfileWidget(
                                            title: "Full Name",
                                            info: "Destina@12"),
                                        ViewProfileWidget(
                                            title: "Join Date",
                                            info: "12-jan-2020"),
                                        ViewProfileWidget(
                                            title: "Sponsor Id",
                                            info: "Destina test"),
                                        ViewProfileWidget(
                                            title: "Package Name",
                                            info: "Preffered Customer"),
                                        ViewProfileWidget(
                                            title: "Rank Status", info: "---"),
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
                                  child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                            title: "Directs", info: "0"),
                                        ViewProfileWidget(
                                            title: "Left Count", info: "0"),
                                        ViewProfileWidget(
                                            title: "Right Count", info: "0"),
                                        ViewProfileWidget(
                                            title: "Total Count", info: "0"),
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
                                  child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                            title: "Personal CV", info: "0"),
                                        ViewProfileWidget(
                                            title: "Left CV", info: "0"),
                                        ViewProfileWidget(
                                            title: "Right CV", info: "0"),
                                        ViewProfileWidget(
                                            title: "Total CV", info: "0"),
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
                                  child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ViewProfileWidget(
                                            title: "Left CV", info: "0"),
                                        ViewProfileWidget(
                                            title: "Right CV", info: "0"),
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
