import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import 'commission_screen.dart';
import 'd1cashback_points_screen.dart';
import 'd1credit_rebatepoints_screen.dart';
import 'dpwallet_screen.dart';
import 'ecard_reqreport_screen.dart';
import 'ecard_screen.dart';
import 'prepaid_screen.dart';
import 'redemption_screen.dart';
import 'stockist_screen.dart';
import 'withdrawalstatus_screen.dart';

class TransactionPasswordScreen extends StatefulWidget {
  final String from;
  const TransactionPasswordScreen({super.key, required this.from});

  @override
  State<TransactionPasswordScreen> createState() =>
      _TransactionPasswordScreenState();
}

class _TransactionPasswordScreenState extends State<TransactionPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final MainController _dataController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: lightDarKBlue.withOpacity(0.1))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonTitle(
                titleName: "Transaction Password",
                size: 16,
              ),
              AccountTextField(
                onchangeFun: (val) {},
                outsideFun: (val) async {},
                textInputType: TextInputType.name,
                hintText: " ",
                controller: passwordController,
                validation: (val) {
                  if (val!.isEmpty) {
                    return "Transaction Password";
                  } else if (val.length < 6) {
                    return "Characters more than 5";
                  } else {
                    return null;
                  }
                },
              ),
              const SpaceHeightWidget(height: 25),
              Obx(() {
                return _dataController.loading.value
                    ? SizedBox(height: 55, child: loader)
                    : CustomElevatedButton(
                        onTapFun: () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.from == "E-Card") {
                              submitFun("IdSummary");
                            } else if (widget.from == "Commission") {
                              submitFun("EwalSummary");
                            } else if (widget.from == "Redemption") {
                              submitFun("RedmSummary");
                            } else if (widget.from == "Prepaid") {
                              submitFun("EmoneySummary");
                            } else if (widget.from == "Stockist") {
                              submitFun("StkSummary");
                            } else if (widget.from == "Withdrawal") {
                              withdrawStatusFun("Withdrawrpt");
                            } else if (widget.from == "Ecard Request") {
                              ecardReqFun();
                            } else if (widget.from == "D1 Cash Back") {
                              d1cashBckFun();
                            } else if (widget.from == "D1 Credit Rebate") {
                              d1RebateFun();
                            } else if (widget.from == "DP Wallet") {
                              dpWalletFun();
                            }
                          }
                        },
                        title: "Submit");
              })
            ],
          ),
        ),
      ),
    );
  }

  submitFun(String apiAction) async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "TransPwd": passwordController.text,
      "Action": apiAction,
      "FrmDate": "01/01/1900",
      "ToDate": "01/01/2100",
      "Sno": "0"
    };
    dynamic res = await _dataController.getEcard(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        if (widget.from == "E-Card") {
          Get.to(() => EcardScreen(transPass: passwordController.text));
        } else if (widget.from == "Commission") {
          Get.to(
              () => ComissionAmountScreen(transPass: passwordController.text));
        } else if (widget.from == "Redemption") {
          Get.to(() => RedemptionScreen(transPass: passwordController.text));
        } else if (widget.from == "Prepaid") {
          Get.to(() => PrepaidScreen(transPass: passwordController.text));
        } else if (widget.from == "Stockist") {
          Get.to(() => StockistScreen(transPass: passwordController.text));
        }
      }
    }
  }

  withdrawStatusFun(String apiAction) async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "TransPwd": passwordController.text,
      "Action": apiAction,
      "FromDate": "01/01/1900",
      "ToDate": "01/01/2100",
      "Sno": "0"
    };
    dynamic res = await _dataController.getWithdrawalStatus(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        Get.to(
            () => WithdrawalStatusScreen(transPass: passwordController.text));
      }
    }
  }

  ecardReqFun() async {
    Map bdata = {
      "rpt": "UserId",
      "fromdate": "1/1/2010",
      "todate": "1/1/2222",
      "userid": Constants.prefs.getString("user_id"),
      "Country": "EcardRequest",
    };
    dynamic res = await _dataController.getEcardReqReports(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        Get.to(() => const EcardReqReportScreen());
      }
    }
  }

  d1cashBckFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "Action": "CashBackSummary",
      "TransPwd": passwordController.text,
      "FromDate": "1/1/2010",
      "ToDate": "1/1/2222",
      "Sno": "0",
    };
    dynamic res = await _dataController.getD1cashBack(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        Get.to(
            () => D1CashBackPointsScreen(transPass: passwordController.text));
      }
    }
  }

  d1RebateFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "Action": "CreRebateSummary",
      "TransPwd": passwordController.text,
      "FromDate": "1/1/2010",
      "ToDate": "1/1/2222",
      "Sno": "0",
    };
    dynamic res = await _dataController.getD1creditRebate(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        Get.to(() =>
            D1CreditRebatePointsScreen(transPass: passwordController.text));
      }
    }
  }

  dpWalletFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "Action": "DPSummary",
      "TransPwd": passwordController.text,
      "FromDate": "1/1/2010",
      "ToDate": "1/1/2222",
      "Sno": "0",
    };
    dynamic res = await _dataController.getDPSummary(bdata);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        Get.to(() => DpWallateScreen(transPass: passwordController.text));
      }
    }
  }
}
