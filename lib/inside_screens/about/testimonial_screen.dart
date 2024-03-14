import 'package:destina_1_international/commons/cmnproduct_detailswdgts.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/main_controller.dart';

class TestimonialScreen extends StatefulWidget {
  const TestimonialScreen({super.key});

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  final MainController _dataController = Get.put(MainController());
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() {
    Map params = {
      // API Name : GetTestimonials
      "action": "GetTestimonialsForMA",
      "regid": 0,
      "TestiImg": "Testimonials",
      "Title": "0",
      "descr": "0",
      "VideoUrl": "0",
      "countryid": "0",
      "sesuer": "0",
      "Sesid": Constants.prefs.getString("country")
    };
    _dataController.getTestimonials(params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(backNavigation: true, title: "Testimonials"),
        body: Obx(() {
          return _dataController.loading.value
              ? SizedBox(
                  height: 500,
                  child: loader,
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0;
                          i < _dataController.testimonialData.length;
                          i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTitle(
                                    // textAlign: TextAlign.center,
                                    titleName: _dataController
                                        .testimonialData[i].title,
                                    size: 16,
                                  ),
                                  CommonTitle(
                                    titleName: _dataController
                                        .testimonialData[i].descr,
                                    size: 14,
                                    fontFamily: "OnestRegular",
                                  )
                                ],
                              ),
                            ),
                            if (_dataController.testimonialData[i].videoUrl !=
                                "")
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ReviewVideoWidget(
                                    onTapFun: () async {
                                      final Uri url = Uri.parse(_dataController
                                          .testimonialData[i].videoUrl);
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                    videoUrl: _dataController
                                        .testimonialData[i].videoUrl,
                                    videoImgHeight: 150),
                              ),
                            const SpaceHeightWidget(height: 10),
                            const CommonDivider()
                          ],
                        ),
                    ],
                  ),
                );
        }));
  }
}
