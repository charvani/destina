import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:destina_1_international/authentication_screens/countryselect_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../authentication_screens/login_screen.dart';
import 'constants.dart';

class SpaceHeightWidget extends StatelessWidget {
  final double height;
  const SpaceHeightWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SpaceWidthWidget extends StatelessWidget {
  final double width;
  const SpaceWidthWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  const CustomElevatedButton(
      {super.key, required this.onTapFun, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTapFun,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(blackColor),
          minimumSize:
              const MaterialStatePropertyAll(Size(double.infinity, 40)),
        ),
        child: Text(
          title,
          style: TextStyle(color: whiteColor, fontFamily: "OnestSemiBold"),
        ));
  }
}

class CustomBorderElevatedButton extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  final Color bgcolor;

  const CustomBorderElevatedButton(
      {super.key,
      required this.onTapFun,
      required this.title,
      required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTapFun,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(bgcolor),
          minimumSize:
              const MaterialStatePropertyAll(Size(double.infinity, 45)),
          // maximumSize:
          //     const MaterialStatePropertyAll(Size(double.infinity, 45)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: blackColor))),
        ),
        child: Text(
          title,
          style: TextStyle(color: blackColor, fontFamily: "OnestSemiBold"),
        ));
  }
}

class CustomFixedElevatedButton extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  const CustomFixedElevatedButton(
      {super.key, required this.onTapFun, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTapFun,
        style: ElevatedButton.styleFrom(
            backgroundColor: blackColor,
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            foregroundColor: whiteColor),
        child: Text(
          title,
          style: TextStyle(
              color: whiteColor, fontFamily: "OnestSemiBold", fontSize: 12),
        ));
  }
}

class CommonFormFieldwidget extends StatelessWidget {
  final Icon prefixIcon;
  final String? hintText;
  final Function(String)? onChangeFun;

  const CommonFormFieldwidget(
      {super.key,
      required this.prefixIcon,
      required this.onChangeFun,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChangeFun,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: blackColor.withOpacity(0.3),
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: appthemeColor,
        isDense: true,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: appthemeColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: appthemeColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: appthemeColor)),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final String imgPath;
  final String title;
  const ProductWidget({super.key, required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: appthemeColor,
            radius: 50.5,
            child:
                CircleAvatar(radius: 50, backgroundImage: AssetImage(imgPath)),
          ),
          const SpaceHeightWidget(height: 5),
          Text(
            title,
          )
        ],
      ),
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String productCode;
  const ProductItemWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.productCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: whiteColor, width: 0.5)),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpaceHeightWidget(height: 5),
                Text(
                  title.toUpperCase(),
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      fontFamily: "PoppinsRegular"),
                ),
                Text(
                  "Code: $productCode",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  const CategoryWidget(
      {super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: appthemeColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                imagePath,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          const SpaceHeightWidget(height: 10)
        ],
      ),
    );
  }
}

class ActiveDot extends StatelessWidget {
  final Color? fillColor;
  const ActiveDot({super.key, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: fillColor ?? appthemeColor),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: CircleAvatar(
        backgroundColor: appthemeColor.withOpacity(0.4),
        radius: 4,
        child: CircleAvatar(
          radius: 3,
          backgroundColor: whiteColor,
        ),
      ),
    );
  }
}

class SopInactiveDot extends StatelessWidget {
  const SopInactiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.8,
      width: 7.8,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: naviBlue)),
    );
  }
}

class CartBannerWidget extends StatelessWidget {
  final int itemCount;
  final String itemAmount;
  const CartBannerWidget(
      {super.key, required this.itemCount, required this.itemAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightAppThemeColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Cart",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Total Items: $itemCount",
                  style: const TextStyle(fontSize: 12),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outlined,
                      color: appthemeColor,
                    ),
                    const SpaceWidthWidget(width: 5),
                    Text(
                      "FREE Delivery",
                      style: TextStyle(color: appthemeColor),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "₹ $itemAmount",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Text(
                  "(incl.of all taxes)",
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CartItemCountWidget extends StatelessWidget {
  final String itemName;
  final String imgPath;
  final String categoryName;
  final String mrpRate;
  final String itemRate;
  final int itemCount;
  final VoidCallback itemAddFun;
  final VoidCallback itemRemoveFun;
  final VoidCallback addItemFun;
  const CartItemCountWidget(
      {super.key,
      required this.itemName,
      required this.imgPath,
      required this.categoryName,
      required this.mrpRate,
      required this.itemRate,
      required this.itemCount,
      required this.itemAddFun,
      required this.addItemFun,
      required this.itemRemoveFun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  imgPath,
                  height: 90,
                ),
              ),
              // const SpaceWidthWidget(width: 13),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$itemCount x $itemName"),
                    Text(
                      categoryName,
                      style: const TextStyle(fontSize: 10),
                    ),
                    Row(children: [
                      const Text(
                        "MRP ₹ ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text("$mrpRate.00",
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              fontWeight: FontWeight.normal)),
                    ]),
                    Text("₹ $itemRate"),
                    const Text(
                      "(incl.of all taxes)",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          ),
          itemCount > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: itemRemoveFun,
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: redColor,
                          ),
                        ),
                        const SpaceWidthWidget(width: 10),
                        Text(itemCount.toString()),
                        const SpaceWidthWidget(width: 10),
                        IconButton(
                          onPressed: itemAddFun,
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: greenColor,
                          ),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: redColor,
                        ))
                  ],
                )
              : CustomElevatedButton(onTapFun: addItemFun, title: "Add Item")
        ],
      ),
    );
  }
}

class CartItemAmounttDetailsWidget extends StatelessWidget {
  final String mrpRate;
  final String distributerPrice;
  final String deliveryCharges;
  final String priceBeforeTax;
  final String taxAmount;
  const CartItemAmounttDetailsWidget(
      {super.key,
      required this.mrpRate,
      required this.distributerPrice,
      required this.deliveryCharges,
      required this.taxAmount,
      required this.priceBeforeTax});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text("Total price"), Text("MRP ₹ $mrpRate")],
        ),
        Divider(
          color: lightBlackColor,
        ),
        const Text("chreey"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Distributer price discount",
              style: TextStyle(color: middleBlackColor, fontSize: 12),
            ),
            Text("-₹ $distributerPrice",
                style: TextStyle(
                    color: greenColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600))
          ],
        ),
        Divider(
          color: lightBlackColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery charges",
              style: TextStyle(color: middleBlackColor, fontSize: 12),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Free   ",
                  style: TextStyle(
                      color: greenColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              TextSpan(
                  text: "₹ $deliveryCharges",
                  style: TextStyle(
                      color: middleBlackColor,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough))
            ]))
          ],
        ),
        Divider(
          color: lightBlackColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Price before taxes",
              style: TextStyle(color: middleBlackColor, fontSize: 12),
            ),
            Text("₹ $priceBeforeTax",
                style: TextStyle(
                  color: middleBlackColor,
                  fontSize: 12,
                ))
          ],
        ),
        Divider(
          color: lightBlackColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Taxes",
              style: TextStyle(color: middleBlackColor, fontSize: 12),
            ),
            Text("₹ $taxAmount",
                style: TextStyle(
                  color: middleBlackColor,
                  fontSize: 12,
                ))
          ],
        ),
      ]),
    );
  }
}

class CartPayBannerWidget extends StatelessWidget {
  final String savedAmount;
  final String finalAmount;
  const CartPayBannerWidget(
      {super.key, required this.savedAmount, required this.finalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: lightAppThemeColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "You Pay",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: appthemeColor,
                          size: 14,
                        ),
                        const SpaceWidthWidget(width: 5),
                        Text(
                          "Order Policy",
                          style: TextStyle(color: appthemeColor, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "₹ $finalAmount",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Text(
                      "(incl.of all taxes)",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: appthemeColor,
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outlined,
                color: whiteColor,
                size: 18,
              ),
              const SpaceWidthWidget(width: 5),
              Text(
                "You saved ₹ $savedAmount on this order",
                style: TextStyle(color: whiteColor, fontSize: 14),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool boldText;
  final VoidCallback onTapFun;
  const ProfileWidget(
      {super.key,
      required this.boldText,
      this.leadingIcon,
      required this.title,
      required this.onTapFun,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFun,
      child: ListTile(
          minLeadingWidth: 0,
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            leadingIcon,
            size: 19,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          trailing: Icon(trailingIcon)),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: lightBlackColor),
          color: lightAppThemeColor.withOpacity(0.3)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Conversion to ADS Partner completed",
                style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
            Text("2 hr ago",
                style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    color: middleBlackColor,
                    fontSize: 9))
          ],
        ),
        Text(
            "Congratulations! You are appointed as an Insta 1 International Direct Selling Partner. Please fulfil the 30 days required Sales Criteria and Certification to continue to maintain ADS Partner status and sponsoring eligibility.",
            style: TextStyle(
                fontFamily: "PoppinsRegular",
                color: middleBlackColor,
                fontSize: 11)),
      ]),
    );
  }
}

