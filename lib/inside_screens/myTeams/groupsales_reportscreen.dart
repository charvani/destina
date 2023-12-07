import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import 'netgroup_cvscreen.dart';

class GroupSalesReportScreen extends StatefulWidget {
  final String fromDate;
  final String toDate;
  const GroupSalesReportScreen(
      {super.key, required this.fromDate, required this.toDate});

  @override
  State<GroupSalesReportScreen> createState() => _GroupSalesReportScreenState();
}

class _GroupSalesReportScreenState extends State<GroupSalesReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "", backNavigation: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonTitle(
                titleName: "Group CV Details",
                size: 16,
              ),
              const SpaceHeightWidget(height: 8),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(color: lightBlackColor.withOpacity(0.5))),
                child: Column(children: [
                  coloredBarWidget(title: "User ID", info: "DESTINA1INT"),
                  plainBarWidget(title: "User Name", info: "	DESTINA1"),
                  coloredBarWidget(title: "From Date", info: widget.fromDate),
                  plainBarWidget(title: "To Date", info: widget.toDate)
                ]),
              ),
              const SpaceHeightWidget(height: 25),
              const CommonTitle(
                titleName: "Business In CV",
                size: 16,
              ),
              const SpaceHeightWidget(height: 8),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(color: lightBlackColor.withOpacity(0.5))),
                child: Column(children: [
                  coloredBarWidget(title: "Total Personal CV", info: "350"),
                  plainBarWidget(title: "Net Left Group CV", info: "	2900"),
                  coloredBarWidget(title: "Net Right Group CV", info: "0"),
                  plainBarWidget(title: "Total Group CV", info: "0")
                ]),
              ),
              const SpaceHeightWidget(height: 25),
              const CommonTitle(
                titleName: "Business In Amount",
                size: 16,
              ),
              const SpaceHeightWidget(height: 8),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(color: lightBlackColor.withOpacity(0.5))),
                child: Column(children: [
                  coloredBarWidget(title: "Total Personal Amount", info: "350"),
                  plainBarWidget(title: "Net Left Group Amount", info: "	2900"),
                  coloredBarWidget(title: "Net Right Group Amount", info: "0"),
                  plainBarWidget(title: "Total Group Amount", info: "0")
                ]),
              ),
              const SpaceHeightWidget(height: 25)
            ],
          ),
        ),
      ),
    );
  }

  plainBarWidget({required title, required info}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
            ),
          ),
          title == "Net Left Group CV" && info != "0"
              ? SizedBox(
                  height: 23,
                  child: CommonOulineTextButton(
                    title: info,
                    onTapFun: () {
                      Get.to(() => const NetGroupCvScreen(
                            from: "Net Left Group CV",
                          ));
                    },
                  ),
                )
              : Flexible(
                  child: Text(
                    info,
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 14,
                        color: title == "Total Group CV"
                            ? darkRedColor
                            : blackColor),
                  ),
                ),
        ],
      ),
    );
  }

  coloredBarWidget({required title, required info}) {
    return Container(
      color: lightDarKBlue.withOpacity(0.1),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
            ),
          ),
          title == "Net Right Group CV" && info != "0"
              ? SizedBox(
                  height: 23,
                  child: CommonOulineTextButton(
                    title: info,
                    onTapFun: () {
                      Get.to(() => const NetGroupCvScreen(
                            from: "Net Right Group CV",
                          ));
                    },
                  ),
                )
              : Flexible(
                  child: Text(
                    info,
                    style: const TextStyle(
                        fontFamily: "OnestSemiBold", fontSize: 14),
                  ),
                ),
        ],
      ),
    );
  }
}
