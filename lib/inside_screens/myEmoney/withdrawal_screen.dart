import 'dart:async';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class WithdrawalScreen extends StatefulWidget {
  final String transPass;

  const WithdrawalScreen({
    super.key,
    required this.transPass,
  });

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController withdrawalAmountTController = TextEditingController();

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
      dataFun();
    });
  }

  dataFun() {
    Map bdata = {
      "UserId": userId,
      "Pwd": Constants.prefs.getString("password"),
    };
    _dataController.getWithdrawalInfo(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Withdrawal"),
      body: Obx(() {
        return _dataController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: lightDarKBlue.withOpacity(0.3))),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ViewProfileWidget(
                            title: "User ID",
                            info: userId.toString().toUpperCase()),
                        ViewProfileWidget(
                            title: "Name",
                            info:
                                _dataController.withdrawalInfoData.value.name),
                        ViewProfileWidget(
                            title: "City",
                            info:
                                _dataController.withdrawalInfoData.value.city),
                        ViewProfileWidget(
                            title: "Balance (D1 \$)",
                            info: _dataController
                                .withdrawalInfoData.value.balance),
                        const SpaceHeightWidget(height: 10),
                        const SideTitle(title: "Withdrawal Amount (D1 \$)"),
                        AccountTextField(
                          onchangeFun: (val) {},
                          outsideFun: (val) async {},
                          textInputType: TextInputType.number,
                          hintText: "",
                          controller: withdrawalAmountTController,
                          validation: (val) {
                            if (val!.isEmpty) {
                              return "Enter withdrawal amount";
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
                            : CustomAutoWidthButton(
                                onTapFun: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      transferLoad = true;
                                    });
                                    submitFun();
                                  }
                                },
                                title: "Submit"),
                        const SpaceHeightWidget(height: 10),
                        ViewProfileWidget(
                            title: "Minimum Withdrawal Amount :",
                            info: _dataController
                                .withdrawalInfoData.value.minWithdrawalAmount),
                        ViewProfileWidget(
                            title:
                                "${_dataController.withdrawalInfoData.value.schead} :",
                            info:
                                "${_dataController.withdrawalInfoData.value.symbol} ${_dataController.withdrawalInfoData.value.scChrgs}"),
                        ViewProfileWidget(
                            title:
                                "${_dataController.withdrawalInfoData.value.tchead}:",
                            info:
                                "${_dataController.withdrawalInfoData.value.tChrgs} %"),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }

  submitFun() async {
    Map bdata = {
      "UserId": userId,
      "Pwd": Constants.prefs.getString("password"),
      // "From": userId,
      "Action": "Insert",
      "regid": Constants.prefs.getString("reg_id"),
      "amount": withdrawalAmountTController.text,
      "ip": _dataController.withdrawalInfoData.value.symbol,
      "frmdate": "1/1/1990",
      "Todate": "1/1/1990",
      "distid": "",
      "status": "0",
      "countryid": "0",
      "sesuser": "",
      "withdrawaltype": "Manual",
      "dollarvalue": _dataController.withdrawalInfoData.value.dollarValue,
      "Tchead": _dataController.withdrawalInfoData.value.tchead,
      "TChrgsType": _dataController.withdrawalInfoData.value.tChrgsType,
      "Schead": _dataController.withdrawalInfoData.value.schead,
      "SCChrgsType": _dataController.withdrawalInfoData.value.scChrgsType,
      "TChrgs": _dataController.withdrawalInfoData.value.tChrgs,
      "SCChrgs": _dataController.withdrawalInfoData.value.scChrgs,
    };
    dynamic res = await _dataController.getWithdrawalAmt(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        CommonToastTrue(res["Message"]);
        Timer(const Duration(seconds: 1), () {
          Get.back();
        });
      }
    }
    setState(() {
      transferLoad = false;
    });
  }
}
