import 'package:destina_1_international/inside_screens/search/search_itemsscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/common_widgets.dart';
import '../../models/onboarding_model.dart';

class SearchCategoryScreen extends StatefulWidget {
  const SearchCategoryScreen({super.key});

  @override
  State<SearchCategoryScreen> createState() => _SearchCategoryScreenState();
}

class _SearchCategoryScreenState extends State<SearchCategoryScreen> {
  List<OnboardModel> productsCategories = [
    OnboardModel(
        image: "assets/images/health_care_wb.png", title: "Health Care"),
    // OnboardModel(image: "assets/images/sop_wb.png", title: "Skin Care"),
    // OnboardModel(image: "assets/images/body_care_wb.png", title: "Hair Care"),
    OnboardModel(image: "assets/packImg/SAPPHIRE NO BG.png", title: "Kritalia"),
  ];
  final TextEditingController _seachTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: whiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        leadingWidth: 35,
        title: Container(
            margin: const EdgeInsets.only(top: 8),
            height: 50,
            child: SearcItemhWidget(
              onFieldSubFun: (val) {
                print("submit val..$val");
                Get.to(() => SearchItemsScreen(searchKeyword: val));
              },
              clearFun: () {
                setState(() {
                  _seachTextController.text = "";
                });
              },
              onchangeFun: (key) {
                print("key");
                setState(() {});
              },
              controller: _seachTextController,
              borderColor: transperantColor,
              hintText: "What are you looking for?",
            )),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeightWidget(height: 20),
            const CommonTitle(titleName: "Popular Searches"),
            const SpaceHeightWidget(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 0.5),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => SearchItemsScreen(
                          categoryString: productsCategories[i].title));
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: whiteColor,
                        ),
                        child: Row(
                          children: [
                            Image.asset(productsCategories[i].image),
                            CommonTitle(
                              titleName: productsCategories[i].title,
                              size: 12,
                              fontFamily: "OnestRegular",
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
