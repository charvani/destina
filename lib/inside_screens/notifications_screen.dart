import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  MainController productController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    productController.getNotificationData(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            color: whiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: darkBlue,
        title: Obx(() {
          return Text(
            productController.loading.value
                ? "Notifications"
                : "Notifications (${productController.notificationData.length})",
            style: TextStyle(
              fontFamily: "OnestSemiBold",
              color: whiteColor,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }),
      ),

      // commonAppBar(title: "Notifications (0)", backNavigation: true),
      body: Obx(() {
        return productController.loading.value
            ? SizedBox(
                height: 400,
                child: loader,
              )
            : productController.notificationData.isEmpty
                ? const NotAvailableText(text: "Notifications not available")
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: productController.notificationData.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Card(
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.all(10),
                                  child: CommonTitle(
                                    titleName:
                                        productController.notificationData[i],
                                    fontFamily: "OnestRegular",
                                    size: 14,
                                  ),
                                )),
                          );
                        }),
                  );
      }),
    );
  }
}
