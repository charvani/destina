import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Social Media Policy"),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceHeightWidget(height: 15),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "DESTINA 1 Social Media Policy Independent Distributors can discuss and promote their DESTINA 1 business on social media platforms such as blogs, Facebook, YouTube, LinkedIn, MySpace, etc. The following is DESTINA 1's policy and guidelines on such representation. The absence of, or lack of, explicit reference to a specific site, does not limit the extent of the application of this policy. Where no policy or guideline exists, Independent Distributors should use their professional judgment and take the most prudent action possible."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "The following guidelines must be adhered to for posting any content online:"),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Personal blogs, websites and social media profiles should have clear disclaimers that the views expressed by the author are the author's alone and do not represent the views of DESTINA 1. E.g., The opinions and positions expressed are my own and don't necessarily reflect those of DESTINA 1"),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "You must represent yourself accurately and clearly state your relationship with DESTINA 1 as Independent Distributor. No other claims may be made as employee, agent or otherwise."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "You may not use DESTINA 1's trademarks or brands in any username or handle on any social media platform. These include but are not limited to Twitter, Facebook, and Linkedin."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Information published on your blogs, websites and social media profiles should comply with DESTINA 1's Rules & Regulations. (See clause 26.7 of the Rules & Regulations). This also applies to comments posted on other blogs, forums, and social networking sites."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Distributors may not use or attempt to register or sell any of DESTINA 1 and its associated companies' trade names, trademarks, service names, service marks, product names, or any derivative thereoffor any internet domain name or email address (See 19.3 of the DESTINA 1's Rules and Regulations)."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "By identifying yourself as an Independent Distributor, you identify yourself with the brand image and the values of DESTINA 1. As such, your online activity can affect others' perceptions of DESTINA 1, its products and services. It is, therefore,essential to be aware that your actions captured via images, posts, or comments can reflect that of DESTINA 1."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "You must use only text found on DESTINA 1's official website."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "You may not supplement the content of your website or social networking profile with text from any source other than DESTINA 1"),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName: "All content must be spell-checked."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "All misleading or deceptive activities, information and tactics are prohibited."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Respect copyright laws, references or cite sources appropriately."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName: "No abusive language is permitted."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName: "No personal attacks are permitted."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Independent Distributors must always disclose their relationship or identify themselves as a DESTINA 1 Independent Distributor when commenting on DESTINA 1 and its products."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      'Independent Distributors who provide testimonials online must be truthful and subject to typical results. E.g. 1: "D1 Scalar Pendant cured my snoring problem" While that may be an honest opinion, it is not a specific result, and therefore, any such idea posted online would violate the current guidelines unless there is valid research to support the claim. E.g. 2. "I made USD 25,000 in one month with DESTINA 1, and you can too." While this statement may be true, the result is not "typical". Such information would violate the current guidelines. Whenever discussing earnings, you should refer to clause 10.4 of DESTINA 1\'s Rules and Regulations for guidance on this subject matter.'),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "For paid Internet advertising, such as Facebook ads, DESTINA 1's logo or trademark may not be used. All links must be directed to the ID's Personal Website, not DESTINA 1's official site."),
              SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "If you have a complaint with DESTINA 1, contact DESTINA 1 for resolution through any official social media channels available at www.destina1.com or the 24/7 multilingual DESTINA 1 Support Centre (D1 GSC). Please do not use other social media to express your grievances publically, as DESTINA 1 will have no way of addressing your grievance; Many of the people who read your grievance won't know when it is resolved, so they will be left with bad unresolved feelings that may never be corrected."),
              SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
