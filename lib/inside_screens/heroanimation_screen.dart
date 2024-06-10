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
  String img = "";
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: Center(
          child:
          
              InteractiveViewer(
        maxScale: 5,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: middleBlackColor, width: 0.25)),
          child: CommonCachedNetworkImage(
              imagePath: widget.tagData,
              boxfit: BoxFit.fill),
        ),
      )
          ),
    );
  }
}
