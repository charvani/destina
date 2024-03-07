import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class ReturnPolicyScreen extends StatefulWidget {
  const ReturnPolicyScreen({super.key});

  @override
  State<ReturnPolicyScreen> createState() => _ReturnPolicyScreenState();
}

class _ReturnPolicyScreenState extends State<ReturnPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Return Policy"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "RIGHT FOR YOU TO CANCEL YOUR CONTRACT"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName: "1. Contract for Sale of Goods"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "If the products that you ordered from us are goods, you may cancel your contract with us for the goods that you have ordered at any time up to the end of the:"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "1.1 Seventh (7th) day from the date of your receipt of the product/s, if your order is made in any EU member, state or the US; or"),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "1.2 Sixtieth (60th) day from the delivery date of the product/s to you if your order is made in Singapore."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "1.3 Tenth (10th) day from the date you order the product/s if your order is made in Australia or Hong Kong."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "1.4 Seventh (7th) day from the date you order the product/s if your order is made in a territory other than a European Union member state, the United States, Singapore or Australia."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName: "2. Contract for Sale of Services"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "If the products that you ordered from us are related to services other than goods, you may cancel your contract with us for the services that you have ordered at any time up to the end of the:"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "2.1 Tenth (10th) day from the date of our email confirming our acceptance of your order if your order is made in any EU member state or the US; or"),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "2.2 Sixtieth (60th) day from the date of our email confirming our acceptance of your order if your order is made in Singapore."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "2.3 Tenth (10th) day from the date you order the service/s if your order is made in Australia or Hong Kong."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "2.4 Seventh (7th) day from the date you order the service/s if your order is made in a territory other than a European Union member state, the United States, Singapore or Australia."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "3. To cancel your contract, you must notify us in writing in accordance with clause 12."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "4. If you received the product/s or any materials from us relating to the product/s before you cancel your contract, you must send the product/s or those materials back to our contact address at your own cost and risk. If you cancel your contract, but we have already processed the product/s for delivery, you must not unpack the product/s or any such related materials when you receive them. You must deliver the product/s or those related materials back to us at our contact address at your own cost and risk as soon as possible."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "5. Once you have notified us that you are cancelling your contract, any sum debited by us from your credit card will be subject to the deduction of the aggregate sum of the following:"),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "(i) a reasonable administration fee charged by us"),
              const SpaceHeightWidget(height: 2),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "(ii) will deduct 100% on CVs and bonus paid; and"),
              const SpaceHeightWidget(height: 2),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName: "(iii)applicable fees charged by your bank"),
              const SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "The net refundable amount will be re-credited to your account as soon as possible and, in any event, within thirty (30) days of your order, PROVIDED THAT the product/s in question are returned by you and received by us in the condition they were in when delivered to you. If you do not return the products offered or do not pay the delivery costs, we shall be entitled to deduct the direct cost/s of recovering the product/s from the amount to be re-credited to you."),
              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
