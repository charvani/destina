import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class InvoiceDesignScreen extends StatefulWidget {
  const InvoiceDesignScreen({super.key});

  @override
  State<InvoiceDesignScreen> createState() => _InvoiceDesignScreenState();
}

class _InvoiceDesignScreenState extends State<InvoiceDesignScreen> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ScrollController infoScrollController = ScrollController();
  ScrollController payScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Invoice", backNavigation: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: middleBlackColor.withOpacity(0.5)),
                    color: whiteColor),
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(color: darkBlue),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/invoice_logo.png",
                          height: 90,
                        ),
                        const SpaceHeightWidget(height: 15),
                        CommonTitle(
                          titleName: "Tax Invoice/Bill of Supply/Cash Memo",
                          fontColor: whiteColor,
                          size: 15,
                        ),
                        CommonTitle(
                          titleName: "(Original for Recipient)",
                          fontColor: whiteColor,
                          size: 15,
                          fontFamily: "OnestRegular",
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeightWidget(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          userInfoWidget("User Id", "DESTINA1INT"),
                          userInfoWidget("Name", "DESTINA1"),
                          userInfoWidget("Address", "SUITE J-3-5 & J-3A-5 ,"),
                          userInfoWidget("Mobile", "162635294"),
                          userInfoWidget("Email", "balajirao.s@gmail.com"),
                          userInfoWidget("Bill No.", "11122023/7451"),
                          userInfoWidget("Bill Date", "Dec 11 2023 8:20PM"),
                          const SpaceHeightWidget(height: 10),
                          Scrollbar(
                            trackVisibility: true,
                            interactive: true,
                            controller: infoScrollController,
                            thumbVisibility: true,
                            scrollbarOrientation: ScrollbarOrientation.bottom,
                            radius: const Radius.circular(10),
                            child: SingleChildScrollView(
                              controller: infoScrollController,
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing: 0,
                                  headingRowColor: MaterialStatePropertyAll(
                                      lightDarKBlue.withOpacity(0.2)),
                                  border: TableBorder.all(
                                    color: middleBlackColor.withOpacity(0.15),
                                  ),
                                  columns: const [
                                    DataColumn(
                                        label:
                                            TableHeadingWidget(title: "S.No")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Description")),
                                    DataColumn(
                                        label:
                                            TableHeadingWidget(title: "Qty")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Unit Price")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Tax Amount")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Total CV")),
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Total Amount")),
                                  ],
                                  rows: const [
                                    DataRow(cells: [
                                      DataCell(
                                        TableInfoWidget(
                                          info: "1",
                                        ),
                                      ),
                                      DataCell(
                                        TableInfoWidget(
                                            info:
                                                "D1 ASE SCALARVIA - MYD1SLS39"),
                                      ),
                                      DataCell(
                                        TableInfoWidget(info: "1"),
                                      ),
                                      DataCell(
                                        TableInfoWidget(info: "RM 73"),
                                      ),
                                      DataCell(
                                        TableInfoWidget(info: "RM 2.92"),
                                      ),
                                      DataCell(
                                        TableInfoWidget(info: "15"),
                                      ),
                                      DataCell(
                                        TableInfoWidget(info: "RM 75.92"),
                                      ),
                                    ])
                                  ]),
                            ),
                          ),
                          const SpaceHeightWidget(height: 15),
                          cvWidget("Total CV", "15"),
                          cvWidget("Licensee Code", "MY.SELANGOR.DESTINA1INT"),
                          cvWidget("Handling Method", "Self Collect"),
                          const SpaceHeightWidget(height: 10),
                          Scrollbar(
                            interactive: true,
                            trackVisibility: true,
                            controller: payScrollController,
                            thumbVisibility: true,
                            scrollbarOrientation: ScrollbarOrientation.bottom,
                            radius: const Radius.circular(10),
                            child: SingleChildScrollView(
                              controller: payScrollController,
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing: 0,
                                  headingRowColor: MaterialStatePropertyAll(
                                      lightDarKBlue.withOpacity(0.2)),
                                  border: TableBorder.all(
                                    color: middleBlackColor.withOpacity(0.15),
                                  ),
                                  columns: const [
                                    DataColumn(
                                        label: TableHeadingWidget(
                                            title: "Mode Of Payment")),
                                    DataColumn(
                                        label:
                                            TableHeadingWidget(title: "Value")),
                                  ],
                                  rows: const [
                                    DataRow(cells: [
                                      DataCell(
                                        TableInfoWidget(
                                          info:
                                              "Commission Emoney User Id : DESTINA1INT",
                                        ),
                                      ),
                                      DataCell(
                                        TableInfoWidget(info: "D1 \$ 107.33"),
                                      ),
                                    ])
                                  ]),
                            ),
                          ),
                          const SpaceHeightWidget(height: 15),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: middleBlackColor.withOpacity(0.15),
                            )),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  color: lightDarKBlue.withOpacity(0.2),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  child: const CommonTitle(
                                    titleName: "Order Summary",
                                    size: 13,
                                  ),
                                ),
                                const SpaceHeightWidget(height: 7),
                                orderSummaryTextWidget("Sub Total", "RM 75.92"),
                                orderSummaryTextWidget("Tax Amount", "RM 2.92"),
                                orderSummaryTextWidget(
                                    "Enrollment Fee", "RM 0"),
                                orderSummaryTextWidget(
                                    "Handling Charges", "RM 11.5"),
                                orderSummaryTextWidget(
                                    "Discount Amount", "RM 0"),
                                orderSummaryTextWidget(
                                    "Convenience Amount", "RM 0"),
                                orderSummaryTextWidget(
                                    "TOTAL PAYABLE", "RM 87.42"),
                                const SpaceHeightWidget(height: 7),
                              ],
                            ),
                          ),
                          const SpaceHeightWidget(height: 10),
                          const CommonTitle(
                            titleName: "Amount in Words:",
                            size: 13,
                          ),
                          const CommonTitle(
                            titleName: "Eighty Seven and Forty Two only",
                            size: 13,
                          ),
                          const SpaceHeightWidget(height: 10),
                          const CommonTitle(
                            titleName: "For DESTINA 1 INTERNATIONAL SDN . BHD",
                            size: 12,
                            fontFamily: "OnestRegular",
                          ),
                          const CommonTitle(
                            titleName: "Authorized Signatorys",
                            size: 12.5,
                            fontFamily: "OnestRegular",
                          ),
                        ]),
                  ),
                ]),
              ),
              const SpaceHeightWidget(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTitle(
                      titleName: "Email Id",
                      size: 12.5,
                      fontFamily: "OnestRegular",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "",
                  controller: emailController,
                  validation: (val) {
                    RegExp reg = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                    if (val!.isEmpty) {
                      return "Email address";
                    } else if (!reg.hasMatch(val)) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SpaceHeightWidget(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: CustomElevatedButton(
                    onTapFun: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    title: "Submit"),
              ),
              const SpaceHeightWidget(height: 20),
              SizedBox(
                height: 35,
                child: CustomAutoWidthButton(
                    onTapFun: () {}, title: "Download", bcolor: darkBlue),
              ),
              const SpaceHeightWidget(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  userInfoWidget(String title, info) {
    return Row(
      children: [
        CommonTitle(
          titleName: "$title :",
          size: 12,
        ),
        const SpaceWidthWidget(width: 10),
        CommonTitle(
          titleName: info,
          size: 12,
          fontFamily: "OnestRegular",
        ),
      ],
    );
  }

  cvWidget(String title, info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonTitle(
          titleName: "$title : ",
          size: 12,
          fontFamily: "OnestRegular",
        ),
        // const SpaceWidthWidget(width: 10),
        CommonTitle(
          titleName: info,
          size: 12,
        ),
      ],
    );
  }

  orderSummaryTextWidget(String title, info) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonTitle(
            titleName: "$title :",
            size: 12,
            fontFamily:
                title == "TOTAL PAYABLE" ? "OnestSemiBold" : "OnestRegular",
          ),
          const SpaceWidthWidget(width: 10),
          CommonTitle(
            titleName: info,
            size: 12,
            fontFamily:
                title == "TOTAL PAYABLE" ? "OnestSemiBold" : "OnestRegular",
          ),
        ],
      ),
    );
  }
}
