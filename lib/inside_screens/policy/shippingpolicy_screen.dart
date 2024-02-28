import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/colors.dart';

class ShippingPolicyScreen extends StatefulWidget {
  const ShippingPolicyScreen({super.key});

  @override
  State<ShippingPolicyScreen> createState() => _ShippingPolicyScreenState();
}

class _ShippingPolicyScreenState extends State<ShippingPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Shipping Policy"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeightWidget(height: 15),
              const CommonTitle(size: 14, titleName: "DELIVERY OF PRODUCT/S"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "1. We will deliver the product/s if it is/they a/are good/s, ordered by you to the address you gave us for delivery at the time you made your order or at the time of payment of a product under RPP."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "2. Delivery will be made as soon as possible after your order is accepted or at the time of payment of a product under RPP, and within thirty (30) days of your order or payment. Delivery will be by way of courier or other similar services."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "3. In the event that the first attempt at delivery fails for whatsoever reason, a maximum of two (2)further attempts to deliver/contact you will be made within a period of ten(10) days after the first attempt. If, for any reason whatsoever, the attempts to deliver/contact you are still unsuccessful, your product will be classed as undeliverable."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "4. Once your product is classed as undeliverable and returned to us, you must bear all return shipment charges and reshipment charges for any other reshipment attempts."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "5. In the event that you cannot be contacted within ninety (90) days of the first delivery attempt or the product remains undeliverable as defined in clause 3. above, in either case, you are deemed to have abandoned the product, and it will be disposed of at our sole discretion, and we shall have no liability to you whatsoever nor refund any money to you by way of compensation."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "6. You will become the owner of the product/s if it is/they a/are good/s, ordered by you when they have been delivered to you. Once the product/s have been delivered to you, they will be held at your own risk, and we will not be liable for their loss or destruction."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "7. If the product/s you ordered are unavailable, we will, at our sole discretion, provide you with substitute product/s of equivalent quality and prices. If you do not agree to accept the substitute product/s, you may return them to our contact address. We shall bear any cost of returning any such substitute product/s."),
              const SpaceHeightWidget(height: 8),
              CommonTitle(
                  fontColor: middleBlackColor,
                  fontFamily: "OnestRegular",
                  size: 13,
                  titleName:
                      "8. If the product/s you order is/are not goods, the email we send you for the confirmation of our acceptance shall be conclusive evidence of a binding contract between us for your purchase of the product/s."),
              const SpaceHeightWidget(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
