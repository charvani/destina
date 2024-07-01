import 'dart:async';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../service_call/api_data.dart';
import 'promo_cartscreen.dart';

class PromoDashboardScreen extends StatefulWidget {
  final String pkMallNum;
  final String pkCode;

  const PromoDashboardScreen({
    super.key,
    required this.pkMallNum,
    required this.pkCode,
  });

  @override
  State<PromoDashboardScreen> createState() => _PromoDashboardScreenState();
}

class _PromoDashboardScreenState extends State<PromoDashboardScreen> {
  final MainController _dataController = Get.put(MainController());
  bool packageLoading = false;
  dynamic uniqId;
  dynamic sessionId, packCode;
  @override
  void initState() {
    super.initState();
    packCode = widget.pkCode;
   
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (Constants.prefs.getString("uniq_id") == null) {
        uniqId = generateRandomString(10);
        await Constants.prefs.setString("uniq_id", uniqId);
      } else {
        uniqId = Constants.prefs.getString("uniq_id");
      }
      if (Constants.prefs.getString("ss_id") == null) {
        sessionId = generateTimeStamp();
        await Constants.prefs.setString("ss_id", sessionId);
      } else {
        sessionId = Constants.prefs.getString("ss_id");
      }
    });
  }

  getPackageItemsData() async {
    //
    Map parameters = {
      "pkgcode": packCode,
      "dtype": "RePromotion",
      "qty": Constants.prefs.getString("reg_id"),
      "uniqid": uniqId,
      "sessid": sessionId,
      "Jointype": widget.pkMallNum == "3" ? "Signup" : "Upgrade",
    };
    dynamic res = await _dataController.getPromoPacks(
        parameters,
        widget.pkMallNum == "3"
            ? ApiData().getPkgItemsPro
            : ApiData().getPkgItemsUpgPro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(title: "Cart Details", backNavigation: true),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                const CommonTitle(
                    titleName: "You qualified to receive Promotion products!"),
                const SpaceHeightWidget(height: 10),
                const SideTitle(
                    title: "You are eligible for the following promotion:"),
                const SpaceHeightWidget(height: 5),
                const SideTitle(
                    title:
                        "Be sure to select your preferred choice in the given catalogue."),
                const SpaceHeightWidget(height: 15),
                packageLoading
                    ? loader
                    : ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            packageLoading = true;
                          });
                          await getPackageItemsData();
                          textEControllerList.clear();

                          for (int i = 0;
                              i <
                                  _dataController.packageDetails.value
                                      .getPkgItemsRpt.length;
                              i++) {
                            textEControllerList.add(TextEditingController());

                            if (_dataController.packageDetails.value
                                    .getPkgItemsRpt[i].compulsory ==
                                "True") {
                              textEControllerList[i].text = _dataController
                                  .packageDetails.value.getPkgItemsRpt[i].qty;
                            }
                          }

                          setState(() {
                            packageLoading = false;
                          });
                          Get.dialog(PackageDilog(), barrierDismissible: false);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(blackColor),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20)),
                          minimumSize: const MaterialStatePropertyAll(
                              Size(double.infinity, 40)),
                        ),
                        child: Text(
                          "Select Promotion Products For Package $packCode",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: whiteColor, fontFamily: "OnestSemiBold"),
                        )),
                const SpaceHeightWidget(height: 15),
                const CommonDivider()
              ]),
            )
          ]),
        ));
  }

  final _fomkey = GlobalKey<FormState>();
  bool loading = false;
  List<TextEditingController> textEControllerList = [];
  bool showQtyErrorText = false;
  List<String> pidList = [];

  Dialog PackageDilog() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: blackColor.withOpacity(0.8),
      child: StatefulBuilder(builder: (context, myState) {
        return SingleChildScrollView(
          child: Form(
            key: _fomkey,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blackColor.withOpacity(0.8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Customize Packages",
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 16,
                              color: whiteColor),
                        ),
                        IconButton(
                            onPressed: () {
                              if (loading != true) {
                                Get.back();
                              }
                            },
                            icon: Icon(
                              Icons.close,
                              size: 16,
                              color: whiteColor,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: whiteColor,
                    ),
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeightWidget(height: 5),
                        Text(
                          _dataController.packageDetails.value.head,
                          style: TextStyle(
                              fontFamily: "OnestSemiBold",
                              fontSize: 12,
                              color: blackColor),
                        ),
                        const SpaceHeightWidget(height: 5),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text:
                                "Products Selected Should Be Of Total Quantity : ",
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 12,
                                color: blackColor),
                          ),
                          TextSpan(
                            text: _dataController.packageDetails.value.maxQty,
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 14,
                                color: redColor),
                          )
                        ])),
                        const SpaceHeightWidget(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              dataRowMaxHeight: 70,
                              horizontalMargin: 0,
                              columnSpacing: 0,
                              border: TableBorder.all(
                                  color: middleBlackColor.withOpacity(0.15)),
                              columns: [
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "S.No",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Product\nCode",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Name",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Maximum\nQuantity",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                                DataColumn(
                                    label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(
                                        fontFamily: "OnestSemiBold",
                                        fontSize: 12,
                                        color: blackColor),
                                  ),
                                )),
                              ],
                              rows: [
                                for (int i = 0;
                                    i <
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt.length;
                                    i++)
                                  DataRow(cells: [
                                    DataCell(Container(
                                      width: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2),
                                      child: Text(
                                        (i + 1).toString(),
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2),
                                      child: Text(
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt[i].pcode,
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                      width: 160,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2, vertical: 2),
                                      child: Text(
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt[i].name,
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                      width: 80,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2, vertical: 2),
                                      child: Text(
                                        _dataController.packageDetails.value
                                                .getPkgItemsRpt[i].amount ??
                                            "",
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                      width: 100,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.2),
                                      child: Text(
                                        _dataController.packageDetails.value
                                            .getPkgItemsRpt[i].maxquan,
                                        style: TextStyle(
                                            fontFamily: "OnestRegular",
                                            fontSize: 12,
                                            color: middleBlackColor),
                                      ),
                                    )),
                                    DataCell(Container(
                                        width: 100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.2),
                                        child: RegisterTextField(
                                            readOnly: _dataController
                                                        .packageDetails
                                                        .value
                                                        .getPkgItemsRpt[i]
                                                        .compulsory ==
                                                    "True"
                                                ? true
                                                : false,
                                            inputFormatter: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  2),
                                            ],
                                            padding: 8,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            controller: textEControllerList[i],
                                            hintText: "0",
                                            textInputType: TextInputType.number,
                                            validation: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter Quantity";
                                              } else if (int.parse(val) >
                                                  int.parse(_dataController
                                                      .packageDetails
                                                      .value
                                                      .maxQty)) {
                                                return "Not allowed";
                                              } else {
                                                return null;
                                              }
                                            },
                                            labelText: ""))),
                                  ])
                              ]),
                        ),
                        if (showQtyErrorText)
                          Column(
                            children: [
                              const SpaceHeightWidget(height: 8),
                              Text(
                                "Your selected quantity total should be ${_dataController.packageDetails.value.maxQty}",
                                style: TextStyle(
                                    fontFamily: "OnestSemiBold",
                                    fontSize: 14,
                                    color: redColor),
                              )
                            ],
                          ),
                        const SpaceHeightWidget(height: 20),
                        loading
                            ? loader
                            : Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        height: 30,
                                        width: 130,
                                        child: CustomElevatedButton(
                                            onTapFun: () async {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              pidList.clear();
                                              int countQty = 0;
                                              for (int i = 0;
                                                  i <
                                                      textEControllerList
                                                          .length;
                                                  i++) {
                                                if (textEControllerList[i]
                                                        .text !=
                                                    "") {
                                                  countQty = countQty +
                                                      int.parse(
                                                          textEControllerList[i]
                                                              .text);
                                                  pidList.add(
                                                      "${_dataController.packageDetails.value.getPkgItemsRpt[i].pcode}*${textEControllerList[i].text}");
                                                }
                                              }

                                              if (countQty ==
                                                  int.parse(_dataController
                                                      .packageDetails
                                                      .value
                                                      .maxQty)) {
                                                myState(() {
                                                  showQtyErrorText = false;
                                                  loading = true;
                                                });

                                                Map parameters = {
                                                  "Pkid": packCode,
                                                  "pid": pidList.join(":"),
                                                  "uniqid": uniqId,
                                                  "sessid": sessionId,
                                                  "ipaddress": Constants.prefs
                                                      .getString("ip"),
                                                  "sprno": Constants.prefs
                                                      .getString("user_id"),
                                                  "prdtype": "Promotion",
                                                };

                                                dynamic res = await MainController()
                                                    .getPromoPackAddToCart(
                                                        parameters,
                                                        widget.pkMallNum == "3"
                                                            ? ApiData()
                                                                .pAddtoCartOpen
                                                            : ApiData()
                                                                .productsAddtoCartOpenUpgPro);
                                                if (res['Msg']
                                                        .toString()
                                                        .toLowerCase() ==
                                                    "success") {
                                                  Timer(
                                                      const Duration(
                                                          seconds: 1), () {
                                                    if (mounted) {
                                                      myState(() {
                                                        loading = false;
                                                      });
                                                    }

                                                    Get.back();
                                                    Get.to(() =>
                                                        PromoCartScreen(
                                                          pkMallNum:
                                                              widget.pkMallNum,
                                                          packCode: packCode,
                                                        ));
                                                  });
                                                } else {
                                                  Timer(
                                                      const Duration(
                                                          seconds: 1), () {
                                                    if (mounted) {
                                                      myState(() {
                                                        loading = false;
                                                      });
                                                      Get.back();
                                                    }
                                                  });
                                                }
                                              } else {
                                                myState(() {
                                                  showQtyErrorText = true;
                                                });
                                              }
                                            },
                                            title: "Add To Cart")),
                                    const SpaceWidthWidget(width: 10),
                                    SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: CustomElevatedButton(
                                          onTapFun: () {
                                            Get.back();
                                          },
                                          title: "Cancel"),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
