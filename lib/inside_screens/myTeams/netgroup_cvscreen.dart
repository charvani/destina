import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class NetGroupCvScreen extends StatefulWidget {
  final String from;

  const NetGroupCvScreen({super.key, required this.from});

  @override
  State<NetGroupCvScreen> createState() => _NetGroupCvScreenState();
}

class _NetGroupCvScreenState extends State<NetGroupCvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(backNavigation: true, title: ""),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: DataTable(
                      // dataRowMaxHeight: 50,
                      horizontalMargin: 10,
                      columnSpacing: 20,
                      border: TableBorder.all(
                          color: middleBlackColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10)),
                      headingRowColor:
                          MaterialStatePropertyAll(darkBlue.withOpacity(0.1)),
                      dataRowColor: MaterialStatePropertyAll(whiteColor
                          // whiteColor
                          ),
                      columns: [
                        DataColumn(label: idTextStyle("S.No")),
                        DataColumn(label: idTextStyle("Bill No")),
                        DataColumn(label: idTextStyle("User Id")),
                        DataColumn(label: idTextStyle("Name")),
                        DataColumn(label: idTextStyle("Net Amount")),
                        DataColumn(label: idTextStyle("Total CV")),
                        DataColumn(label: idTextStyle("Bill Date")),
                        DataColumn(label: idTextStyle("Mall Name")),
                        DataColumn(label: idTextStyle("Country")),
                      ],
                      rows: [
                        for (int i = 1; i <= 10; i++)
                          DataRow(cells: [
                            DataCell(
                              infoTextStyle("$i", blackColor),
                            ),
                            DataCell(
                              infoTextStyle("01112023/10233", darkBlue),
                            ),
                            DataCell(
                              infoTextStyle("Darove Carlo", blackColor),
                            ),
                            DataCell(
                              infoTextStyle("Darove Carlo", blackColor),
                            ),
                            DataCell(
                              infoTextStyle("84.13", blackColor),
                            ),
                            DataCell(
                              infoTextStyle("5", blackColor),
                            ),
                            DataCell(
                              infoTextStyle("01 Nov 2023", blackColor),
                            ),
                            DataCell(
                              infoTextStyle("Sales Mall", blackColor),
                            ),
                            DataCell(
                              infoTextStyle("United States", blackColor),
                            ),
                          ])
                      ]),
                ),
              ),
            ],
          ),
        ));
  }

  idTextStyle(String id) {
    return Text(
      id,
      style: TextStyle(
          fontFamily: "OnestSemiBold", fontSize: 12, color: blackColor),
    );
  }

  infoTextStyle(String id, Color textColor) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (textColor == darkBlue) {
          print("funtion cll");
        }
      },
      child: Text(
        id,
        style: TextStyle(
            fontFamily: "OnestRegular", fontSize: 12, color: textColor),
      ),
    );
  }
}
