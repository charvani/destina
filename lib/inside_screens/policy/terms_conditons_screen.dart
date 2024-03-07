import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Terms and Conditions"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeightWidget(height: 15),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "We provide our services to you through this app and website based on the Terms of Use ('Terms'). Please read the Terms carefully. Your use of this and website constitutes your acceptance of our Terms."),
              const SpaceHeightWidget(height: 8),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Licence to Use"),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "We grant you a limited licence to access and use this site personally. Except with our express written consent, you cannot download or modify our website or any portion of it. You cannot reproduce, duplicate, copy or modify our website or any part."),
              const SpaceHeightWidget(height: 8),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Downloading"),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "On website, we may provide materials you are allowed to download. By downloading any such materials, you agree to use the materials only for your personal, non-commercial use. You must retain all copyright and other proprietary notices contained in the original materials or any copy of those materials. You are not allowed to use these materials for any commercial purposes other than to promote the Company's networking business or on any other website unless a prior approval is obtained from the Company per the DESTINA 1 Distributor Rules and Regulations."),
              const SpaceHeightWidget(height: 8),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Electronic Communications"),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "You agree to receive our communications electronically when you make any transaction via our website or email. All agreements, notices, or any other communications we provide electronically satisfy any legal requirement that such communications be in writing."),
              const SpaceHeightWidget(height: 8),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Copyright"),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "The content of this website, including text, graphics, images, logos and the compilation of this website, are our intellectual property."),
              const SpaceHeightWidget(height: 8),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Personal Data"),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "Our Privacy Policy governs all personal data you submit to us via this website and app."),
              const SpaceHeightWidget(height: 8),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Links to Third Party Websites"),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "Links to third-party websites may be provided on our website. However, we are not responsible for the content of those third-party websites. Please refer to our Disclaimer."),
              const SpaceHeightWidget(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