class AboutUsScreenWidget extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  final IconData leadingIcon;
  const AboutUsScreenWidget(
      {super.key,
      required this.onTapFun,
      required this.title,
      required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapFun,
          dense: true,
          leading: CircleAvatar(
            radius: 15,
            backgroundColor: lightBlackColor.withOpacity(0.1),
            child: Icon(
              leadingIcon,
              size: 18,
              color: blackColor.withOpacity(0.5),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontFamily: "OnestRegular"),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ),
        Divider(
          color: lightAppThemeColor,
          thickness: 2,
          height: 0,
        )
      ],
    );
  }
}

class MyOrderItemWidget extends StatelessWidget {
  final String itemName;
  final String imgPath;
  final VoidCallback shippingFun;
  final VoidCallback invoiceFun;
  final String mrpRate;
  final String date;
  final String ordercode;
  final bool loading;
  const MyOrderItemWidget(
      {super.key,
      required this.loading,
      required this.shippingFun,
      required this.itemName,
      required this.imgPath,
      required this.mrpRate,
      required this.ordercode,
      required this.invoiceFun,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: lightDarKBlue.withOpacity(0.3))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CommonCachedNetworkImage(imagePath: imgPath),
                  Image.asset(
                    imgPath,
                    height: 90,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemName.toUpperCase(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 16,
                              color: lightDarKBlue),
                        ),
                        const Text(
                          " Buy",
                          style: TextStyle(
                            fontFamily: "OnestRegular",
                            fontSize: 10,
                          ),
                        ),
                        const SpaceHeightWidget(height: 15),
                        SizedBox(
                            height: 25,
                            width: 120,
                            child: loading
                                ? loader
                                : CommonOulineTextButton(
                                    onTapFun: shippingFun,
                                    title: "Shipping History"))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SpaceHeightWidget(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: lightDarKBlue.withOpacity(0.15),
              child: Column(children: [
                ViewProfileWidget(title: "Order Placed", info: date),
                ViewProfileWidget(title: "Total Amount", info: mrpRate),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SideTitle(title: "Order# $ordercode"),
                    SizedBox(
                        height: 28,
                        width: 100,
                        child: CustomElevatedButton(
                            onTapFun: invoiceFun, title: "Invoice"))
                  ],
                )
              ]),
            )
          ],
        ));
  }
}

class UnderLineTextButton extends StatelessWidget {
  final VoidCallback onTapFun;
  final String titile;
  final double fontSize;
  const UnderLineTextButton(
      {super.key,
      required this.onTapFun,
      required this.titile,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapFun,
        child: Container(
          padding: const EdgeInsets.only(bottom: 0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: appthemeColor,
          ))),
          child: Text(
            titile,
            style: TextStyle(fontFamily: "OnestRegular", fontSize: fontSize),
          ),
        ));
  }
}

class CommonUnderlineTextForm extends StatelessWidget {
  final Function(String)? onChangeFun;
  final String hintText;
  final String? Function(String?)? validation;
  const CommonUnderlineTextForm(
      {super.key,
      required this.onChangeFun,
      required this.hintText,
      required this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChangeFun,
      keyboardType: TextInputType.name,
      validator: validation,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: lightBlackColor),
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: lightBlackColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: lightBlackColor),
        ),
      ),
    );
  }
}

class VersionText extends StatelessWidget {
  const VersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "version ${Constants.appversion}",
      style: TextStyle(
          fontFamily: "OnestLight",
          color: middleBlackColor.withOpacity(0.5),
          fontSize: 11),
    );
  }
}

class SearchWidget extends StatelessWidget {
  final VoidCallback onTapFun;
  final String hintText;
  final Color borderColor;
  const SearchWidget(
      {super.key,
      required this.onTapFun,
      required this.hintText,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTapFun,
      child: Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(20),
              color: whiteColor),
          child: Row(children: [
            const SpaceWidthWidget(width: 10),
            Icon(
              FeatherIcons.search,
              size: 18,
              color: blackColor.withOpacity(0.3),
            ),
            const SpaceWidthWidget(width: 10),
            Text(
              hintText,
              style: TextStyle(
                color: blackColor.withOpacity(0.3),
                fontSize: 14,
              ),
            )
          ])),
    );
  }
}

class FreeDeliveryBanner extends StatelessWidget {
  final String amount;
  const FreeDeliveryBanner({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      color: lightAmberColor,
      child: Row(
        children: [
          const SpaceWidthWidget(width: 20),
          Icon(
            Icons.shopping_cart_outlined,
            color: greenColor.withOpacity(0.7),
          ),
          const SpaceWidthWidget(width: 20),
          Text(
            "Free delivery! When order up to $amount RM",
            style: TextStyle(color: limeColor, fontFamily: "OnestRegular"),
          )
        ],
      ),
    );
  }
}

class CommonOulineTextButton extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  final Color? borderColor;
  final Color? textColor;
  final double? titleFontSize;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  const CommonOulineTextButton(
      {super.key,
      required this.onTapFun,
      required this.title,
      this.titleFontSize,
      this.borderColor,
      this.padding,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTapFun,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            padding: MaterialStatePropertyAll(padding ?? EdgeInsets.zero),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                side: BorderSide(color: borderColor ?? appthemeColor),
                borderRadius: BorderRadius.circular(15)))),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "OnestSemiBold",
              fontSize: titleFontSize ?? 12,
              color: textColor ?? blackColor),
        ));
  }
}

class PromotionItemWidget extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String amount;
  final bool exclusiveProduct;
  final Color? amountColor;
  final VoidCallback onTapFun;
  const PromotionItemWidget({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.amount,
    this.amountColor,
    required this.onTapFun,
    required this.exclusiveProduct,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTapFun,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: whiteColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.5),
            border: Border.all(color: lightBlackColor, width: 0.3),
            color: whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SpaceHeightWidget(height: 5),
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      imagePath.contains("assets")
                          ? Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 3),
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(
                                imagePath,
                                height: 100,
                                width: 100,
                                // fit: BoxFit.fill,
                              ),
                            )
                          : CommonCachedNetworkImage(imagePath: imagePath),
                      if (exclusiveProduct)
                        Container(
                          height: 25,
                          width: 132,
                          decoration: BoxDecoration(
                              color: darkBlue.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SpaceWidthWidget(width: 3),
                              CircleAvatar(
                                  radius: 10,
                                  backgroundColor: whiteColor,
                                  child: Icon(
                                    Icons.person_outline_sharp,
                                    color: naviBlue,
                                    size: 15,
                                  )),
                              const SpaceWidthWidget(width: 5),
                              Text(
                                "Exclusive product",
                                style:
                                    TextStyle(color: whiteColor, fontSize: 12),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      itemName.toString(),
                      // .capitalize.toString().replaceAll("d1", "D1"),
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: "OnestSemiBold", fontSize: 12),
                    ),
                  ),
                ],
              ),
              if (amount != "")
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("RM ",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold",
                                  fontSize: 14,
                                  color: amountColor ?? blackColor)),
                          Text(
                            amount,
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 20,
                                color: amountColor ?? blackColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              const SpaceHeightWidget(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenProductCategory extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double? height;
  final double? width;
  const HomeScreenProductCategory(
      {super.key,
      required this.imagePath,
      required this.productName,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: width ?? 70,
      height: height ?? 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            child: Image.asset(
              imagePath,
              // height: 80,
            ),
          ),
          Text(
            productName,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(fontFamily: "OnestLight", fontSize: 10),
          )
        ],
      ),
    );
  }
}

class CommonTitle extends StatelessWidget {
  final String titleName;
  final String? fontFamily;
  final double? size;
  final Color? fontColor;
  final TextAlign? textAlign;
  const CommonTitle(
      {super.key,
      required this.titleName,
      this.fontFamily,
      this.textAlign,
      this.size,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleName,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          fontFamily: fontFamily ?? "OnestSemiBold",
          fontSize: size ?? 18,
          color: fontColor),
    );
  }
}

class RightArrow extends StatelessWidget {
  final Color arrowColor;
  const RightArrow({super.key, required this.arrowColor});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/arrow_right.png",
      color: arrowColor,
      width: 30,
    );
  }
}

class HomeScreenNewArrivalItemWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTapFun;
  final String itemName;
  final String amount;
  const HomeScreenNewArrivalItemWidget({
    super.key,
    required this.onTapFun,
    required this.imagePath,
    required this.itemName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTapFun,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: whiteColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.5),
            border: Border.all(color: lightBlackColor, width: 0.3),
            color: whiteColor,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  imagePath,
                  height: 90,
                  width: 90,
                  // fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName.capitalize.toString().replaceAll("d1", "D1"),
                        maxLines: 2,
                        style: const TextStyle(fontFamily: "OnestRegular"),
                      ),
                      const SpaceHeightWidget(height: 8),
                      Row(
                        children: [
                          Text("RM ",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold",
                                  fontSize: 14,
                                  color: blackColor)),
                          Text(
                            amount,
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 18,
                                color: blackColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeeNewAllProductsBanner extends StatelessWidget {
  final VoidCallback onTapFun;
  const SeeNewAllProductsBanner({super.key, required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFun,
      child: Container(
        height: 50,
        width: double.infinity,
        color: lightAmberColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "See all new product details.",
              style: TextStyle(
                  fontFamily: "OnestMedium",
                  fontSize: 12,
                  // fontWeight: FontWeight.w600,
                  color: greenColor),
            ),
            RightArrow(arrowColor: greenColor)
          ]),
        ),
      ),
    );
  }
}

