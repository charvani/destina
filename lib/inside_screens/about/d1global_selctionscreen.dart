import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class D1GlobalScreen extends StatefulWidget {
  const D1GlobalScreen({super.key});

  @override
  State<D1GlobalScreen> createState() => _D1GlobalScreenState();
}

class _D1GlobalScreenState extends State<D1GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "D1 Global"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutUsScreenWidget(
              leadingIcon: Icons.info_outline,
              image: "assets/images/instagram.png",
              onTapFun: () async {
                final Uri url = Uri.parse(
                    "https://www.instagram.com/destina1international/");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              title: "Instagram",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.facebook,
              onTapFun: () async {
                final Uri url =
                    Uri.parse("https://www.facebook.com/Destina1int/");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              title: "Facebook",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.facebook,
              image: "assets/images/twitter.png",
              onTapFun: () async {
                final Uri url = Uri.parse(
                    // "https://twitter.com/destina1world"
                    "https://twitter.com/Destina1Main");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              title: "Twitter",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.branding_watermark_outlined,
              image: "assets/images/youtube.png",
              onTapFun: () async {
                final Uri url =
                    Uri.parse("https://www.youtube.com/@Destina1TV/videos");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              title: "Youtube",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.video_stable_rounded,
              image: "assets/images/linkedin.png",
              onTapFun: () async {
                final Uri url = Uri.parse(
                    "https://www.linkedin.com/company/destina1-international");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              title: "linkedIn",
            ),
            AboutUsScreenWidget(
              leadingIcon: Icons.link_rounded,
              image: "assets/images/tiktok.png",
              onTapFun: () async {
                
                final Uri url =
                    Uri.parse("https://www.tiktok.com/@d1globalcorp");
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              title: "Tiktok",
            ),
          ],
        ),
      ),
    );
  }
}
