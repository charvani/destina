import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'commission_screen.dart';
import 'd1cashback_points_screen.dart';
import 'd1credit_rebatepoints_screen.dart';
import 'dpwallet_screen.dart';
import 'ecard_reqreport_screen.dart';
import 'ecart_screen.dart';
import 'prepaid_screen.dart';
import 'redemption_screen.dart';
import 'stockist_screen.dart';
import 'withdrawal_screen.dart';

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
              CustomElevatedButton(
                  onTapFun: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.from == "E-Card") {
                        Get.to(() => const EcardScreen());
                      } else if (widget.from == "Commission") {
                        Get.to(() => const ComissionAmountScreen());
                      } else if (widget.from == "Redemption") {
                        Get.to(() => const RedemptionScreen());
                      } else if (widget.from == "Prepaid") {
                        Get.to(() => const PrepaidScreen());
                      } else if (widget.from == "Stockist") {
                        Get.to(() => const StockistScreen());
                      } else if (widget.from == "Withdrawal") {
                        Get.to(() => const WithdrawalStatusScreen());
                      } else if (widget.from == "Ecard Request") {
                        Get.to(() => const EcardReqReportScreen());
                      } else if (widget.from == "D1 Cash Back") {
                        Get.to(() => const D1CashBackPointsScreen());
                      } else if (widget.from == "D1 Credit Rebate") {
                        Get.to(() => const D1CreditRebatePointsScreen());
                      } else if (widget.from == "DP Wallet") {
                        Get.to(() => const DpWallateScreen());
                      }
                    }
                  },
                  title: "Submit")
            ],
          ),
        ),
      ),
    );
  }
}
