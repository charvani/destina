import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class SalesToolsViewScreen extends StatefulWidget {
  const SalesToolsViewScreen({super.key});

  @override
  State<SalesToolsViewScreen> createState() => _SalesToolsViewScreenState();
}

class _SalesToolsViewScreenState extends State<SalesToolsViewScreen> {
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
              "Sales & Marketing Tools",
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
              "Go Pro Audio Book - Chapter 12",
              style: TextStyle(
                  fontFamily: "OnestSemiBold",
                  fontSize: 14),
            ),
            const SpaceHeightWidget(height: 5),
            const Text(
              "Go Pro Audio Book Download the audio version of the Go Pro book. Go Pro takes all the experience and knowledge Eric Worre has gained over the past 28 years and boils it down into one easy-to-follow guide. Download the audio tracks to get started on your journey to becoming a network marketing professional.",
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
