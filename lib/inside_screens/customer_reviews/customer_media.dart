import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/cmnproduct_detailswdgts.dart';
import '../../models/reviewdata_model.dart';
import '../heroanimation_screen.dart';

class CustomerMediaScreen extends StatefulWidget {
  final List<ReviewReport3> photos;
  final List<ReviewReport4> videos;
  const CustomerMediaScreen(
      {super.key, required this.photos, required this.videos});

  @override
  State<CustomerMediaScreen> createState() => _CustomerMediaScreenState();
}

class _CustomerMediaScreenState extends State<CustomerMediaScreen> {
  List<String> mediaType = ["Videos", "Photos"];
  int selectedInd = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.photos.isEmpty) {
      setState(() {
        selectedInd = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Customer Media", backNavigation: true),
      body: Column(
        children: [
          Row(
            children: [
              for (int i = 0; i < mediaType.length; i++)
                Expanded(
                  child: ProductCatScrollWidget(
                      title: mediaType[i] == "Photos"
                          ? "Photos (${widget.photos.length})"
                          : "Videos (${widget.videos.length})",
                      index: i,
                      selInd: selectedInd,
                      onTapFun: () {
                        setState(() {
                          selectedInd = i;
                        });
                      }),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio:
                          mediaType[selectedInd] == "Photos" ? 1 : 1.9,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5),
                  itemCount: mediaType[selectedInd] == "Photos"
                      ? widget.photos.length
                      : widget.videos.length,
                  itemBuilder: (context, i) {
                    return mediaType[selectedInd] == "Photos"
                        ? GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Get.to(() => HeroAnimationScreen(
                                    tagData: widget.photos[i].image,
                                  ));
                            },
                            child: CommonCachedNetworkImage(
                                imagePath: widget.photos[i].image),
                          )
                        : ReviewViWidget(
                            videoImgHeight: 180,
                            videoUrl: widget.videos[i].video);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