class SopWidget extends StatelessWidget {
  const SopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: double.infinity,
      color: darkBlue.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SOP Customize",
                      style: TextStyle(
                          color: darkBlue.withOpacity(0.7),
                          fontFamily: "OnestBold",
                          fontSize: 19),
                    ),
                    SizedBox(
                      height: 28,
                      width: 65,
                      child: CommonOulineTextButton(
                        onTapFun: () {},
                        title: "See all",
                        borderColor: darkBlue,
                        textColor: darkBlue,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                    "Save more....when select to subscribe with the solution.",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "OnestRegular",
                      fontSize: 12.5,
                      color: lightDarKBlue,
                    )),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/truck.png",
                      height: 20,
                      color: lightDarKBlue,
                    ),
                    const SpaceWidthWidget(width: 5),
                    Text("Delivery free",
                        style: TextStyle(
                          fontFamily: "OnestRegular",
                          fontSize: 11.5,
                          color: lightDarKBlue,
                        )),
                    const SpaceWidthWidget(width: 5),
                    Container(
                      height: 15,
                      width: 1.2,
                      color: lightDarKBlue,
                    ),
                    const SpaceWidthWidget(width: 5),
                    Image.asset(
                      "assets/images/offer_tag.png",
                      height: 20,
                      color: lightDarKBlue,
                    ),
                    const SpaceWidthWidget(width: 5),
                    Text("Get discount",
                        style: TextStyle(
                          fontFamily: "OnestRegular",
                          fontSize: 11.5,
                          color: lightDarKBlue,
                        )),
                    const SpaceWidthWidget(width: 5),
                    Container(
                      height: 15,
                      width: 1.2,
                      color: lightDarKBlue,
                    ),
                    const SpaceWidthWidget(width: 10),
                    Image.asset(
                      "assets/images/gift.png",
                      height: 15,
                      color: lightDarKBlue,
                    ),
                    const SpaceWidthWidget(width: 5),
                    Text("More privileged",
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "OnestRegular",
                          fontSize: 11.5,
                          color: lightDarKBlue,
                        )),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: lightDarKBlue.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}

class SopCarouselWidget extends StatelessWidget {
  final String imagePath;
  final Color imageContainerColor;
  final String amount;
  final IconElevatedButton elevatedButton;
  final String twelvthPurchaseDiscount;
  final String sixthPurchaseDiscount;
  const SopCarouselWidget({
    super.key,
    required this.imagePath,
    required this.amount,
    required this.imageContainerColor,
    required this.elevatedButton,
    required this.twelvthPurchaseDiscount,
    required this.sixthPurchaseDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: imageContainerColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        imagePath,
                        height: 70,
                        width: 70,
                        // fit: BoxFit.fill,
                      ),
                    ),
                    const SpaceWidthWidget(width: 5),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customize Solution",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontFamily: "OnestSemiBold",
                                      fontSize: 12.5,
                                      color: blackColor),
                                ),
                                Text(
                                  "Design your own SOP\nSolution for better health.",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontFamily: "OnestRegular",
                                      fontSize: 15.5,
                                      color: blackColor.withOpacity(0.85)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SpaceHeightWidget(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("RM ",
                            style: TextStyle(
                                fontFamily: "OnestRegular",
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                color: blackColor)),
                        Text(
                          amount,
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 20,
                              color: blackColor,
                              height: 1.6),
                        ),
                        const SpaceWidthWidget(width: 8),
                        Text(
                          "Start",
                          style: TextStyle(
                              fontFamily: "OnestRegular",
                              fontSize: 13,
                              color: blackColor.withOpacity(0.3),
                              height: 2.5),
                        )
                      ],
                    ),
                    SizedBox(height: 40, width: 119, child: elevatedButton)
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            child: Container(
              height: 57,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: darkBlue.withOpacity(0.1),
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(darkBlue, BlendMode.color),
                    image: const AssetImage("assets/images/tag_banner.png"),
                    fit: BoxFit.fill),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: darkBlue.withOpacity(0.7),
                        radius: 2,
                      ),
                      const SpaceWidthWidget(width: 10),
                      Text(
                          "Discount $twelvthPurchaseDiscount% in the 12th purchase",
                          style: TextStyle(
                            fontFamily: "OnestSemiBold",
                            fontSize: 12,
                            color: darkBlue.withOpacity(0.7),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: darkBlue.withOpacity(0.7),
                        radius: 2,
                      ),
                      const SpaceWidthWidget(width: 10),
                      Text(
                          "Discount $sixthPurchaseDiscount% in the 6th purchase",
                          style: TextStyle(
                            fontFamily: "OnestSemiBold",
                            fontSize: 12,
                            color: darkBlue.withOpacity(0.7),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IconElevatedButton extends StatelessWidget {
  final VoidCallback onTapFun;
  final String imagePath;
  final String titile;
  final Color buttonColor;
  final Color labelColor;
  const IconElevatedButton(
      {super.key,
      required this.imagePath,
      required this.onTapFun,
      required this.buttonColor,
      required this.labelColor,
      required this.titile});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style:
            ButtonStyle(backgroundColor: MaterialStatePropertyAll(buttonColor)),
        onPressed: onTapFun,
        icon: Image.asset(
          imagePath,
          color: labelColor,
          height: 22,
        ),
        label: Text(
          titile,
          style: TextStyle(
              color: labelColor, fontFamily: "OnestSemiBold", fontSize: 14),
        ));
  }
}

class CategroyItemWidget extends StatelessWidget {
  final String imagePath;
  final String titile;
  final VoidCallback onTapFun;
  final String? amount;
  const CategroyItemWidget(
      {super.key,
      required this.imagePath,
      required this.titile,
      this.amount,
      required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTapFun,
      child: Card(
        color: whiteColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: lightBlackColor, width: 0.2),
              color: whiteColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonCachedNetworkImage(
                  imagePath: imagePath,
                  height: 95,
                ),
                // CachedNetworkImage(
                //   imageUrl: imagePath,
                //   height: 100,
                //   progressIndicatorBuilder: (context, url, progress) => loader,
                //   errorWidget: (context, url, error) => Image.asset(
                //     "assets/images/new_logo.png",
                //     height: 100,
                //   ),
                // ),
                const SpaceHeightWidget(height: 5),
                Text(
                  titile.toString(),
                  // capitalizeFirst.toString().replaceAll("d1", "D1"),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "OnestSemiBold",
                      fontSize: 11,
                      color: blackColor),
                ),
                const SpaceHeightWidget(height: 5),
                if (amount != "" && amount != null)
                  Text(
                    "$amount",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 12,
                        color: blackColor),
                  ),
              ]),
        ),
      ),
    );
  }
}
// commonCachedNetworkImage

class CommonCachedNetworkImage extends StatelessWidget {
  final String imagePath;
  final double? height;
  final BoxFit? boxfit;
  const CommonCachedNetworkImage(
      {super.key, required this.imagePath, this.height, this.boxfit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      height: height,
      progressIndicatorBuilder: (context, url, progress) =>
          SizedBox(width: 80, child: loader),
      fit: boxfit,
      errorWidget: (context, url, error) => Image.asset(
        "assets/images/new_logo.png",
        height: height,
      ),
    );
  }
}

