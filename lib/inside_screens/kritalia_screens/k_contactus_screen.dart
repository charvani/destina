import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../about/weburl_screen.dart';

class KContactUsScreen extends StatefulWidget {
  const KContactUsScreen({super.key});

  @override
  State<KContactUsScreen> createState() => _KContactUsScreenState();
}

class _KContactUsScreenState extends State<KContactUsScreen> {
  List faqs = [
    {
      "q": "How do I care for my jewellery?",
      "ans":
          "Since 1937, Kritalia & Co. has maintained the highest standards in design, materials and craftsmanship, creating jewelry that has been passed down from generation to generation. With some simple, basic care, you can help preserve and protect your jewelry for years to come.\nOver time, fine jewelry can become a treasured family heirloom if it is cared for properly. Dust, pollution and daily wear all conspire to cloud the brilliance of gemstones. The surface of gold, platinum and silver jewelry can become dulled. Timeworn prongs and clasps can result in the loss of a stone or an entire piece of jewelry.\nProfessional cleanings are recommended as often as once a year. We encourage you to bring your Kritalia & Co. jewelry back to us for professional servicing. Our staff is knowledgeable and experienced in all aspects of care, including cleaning gemstones, restringing pearls and repairing clasps and earring backs."
    },
    {
      "q": "How do I measure ring size?",
      "ans":
          "Kritalia & Co. uses standard U.S. ring sizes. Refer to our measurement chart or the ruler found in our size guide."
    },
    {
      "q": "How can I make returns or exchanges?",
      "ans":
          "Kritalia & Co. offers complimentary shipping for any item that you would like to return. Simply click here to print out a shipping label. Then drop off your package at the nearest UPS or FedEx location, depending on which label you receive. Alternatively, you may contact one of our client advisors for assistance here or return your items at any of our retail stores in the U.S."
    },
    {
      "q": "Does Kritalia & CO. offer resizing?",
      "ans":
          "Kritalia & Co. offers resizing for selected items. Please contact Customer Service at +603-58887789 to learn more."
    },
    {
      "q":
          "Does Kritalia & CO. offer financing or payment plans for engagement ring purchases?",
      "ans":
          "We want you to have the ring of your dreams. We offer Kritalia Selected Financing, which provides interest-free financing for all engagement rings, for U.S. customers only."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Contact Us"),
      body: SingleChildScrollView(
        child: Column(children: [
          // Image.asset("assets/images/k_contactus_banner.jpeg"),
          const CommonCachedNetworkImage(
              imagePath: "https://www.destina1.com/images/jewellery-box.jpeg"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName: "Kritalia At Your Service",
              fontColor: darkBlue,
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CommonTitle(
              titleName:
                  "There's no question too small or request too big for our Kritalia client advisors. From choosing an engagement ring or gift to providing in-store or virtual appointments, we're always at your service.",
              size: 14,
              fontFamily: "OnestRegular",
              textAlign: TextAlign.justify,
            ),
          ),
          const SpaceHeightWidget(height: 10),
          iconRelatedWidget(
              Icons.local_phone_rounded, "Phone Number", "+603-58887789"),
          const SpaceHeightWidget(height: 4),
          iconRelatedWidget(Icons.mail_outline_rounded, "Email",
              "support@destina1global.com"),
          const SpaceHeightWidget(height: 4),
          iconRelatedWidget(
              Icons.access_time, "Monday to Friday", " 8:00AM - 10:00PM"),
          const SpaceHeightWidget(height: 4),
          iconRelatedWidget("", "Saturday:", "9:00 AM - 9:00 PM"),
          const SpaceHeightWidget(height: 4),
          iconRelatedWidget("", "Sunday:", "10:00 AM - 9:00 PM"),
          const SpaceHeightWidget(height: 10),
          CustomAutoWidthButton(
              onTapFun: () {
                Get.to(() => const WebUrlScreen(
                      redirectUrl: "https://destina1.com/MAKritaliaBA.html",
                      from: "Book an Appointment",
                    ));
              },
              title: "Book an Appointment"),
          const SpaceHeightWidget(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTitle(
              titleName: "Frequently Asked Questions",
              fontColor: darkBlue,
              textAlign: TextAlign.center,
            ),
          ),
          for (int i = 0; i < faqs.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: Card(
                  child: ExpansionTile(
                childrenPadding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: lightDarKBlue.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                title: CommonTitle(
                  titleName: faqs[i]['q'],
                  fontFamily: "OnestSemiBold",
                  size: 14,
                ),
                children: [
                  CommonTitle(
                    titleName: faqs[i]['ans'],
                    fontFamily: "OnestRegular",
                    size: 14,
                  ),
                ],
              )),
            ),
          const SpaceHeightWidget(height: 40),
        ]),
      ),
    );
  }

  iconRelatedWidget(dynamic icon, String title, info) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (icon != "")
              ? Icon(
                  icon,
                  color: middleBlackColor.withOpacity(0.6),
                )
              : const SizedBox(
                  width: 25,
                ),
          const SpaceWidthWidget(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTitle(
                  titleName: "$title :",
                  size: 14,
                  fontFamily: "OnestSemiBold",
                  fontColor: middleBlackColor,
                ),
                CommonTitle(
                  titleName: info,
                  size: 13,
                  fontFamily: "OnestRegular",
                  fontColor: middleBlackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
