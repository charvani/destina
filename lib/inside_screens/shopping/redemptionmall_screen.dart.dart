import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'redemption_productdetailscreen.dart';

class RedemptionMallScreen extends StatefulWidget {
  const RedemptionMallScreen({
    super.key,
  });

  @override
  State<RedemptionMallScreen> createState() => _RedemptionMallScreenState();
}

class _RedemptionMallScreenState extends State<RedemptionMallScreen> {
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
      "Action": "GetRedPackages",
      "CountryID": countryId,
      "MallName": ""
      // uniqId
    };

    dynamic res = await _dataController.getRedemptionMall(bData);
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
          backgroundColor: darkBlue,
          title: Text(
            "Redemption Order",
            style: TextStyle(
              fontSize: 18,
              color: whiteColor,
              fontFamily: "OnestSemiBold",
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: whiteColor,
                )),
          ),
          actions: const []),
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
                            dynamic res = await Get.to(
                                () => RedemptionProductDetailsScreen(
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
                          amount:
                              "RP ${_dataController.salesOrdersList[i].mrp}",
                        );
                      },
                      itemCount: _dataController.salesOrdersList.length,
                    ),
                  );
      }),
    );
  }
}