class PromotionScreenWidget extends StatelessWidget {
  final String imagePath;
  final String titile;
  final String date;
  final bool isBigPromotion;
  const PromotionScreenWidget(
      {super.key,
      required this.imagePath,
      required this.titile,
      required this.date,
      required this.isBigPromotion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: isBigPromotion
          ? MediaQuery.of(context).size.height * 0.45
          : MediaQuery.of(context).size.height * 0.3,
      width: isBigPromotion
          ? double.infinity
          : MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isBigPromotion
                ? MediaQuery.of(context).size.height * 0.35
                : MediaQuery.of(context).size.height * 0.2,
            width: isBigPromotion
                ? double.infinity
                : MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imagePath),
                )),
          ),
          const SpaceHeightWidget(height: 5),
          Text(
            titile,
            style: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 14, color: blackColor),
          ),
          const SpaceHeightWidget(height: 5),
          Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 10,
                color: blackColor.withOpacity(0.4),
              ),
              Text(
                "Start $date",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    fontSize: 12,
                    color: blackColor.withOpacity(0.4)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TriangleShape extends StatelessWidget {
  final Color triangleColor;
  const TriangleShape({super.key, required this.triangleColor});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomTriangleClipper(),
      child: Container(
        width: 40,
        height: 50,
        color: triangleColor,
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, 40);
    path.lineTo(40, size.width);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomMemberButton extends StatelessWidget {
  final Color activeColor;
  final String title;
  final Color textColor;
  final VoidCallback onTapFun;
  final String imagePath;
  const CustomMemberButton(
      {super.key,
      required this.activeColor,
      required this.title,
      required this.textColor,
      required this.imagePath,
      required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFun,
      child: Container(
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(25)),
        height: 35,
        width: 135,
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 24, bottom: 8, top: 8),
                decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                height: 35,
                child: Image.asset(
                  imagePath,
                  width: 21,
                  color: whiteColor,
                )),
            Positioned(
              left: 31,
              child: Transform.rotate(
                  angle: 10.5,
                  child: TriangleShape(
                    triangleColor: whiteColor,
                  )),
            ),
            Positioned(
              left: 45,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 10, fontFamily: "OnestBold", color: textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PrivilegeBanner extends StatelessWidget {
  final String days;
  const PrivilegeBanner({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightAmberColor,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/gift_member.png",
            height: 60,
          ),
          const SpaceWidthWidget(width: 5),
          Flexible(
            child: Text(
              "More privileges! for New applicants of the first $days days.",
              style: TextStyle(
                  fontFamily: "OnestRegular", fontSize: 12, color: greenColor),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBulletTextWidget extends StatelessWidget {
  final String data;
  final double? verticalPadding;
  final Color? textColor;
  const CustomBulletTextWidget(
      {super.key, required this.data, this.textColor, this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding ?? 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(0, 6),
            child: CircleAvatar(
              radius: 3,
              backgroundColor: textColor ?? blackColor,
            ),
          ),
          const SpaceWidthWidget(width: 10),
          Flexible(
              child: Text(
            data,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: textColor ?? blackColor,
                height: 1.5,
                fontSize: 12,
                fontFamily: "OnestRegular"),
          ))
        ],
      ),
    );
  }
}

PreferredSizeWidget commonAppBar(
    {BuildContext? context,
    String? title,
    VoidCallback? onTapFun,
    Widget? action,
    bool backNavigation = false}) {
  return AppBar(
      backgroundColor: lightBlackColor,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          color: whiteColor,
          margin: const EdgeInsets.all(0),
          borderOnForeground: false,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ListTile(
              minLeadingWidth: 0,
              leading: backNavigation
                  ? IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                      ),
                      onPressed: onTapFun ??
                          () {
                            Get.back();
                            // Navigator.pop(context!);
                          },
                    )
                  : const SizedBox.shrink(),
              title: Text(
                title ?? "",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    overflow: TextOverflow.ellipsis,
                    fontSize: title!.length > 20 ? 16 : 18),
              ),
              trailing: action,
            ),
          ),
        ),
      ));
}

class ProductAmountDetailsWidget extends StatelessWidget {
  final String title;
  final String productCode;
  final String cv;
  // final String memberPrice;
  final String price;

  const ProductAmountDetailsWidget(
      {super.key,
      // required this.memberPrice,
      required this.productCode,
      required this.cv,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 18, color: blackColor),
          ),
          const SpaceHeightWidget(height: 10),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Product Code: ",
              style: TextStyle(
                  fontFamily: "OnestSemiBold",
                  fontSize: 14,
                  color: blackColor.withOpacity(0.4)),
            ),
            TextSpan(
              text: productCode,
              style: TextStyle(
                  fontFamily: "OnestSemiBold",
                  fontSize: 14,
                  color: blackColor.withOpacity(0.4)),
            )
          ])),
          const SpaceHeightWidget(height: 10),
          if (cv != "0")
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "CV: ",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    fontSize: 14,
                    color: blackColor.withOpacity(0.4)),
              ),
              TextSpan(
                text: cv,
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    fontSize: 14,
                    color: blackColor.withOpacity(0.4)),
              )
            ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //     Row(
              //       children: [
              //         Text(
              //           "Member price",
              //           style: TextStyle(
              //               fontFamily: "OnestRegular",
              //               fontSize: 12,
              //               color: blackColor),
              //         ),
              //         const SpaceWidthWidget(width: 5),
              //         Text(
              //           "฿ $memberPrice",
              //           style: TextStyle(
              //               fontFamily: "OnestSemiBold",
              //               fontSize: 14,
              //               color: blackColor),
              //         ),
              //       ],
              //     ),
              if (price != "")
                Row(
                  children: [
                    Text(
                      "Price: ",
                      style: TextStyle(
                          fontFamily: "OnestSemiBold",
                          fontSize: 14,
                          color: blackColor.withOpacity(0.4)),
                    ),
                    const SpaceWidthWidget(width: 5),
                    Text(
                      price,
                      style: TextStyle(
                          fontFamily: "OnestSemiBold",
                          fontSize: 20,
                          color: blackColor),
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}

class CommonCarousel extends StatelessWidget {
  final int currentIndex;
  final List<String> images;
  final bool? autoPlay;
  final VoidCallback? onTapFun;
  final Function(int, CarouselPageChangedReason)? onchangedFun;
  const CommonCarousel(
      {super.key,
      required this.onchangedFun,
      required this.currentIndex,
      this.autoPlay,
      this.onTapFun,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, i, rindex) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: onTapFun,
                      child: CommonCachedNetworkImage(
                          imagePath: images[i], boxfit: BoxFit.fill),
                    ),
                  ));
            },
            options: CarouselOptions(
                // pageSnapping: false,
                viewportFraction: 0.95,
                padEnds: false,
                autoPlay: autoPlay ?? true,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: onchangedFun)),
        const SpaceHeightWidget(height: 10),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (int i = 0; i < images.length; i++)
                (i == currentIndex)
                    ? const ActiveDot()
                    : const SopInactiveDot(),
            ],
          ),
        ),
      ],
    );
  }
}

class CommonDivider extends StatefulWidget {
  const CommonDivider({super.key});

  @override
  State<CommonDivider> createState() => _CommonDividerState();
}

class _CommonDividerState extends State<CommonDivider> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: blackColor.withOpacity(0.1),
      thickness: 1,
      height: 0,
    );
  }
}

// class CartItemWidget extends StatelessWidget {
//   final VoidCallback removeFun;
//   final VoidCallback addFun;
//   final int itemCount;
//   final String productCode;
//   final String itemname;
//   final String imagePath;
//   final String actualItemPrice;
//   final String itemsPrice;
//   final String memberPrice;

