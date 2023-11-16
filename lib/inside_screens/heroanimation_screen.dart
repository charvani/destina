import 'package:destina_1_international/commons/colors.dart';
import 'package:flutter/material.dart';

import '../commons/common_widgets.dart';

class HeroAnimationScreen extends StatefulWidget {
  final String tagData;
  const HeroAnimationScreen({super.key, required this.tagData});

  @override
  State<HeroAnimationScreen> createState() => _HeroAnimationScreenState();
}

class _HeroAnimationScreenState extends State<HeroAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true),
      body: Center(
        child: InteractiveViewer(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: middleBlackColor, width: 0.1)),
            child: CommonCachedNetworkImage(
                imagePath: widget.tagData, boxfit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
