import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  List<String> faqTypes = ["Bonus", "D1 Pendant", "Energizing Water"];
  int selectedInd = 0;
  final MainController _dataController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() {
    Map bData = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    _dataController.getFaqs(bData);
  }

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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: selectedInd == i
                          ? SizedBox(
                              height: 30,
                              width: faqTypes[i].toString().length == 5
                                  ? 100
                                  : 180,
                              child: CustomElevatedButton(
                                  onTapFun: () {}, title: faqTypes[i]))
                          : SizedBox(
                              height: 30,
                              child: CommonOulineTextButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
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
            Obx(() {
              return _dataController.loading.value
                  ? loader
                  : Column(
                      children: [
                        if (faqTypes[selectedInd] == "Bonus")
                          for (int i = 0;
                              i < _dataController.bonusfaqList.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 5),
                              child: Card(
                                child: ExpansionTile(
                                  childrenPadding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: lightDarKBlue.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  title: CommonTitle(
                                    titleName: _dataController
                                        .bonusfaqList[i].question,
                                    fontFamily: "OnestSemiBold",
                                    size: 14,
                                  ),
                                  children: [
                                    HtmlWidget(
                                      _dataController.bonusfaqList[i].answer,
                                    )
                                  ],
                                ),
                              ),
                            ),
                        if (_dataController.bonusfaqList.isEmpty &&
                            faqTypes[selectedInd] == "Bonus")
                          const SizedBox(
                              height: 400,
                              child: NotAvailableText(text: "No data found")),
                        if (faqTypes[selectedInd] == "D1 Pendant")
                          for (int i = 0;
                              i < _dataController.d1pendantfaqList.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 5),
                              child: Card(
                                child: ExpansionTile(
                                  childrenPadding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: lightDarKBlue.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  title: CommonTitle(
                                    titleName: _dataController
                                        .d1pendantfaqList[i].question,
                                    fontFamily: "OnestSemiBold",
                                    size: 14,
                                  ),
                                  children: [
                                    HtmlWidget(
                                      _dataController
                                          .d1pendantfaqList[i].answer,
                                    )
                                  ],
                                ),
                              ),
                            ),
                        if (_dataController.d1pendantfaqList.isEmpty &&
                            faqTypes[selectedInd] == "D1 Pendant")
                          const SizedBox(
                              height: 400,
                              child: NotAvailableText(text: "No data found")),
                        if (faqTypes[selectedInd] == "Energizing Water")
                          for (int i = 0;
                              i < _dataController.waterfaqList.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 5),
                              child: Card(
                                child: ExpansionTile(
                                  childrenPadding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: lightDarKBlue.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  title: CommonTitle(
                                    titleName: _dataController
                                        .waterfaqList[i].question,
                                    fontFamily: "OnestSemiBold",
                                    size: 14,
                                  ),
                                  children: [
                                    HtmlWidget(
                                      _dataController.waterfaqList[i].answer,
                                    )
                                  ],
                                ),
                              ),
                            ),
                        if (_dataController.waterfaqList.isEmpty &&
                            faqTypes[selectedInd] == "Energizing Water")
                          const SizedBox(
                              child: NotAvailableText(text: "No data found")),
                      ],
                    );
            })
          ]),
        ));
  }
}
