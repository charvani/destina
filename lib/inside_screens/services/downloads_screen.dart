import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'downloadview_screen.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  final MainController _salesController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "Action": "Downloads"
    };
    _salesController.getSalesTools(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Downloads", backNavigation: true),
      body: Obx(() {
        return _salesController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: lightBlackColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    for (int i = 0;
                        i < _salesController.servicesListData.length;
                        i++)
                      ServiceToolWidget(
                        title: _salesController.servicesListData[i].title,
                        date: _salesController.servicesListData[i].date,
                        onTapFun: () {
                          Get.to(() => DownloadViewScreen(
                                title:
                                    _salesController.servicesListData[i].title,
                                date: _salesController.servicesListData[i].date,
                                downloadlink: _salesController
                                    .servicesListData[i].downloadLink,
                                description: _salesController
                                    .servicesListData[i].descrption,
                              ));
                        },
                      ),
                    const SpaceHeightWidget(height: 15)
                  ]),
                ),
              );
      }),
    );
  }
}
