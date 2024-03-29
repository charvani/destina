import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../controllers/main_controller.dart';
import '../myEmoney/ecard_reqreport_screen.dart';

class NewsDetailsScreen extends StatefulWidget {
  final String newsno;
  const NewsDetailsScreen({super.key, required this.newsno});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final MainController _dataController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map params = {
        "action": "singleNewsMA",
        "category": "all",
        "Title": "News",
        "Imgpath": "0",
        "Descr": "0",
        "url": "0",
        "Countryid": widget.newsno,
        "sesuer": "0",
        "Sesid": "all"
      };
      _dataController.getHomeNewsDetails(params);
    });
  }

  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: Obx(() {
        return _dataController.loading.value
            ? SizedBox(
                height: 400,
                child: loader,
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonCachedNetworkImage(
                        imagePath: _dataController
                            .singleNewsDetails.value.newsRpt[0].imgPath,
                        // height: 300,
                      ),
                      if (_dataController
                          .singleNewsDetails.value.newsImagesRpt.isNotEmpty)
                        CommonCarousel(
                          padding: const EdgeInsets.only(
                              top: 45, bottom: 0, left: 20, right: 20),
                          onTapFun: () {},
                          autoPlay: false,
                          images: _dataController
                              .singleNewsDetails.value.newsImagesRpt
                              .map((e) => e.thumbUrl)
                              .toList(),
                          onchangedFun: (index, res) {
                            if (mounted) {
                              setState(() {
                                carouselIndex = index;
                              });
                            }
                          },
                          currentIndex: carouselIndex,
                        ),
                      const SpaceHeightWidget(height: 10),
                      Text(
                        _dataController
                            .singleNewsDetails.value.newsRpt[0].title,
                        style: TextStyle(
                            fontFamily: "OnestSemiBold",
                            fontSize: 18,
                            color: darkBlue),
                      ),
                      htmlDataWidget(_dataController
                          .singleNewsDetails.value.newsRpt[0].descr),
                      const SpaceHeightWidget(height: 15)
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
