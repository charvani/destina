import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'formview_screen.dart';

class FormsAgreementScreen extends StatefulWidget {
  const FormsAgreementScreen({super.key});

  @override
  State<FormsAgreementScreen> createState() => _FormsAgreementScreenState();
}

class _FormsAgreementScreenState extends State<FormsAgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Forms & Agreement", backNavigation: true),
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
                title: "Credit Card Authorization Form",
                date: "21 Jan 2019",
                onTapFun: () {
                  Get.to(() => const FormViewScreen());
                },
              ),
            const SpaceHeightWidget(height: 15)
          ]),
        ),
      ),
    );
  }
}
