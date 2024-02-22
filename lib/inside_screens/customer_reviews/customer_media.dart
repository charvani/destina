import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/cmnproduct_detailswdgts.dart';

class CustomerMediaScreen extends StatefulWidget {
  const CustomerMediaScreen({super.key});

  @override
  State<CustomerMediaScreen> createState() => _CustomerMediaScreenState();
}

class _CustomerMediaScreenState extends State<CustomerMediaScreen> {
  List<String> mediaType = ["Videos", "Photos"];
  int selectedInd = 1;

  dataFun(from) {}
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
                      title: " ${mediaType[i]} (0) ",
                      index: i,
                      selInd: selectedInd,
                      onTapFun: () {
                        setState(() {
                          selectedInd = i;
                        });
                        dataFun(mediaType[i]);
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
                      crossAxisCount:
                          mediaType[selectedInd] == "Photos" ? 2 : 1,
                      crossAxisSpacing: 5),
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return mediaType[selectedInd] == "Photos"
                        ? const CommonCachedNetworkImage(imagePath: "")
                        : const ReviewVideoWidget(
                            videoImgHeight: 180,
                            videoUrl:
                                "https://www.youtube.com/watch?v=wAMzvlCwTKU",
                          );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
