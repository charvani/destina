import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'member_productdetail_screen.dart';
import 'membermall_cartscreen.dart';
import 'membermall_upgradescreen.dart';

class MembershipMallScreen extends StatefulWidget {
  const MembershipMallScreen({
    super.key,
  });

  @override
  State<MembershipMallScreen> createState() => _MembershipMallScreenState();
}

class _MembershipMallScreenState extends State<MembershipMallScreen> {
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password, countryId, hidUid, uniqId, sessionId;
  @override
  void initState() {
    super.initState();
    // countOfCart = "0";
    userId = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");
    countryId = Constants.prefs.getString("country_id");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
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
      dataFun();
    });
  }

  dataFun() {
    Map bData = {
      "Action": "GetDMemberPackages",
      "CountryID": countryId,
      "MallName":
          // uniqId
          Constants.prefs.getString("reg_id")
    };

    _dataController.getMembershipMall(bData);
  }

  actionFun() async {
    Map bParams = {
      "Pkid": "",
      "pid": "",
      "Uniqid": uniqId,
      "sessid": sessionId,
      "ipaddress": Constants.prefs.get("ip"),
      "sprno": Constants.prefs.get("user_id"),
      "prdtype": "Package",
      "qty": "1",
      "country": Constants.prefs.get("country_id"),
    };
    dynamic res = await _dataController.getMemberMCheckOut(bParams);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        if (res['result'] == "Upgrade") {
          Get.to(() => MembermallUpgradeScreen(
                res: res,
              ));
        } else {
          Get.to(() => const MembermallCartScreen());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 8,
          centerTitle: false,
          title: Transform.translate(
            offset: const Offset(-30, 0),
            child: const Text(
              "Membership Order",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "OnestSemiBold",
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: InkWell(
                // behavior: HitTestBehavior.translucent,
                onTap: () {
                  print("ooooo");
                  Get.back();
                },
                child: const Icon(Icons.keyboard_arrow_left_rounded)),
          ),
          actions: [
            Obx(() {
              return _dataController.loading.value
                  ? SizedBox(height: 20, width: 20, child: loader)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        int.parse(_dataController.memberMallCartCount.value) > 0
                            ? Badge.count(
                                count: int.parse(
                                    _dataController.memberMallCartCount.value),
                                child: InkWell(
                                  onTap: () {
                                    if (_dataController
                                                .memberMallCartCount.value !=
                                            "0" &&
                                        _dataController
                                                .memberMallCartCount.value !=
                                            "") {
                                      // Get.to(() => const MembermallCartScreen());
                                      actionFun();
                                    } else {}
                                  },
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: appthemeColor,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  if (_dataController
                                              .memberMallCartCount.value !=
                                          "0" &&
                                      _dataController
                                              .memberMallCartCount.value !=
                                          "") {
                                    // Get.to(() => const MembermallCartScreen());
                                    actionFun();
                                  } else {}
                                },
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: appthemeColor,
                                ),
                              ),
                        const SpaceWidthWidget(width: 5),
                        Obx(() {
                          return _dataController.genealogyLoading.value
                              ? SizedBox(width: 50, child: loader)
                              : Container(
                                  height: 30,
                                  width: 118,
                                  padding: const EdgeInsets.only(right: 5),
                                  child: CustomAutoWidthButton(
                                      onTapFun: () async {
                                        if (_dataController.memberMallCartCount
                                                    .value !=
                                                "0" &&
                                            _dataController.memberMallCartCount
                                                    .value !=
                                                "") {
                                          actionFun();

                                          // dynamic res = await Get.to(
                                          //     () => const MembermallCheckoutScreen());
                                          // //  MembermallCartScreen());

                                          // if (res != null) {
                                          //   if (res[0] == true) {
                                          //     dataFun();
                                          //   }
                                        }
                                        // } else {}
                                      },
                                      title: "Checkout"));
                        })
                      ],
                    );
            })
          ]),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : _dataController.salesOrdersList.isEmpty
                ? const NotAvailableText(text: "No data found")
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                      itemBuilder: (context, i) {
                        return CategroyItemWidget(
                          onTapFun: () async {
                            dynamic res =
                                await Get.to(() => MemberProductDetailsScreen(
                                      packageCode: _dataController
                                          .salesOrdersList[i].pkcode,
                                    ));

                            if (res != null) {
                              if (res[0] == true) {
                                _dataController.memberMallCartCount.value =
                                    res[1] ?? "0";
                                setState(() {});
                              }
                            }
                          },
                          imagePath: _dataController.salesOrdersList[i].pImage,
                          titile: _dataController.salesOrdersList[i].pkname,
                          amount: _dataController.salesOrdersList[i].mrp,
                        );
                      },
                      itemCount: _dataController.salesOrdersList.length,
                    ),
                  );
      }),
    );
  }
}
