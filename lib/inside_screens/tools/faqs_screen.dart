import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  List<String> faqTypes = ["Bonus", "D1 Pendant", "Energizing Water"];
  int selectedInd = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "FAQs", backNavigation: true),
      body: SingleChildScrollView(
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < faqTypes.length; i++)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: selectedInd == i
                        ? SizedBox(
                            height: 30,
                            width:
                                faqTypes[i].toString().length == 5 ? 100 : 180,
                            child: CustomElevatedButton(
                                onTapFun: () {}, title: faqTypes[i]))
                        : SizedBox(
                            height: 30,
                            child: CommonOulineTextButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                onTapFun: () {
                                  setState(() {
                                    selectedInd = i;
                                  });
                                },
                                title: faqTypes[i]),
                          ),
                  )
              ],
            ),
          ),
          const SpaceHeightWidget(height: 10),
          for (int i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              child: Card(
                child: ExpansionTile(
                  childrenPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: lightDarKBlue.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  title: const CommonTitle(
                    titleName:
                        "How long does the pendant last? Will the energy diminish? Do I have consistently buy new ones?",
                    fontFamily: "OnestSemiBold",
                    size: 14,
                  ),
                  children: const [
                    HtmlWidget(
                        "Place the Destina 1 Pendant next to the cup or bottle of water for about 15-20 minutes.<br />")
                  ],
                ),
              ),
            )
        ]),
      ),
    );
  }
}
