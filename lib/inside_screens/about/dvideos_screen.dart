import 'dart:async';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../commons/constants.dart';
import '../../models/d1video_model.dart';

class D1VideosScreen extends StatefulWidget {
  const D1VideosScreen({super.key});

  @override
  State<D1VideosScreen> createState() => _D1VideosScreenState();
}

class _D1VideosScreenState extends State<D1VideosScreen> {
  List<D1VideosModel> videoData = [
    D1VideosModel(title: "BEAUTY AND WELLNESS", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=g6WuOPyE5eU",
          viTitle: "Dr Kaven London & Princess Anish London")
    ]),
    D1VideosModel(title: "BUSINESS", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=26hYbOPO7QY",
          viTitle: "Destina 1 is the best choice for all !!!"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=N6DQGwiSbc8",
          viTitle: "About Destina 1 International"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=PTVGfkjCUfc",
          viTitle: "Global Recognition for Destina 1 International"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=yzE0QPeom-U",
          viTitle: "Welcome to Destina 1 International Sdn Bhd"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=kSBBoN2_gnA",
          viTitle: "Philippines Business Tour & Leaders meeting"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=66p9qvYQW9s",
          viTitle: "Destina 1 Global Market Promotion"),
      VideoList(
        viUrl: "https://www.youtube.com/watch?v=FCb_-8cZtBI",
        viTitle:
            "Introduction to Destina 1 Virtual Business Office Mobile Apps",
      ),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=gTYWRJ5zcl0",
          viTitle: "ANCE Best Leader of The Year ( Notable Leader) Chief Arul"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=vQlfx7eR82g",
          viTitle:
              "Z Radio Baguio Interview Dato sri Dr Barani Karunakaran MLM VS SCAM"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=xVuL3zv_hKo",
          viTitle:
              "Dato' Sri Dr Barani Karunakaran Lifetime Achievement Award ANCE 2019"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=GHCK63s3PNw",
          viTitle: "About Uniwave by Quantes Technology"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=_hU2fKy5IMM",
          viTitle: "D1 New Office Opening Announcement"),
    ]),
    D1VideosModel(title: "DEMO", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=oLiPlpz-JRA",
          viTitle: "Strength, Balancing & Flexibility Test"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=V50ly-Gn8_U",
          viTitle:
              "Uniwave by Quantes Technology Alkaline Water Test (Hand is on Fire)"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=qzouxYXBJU4",
          viTitle:
              "Destina 1® Uniwave by Quantes Technology Alkaline Flask ( ScalarQ Flask ) Iodine test"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=RTxr2Wou_lc",
          viTitle:
              "Destina 1® Uniwave by Quantes Technology Alkaline Flask Water Demo pH Test, Tap Water & Bottled Drinks")
    ]),
    D1VideosModel(title: "EVENTS", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=cL9VmfWcWis",
          viTitle:
              'THE BIZZ AMEA 2019 | DESTINA 1 INTERNATIONAL WINNER OF "PEAK OF SUCCESS" AWARD'),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=vFTLs6Iz43M",
          viTitle:
              "Destina 1 International Winner of The Most Inspirational Company of the Year Award by Worldcob"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=bt-0rVg1lZA",
          viTitle:
              "The Grand Inauguration of Destina 1 International Headquarters and D1 FoodBank Launching"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=hmUYntmQr7o",
          viTitle:
              "Destina 1 Scalarvia Launching & Achiever's Recognition Luncheon"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=Z7bspY-9M0o",
          viTitle: "D1 D'Achiever Recognition Nite 2020"),
    ]),
    D1VideosModel(title: "HOPE FOR MANKIND", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=Z5-gM65z1a4",
          viTitle: "Charitable Activities by Hope for Mankind Foundation"),
    ]),
    D1VideosModel(title: "LIFESTYLE", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=4EfN6sok9oM",
          viTitle: 'Destina1 D\'Achievers Club "WORK HARD, PLAY HARD"'),
    ]),
    D1VideosModel(title: "PRODUCTS", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=5YDNMdKxn10",
          viTitle:
              'THE BIZZ AMEA 2019 | DESTINA 1 INTERNATIONAL WINNER OF "PEAK OF SUCCESS" AWARD'),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=4UdbYYw-v50",
          viTitle:
              "Destina 1 International Winner of The Most Inspirational Company of the Year Award by Worldcob"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=ojY3mpjuK8Y",
          viTitle:
              "The Grand Inauguration of Destina 1 International Headquarters and D1 FoodBank Launching"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=wAMzvlCwTKU",
          viTitle:
              "Destina 1 Scalarvia Launching & Achiever's Recognition Luncheon"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=Drltmqw6pBM",
          viTitle:
              "Destina 1 Scalarvia Launching & Achiever's Recognition Luncheon"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=Y8-bkJrNyFE",
          viTitle:
              "Destina 1 Scalarvia Launching & Achiever's Recognition Luncheon"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=dsFZxus43o8",
          viTitle:
              "Destina 1 Scalarvia Launching & Achiever's Recognition Luncheon"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=5-OPw274MR8",
          viTitle:
              "Destina 1 Scalarvia Launching & Achiever's Recognition Luncheon"),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=iMipsyLRjgk",
          viTitle: "D1 D'Achiever Recognition Nite 2020"),
    ]),
    D1VideosModel(title: "TRAINING", videoList: [
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=H4mP_k8gAK4",
          viTitle:
              'THE BIZZ AMEA 2019 | DESTINA 1 INTERNATIONAL WINNER OF "PEAK OF SUCCESS" AWARD'),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=Ty-0kJFibkw",
          viTitle:
              'THE BIZZ AMEA 2019 | DESTINA 1 INTERNATIONAL WINNER OF "PEAK OF SUCCESS" AWARD'),
      VideoList(
          viUrl: "https://www.youtube.com/watch?v=r5RxStUhe0Y",
          viTitle: "D1 D'Achiever Recognition Nite 2020"),
    ]),
  ];
  int selectedInd = 0;
  bool loaderVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "D' Video TV"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeightWidget(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < videoData.length; i++)
                  ProductCatScrollWidget(
                      title: videoData[i].title,
                      index: i,
                      selInd: selectedInd,
                      onTapFun: () {
                        setState(() {
                          loaderVal = true;
                          selectedInd = i;
                        });
                        Timer(const Duration(seconds: 1), () {
                          print("charvani");
                          setState(() {
                            loaderVal = false;
                          });
                        });
                      }),
              ],
            ),
          ),
          const SpaceHeightWidget(height: 10),
          loaderVal
              ? SizedBox(height: 500, child: loader)
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.7,
                                crossAxisCount: 1,
                                crossAxisSpacing: 5),
                        itemCount: videoData[selectedInd].videoList.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: ReviewVideoWidget(
                                    onTapFun: () async {
                                      final Uri url = Uri.parse(
                                          videoData[selectedInd]
                                              .videoList[i]
                                              .viUrl);
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                    videoImgHeight: 145,
                                    videoUrl: videoData[selectedInd]
                                        .videoList[i]
                                        .viUrl),
                              ),
                              CommonTitle(
                                textAlign: TextAlign.center,
                                fontFamily: "OnestRegular",
                                titleName:
                                    videoData[selectedInd].videoList[i].viTitle,
                                size: 13,
                              )
                            ],
                          );
                        }),
                  ),
                )
        ],
      ),
    );
  }
}