//   const CartItemWidget(
//       {super.key,
//       required this.removeFun,
//       required this.addFun,
//       required this.actualItemPrice,
//       required this.imagePath,
//       required this.itemname,
//       required this.itemsPrice,
//       required this.memberPrice,
//       required this.productCode,
//       required this.itemCount});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("#$productCode",
//                   style: TextStyle(
//                       fontFamily: "OnestRegular",
//                       fontSize: 12,
//                       color: blackColor.withOpacity(0.5))),
//               const SpaceHeightWidget(height: 5),
//               Image.asset(
//                 imagePath,
//                 height: 90,
//                 width: 90,
//                 // fit: BoxFit.fill,
//               )
//             ],
//           ),
//           const SpaceWidthWidget(width: 10),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   itemname,
//                   maxLines: 3,
//                   style: TextStyle(
//                       fontFamily: "OnestRegular",
//                       fontSize: 11,
//                       color: blackColor),
//                 ),
//                 const SpaceHeightWidget(height: 10),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       height: 28,
//                       // width: 120,
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all()),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           InkWell(
//                               onTap: removeFun,
//                               child: Icon(
//                                 Icons.remove_outlined,
//                                 color: blackColor,
//                                 size: 15,
//                               )),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Text(
//                               itemCount.toString(),
//                               style: TextStyle(
//                                   color: blackColor,
//                                   fontFamily: "OnestRegular"),
//                             ),
//                           ),
//                           InkWell(
//                               onTap: addFun,
//                               child: Icon(
//                                 size: 15,
//                                 Icons.add,
//                                 color: blackColor,
//                               ))
//                         ],
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           "3 x ฿ $actualItemPrice",
//                           style: TextStyle(
//                               fontFamily: "OnestRegular",
//                               fontSize: 12.5,
//                               color: blackColor.withOpacity(0.5)),
//                         ),
//                         Text(
//                           "฿ $itemsPrice",
//                           style: TextStyle(
//                               fontFamily: "OnestSemiBold",
//                               color: lightDarKBlue,
//                               fontSize: 14),
//                         ),
//                         Text(
//                           "Member Price $memberPrice",
//                           maxLines: 2,
//                           style: TextStyle(
//                               fontFamily: "OnestRegular",
//                               fontSize: 12,
//                               color: blackColor),
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class CartItemWidget extends StatelessWidget {
  final VoidCallback removeFun;
  final String itemCount;
  final String productCode;
  final String itemname;
  final String imagePath;
  final String itemsPrice;
  final bool? removeCartOption;

  const CartItemWidget(
      {super.key,
      this.removeCartOption,
      required this.removeFun,
      required this.imagePath,
      required this.itemname,
      required this.itemsPrice,
      required this.productCode,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonCachedNetworkImage(
            imagePath: imagePath,
            height: 90,
          ),
          const SpaceWidthWidget(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  itemname,
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: "OnestRegular",
                      fontSize: 11,
                      color: blackColor),
                ),
                const SpaceHeightWidget(height: 5),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Product Code: ",
                    style: TextStyle(
                        fontFamily: "OnestRegular",
                        fontSize: 12,
                        color: blackColor.withOpacity(0.7)),
                  ),
                  TextSpan(
                      text: productCode,
                      style: TextStyle(
                          fontFamily: "OnestRegular",
                          fontSize: 12,
                          color: blackColor.withOpacity(0.5)))
                ])),
                const SpaceHeightWidget(height: 5),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Quantity: ",
                    style: TextStyle(
                        fontFamily: "OnestRegular",
                        fontSize: 12,
                        color: blackColor.withOpacity(0.7)),
                  ),
                  TextSpan(
                      text: itemCount,
                      style: TextStyle(
                          fontFamily: "OnestRegular",
                          fontSize: 12,
                          color: blackColor.withOpacity(0.5)))
                ])),
                const SpaceHeightWidget(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "MRP: ",
                        style: TextStyle(
                            fontFamily: "OnestRegular",
                            fontSize: 12,
                            color: blackColor.withOpacity(0.7)),
                      ),
                      TextSpan(
                          text: itemsPrice,
                          style: TextStyle(
                              fontFamily: "OnestRegular",
                              fontSize: 12,
                              color: blackColor.withOpacity(0.5)))
                    ])),
                    if (removeCartOption != true)
                      GestureDetector(
                          onTap: removeFun,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: darkRedColor,
                            child: Icon(
                              Icons.delete_forever,
                              color: whiteColor,
                              size: 17,
                            ),
                          ))
                  ],
                ),
                const SpaceHeightWidget(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CheckOutItemWidget extends StatelessWidget {
  final VoidCallback removeFun;
  final VoidCallback addFun;
  final int itemCount;
  final String productCode;
  final String itemname;
  final String imagePath;
  final String actualItemPrice;
  final String itemsPrice;

  const CheckOutItemWidget(
      {super.key,
      required this.removeFun,
      required this.addFun,
      required this.actualItemPrice,
      required this.imagePath,
      required this.itemname,
      required this.itemsPrice,
      required this.productCode,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 90,
            width: 90,
            fit: BoxFit.fill,
          ),
          const SpaceWidthWidget(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemname,
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: "OnestSemiBold",
                      fontSize: 12,
                      color: blackColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("ProductCode: ",
                            style: TextStyle(
                                fontFamily: "OnestRegular",
                                fontSize: 12,
                                color: blackColor.withOpacity(0.6))),
                        Text(productCode,
                            style: TextStyle(
                                fontFamily: "OnestRegular",
                                fontSize: 12,
                                color: blackColor)),
                      ],
                    ),
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: Icon(
                          FeatherIcons.trash2,
                          size: 16,
                          color: blackColor.withOpacity(0.7),
                        ))
                  ],
                ),
                const SpaceHeightWidget(height: 5),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "\$",
                        style: TextStyle(fontSize: 12, color: blackColor),
                      ),
                      TextSpan(
                        text: actualItemPrice,
                        style: TextStyle(
                            fontFamily: "OnestSemiBold",
                            fontSize: 14,
                            color: blackColor),
                      )
                    ])),
                    const SpaceWidthWidget(width: 5),
                    SizedBox(
                      height: 30,
                      child: CommonOulineTextButton(
                        onTapFun: () {},
                        title: "In Stock",
                        titleFontSize: 12,
                        backgroundColor: greenColor.withOpacity(0.1),
                        textColor: greenColor,
                        borderColor: greenColor.withOpacity(0.01),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 28,
                      // width: 120,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: removeFun,
                              child: Icon(
                                Icons.remove_outlined,
                                color: blackColor,
                                size: 15,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              itemCount.toString(),
                              style: TextStyle(
                                  color: blackColor,
                                  fontFamily: "OnestRegular"),
                            ),
                          ),
                          InkWell(
                              onTap: addFun,
                              child: Icon(
                                size: 15,
                                Icons.add,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(fontSize: 12, color: blackColor),
                          ),
                          TextSpan(
                            text: itemsPrice,
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 14,
                                color: blackColor),
                          )
                        ])),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_outlined,
                              color: lightDarKBlue,
                              size: 18,
                            ),
                            Text(
                              "35 AmPerks Points",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold",
                                  color: lightDarKBlue,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RegisterTitleWidget extends StatelessWidget {
  final String title;
  const RegisterTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: "OnestRegular", color: brownColor, fontSize: 15),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? padding;
  final Color? borderColor;
  final String hintText;
  final String labelText;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final TextInputType textInputType;
  final String? Function(String?)? validation;
  final List<TextInputFormatter>? inputFormatter;
  final Function(PointerDownEvent)? outsideFun;
  final VoidCallback? onTapFun;
  final bool? readOnly;
  final Function(String)? onchangeFun;
  final VoidCallback? editFun;
  final Function(String)? filedSubmitFun;

  const RegisterTextField(
      {super.key,
      this.filedSubmitFun,
      required this.controller,
      this.onchangeFun,
      this.editFun,
      this.padding,
      this.readOnly,
      this.onTapFun,
      this.outsideFun,
      this.borderColor,
      this.inputFormatter,
      this.textAlignVertical,
      this.focusNode,
      required this.hintText,
      required this.textInputType,
      required this.validation,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 10),
      child: TextFormField(
        onEditingComplete: editFun,
        onChanged: onchangeFun,
        readOnly: readOnly ?? false,
        onTap: onTapFun,
        onFieldSubmitted: filedSubmitFun,
        onTapOutside: outsideFun,
        focusNode: focusNode,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: textInputType,
        style: TextStyle(
            fontFamily: "OnestSemiBold",
            fontSize: 14,
            color: blackColor.withOpacity(0.6)),
        validator: validation,
        inputFormatters: inputFormatter ?? [],
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? lightDarKBlue.withOpacity(0.3))),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: "OnestRegular",
                fontSize: 14,
                color: blackColor.withOpacity(0.5)),
            label: Text(labelText),
            labelStyle: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 14, color: blackColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? lightDarKBlue.withOpacity(0.3))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(width: 3.5, color: blueColor.withOpacity(0.5)))),
      ),
    );
  }
}

class RegisterDropDown extends StatelessWidget {
  final void Function(String?)? onChangedFun;
  final List<String> items;
  final String? value;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validationFun;
  const RegisterDropDown(
      {super.key,
      required this.onChangedFun,
      this.validationFun,
      this.value,
      this.labelText,
      this.hintText,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // height: 40,
      child: DropdownButtonFormField<String>(
          // menuMaxHeight: 20,
          // itemHeight: 40,
          // value: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validationFun,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: blackColor.withOpacity(0.5),
          ),
          isDense: true,
          decoration: InputDecoration(
              fillColor: whiteColor,
              filled: true,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: lightDarKBlue.withOpacity(0.3))),
              labelText: labelText,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: "OnestRegular",
                  fontSize: 14,
                  color: blackColor.withOpacity(0.5)),
              labelStyle: TextStyle(
                  fontFamily: "OnestSemiBold", fontSize: 14, color: blackColor),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: lightDarKBlue.withOpacity(0.3))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      width: 3.5, color: blueColor.withOpacity(0.5)))),
          padding: const EdgeInsets.all(0),
          borderRadius: BorderRadius.circular(5),
          style: TextStyle(
              fontFamily: "OnestRegular", color: blackColor.withOpacity(0.7)),
          items: items
              .map((e) =>
                  DropdownMenuItem<String>(value: e, child: Text(e.toString())))
              .toList(),
          onChanged: onChangedFun),
    );
  }
}

class CheckoutSigninReqWidget extends StatelessWidget {
  const CheckoutSigninReqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blueColor.withOpacity(0.15)),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Get.to(() => const LoginScreen());
          },
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor,
                    fontSize: 12)),
            TextSpan(
                text: "Sign in for faster checkout.",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor,
                    fontSize: 12))
          ])),
        ),
        const SpaceHeightWidget(height: 10),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Get.to(() => const CountySelectScreen());
          },
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "New to Amway? ",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor,
                    fontSize: 12)),
            TextSpan(
                text: "Create an account ",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor,
                    fontSize: 12)),
            TextSpan(
                text: "and shop with the benefits of a Registered Customer.",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor,
                    fontSize: 12)),
          ])),
        ),
      ]),
    );
  }
}

