import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class FTAAfterRegScreen extends StatefulWidget {
  const FTAAfterRegScreen({super.key});

  @override
  State<FTAAfterRegScreen> createState() => _FTAAfterRegScreenState();
}

class _FTAAfterRegScreenState extends State<FTAAfterRegScreen> {
  final MainController _dataController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: "ONLINE FTA FORM",
          backNavigation: true,
          onTapFun: () {
            Get.back();
            Get.back();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 130,
                  ),
                ],
              ),
              const SpaceHeightWidget(height: 10),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.companyName,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.add1 +
                    _dataController.ftaRegData.value.add2,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.city +
                    _dataController.ftaRegData.value.stateName,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.name,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.mobile,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.faxno,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.email,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.website,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              CommonTitle(
                titleName: _dataController.ftaRegData.value.vatno,
                fontFamily: "OnestRegular",
                size: 10,
              ),
              const SpaceHeightWidget(height: 10),
              const CommonDivider(),
              const SpaceHeightWidget(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonTitle(
                    titleName: "Particulars Of D1DB First Time Attendee (FTA)",
                    size: 15,
                  ),
                  const SpaceHeightWidget(height: 10),
                  Row(
                    children: [
                      const SideTitle(title: "i. FTA Name : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.ftaName,
                        size: 14.5,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SideTitle(title: "ii. FTA NRIC/Passport No. : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.ftaProofNo,
                        size: 14.5,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SideTitle(title: "iii. FTA Mobile : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.ftaContact,
                        size: 14.5,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SideTitle(title: "iv. FTA Email : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.ftaEmail,
                        size: 14.5,
                      )
                    ],
                  ),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                    titleName: "Particulars Of D1DB Inviter",
                    size: 15,
                  ),
                  const SpaceHeightWidget(height: 10),
                  Row(
                    children: [
                      const SideTitle(title: "i. Inviter Name : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.invName,
                        size: 14.5,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SideTitle(title: "ii. Inviter NRIC/Passport No: "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.invProofNo,
                        size: 14.5,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SideTitle(title: "iii. Inviter Mobile : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.invContact,
                        size: 14.5,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SideTitle(title: "iv. Inviter Email : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.invEmail,
                        size: 14.5,
                      )
                    ],
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                    titleName:
                        "1. The above mentioned FTA name and holder of the FTA NRIC/Passport stated herein above under items (1)(i) and 1(ii) hereby confirm and warrants the followings :-",
                    size: 13,
                    fontFamily: "OnestSemiBold",
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                    titleName:
                        "I have never attended any destina1 Dream builder (D1DB) presentation before. this is my frist attendance\nI am currently not Destina1 international (D1) member and i have never join Destina1 international as a member before.",
                    size: 12,
                    fontFamily: "OnestRegular",
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                    titleName:
                        "In the event that the above declaration is untrue or incorrect, i agree to indemnify Destina1 international (D1) for the price of the product/gift/prize that was redeemed by me as a lucky draw gift. i further authorize D1 to deduct the said amount from my D1 account E-wallet (if have any) in event of non-payment by me due to my false declaration/representation.",
                    size: 12,
                    fontFamily: "OnestRegular",
                  ),
                  const SpaceHeightWidget(height: 10),
                  Row(
                    children: [
                      const SideTitle(title: "Name : "),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.name,
                        size: 14.5,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const CommonTitle(
                        titleName: "Date : ",
                        size: 13,
                        fontFamily: "OnestRegular",
                      ),
                      CommonTitle(
                        titleName: _dataController.ftaRegData.value.ldated,
                        size: 14.5,
                      )
                    ],
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                    titleName:
                        'All of the above mentioned terms shall be subjected to the terms & Condition of the "free gift promo" currently being carried out by D1 in 2015',
                    size: 12,
                    fontFamily: "OnestRegular",
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                    titleName:
                        "(Note: All items a(i) - 1(iv) and 2(i) - 2(iv) must be completely filled in otherwise registration in void)",
                    size: 12,
                    fontFamily: "OnestSemiBold",
                  ),
                ],
              ),
              const SpaceHeightWidget(height: 15),
              const SpaceHeightWidget(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
