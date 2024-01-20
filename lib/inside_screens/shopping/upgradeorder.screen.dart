import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'sales_productdetailsscreen.dart';
import 'upgrade_productdetails_screen.dart';

class UpgradeOrderScreen extends StatefulWidget {
  const UpgradeOrderScreen({
    super.key,
  });

  @override
  State<UpgradeOrderScreen> createState() => _UpgradeOrderScreenState();
}

class _UpgradeOrderScreenState extends State<UpgradeOrderScreen> {
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password, countryId, hidUid, countOfCart, uniqId;
  @override
  void initState() {
    super.initState();
    countOfCart = "0";
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
      dataFun();
    });
  }

  dataFun() async {
    Map bData = {
      "Action": "GetUpgPackages",
      "CountryID": Constants.prefs.getString("reg_id"),
      "MallName": ""
    };

    dynamic res = await _dataController.getUpgradeMall(bData);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        setState(() {
          countOfCart = res['Cnt'] ?? "0";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 8,
          title: const Text(
            "Upgrade Order",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "OnestSemiBold",
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
                // behavior: HitTestBehavior.translucent,
                onTap: () {
                  print("ooooo");
                  Get.back();
                },
                child: const Icon(Icons.keyboard_arrow_left_rounded)),
          ),
          actions: const [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     int.parse(countOfCart) > 0
            //         ? Badge.count(
            //             count: int.parse(countOfCart),
            //             child: InkWell(
            //               onTap: () {
            //                 if (countOfCart != "0" && countOfCart != "") {
            //                   Get.to(() => const SalesmallCartScreen());
            //                 } else {}
            //               },
            //               child: Icon(
            //                 Icons.shopping_cart,
            //                 color: appthemeColor,
            //               ),
            //             ),
            //           )
            //         : InkWell(
            //             onTap: () {
            //               if (countOfCart != "0" && countOfCart != "") {
            //                 Get.to(() => const SalesmallCartScreen());
            //               } else {}
            //             },
            //             child: Icon(
            //               Icons.shopping_cart,
            //               color: appthemeColor,
            //             ),
            //           ),
            //     const SpaceWidthWidget(width: 5),
            //     Container(
            //         height: 30,
            //         width: 118,
            //         padding: const EdgeInsets.only(right: 5),
            //         child: CustomAutoWidthButton(
            //             onTapFun: () async {
            //               if (countOfCart != "0" && countOfCart != "") {
            //                 dynamic res =
            //                     await Get.to(() => const SalesmallCartScreen());

            //                 if (res != null) {
            //                   if (res[0] == true) {
            //                     dataFun();
            //                   }
            //                 }
            //               } else {}
            //             },
            //             title: "Checkout"))
            //   ],
            // )
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
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                      itemBuilder: (context, i) {
                        return CategroyItemWidget(
                          onTapFun: () async {
                            dynamic res =
                                await Get.to(() => UpgradeProductDetailsScreen(
                                      packageCode: _dataController
                                          .salesOrdersList[i].pkcode,
                                    ));
                            if (res != null) {
                              if (res[0] == true) {
                                dataFun();
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