class CheckoutOrderSummaryWidget extends StatelessWidget {
  final String subtotal;
  final String shippingAmount;
  final String grandTotal;
  const CheckoutOrderSummaryWidget(
      {super.key,
      required this.grandTotal,
      required this.shippingAmount,
      required this.subtotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blueColor.withOpacity(0.08)),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Order Summary",
          style: TextStyle(
              fontFamily: "OnestSemiBold", color: blackColor, fontSize: 15.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor.withOpacity(0.6),
                    fontSize: 13),
              ),
              Text(
                "\$ $subtotal",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor.withOpacity(0.6),
                    fontSize: 13),
              ),
            ],
          ),
        ),
        const CommonDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Estimated Shipping",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor.withOpacity(0.6),
                    fontSize: 13),
              ),
              Text(
                "\$ $shippingAmount",
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    color: blackColor.withOpacity(0.6),
                    fontSize: 13),
              ),
            ],
          ),
        ),
        const CommonDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Estimated Total",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor.withOpacity(0.8),
                    fontSize: 13),
              ),
              Text(
                "\$ $grandTotal",
                style: TextStyle(
                    fontFamily: "OnestSemiBold",
                    color: blackColor.withOpacity(0.8),
                    fontSize: 13),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class CheckoutAddCouponWidget extends StatelessWidget {
  final String? Function(String?)? validation;
  final TextEditingController controller;
  final VoidCallback applyButtonFun;

  const CheckoutAddCouponWidget(
      {super.key,
      required this.validation,
      required this.controller,
      required this.applyButtonFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blueColor.withOpacity(0.08)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add a Coupon Code",
            style: TextStyle(
                fontFamily: "OnestSemiBold", color: blackColor, fontSize: 15.5),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: RegisterTextField(
                    borderColor: blackColor.withOpacity(0.5),
                    controller: controller,
                    hintText: "Enter Coupon Code",
                    textInputType: TextInputType.name,
                    validation: validation,
                    labelText: ""),
              ),
              const SpaceWidthWidget(width: 10),
              Expanded(
                flex: 2,
                child: CommonOulineTextButton(
                  onTapFun: applyButtonFun,
                  title: "Apply",
                  backgroundColor: transperantColor,
                  borderColor: blackColor.withOpacity(0.5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomCurveShape extends StatelessWidget {
  const CustomCurveShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CustomCurveClipper(),
        child: Container(
          width: 150,
          height: 90,
          decoration: BoxDecoration(
              color: blueColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          // width: 150,
          // height: 85,
        ));
  }
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 90);
    path.quadraticBezierTo(150, 90, 150, 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class FlagWidget extends StatelessWidget {
  final bool selected;
  final String imagePath;
  final String countryName;
  final VoidCallback onTapFun;
  const FlagWidget(
      {super.key,
      required this.selected,
      required this.imagePath,
      required this.countryName,
      required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFun,
      child: Card(
          elevation: 10,
          shadowColor: middleBlackColor,
          color: whiteColor,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  width: selected ? 3.5 : 0,
                  color: selected
                      ? blueColor.withOpacity(0.6)
                      : blueColor.withOpacity(0)),
              color: whiteColor,
            ),
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const CustomCurveShape(),
                    CommonCachedNetworkImage(
                      imagePath: imagePath,
                      height: 60,
                    )
                    // Image.asset(
                    //   imagePath,
                    //   height: 60,
                    // )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 10, left: 10, bottom: 10),
                  child: Text(
                    countryName.toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "OnestSemiBold", fontSize: 15),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class MemberScreenInfoWidget extends StatelessWidget {
  final String heading1;
  final List<dynamic> ddcInfo;
  final List<dynamic> applicationInfo;
  final Color activeColor;
  final String heading2;
  final String questioningText;
  final String amount;
  final VoidCallback signupFun;
  const MemberScreenInfoWidget(
      {super.key,
      required this.heading2,
      required this.activeColor,
      required this.heading1,
      required this.ddcInfo,
      required this.questioningText,
      required this.amount,
      required this.signupFun,
      required this.applicationInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: middleBlackColor,
        elevation: 5,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: activeColor == darkRedColor
                  ? redColor.withOpacity(0.15)
                  : activeColor.withOpacity(0.1)),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heading1,
                        style: TextStyle(
                            fontFamily: "OnestBold",
                            fontSize: 16,
                            color: activeColor),
                      ),
                      const SpaceHeightWidget(height: 15),
                      Text(
                        " $heading2",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "OnestRegular",
                            fontSize: 11,
                            color: activeColor),
                      ),
                      const SpaceHeightWidget(height: 15),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: signupFun,
                        child: Text(
                          "SIGN UP here! >",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "OnestSemiBold",
                              fontSize: 13,
                              color: activeColor),
                        ),
                      ),
                    ]),
              ),
              Container(
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            questioningText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "OnestSemiBold",
                                fontSize: 13,
                                color: activeColor),
                          ),
                          const SpaceHeightWidget(height: 25),
                          Wrap(
                            children: [
                              for (int i = 0; i < ddcInfo.length; i++)
                                SizedBox(
                                  width: (i >= 3 && ddcInfo.length == 5)
                                      ? 135
                                      : 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, right: 8),
                                    child: Column(
                                      children: [
                                        Image.asset(ddcInfo[i]['image_path'],
                                            height: 70, fit: BoxFit.fill),
                                        const SpaceHeightWidget(height: 5),
                                        Text(
                                          ddcInfo[i]['title'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: "OnestRegular",
                                              fontSize: 11),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const CommonDivider(),
                    const SpaceHeightWidget(height: 30),
                    Text(
                      "Application Terms",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "OnestSemiBold",
                          fontSize: 13,
                          color: blackColor),
                    ),
                    const SpaceHeightWidget(height: 25),
                    Wrap(
                      children: [
                        for (int i = 0; i < applicationInfo.length; i++)
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                i != 1
                                    ? Image.asset(
                                        applicationInfo[i]['image_path'],
                                        height: 70,
                                        fit: BoxFit.fill)
                                    : CommonCachedNetworkImage(
                                        imagePath: applicationInfo[i]
                                            ['image_path'],
                                        height: 70,
                                        boxfit: BoxFit.fill,
                                      ),
                                const SpaceHeightWidget(height: 5),
                                Text(
                                  i != 2 ? applicationInfo[i]['title'] : amount,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: "OnestRegular", fontSize: 11),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SpaceHeightWidget(height: 25),
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

String generateRandomString(int length) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  return List.generate(length, (index) => chars[Random().nextInt(chars.length)])
      .join();
}

String generateTimeStamp() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  return timestamp.toString();
}

class ConfrimationDialog extends StatelessWidget {
  final String title;
  final VoidCallback onTapFun;
  const ConfrimationDialog(
      {super.key, required this.onTapFun, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,
                style:
                    const TextStyle(fontFamily: "OnestSemiBold", fontSize: 15)),
            const SpaceHeightWidget(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 80,
                    height: 35,
                    child:
                        CustomElevatedButton(onTapFun: onTapFun, title: "Yes")),
                const SpaceWidthWidget(width: 10),
                SizedBox(
                    width: 80,
                    height: 35,
                    child: CustomElevatedButton(
                        onTapFun: () {
                          Get.back();
                        },
                        title: "No"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

CommonToast(String text) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: darkRedColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

CommonToastTrue(String text) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: greenColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

class CommonTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTapFun;
  const CommonTextButton(
      {super.key, required this.title, required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: onTapFun,
        child: Text(
          title,
          style: const TextStyle(fontFamily: "OnestBold", fontSize: 14),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? padding;
  final Color? borderColor;
  final String hintText;
  final String labelText;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final TextInputType textInputType;
  final String? Function(String?)? validation;
  final List<TextInputFormatter>? inputFormatter;
  final Function(PointerDownEvent)? outsideFun;
  final VoidCallback? onTapFun;
  final bool? readOnly;
  final Function(String)? onchangeFun;
  final VoidCallback? editFun;
  final Widget? suffix;
  final bool? obscureText;

  const LoginTextField(
      {super.key,
      this.obscureText,
      required this.controller,
      this.suffix,
      this.onchangeFun,
      this.editFun,
      this.padding,
      this.readOnly,
      this.onTapFun,
      this.outsideFun,
      this.borderColor,
      this.inputFormatter,
      this.textAlignVertical,
      this.focusNode,
      required this.hintText,
      required this.textInputType,
      required this.validation,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        // scrollPadding: const EdgeInsets.all(40),
        obscureText: obscureText ?? false,
        onEditingComplete: editFun,
        onChanged: onchangeFun,
        readOnly: readOnly ?? false,
        onTap: onTapFun,
        onTapOutside: outsideFun,
        focusNode: focusNode,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: textInputType,
        style: TextStyle(
            fontFamily: "OnestSemiBold",
            fontSize: 14,
            color: blackColor.withOpacity(0.6)),
        validator: validation,
        inputFormatters: inputFormatter ?? [],
        decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 20,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: suffix,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? lightDarKBlue.withOpacity(0.3))),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: "OnestRegular",
                fontSize: 14,
                color: blackColor.withOpacity(0.5)),
            label: Text(labelText),
            labelStyle: TextStyle(
                fontFamily: "OnestSemiBold", fontSize: 14, color: blackColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? lightDarKBlue.withOpacity(0.3))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(width: 3.5, color: blueColor.withOpacity(0.5)))),
      ),
    );
  }
}

class AccountTitleWidget extends StatelessWidget {
  final String title;
  const AccountTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: "OnestSemiBold", color: blackColor, fontSize: 15),
    );
  }
}

class AccountWidgetT extends StatelessWidget {
  final String title;
  const AccountWidgetT({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: "OnestRegular", color: blackColor, fontSize: 13),
    );
  }
}

class AccountTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? borderColor;
  final String hintText;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final TextInputType textInputType;
  final String? Function(String?)? validation;
  final List<TextInputFormatter>? inputFormatter;
  final Function(PointerDownEvent)? outsideFun;
  final VoidCallback? onTapFun;
  final bool? readOnly;
  final Function(String)? onchangeFun;
  final VoidCallback? editFun;
  final Color? backgroundColor;
  final int? minLines;
  final double? bottomGap;

  const AccountTextField(
      {super.key,
      this.bottomGap,
      required this.controller,
      this.minLines,
      this.onchangeFun,
      this.editFun,
      this.readOnly,
      this.onTapFun,
      this.outsideFun,
      this.borderColor,
      this.inputFormatter,
      this.textAlignVertical,
      this.focusNode,
      required this.hintText,
      required this.textInputType,
      required this.validation,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: bottomGap ?? 10),
      child: TextFormField(
        onEditingComplete: editFun,
        onChanged: onchangeFun,
        readOnly: readOnly ?? false,
        onTap: onTapFun,
        onTapOutside: outsideFun,
        focusNode: focusNode,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: textInputType,
        minLines: minLines,
        maxLines: null,
        style: TextStyle(
            fontFamily: "OnestSemiBold",
            fontSize: 14,
            color: blackColor.withOpacity(0.6)),
        validator: validation,
        inputFormatters: inputFormatter ?? [],
        decoration: InputDecoration(
            filled: true,
            fillColor: backgroundColor ?? whiteColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? lightDarKBlue.withOpacity(0.3))),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: "OnestRegular",
                fontSize: 14,
                color: blackColor.withOpacity(0.5)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? lightDarKBlue.withOpacity(0.3))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(width: 3.5, color: blueColor.withOpacity(0.5)))),
      ),
    );
  }
}

