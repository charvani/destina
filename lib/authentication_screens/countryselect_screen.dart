import 'dart:async';

import 'package:destina_1_international/authentication_screens/members_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountySelectScreen extends StatefulWidget {
  const CountySelectScreen({super.key});
  @override
  State<CountySelectScreen> createState() => _CountySelectScreenState();
}

class _CountySelectScreenState extends State<CountySelectScreen> {
  int? currentIndex;
  final MainController _countryController = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCountryData();
    });
  }

  getCountryData() async {
    dynamic res = await _countryController.getCountries();
    print("Country res..$res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor.withOpacity(0.94),
        appBar: commonAppBar(title: "Select Country", backNavigation: true),
        body: SingleChildScrollView(
          child: Obx(() {
            return _countryController.loading.value
                ? SizedBox(height: 400, child: loader)
                : _countryController.countriesList.isEmpty
                    ? SizedBox(height: 100, child: notAvailableW)
                    : Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Wrap(
                          children: [
                            for (int i = 0;
                                i < _countryController.countriesList.length;
                                i++)
                              FlagWidget(
                                  onTapFun: () {
                                    setState(() {
                                      currentIndex = i;
                                    });
                                    Timer(const Duration(milliseconds: 500),
                                        () {
                                      Get.to(() => MemberScreen(
                                            countryId: _countryController
                                                .countriesList[i].countryId,
                                          ));
                                      Constants.prefs.setString(
                                          "country_id",
                                          _countryController
                                              .countriesList[i].countryId);
                                    });
                                    Timer(const Duration(seconds: 1), () {
                                      setState(() {
                                        setState(() {
                                          currentIndex = null;
                                        });
                                      });
                                    });
                                  },
                                  selected: currentIndex == i ? true : false,
                                  imagePath: _countryController
                                      .countriesList[i].countryFlag,
                                  countryName:
                                      _countryController.countriesList[i].name)
                          ],
                        ),
                      );
          }),
        ));
  }
}
