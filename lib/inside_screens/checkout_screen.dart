import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../commons/constants.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int cartCount = 0;
  int cartItemCount = 0;
  String? handlingMethod;
  String? paymentType;
  TextEditingController couponController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cartCount = Constants.prefs.getInt("cart_count") ?? 0;
    cartItemCount = cartCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Checkout",
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        color: blackColor,
                        fontSize: 18)),
                TextSpan(
                    text: " (1 item)",
                    style: TextStyle(
                        fontFamily: "OnestRegular",
                        color: blackColor,
                        fontSize: 18))
              ])),
              const CheckoutSigninReqWidget(),
              const CommonDivider(),
              for (int i = 0; i < 2; i++)
                Column(
                  children: [
                    const SpaceHeightWidget(height: 10),
                    CheckOutItemWidget(
                      productCode: "MYJD02",
                      imagePath: "assets/images/health.jpg",
                      itemname: "D1 ADVANCE SCALAR ENERGIZED SCALARVIA",
                      itemsPrice: "20.00",
                      itemCount: cartItemCount,
                      removeFun: () async {
                        cartItemCount = cartItemCount - 1;
                        await Constants.prefs
                            .setInt("cart_count", cartCount - 1);
                        cartCount = Constants.prefs.getInt("cart_count")!;
                        print("my minus,,$cartCount");

                        setState(() {});
                      },
                      addFun: () async {
                        cartItemCount = cartItemCount + 1;
                        await Constants.prefs
                            .setInt("cart_count", cartCount + 1);
                        cartCount = Constants.prefs.getInt("cart_count")!;
                        print("my ++,,,$cartCount");
                        setState(() {});
                      },
                      actualItemPrice: '19.00',
                    ),
                    const SpaceHeightWidget(height: 10),
                    const CommonDivider(),
                  ],
                ),
              const SpaceHeightWidget(height: 5),
              const CheckoutOrderSummaryWidget(
                shippingAmount: "9.95",
                grandTotal: "44.95",
                subtotal: "35.00",
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckoutAddCouponWidget(
                      applyButtonFun: () {},
                      controller: couponController,
                      validation: (val) {
                        return null;
                      },
                    ),
                  ),
                  const SpaceWidthWidget(width: 10),
                ],
              ),
              const SpaceHeightWidget(height: 15),
              const CommonDivider(),
              const SpaceHeightWidget(height: 15),
              Text(
                "Handling Method",
                style: TextStyle(
                    fontFamily: "OnestBold",
                    color: blackColor.withOpacity(0.5),
                    fontSize: 14),
              ),
              Row(
                children: [
                  Radio(
                      // activeColor: darkBlue,
                      // fillColor:
                      // MaterialStatePropertyAll(blackColor.withOpacity(0.5)),
                      value: "Self Collect",
                      groupValue: handlingMethod,
                      onChanged: (val) {
                        setState(() {
                          handlingMethod = val;
                        });
                      }),
                  Text(
                    "Self Collect",
                    style: TextStyle(
                        fontFamily: "OnestRegular",
                        color: blackColor.withOpacity(0.7),
                        fontSize: 14),
                  ),
                  Radio(
                      // activeColor: darkBlue,
                      // focusColor: darkBlue,
                      overlayColor:
                          MaterialStatePropertyAll(blackColor.withOpacity(0.5)),
                      value: "Shipping Method",
                      groupValue: handlingMethod,
                      onChanged: (val) {
                        setState(() {
                          handlingMethod = val;
                        });
                      }),
                  Text(
                    "Shipping Method",
                    style: TextStyle(
                        fontFamily: "OnestRegular",
                        color: blackColor.withOpacity(0.7),
                        fontSize: 14),
                  ),
                ],
              ),
              const SpaceHeightWidget(height: 10),
              const CommonDivider(),
              const SpaceHeightWidget(height: 15),
              Text(
                "Payment",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor,
                    fontSize: 16),
              ),
              RadioListTile(
                  value: "PayPal",
                  title: Text(
                    "PayPal",
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        color: blackColor,
                        fontSize: 14.5),
                  ),
                  groupValue: paymentType,
                  onChanged: (val) {
                    setState(() {
                      paymentType = val;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Pay in 4 interest-free payments of \$11.23 with ",
                      style: TextStyle(
                        fontFamily: "OnestLight",
                        color: greenColor,
                        fontSize: 14,
                      )),
                  TextSpan(
                      text: "Pay",
                      style: TextStyle(
                          fontFamily: "OnestExtraBold",
                          fontStyle: FontStyle.italic,
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Pal",
                      style: TextStyle(
                        fontFamily: "OnestExtraBold",
                        fontStyle: FontStyle.italic,
                        color: middleBlackColor.withOpacity(0.6),
                        fontSize: 15,
                      )),
                  TextSpan(
                      text: " Learn More",
                      style: TextStyle(
                        fontFamily: "OnestLight",
                        color: greenColor,
                        fontSize: 14,
                      )),
                ])),
              ),
              RadioListTile(
                  value: "Credit/Debit Card",
                  title: Text(
                    "Credit/Debit Card",
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        color: blackColor,
                        fontSize: 14.5),
                  ),
                  groupValue: paymentType,
                  onChanged: (val) {
                    setState(() {
                      paymentType = val;
                    });
                  }),
              Text(
                "Name on Card",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor,
                    fontSize: 14.5),
              ),
              RegisterTextField(
                  borderColor: blackColor.withOpacity(0.5),
                  controller: nameController,
                  hintText: "John Smith",
                  textInputType: TextInputType.name,
                  validation: (val) {
                    return null;
                  },
                  labelText: ""),
              const SpaceHeightWidget(height: 5),
              Text(
                "Card Number",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor,
                    fontSize: 14.5),
              ),
              RegisterTextField(
                  borderColor: blackColor.withOpacity(0.5),
                  controller: nameController,
                  hintText: "Card Number",
                  textInputType: TextInputType.name,
                  validation: (val) {
                    return null;
                  },
                  labelText: ""),
              const SpaceHeightWidget(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry Date",
                          style: TextStyle(
                              fontFamily: "OnestSemiBold",
                              color: blackColor,
                              fontSize: 14.5),
                        ),
                        RegisterTextField(
                            borderColor: blackColor.withOpacity(0.5),
                            controller: nameController,
                            hintText: "mm/yy",
                            textInputType: TextInputType.name,
                            validation: (val) {
                              return null;
                            },
                            labelText: ""),
                      ],
                    ),
                  ),
                  const SpaceWidthWidget(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CVV",
                          style: TextStyle(
                              fontFamily: "OnestSemiBold",
                              color: blackColor,
                              fontSize: 14.5),
                        ),
                        RegisterTextField(
                            borderColor: blackColor.withOpacity(0.5),
                            controller: nameController,
                            hintText: "CVV",
                            textInputType: TextInputType.name,
                            validation: (val) {
                              return null;
                            },
                            labelText: ""),
                      ],
                    ),
                  ),
                ],
              ),
              const SpaceHeightWidget(height: 20),
              Text(
                "Finalize & Place Order",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor,
                    fontSize: 17),
              ),
              const SpaceHeightWidget(height: 10),
              Text(
                "Order Total: \$44.95",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor,
                    fontSize: 14),
              ),
              const SpaceHeightWidget(height: 5),
              Text(
                "I've confirmed my information above is correct. Please place my order!",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor,
                    fontSize: 13),
              ),
              const SpaceHeightWidget(height: 20),
              CustomElevatedButton(onTapFun: () {}, title: "Place Order"),
              const SpaceHeightWidget(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