class MyAccountWidget extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  final IconData? leadingIcon;
  final String? imagePath;
  final bool? trailing;
  final VoidCallback traillingFun;
  const MyAccountWidget(
      {super.key,
      required this.traillingFun,
      required this.onTapFun,
      required this.title,
      this.trailing,
      this.imagePath,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: woodColor,
          thickness: 1.5,
          height: 0,
        ),
        ListTile(
          onTap: onTapFun,
          dense: true,
          leading: imagePath != null
              ? Image.asset(
                  imagePath!,
                  height: imagePath!.contains("view-module") ? 13 : 20,
                  color: middleBlackColor,
                )
              : Icon(leadingIcon, size: 20, color: middleBlackColor),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontFamily: "OnestRegular"),
          ),
          trailing: trailing == null
              ? const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 15,
                )
              : InkWell(
                  onTap: traillingFun,
                  child: trailing == false
                      ? const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 15,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          size: 15,
                        ),
                ),
        ),
      ],
    );
  }
}

class MyAccountItemWidget extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  const MyAccountItemWidget({
    super.key,
    required this.onTapFun,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      onTap: onTapFun,
      dense: true,
      leading: Image.asset(
        "assets/images/arrow_right.png",
        height: 15,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontFamily: "OnestRegular"),
      ),
    );
  }
}

class CommissionWidget extends StatelessWidget {
  final String title;
  final String amountType;
  final String amount;
  final Color? textColor;
  final Color? backgroundColor;
  const CommissionWidget(
      {super.key,
      this.backgroundColor,
      this.textColor,
      required this.title,
      required this.amountType,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? lightDarKBlue,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      constraints: const BoxConstraints(minWidth: 110),
      child: Column(
        children: [
          Text(
            title,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "OnestSemiBold",
                color: textColor ?? whiteColor,
                fontSize: 10),
          ),
          Text(
            amountType != "" ? "($amountType)" : "\n",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "OnestSemiBold",
                color: textColor ?? whiteColor,
                fontSize: 10),
          ),
          const SpaceHeightWidget(height: 10),
          Text(
            amount,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "OnestSemiBold",
                color: textColor != null
                    ? textColor!.withOpacity(0.5)
                    : whiteColor.withOpacity(0.8),
                fontSize: 10),
          )
        ],
      ),
    );
  }
}

class CommonVerticalDivider extends StatelessWidget {
  final double? height;
  const CommonVerticalDivider({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: height ?? 90,
      width: 0.8,
      color: middleBlackColor.withOpacity(0.2),
    );
  }
}

class RedeemWidget extends StatelessWidget {
  final VoidCallback onTapFun;
  final String points;
  final String title;
  const RedeemWidget(
      {super.key,
      required this.onTapFun,
      required this.title,
      required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpaceHeightWidget(height: 10),
        Text(
          points,
          style: TextStyle(
              fontFamily: "OnestRegular", color: greenColor, fontSize: 22),
        ),
        const SpaceHeightWidget(height: 5),
        Text(
          title,
          style: TextStyle(
              fontFamily: "OnestRegular",
              color: middleBlackColor,
              fontSize: 12),
        ),
        SizedBox(
          height: 40,
          child: CommonTextButton(
            onTapFun: onTapFun,
            title: "Click To Redeem >",
          ),
        )
      ],
    );
  }
}

class RankWidget extends StatelessWidget {
  final String title;
  const RankWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Rank",
            style: TextStyle(
                fontFamily: "OnestSemiBold", color: blackColor, fontSize: 16),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: "OnestSemiBold",
                      color: blackColor,
                      fontSize: 12),
                ),
                Image.asset(
                  "assets/images/rank.png",
                  height: 140,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DownLineWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagpath;

  const DownLineWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imagpath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: false,
          leading: CircleAvatar(
            backgroundColor: lightBlackColor,
            radius: 23,
            child: CommonCachedNetworkImage(
              imagePath: imagpath,
              height: 35,
            ),
          ),
          //  Container(
          //     padding: const EdgeInsets.all(8),
          //     width: 50,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(50),
          //         border: Border.all(
          //             color: greenColor.withOpacity(0.5), width: 2.5)),
          //     child:
          //     Icon(
          //       Icons.person,
          //       size: 28,
          //       color: lightDarKBlue,
          //     ),
          //     ),
          title: Text(
            title,
            style: const TextStyle(fontFamily: "OnestSemiBold", fontSize: 13),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontFamily: "OnestRegular", fontSize: 11),
          ),
          trailing: Image.asset(
            "assets/images/share_mail.png",
            height: 33,
          ),
        ),
        const CommonDivider()
      ],
    );
  }
}

class ViewProfileWidget extends StatelessWidget {
  final String title;
  final String info;
  final Color? infoColor;
  final String? fontfamily;
  const ViewProfileWidget(
      {super.key,
      required this.title,
      required this.info,
      this.infoColor,
      this.fontfamily});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: fontfamily ?? "OnestRegular", fontSize: 14),
            ),
          ),
          Text(
            info,
            style: TextStyle(
                fontFamily: fontfamily ?? "OnestSemiBold",
                fontSize: 14,
                color: infoColor),
          ),
        ],
      ),
    );
  }
}

class ProfileDropDown extends StatelessWidget {
  final void Function(String?)? onChangedFun;
  final List<String> items;
  final String? value;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validationFun;
  const ProfileDropDown(
      {super.key,
      required this.onChangedFun,
      this.validationFun,
      this.value,
      this.labelText,
      this.hintText,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // height: 40,
      child: DropdownButtonFormField<String>(
          // menuMaxHeight: 20,
          itemHeight: null,
          isExpanded: true,
          value: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validationFun,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: blackColor.withOpacity(0.5),
          ),
          isDense: true,
          decoration: InputDecoration(
              fillColor: whiteColor,
              filled: true,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: lightDarKBlue.withOpacity(0.3))),
              labelText: labelText,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: "OnestRegular",
                  fontSize: 14,
                  color: blackColor.withOpacity(0.5)),
              labelStyle: TextStyle(
                  fontFamily: "OnestSemiBold", fontSize: 14, color: blackColor),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: lightDarKBlue.withOpacity(0.3))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      width: 3.5, color: blueColor.withOpacity(0.5)))),
          padding: const EdgeInsets.all(0),
          borderRadius: BorderRadius.circular(5),
          style: TextStyle(
              fontFamily: "OnestRegular", color: blackColor.withOpacity(0.7)),
          items: items
              .map((e) => DropdownMenuItem<String>(
                  value: e.contains("Government") ? e.replaceAll("\n", "") : e,
                  child: Text(
                    e.contains("Government") ? e.replaceAll("\n", " ") : e,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  )))
              .toList(),
          onChanged: onChangedFun),
    );
  }
}

class SideTitle extends StatelessWidget {
  final String title;
  const SideTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontFamily: "OnestRegular", fontSize: 14),
    );
  }
}

