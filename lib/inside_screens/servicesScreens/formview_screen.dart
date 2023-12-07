import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class FormViewScreen extends StatefulWidget {
  const FormViewScreen({super.key});

  @override
  State<FormViewScreen> createState() => _FormViewScreenState();
}

class _FormViewScreenState extends State<FormViewScreen> {
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
              "Forms Agreement",
              style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 16),
            ),
            const SpaceHeightWidget(height: 25),
            const Text(
              "22 Jun 2017",
              style: TextStyle(fontFamily: "OnestRegular", fontSize: 14),
            ),
            const SpaceHeightWidget(height: 18),
            const Text(
              "Credit Card Authorization Form",
              style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 14),
            ),
            const SpaceHeightWidget(height: 5),
            const Text(
              "Credit Card Authorization Form",
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
