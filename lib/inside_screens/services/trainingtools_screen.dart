import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'trainingview_screen.dart';

class TrainingToolsScreen extends StatefulWidget {
  const TrainingToolsScreen({super.key});

  @override
  State<TrainingToolsScreen> createState() => _TrainingToolsScreenState();
}

class _TrainingToolsScreenState extends State<TrainingToolsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Training Tools", backNavigation: true),
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
                title: "DESTINA1 Award Winning Plan",
                date: "21 Jan 2019",
                onTapFun: () {
                  Get.to(() => const TrainingToolsViewScreen());
                },
              ),
            const SpaceHeightWidget(height: 15)
          ]),
        ),
      ),
    );
  }
}
