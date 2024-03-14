import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({super.key});

  @override
  State<DisclaimerScreen> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Disclaimer"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "Your use of the app and website constitutes your acceptance of the terms of this Disclaimer."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "No Warranty to Accuracy"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                fontColor: middleBlackColor,
                size: 14,
                textAlign: TextAlign.justify,
                fontFamily: "OnestRegular",
                titleName:
                    "The information we provide on the app and website is on an 'as is' and 'as available' basis and is only for general, indicative purposes. Although every effort is made to ensure the reliability of the information contained in the app and website, this shall not constitute a warranty, either expressed or implied, concerning the accuracy and adequacy of any information stated herein. We expressly disclaim any guarantee or warranty of promised future income or earnings. Any claim of earning or earning potential should be treated as an opinion only, and you shall not rely on it unless you have verified its accuracy. We shall not be held liable to and shall not accept any liability, obligation or responsibility for any loss or damage arising from your reliance on such claims.",
              ),
              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
