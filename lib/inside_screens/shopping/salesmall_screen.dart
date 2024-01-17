import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'sales_productdetailsscreen.dart';
import 'salescart_screen.dart';

class SalesMallScreen extends StatefulWidget {
  const SalesMallScreen({
    super.key,
  });

  @override
  State<SalesMallScreen> createState() => _SalesMallScreenState();
}

class _SalesMallScreenState extends State<SalesMallScreen> {
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password, countryId, hidUid;
  @override
  void initState() {
    super.initState();
    userId = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");
    countryId = Constants.prefs.getString("country_id");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bData = {
      "Action": "GetDSalesPackages",
      "CountryID": countryId,
      "MallName": ""
    };

    dynamic res = await _dataController.getSalesMall(bData);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        setState(() {
          hidUid = res['hidUid'];
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
            "Sales Order",
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
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_cart,
                    color: appthemeColor,
                  ),
                ),
                const SpaceWidthWidget(width: 5),
                Container(
                    height: 30,
                    width: 118,
                    padding: const EdgeInsets.only(right: 5),
                    child: CustomAutoWidthButton(
                        onTapFun: () {
                          if (Constants.prefs.getString("uniq_id") != null) {
                            Get.to(() => const SalesmallCartScreen());
                          } else {}
                        },
                        title: "Checkout"))
              ],
            )
          ]),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                  itemBuilder: (context, i) {
                    return CategroyItemWidget(
                      onTapFun: () async {
                        dynamic res =
                            await Get.to(() => SalesProductDetailsScreen(
                                  packageCode:
                                      _dataController.salesOrdersList[i].pkcode,
                                  hidUid: hidUid,
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
