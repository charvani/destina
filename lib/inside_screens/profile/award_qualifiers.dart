import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import 'awarddata_screen.dart';

class AwardQualifiersScreen extends StatefulWidget {
  const AwardQualifiersScreen({super.key});

  @override
  State<AwardQualifiersScreen> createState() => _AwardQualifiersScreenState();
}

class _AwardQualifiersScreenState extends State<AwardQualifiersScreen> {
  final MainController _awardController = Get.put(MainController());

  TextEditingController emailTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  dynamic award;
  bool selected = false;
  BoxDecoration decr = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: lightBlackColor.withOpacity(0.5),
      ));

  //  DataTableSource tSource = MyData();
  List<String> awardDropDownData = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "Action": "GetMemberAwards",
      "CountryID": Constants.prefs.getString("country_id"),
      "MallName": ""
    };
    dynamic res = await _awardController.getAwardDropDownData(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        for (int i = 0; i < res['AwardsOfferRpt'].length; i++) {
          if (awardDropDownData
              .contains(res['AwardsOfferRpt'][i]['offername'])) {
          } else {
            awardDropDownData.add(res['AwardsOfferRpt'][i]['offername']);
          }
        }
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppBar(title: "Scheme Awards Qualifiers", backNavigation: true),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: decr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SideTitle(title: "Scheme Award:"),
              Obx(() {
                return _awardController.loading.value
                    ? loader
                    : awardDropDownData.isEmpty
                        ? const SizedBox(
                            height: 100,
                            child: NotAvailableText(text: "Not available"))
                        : ProfileDropDown(
                            hintText: "Select",
                            onChangedFun: (val) {
                              setState(() {
                                award = val;
                              });
                            },
                            items: awardDropDownData,
                            validationFun: (val) {
                              if (val == "" || val == null) {
                                return "Select Award type";
                              } else {
                                return null;
                              }
                            },
                          );
              }),
              const SpaceHeightWidget(height: 15),
              if (awardDropDownData.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: CustomElevatedButton(
                      onTapFun: () {
                        if (_formKey.currentState!.validate()) {
                          if (award != null && award != "") {
                            Get.to(() => AwardDataScreen(
                                  selectedVal: award,
                                ));
                          }
                        }
                      },
                      title: "Submit"),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
