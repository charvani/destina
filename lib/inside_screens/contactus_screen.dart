import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../commons/colors.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        backNavigation: true,
        title: "Contact Us",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              commonContactWidget("Destina 1 International World HQ",
                  "(989308-X) (AJL 932060)"),
              const SpaceHeightWidget(height: 15),
              commonContactWidget(
                  "D1 Global International - Support Centre", ""),
              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  iconRelatedWidget(IconData icon, String title, info) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: middleBlackColor.withOpacity(0.6),
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
    );
  }

  commonContactWidget(String title, subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTitle(titleName: title, size: 16),
        if (subtitle != "")
          CommonTitle(
            titleName: subtitle,
            size: 11,
            fontFamily: "OnestRegular",
            fontColor: middleBlackColor,
          ),
        const SpaceHeightWidget(height: 10),
        iconRelatedWidget(Icons.local_phone_rounded, "Phone",
            "+603 - 5888 7789, +603 - 8600 4650, +603 8600 4651"),
        const SpaceHeightWidget(height: 4),
        iconRelatedWidget(Icons.fax_outlined, "Fax", "+603 5879 9789"),
        const SpaceHeightWidget(height: 4),
        iconRelatedWidget(Icons.local_phone_rounded,
            "Whatsapp/Telegram Support", "+6011 1026 1789"),
        const SpaceHeightWidget(height: 4),
        iconRelatedWidget(Icons.location_on_outlined, "Address",
            "Suite: F-3-3 & F-3A-3, Setiawalk, Persiaran Wawasan, Pusat Bandar Puchong, 47160 Puchong, Selangor, Darul Ehsan, Malaysia"),
        const SpaceHeightWidget(height: 4),
        iconRelatedWidget(Icons.access_time, "Open From", "Monday to Friday"),
        const SpaceHeightWidget(height: 4),
        iconRelatedWidget(
            Icons.access_time, "Operating Hours", "9:00 AM - 7:00 PM"),
      ],
    );
  }
}
