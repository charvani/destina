import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class EcardTransferScreen extends StatefulWidget {
  final String from, transPass, bal, symbol, etype;

  const EcardTransferScreen({
    super.key,
    required this.from,
    required this.transPass,
    required this.bal,
    required this.symbol,
    required this.etype,
  });

  @override
  State<EcardTransferScreen> createState() => _EcardTransferScreenState();
}

class _EcardTransferScreenState extends State<EcardTransferScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController toTController = TextEditingController();
  TextEditingController transferAmtController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController passwordTController = TextEditingController();
  final MainController _dataController = Get.put(MainController());

  bool visible = true;
  dynamic eMoneyType, userId;
  bool transferLoad = false;

  @override
  void initState() {
    super.initState();
    userId = Constants.prefs.getString("user_id");
    // passwordTController.text = widget.transPass;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      moneyTypeFun();
    });
  }

  List<String> dropdownData = [];
  moneyTypeFun() async {
    Map bdata = {
      "UserId": userId,
      "Pwd": Constants.prefs.getString("password"),
      "Action": "getemoneytype",
      "EType": widget.etype,
      "Mallname": ""
    };
    dynamic res = await _dataController.getEcardMoneyType(bdata);
    if (res != null) {
      for (int i = 0; i < res.length; i++) {
        dropdownData.add(res[i]['toemoney']);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: lightDarKBlue.withOpacity(0.3))),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ViewProfileWidget(
                    title: "From", info: userId.toString().toUpperCase()),
                const SpaceHeightWidget(height: 10),
                const SideTitle(title: "To"),
                AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "",
                  controller: toTController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Enter Transfer To";
                    } else {
                      return null;
                    }
                  },
                ),
                ViewProfileWidget(
                    title: "Balance", info: "${widget.symbol} ${widget.bal}"),
                const SpaceHeightWidget(height: 10),
                const SideTitle(title: "Transfer Amount"),
                AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "",
                  controller: transferAmtController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Enter Transfer Amount";
                    } else {
                      return null;
                    }
                  },
                ),
                const SideTitle(title: "EMoney Type"),
                Obx(() {
                  return _dataController.loading.value
                      ? loader
                      : ProfileDropDown(
                          value: eMoneyType,
                          hintText: "Select",
                          onChangedFun: (val) {
                            setState(() {
                              eMoneyType = val!;
                            });
                          },
                          items: dropdownData,
                          validationFun: (val) {
                            if (val == "" || val == null) {
                              return "Select EMoney Type";
                            } else {
                              return null;
                            }
                          },
                        );
                }),
                const SideTitle(title: "Remarks"),
                AccountTextField(
                  minLines: 3,
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.multiline,
                  hintText: "",
                  controller: remarksController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Enter Remarks";
                    } else if (val.length < 2) {
                      return "Enter valid Remarks";
                    } else {
                      return null;
                    }
                  },
                ),
                const SideTitle(title: "Transaction Password"),
                LoginTextField(
                  obscureText: visible,
                  suffix: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    child: Icon(
                      !visible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: middleBlackColor.withOpacity(0.5),
                    ),
                  ),
                  padding: 5,
                  textInputType: TextInputType.name,
                  labelText: "",
                  hintText: "Password",
                  controller: passwordTController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Enter Transaction Password";
                    } else if (val.length < 5) {
                      return "Enter valid password";
                    } else {
                      return null;
                    }
                  },
                ),
                const SpaceHeightWidget(height: 15),
                transferLoad
                    ? SizedBox(height: 55, child: loader)
                    : CustomElevatedButton(
                        onTapFun: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              transferLoad = true;
                            });
                            Map bdata = {
                              "UserId": userId,
                              "Pwd": Constants.prefs.getString("password"),
                              "From": userId,
                              "To": toTController.text,
                              "Action": "Insert",
                              "Balance": widget.bal,
                              "TranferAmount": transferAmtController.text,
                              "FromEmontyType": widget.etype,
                              "ToEmontyType": eMoneyType,
                              "Remarks": remarksController.text,
                              "TransPassword": passwordTController.text,
                            };
                            print("checking bdata...$bdata");
                            dynamic res = await _dataController
                                .getEcardTransferMoney(bdata);
                            if (res != null) {
                              if (res['Msg'] == "SUCCESS") {
                                CommonToastTrue(res["Message"]);
                                Timer(const Duration(seconds: 1), () {
                                  Get.back();
                                  Get.back();
                                  Get.back();
                                });
                              }
                            }

                            setState(() {
                              transferLoad = false;
                            });
                          }
                        },
                        title: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
