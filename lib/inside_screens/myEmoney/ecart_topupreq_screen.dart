import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class EcardTopupRequestScreen extends StatefulWidget {
  const EcardTopupRequestScreen({super.key});

  @override
  State<EcardTopupRequestScreen> createState() =>
      _EcardTopupRequestScreenState();
}

class _EcardTopupRequestScreenState extends State<EcardTopupRequestScreen> {
  dynamic radioData;
  TextEditingController fullNameTController = TextEditingController();
  TextEditingController userIdTController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameTController.text = "DESTINA1";
    userIdTController.text = "DESTINA1INT";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Ecard Topup Request"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                titleName:
                    "KINDLY COMPLETE THIS FORM TO RECEIVE YOUR ECARD TOPUP.",
                size: 12.5,
              ),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                titleName:
                    "Cash/Cheque Bank Deposit receipt, ZellePay,telegraphic transfer receipt, or Phone-In CC Orders only. All others, go to DESTINA1.COM for instant activation using Credit Card Payment.",
                size: 12,
              ),
              const SpaceHeightWidget(height: 10),
              CommonTitle(
                titleName:
                    "NOTE: Be Sure to make payment FIRST before completing this order form. Refer to the Product Price List.",
                size: 12.5,
                fontFamily: "OnestRegular",
                fontColor: darkRedColor,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: lightDarKBlue.withOpacity(0.15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SideTitle(
                        title:
                            "Has your upgrade period expired? If so, Add 20% to your order."),
                    Row(
                      children: [
                        Radio(
                            value: "Yes",
                            groupValue: radioData,
                            onChanged: (val) {
                              setState(() {
                                radioData = val;
                              });
                            }),
                        const SideTitle(title: "Yes"),
                        const SpaceWidthWidget(width: 25),
                        Radio(
                            value: "No",
                            groupValue: radioData,
                            onChanged: (val) {
                              setState(() {
                                radioData = val;
                              });
                            }),
                        const SideTitle(title: "No")
                      ],
                    ),
                    const CommonTitle(
                      titleName: "Distributor Details :",
                      size: 14,
                      fontFamily: "OnestSemiBold",
                    ),
                    const SpaceHeightWidget(height: 5),
                    const SideTitle(title: "Full Name"),
                    AccountTextField(
                      readOnly: true,
                      backgroundColor: lightDarKBlue.withOpacity(0.1),
                      onchangeFun: (val) {},
                      outsideFun: (val) async {},
                      textInputType: TextInputType.name,
                      hintText: "ex: John Lee",
                      controller: fullNameTController,
                      validation: (val) {
                        return null;
                      },
                    ),
                    const SideTitle(title: "Full Name"),
                    AccountTextField(
                      readOnly: true,
                      backgroundColor: lightDarKBlue.withOpacity(0.1),
                      onchangeFun: (val) {},
                      outsideFun: (val) async {},
                      textInputType: TextInputType.name,
                      hintText: "ex: John Lee",
                      controller: fullNameTController,
                      validation: (val) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
