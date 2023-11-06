import 'package:destina_1_international/commons/colors.dart';
import 'package:flutter/material.dart';

class CommonAboutUsScreen extends StatefulWidget {
  final String from;
  const CommonAboutUsScreen({super.key, required this.from});

  @override
  State<CommonAboutUsScreen> createState() => _CommonAboutUsScreenState();
}

class _CommonAboutUsScreenState extends State<CommonAboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.from),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Destina 1 International adopted Blue Ocean Strategy for its business growth. The company is successful & committed in building powerful networks. Destina1 creates opportunities globally for members through its DIRECT SELLING system and advanced technology. Its products are the result of comprehensive R&D in Bio Matrix Science Technology and advance scalar technology.",
          style:
              TextStyle(fontFamily: "PoppinsRegular", color: middleBlackColor),
        ),
      ),
    );
  }
}
