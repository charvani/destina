import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class CodeOfEthicsScreen extends StatefulWidget {
  const CodeOfEthicsScreen({super.key});

  @override
  State<CodeOfEthicsScreen> createState() => _CodeOfEthicsScreenState();
}

class _CodeOfEthicsScreenState extends State<CodeOfEthicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Code of Ethics"),
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
                  fontFamily: "OnestRegular",
                  titleName:
                      "DESTINA 1 expects all Independent Distributors (IDs) to uphold the principles of fairness, honesty and integrity in all their dealings and activities as IDs. This Code of Ethics forms part of the DESTINA 1's Rules and Regulations and all other agreements currently in place, which bind every ID."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "Any serious breach of the Code, Rules and Regulations and agreements in place will involve action(s) being taken by DESTINA 1 in accordance with DESTINA 1's Rules and Regulations."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "The Code of Ethics explains the proper business conduct for IDs to practice. Additionally, DESTINA 1 encourages all IDs to obtain and observe the Code of Ethics provided by any DSA (Direct Selling Association) or MLMIA (Multilevel Marketing International Association) in their respective countries if and where applicable. It is a mandatory requirement that IDs comply with the Code of Ethics at all times."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  // fontColor: darkBlue,
                  titleName: "PART A - CONDUCT"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "1. DEALING WITH THE GENERAL PUBLIC"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "1.1 Contact & Communications"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify, size: 14, titleName: "An ID:"),
              const SpaceHeightWidget(height: 5),
              CustomBulletTextWidget(
                fontSize: 14,
                verticalPadding: 1,
                textColor: middleBlackColor,
                data:
                    "Will at all times, when contacting anyone either from a telephone list or by other means, respect the privacy and wishes of the person contacted;",
              ),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "will never engage in objectionable or abusive conduct, unfair or aggressive behaviour when contacting or dealing with any other person concerning DESTINA 1 or the opportunity it provides;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "will offer the opportunities of an association with DESTINA 1 on its merits without exaggeration, concealment, curiosity or misrepresentation;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "will ensure they maintain their presentation in dress, language and documentation to the highest possible standard;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "will observe the provisions of the law and good manners regarding times and days when making calls and appointments."),
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "1.2 Presenting Opportunity"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "An ID presenting the Business Plan at any time, conducting a Training Event or Seminar or DESTINA 1 ID Meeting will:"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Not falsely represent to any person any details regarding the financial rewards available under the DESTINA 1 Marketing Plan;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "not make any false or misleading representations about the features of DESTINA 1's products, services and programmes, including as to their standard, quality, values, characteristics, accessories, uses for a particular purpose, merchantability or benefits;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "not make any false or misleading representations about the price of DESTINA 1's products or services;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "not engage in conduct that is liable to mislead anyone as to the nature, manufacturing process, characteristics, suitability for purpose or quality of any DESTINA 1's products or services;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "not make any false or misleading representations concerning the need by anyone for goods or services;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "make it thoroughly clear to any person to whom the ID discusses the opportunity that financial rewards to IDs are based on an ID's performance;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "use official literature approved by DESTINA 1, including forms, scripts and other tools."),
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "1.3 Conducting Business"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName: "An ID must not at any time:"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Take advantage of another person's disabilities or weaknesses, such as illness, age, infirmity, lack of education or unfamiliarity with language;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "actively solicit or demand orders for DESTINA 1 products by anything other than an offer to collate any order an ID wishes to make, including by the use of physical force, undue harassment or coercion;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "refuse to identify themselves when requested to do so."),
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "1.4 Explaining the Business Plan"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "When presenting or discussing DESTINA 1's Business Plan and the Benefits which might be available, an ID must generally rely for reference on DESTINA 1's literature and observe the following regarding the contents of the Business Plan:"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "if predictions as to profitability are made, they should reflect what an average person carrying on the Business would achieve under normal circumstances;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "if any estimates of profits are made, the assumptions on which they are based should be clearly stated;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Where there is no previous experience to base expectations on profitability, this should be stated when making the representation."),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "When presenting or discussing DESTINA 1's Business Plan, an ID must not make false representations concerning:"),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "any risks likely to be associated with carrying on the Business;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "the amount of time the average person would have to devote to carry on the Business;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The annual expenditures and gross income the average person carrying on the Business might expect and the method of calculating those figures."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  // fontColor: darkBlue,
                  titleName: "PART B - OBLIGATIONS"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "2. GENERAL OBLIGATIONS"),

              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "2.1 Authorisation Limit"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Authorisation of an ID is limited. They shall refer any matter about DESTINA 1 to the designated DESTINA 1 Distributor. An ID shall not interfere in any decision-making process without prior written approval from the DESTINA 1 Distributor."),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "2.2 Poaching Independent Distributors"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "DESTINA 1 does not condone the intentional poaching of other competitors' IDs or IDs from another line of referrals within the DESTINA 1 Business."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "3. USE OF DESTINA 1 PROPERTY"),

              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "As trademarks, logos and service marks are registered and owned by DESTINA 1 and/or its affiliates, all written materials are the copyright of DESTINA 1. The use of trademarks, logos or service marks or the publication of copyright materials may only be undertaken with the written authorisation from DESTINA 1 and not otherwise."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "4. PRODUCT CLAIMS"),

              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "DESTINA 1 publishes detailed data about its products, which is verifiable, accurate and complete. An ID must not make claims about any DESTINA 1 products or services unless they are sourced from appropriate official DESTINA 1 literature and accurately reflect the information in the proper literature."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "5. OBLIGATIONS OF INDEPENDENT DISTRIBUTOR"),

              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName: "5.1 Promote Ethical Business Practice"),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName: "An ID will:"),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "ensure the IDs in their group are aware of this Code and at all times carry out their Business relationships either within the group or with IDs of the public in a lawful manner, with courtesy and integrity, and in accordance with this Code; keep confidential and not unethically use information that may be of detriment to another ID's Business"),

              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName: "5.2 DESTINA 1's Obligations"),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName: "DESTINA 1 will ensure that:"),

              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "its employees will at all times act in a manner which does not conflict with the best legitimate interests of an ID and carry out duties following professional courtesy and integrity;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "IDs are kept well informed regarding laws applicable to the Business and duties of IDs and other essential facts and public policies which affect such Business and responsibilities and will comply with all the requirements thereof;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "full cooperation of its employees is given to IDs concerning advising them about matters which affect them;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "It acts in the IDs' legitimate interest to the best of its abilities."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  // fontColor: darkBlue,
                  titleName: "PART C - APPLICATIONS"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "6. APPLICATION OF THE CODE OF ETHICS"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "DESTINA 1 and an ID will accept the Code of Ethics entirely and observe its provisions.  "),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "6.1 Compliance"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "DESTINA 1 and an ID will ensure full compliance with the Code:"),
              const SpaceHeightWidget(height: 5),

              CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  textColor: middleBlackColor,
                  data:
                      "in DESTINA 1's case by Directors, Executives and all other employees;"),
              CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  textColor: middleBlackColor,
                  data: "in the ID's case by the ID and their Downlines."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "6.2 Administration"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "DESTINA 1 will administer its dealings with IDs in a manner conducive to compliance with the Code of Ethics."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "7. ETHICAL CONTACT"),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName: "ID (s) must not:"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "tout for or on behalf of another Direct Selling Company;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "divulge confidential information to unauthorised persons or for unauthorised or unethical purposes;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: "discuss financial aspects of other IDs' businesses;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "encourage another ID to change the line of referrals;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: "engage in Cross Lining or Poaching;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "encourage or induce any other person to engage in Cross Lining or Poaching;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "use DESTINA 1's sponsored Functions, Literature or CDs to support Cross Lining or Poaching."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "8. POTENTIAL ID ASSISTANCE"),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "An ID, with or without an Upline's assistance, must at all times complete all relevant parts of an Application in the presence of the prospect."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "8.1 Explanation to Prospect"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "A Sponsor or Upline must explain to the prospect and complete, in their presence, the details of the Application Forms so that the opportunity comprehends that the Upline or Referrer personally introduces them."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "8.2 Application Subject to Acceptance"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "The Application Form is subject to DESTINA 1's discretion in accepting it as a valid application and making that person's appointment as an ID."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  titleName: "9. COMPLAINTS"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName:
                      "If an ID becomes aware of a breach of this Code, and wishes to proceed to lodge a complaint, the complaint should be made in writing in accordance to DESTINA 1 Policies & Procedures."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontFamily: "OnestRegular",
                  titleName: "Part D - “I AM COMMITTED TO MY SUCCESS”"),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  fontFamily: "OnestRegular",
                  titleName:
                      "“Good Business ethics starts with ME, the Leader. As a DESTINA 1 Independent Distributor, I will.…"),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: "Be honest and fair in my dealings with DESTINA 1;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Perform all my professional activities in a manner that will enhance my reputation and the positive reputation established by DESTINA 1;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Present the Compensation Plan accurately and honestly, clearly portraying the level of effort required to achieve success;\n Present the Compensation Plan accurately and honestly, clearly portraying the level of effort required to achieve success;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Present realistic income possibilities only and solely concerning the appropriate effort involved;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Present the benefits and information of the Business as stated in the DESTINA 1's official literature and from my personal experiences;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Accept and carry out to my best effort all duties expected of an ID and Referrer, including training and supporting the Downlines in my organisation;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Abide by all Policies & Procedures that apply to the operation of my Business;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Strive to ensure that my Downlines are satisfied with my service and leadership;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Answer the questions and queries of prospects and Downlines fairly and honestly;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Refer only to those people that I have developed as my own Downlines and/or business prospects;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Always encourage prospect(s) developed by their initial referrers to be referred by them as well;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Be clear that DESTINA 1 is a network marketing opportunity in which my income is related to my marketing and leadership skills as well as my efforts;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Treat all prospects, Downlines and associates with respect, goodwill and professional courtesy;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Not entice Downlines from outside my Line of Referralship to sign under my organisation;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: "Not misrepresent the DESTINA 1 business in any way;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Not use any advertising that I know may be false or misleading;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Be fair and just to my Downlines and associates, and not engage in practices that may reflect unfavourably on myself, my organisation, DESTINA 1, and the industry;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Conduct myself in such a manner as to reflect only the highest standard of integrity, frankness and responsibility because I recognise that my actions as an ID with DESTINA 1 have far-reaching effects;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Use the information contained in all DESTINA 1 websites for my personal, non-commercial use only;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Not create unapproved or illegal websites, which may tarnish the image of DESTINA 1 and its related companies."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 16,
                  fontFamily: "OnestRegular",
                  titleName:
                      "THIS IS MY PLEDGE AND COMMITMENT TO MYSELF, MY NETWORK, AND DESTINA 1”"),
              // const CustomBulletTextWidget(
              //fontSize: 14,verticalPadding: 1, data: ""),

              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
