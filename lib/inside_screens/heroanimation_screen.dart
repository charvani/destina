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
    print("charvani");

    print(",,,,${widget.tagData}");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setState(() {});
      // Timer(const Duration(milliseconds: 300), () {
      //   setState(() {
      //     loading = false;
      //   });
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: Center(
          child:
              //  img != ""
              //     ?
              InteractiveViewer(
        maxScale: 5,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: middleBlackColor, width: 0.25)),
          child: CommonCachedNetworkImage(
              // height: loading ? 50 : 350,
              imagePath: widget.tagData,
              boxfit: BoxFit.fill),
        ),
      )
          // : const NotAvailableText(text: "Unable to zoom"),
          ),
    );
  }
}
