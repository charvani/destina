import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/services/downloadview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Downloads", backNavigation: true),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: lightBlackColor.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
            for (int i = 0; i < 8; i++)
              ServiceToolWidget(
                title:
                    "THE DANGERS OF INVISIBLE EMF AND EMR POLLUTION TO OUR HEALTH",
                date: "21 Jan 2019",
                onTapFun: () {
                  Get.to(() => const DownloadViewScreen());
                },
              ),
            const SpaceHeightWidget(height: 15)
          ]),
        ),
      ),
    );
  }
}
