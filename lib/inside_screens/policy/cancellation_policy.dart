import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class CancellationPolicyScreen extends StatefulWidget {
  const CancellationPolicyScreen({super.key});

  @override
  State<CancellationPolicyScreen> createState() =>
      _CancellationPolicyScreenState();
}

class _CancellationPolicyScreenState extends State<CancellationPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Cancellation Policy"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeightWidget(height: 15),
              CommonTitle(
                  fontColor: middleBlackColor,
                  size: 14,
                  titleName:
                      "Please be informed that we Do Not Accept cancellation for any order once payment has been made. If you have made a mistake in your order or a typo error in your details, please contact our admin at 03-58887789. The changes can be made subject to our policies and procedures."),
              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
