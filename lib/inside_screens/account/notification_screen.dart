import 'package:destina_1_international/commons/colors.dart';
import 'package:flutter/material.dart';

import '../../commons/common_widgets.dart';

class NofificationScreen extends StatefulWidget {
  const NofificationScreen({super.key});

  @override
  State<NofificationScreen> createState() => _NofificationScreenState();
}

class _NofificationScreenState extends State<NofificationScreen> {
  List<String> notificationTypes = [
    "Important",
    "Orders",
    "Announcments",
  ];
  int slectedInd = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          centerTitle: false,
          // leading: const SizedBox.shrink(),
          // toolbarHeight: 100,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              color: lightAppThemeColor,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < notificationTypes.length; i++)
                      InkWell(
                        onTap: () {
                          setState(() {
                            slectedInd = i;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: slectedInd == i
                                          ? appthemeColor
                                          : lightAppThemeColor))),
                          child: Text("${notificationTypes[i]}(2)"),
                        ),
                      ),
                  ]),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, i) {
              return const NotificationWidget();
            }));
  }
}