class ImageOptionsDialog extends StatelessWidget {
  final VoidCallback cameraFun;
  final VoidCallback galleryFun;
  const ImageOptionsDialog(
      {super.key, required this.cameraFun, required this.galleryFun});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      title: const Text(
        "Choose your image selection from?",
        style: TextStyle(fontFamily: "OnestRegular", fontSize: 16),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: cameraFun,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 35,
                  color: appthemeColor,
                ),
                Text(
                  "Camera",
                  style: TextStyle(color: appthemeColor),
                )
              ],
            ),
          ),
          InkWell(
            onTap: galleryFun,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 35,
                  color: appthemeColor,
                ),
                Text(
                  "Gallery",
                  style: TextStyle(color: appthemeColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

imagePickFun(String from) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
      source: from == "gallery" ? ImageSource.gallery : ImageSource.camera);
  return image;
}

class ServiceToolWidget extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  final String date;
  const ServiceToolWidget(
      {super.key,
      required this.onTapFun,
      required this.date,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTapFun,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 13),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontFamily: "OnestRegular",
                            fontSize: 12,
                            color: middleBlackColor.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                const SpaceWidthWidget(width: 15),
                const Row(
                  children: [
                    Text(
                      "View",
                      style:
                          TextStyle(fontFamily: "OnestSemiBold", fontSize: 12),
                    ),
                    Icon(Icons.keyboard_arrow_right_rounded)
                  ],
                )
              ],
            ),
          ),
          const CommonDivider()
        ],
      ),
    );
  }
}

class lllllll extends StatelessWidget {
  final VoidCallback removeFun;
  final String itemCount;
  final String productCode;
  final String itemname;
  final String imagePath;
  final String itemsPrice;
  final bool? removeCartOption;

  const lllllll(
      {super.key,
      this.removeCartOption,
      required this.removeFun,
      required this.imagePath,
      required this.itemname,
      required this.itemsPrice,
      required this.productCode,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonCachedNetworkImage(
            imagePath: imagePath,
            height: 90,
          ),
          const SpaceWidthWidget(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  itemname,
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: "OnestRegular",
                      fontSize: 11,
                      color: blackColor),
                ),
                const SpaceHeightWidget(height: 5),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Product Code: ",
                    style: TextStyle(
                        fontFamily: "OnestRegular",
                        fontSize: 12,
                        color: blackColor.withOpacity(0.7)),
                  ),
                  TextSpan(
                      text: productCode,
                      style: TextStyle(
                          fontFamily: "OnestRegular",
                          fontSize: 12,
                          color: blackColor.withOpacity(0.5)))
                ])),
                const SpaceHeightWidget(height: 5),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Quantity: ",
                    style: TextStyle(
                        fontFamily: "OnestRegular",
                        fontSize: 12,
                        color: blackColor.withOpacity(0.7)),
                  ),
                  TextSpan(
                      text: itemCount,
                      style: TextStyle(
                          fontFamily: "OnestRegular",
                          fontSize: 12,
                          color: blackColor.withOpacity(0.5)))
                ])),
                const SpaceHeightWidget(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "MRP: ",
                        style: TextStyle(
                            fontFamily: "OnestRegular",
                            fontSize: 12,
                            color: blackColor.withOpacity(0.7)),
                      ),
                      TextSpan(
                          text: itemsPrice,
                          style: TextStyle(
                              fontFamily: "OnestRegular",
                              fontSize: 12,
                              color: blackColor.withOpacity(0.5)))
                    ])),
                    if (removeCartOption != true)
                      GestureDetector(
                          onTap: removeFun,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: darkRedColor,
                            child: Icon(
                              Icons.delete_forever,
                              color: whiteColor,
                              size: 17,
                            ),
                          ))
                  ],
                ),
                const SpaceHeightWidget(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TableHeadingWidget extends StatelessWidget {
  final String title;
  final String? fontFamily;
  const TableHeadingWidget({
    super.key,
    this.fontFamily,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: fontFamily ?? "OnestSemiBold",
              fontSize: 12,
              color: blackColor),
        ),
      );
    }
  }
}

class TableInfoWidget extends StatelessWidget {
  final String info;
  const TableInfoWidget({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          info,
          style: TextStyle(
              fontFamily: "OnestRegular", fontSize: 12, color: blackColor),
        ),
      );
    }
  }
}

class NotAvailableText extends StatelessWidget {
  final String text;
  const NotAvailableText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      text,
      style: TextStyle(
          fontFamily: "OnestRegular", fontSize: 12, color: middleBlackColor),
    ));
  }
}

class CustomAutoWidthButton extends StatelessWidget {
  final VoidCallback onTapFun;
  final String title;
  final Color? bcolor;
  final double? textSize;
  const CustomAutoWidthButton(
      {super.key,
      required this.onTapFun,
      required this.title,
      this.bcolor,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTapFun,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bcolor ?? blackColor),
          // minimumSize: const MaterialStatePropertyAll(Size(40)),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: whiteColor,
              fontFamily: "OnestSemiBold",
              fontSize: textSize),
        ));
  }
}

class PackageReviewWidget extends StatelessWidget {
  final String itemName;
  final String imgPath;
  final VoidCallback reviewFun;
  final String mrpRate;
  final String packagecode;
  final String reviewTitle;
  const PackageReviewWidget({
    super.key,
    required this.reviewTitle,
    required this.itemName,
    required this.imgPath,
    required this.mrpRate,
    required this.packagecode,
    required this.reviewFun,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
            border: Border.all(color: lightDarKBlue.withOpacity(0.2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const SpaceHeightWidget(height: 8),
                  Image.asset(
                    imgPath,
                    height: 90,
                  ),
                  const SpaceHeightWidget(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          itemName.toUpperCase(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 13,
                              color: lightDarKBlue),
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                    titleName: "Product Code: $packagecode",
                    fontFamily: "OnestRegular",
                    size: 11,
                  ),
                  CommonTitle(
                    titleName: "DP: $mrpRate",
                    fontFamily: "OnestSemiBold",
                    size: 11,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const CommonDivider(),
                const SpaceHeightWidget(height: 5),
                SizedBox(
                    height: 28,
                    child: CustomAutoWidthButton(
                        // bcolor: darkNaviBlueColor,
                        textSize: 10.5,
                        onTapFun: reviewFun,
                        title: reviewTitle)),
                const SpaceHeightWidget(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  final String type;
  final String timeValue;
  final String markedRangeVal;
  const TimerWidget(
      {super.key,
      required this.timeValue,
      required this.type,
      required this.markedRangeVal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 70,
          width: 70,
          child: markedRangeVal == "0"
              ? CircularProgressIndicator(
                  color: darkNaviBlueColor,
                  backgroundColor: darkNaviBlueColor.withOpacity(0.2),
                  strokeWidth: 5,
                  value: 0)
              : CircularProgressIndicator(
                  color: whiteColor.withOpacity(0.8),
                  backgroundColor: darkNaviBlueColor,
                  strokeWidth: 5,
                  value: double.parse(timeValue) / double.parse(markedRangeVal),
                ),
        ),
        Column(
          children: [
            CommonTitle(
              titleName: (type == "Days")
                  ? markedRangeVal
                  : (int.parse(markedRangeVal) - int.parse(timeValue))
                      .toString(),
              size: 12,
              fontFamily: "OnestSemiBold",
            ),
            CommonTitle(
              titleName: type,
              size: 12,
              fontFamily: "OnestSemiBold",
            ),
          ],
        ),
      ],
    );
  }
}

class UniwaveProductDetails extends StatelessWidget {
  final String dataText;
  const UniwaveProductDetails({super.key, required this.dataText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/leaf.png",
            height: 30,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: CommonTitle(
                titleName: dataText,
                size: 12.5,
                fontFamily: "OnestRegular",
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UniwaveRitchTextWidget extends StatelessWidget {
  final String boldText;
  final String plainText;
  const UniwaveRitchTextWidget(
      {super.key, required this.boldText, required this.plainText});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: boldText,
          style: TextStyle(
              fontFamily: "OnestSemiBold", fontSize: 12, color: blackColor)),
      TextSpan(
          text: " $plainText",
          style: TextStyle(
              fontFamily: "OnestRegular", fontSize: 12, color: blackColor)),
    ]));
  }
}

class BiomatrixImageWidget extends StatelessWidget {
  final String title1;
  final String title2;
  final String count;
  final String imagename;
  const BiomatrixImageWidget(
      {super.key,
      required this.count,
      required this.imagename,
      required this.title1,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CommonTitle(
                  titleName: title1,
                  size: 12,
                  fontFamily: "OnestRegular",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTitle(
                      titleName: count,
                      size: 12,
                      fontFamily: "OnestRegular",
                    ),
                    const CommonTitle(
                      titleName: "BMS",
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/images/$imagename.png",
              height: 35,
            ),
          ),
          Expanded(
            child: CommonTitle(
              titleName: title2,
              size: 10,
              fontFamily: "OnestRegular",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
