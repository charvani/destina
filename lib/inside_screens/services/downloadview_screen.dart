import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class DownloadViewScreen extends StatefulWidget {
  const DownloadViewScreen({super.key});

  @override
  State<DownloadViewScreen> createState() => _DownloadViewScreenState();
}

class _DownloadViewScreenState extends State<DownloadViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: lightBlackColor.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(15)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Downloads",
              style: TextStyle(
                  fontFamily: "OnestSemiBold",
                  
                  fontSize: 16),
            ),
            const SpaceHeightWidget(height: 25),
            const Text(
              "22 Jun 2017",
              style: TextStyle(
                  fontFamily: "OnestRegular",
                  fontSize: 14),
            ),
            const SpaceHeightWidget(height: 18),
            const Text(
              "THE DANGERS OF INVISIBLE EMF AND EMR POLLUTION TO OUR HEALTH",
              style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
            ),
            const SpaceHeightWidget(height: 5),
            const Text(
              "THE DANGERS OF INVISIBLE EMF AND EMR POLLUTION TO OUR HEALTH",
              style: TextStyle(fontFamily: "OnestRegular", fontSize: 12),
            ),
            const SpaceHeightWidget(height: 25),
            CustomElevatedButton(onTapFun: () {}, title: "Click To Download")
          ]),
        ),
      ),
    );
  }
}
