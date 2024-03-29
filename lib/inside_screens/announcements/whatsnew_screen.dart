import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class WhatsNewScreen extends StatefulWidget {
  const WhatsNewScreen({super.key});

  @override
  State<WhatsNewScreen> createState() => _WhatsNewScreenState();
}

class _WhatsNewScreenState extends State<WhatsNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "What's New"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < 4; i++)
              const WhatsNewWidget(
                title: "Bio4Care",
                image: "https://beta.destina1.com/images/bio4care-nobg.png",
                description: "Kidney Health Restoration & Protection",
                popupImage: "",
              )
          ],
        ),
      ),
    );
  }
}
