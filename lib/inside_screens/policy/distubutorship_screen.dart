import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class DistributorshipRulesScreen extends StatefulWidget {
  const DistributorshipRulesScreen({super.key});

  @override
  State<DistributorshipRulesScreen> createState() =>
      _DistributorshipRulesScreenState();
}

class _DistributorshipRulesScreenState
    extends State<DistributorshipRulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppBar(backNavigation: true, title: "Distributorship Rules"),
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
                  titleName: "INTRODUCTION"),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify, size: 14, titleName: "PURPOSE"),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      'These Rules and Regulations were established to protect the rights of and regulate the methods in which the business is conducted by you, your customers, other Distributors and Destina 1 International Sdn. Bhd (hereinafter referred to as " Destina 1"). This document, in conjunction with the Independent Distributor Application Form, Terms of Agreement, and the Marketing Plan, comprises the contract between the Distributor and Destina 1. Violating any provision of this policy will be deemed a breach of your agreement with Destina 1 and may result in the termination of your rights as an Independent distributor and/or loss of your rights to receive compensation of any type. Destina 1 reserves the right to change or modify the Independent Distributor Application Form and Terms of Agreement, the Marketing Plan or the Policies and Procedures at any time. Any changes or amendments shall automatically become part of the Distributor\'s contract with Destina 1'),
              const SpaceHeightWidget(height: 15),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "DEFINITION"),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "For the DESTINA 1 Distributorship Rules and Regulations, unless the context otherwise requires or unless repugnant to or inconsistent with such context, the following words or expressions shall have the following meanings:-"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      '"Distributor" shall mean, for the DESTINA 1 Distributorship Rules and Regulations, a person who has applied under Clause 1 herein and whose application has been accepted by DESTINA 1;'),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: "“DESTINA 1” shall mean DESTINA 1 International;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: '"CDC" shall mean "Crown Diamond Council";'),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: '"CV" shall mean "Commissionable Value";'),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: '"PCV" shall mean "Personal Commissionable Value";'),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      '"Product" or "Products" shall mean products produced or which bear the DESTINA 1 Label;'),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: '"SCN" shall mean Show Cause Notice;'),
              const SpaceHeightWidget(height: 10),

              CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestSemiBold",
                  size: 14,
                  fontColor: middleBlackColor,
                  titleName:
                      '"Sponsor" shall mean an existing Distributor who introduces a new member to be a Distributor of DESTINA 1 and whose name appears on the new member\'s Distributor Application Form as the Sponsor. Unless the context otherwise requires or unless repugnant or inconsistent with such context, the following interpretations shall apply:-'),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "references to clauses and sub-clauses are to be construed as references to clauses and subclauses of this DESTINA 1 Distributorship Rules and Regulations;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "regards to DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan and any of its policies, federal or state legislations or provisions of such legislation shall include such conditions as modified, amended or re-enacted;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "references to persons include any body corporate or partnership;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "words denoting the singular number have the plural number and vice versa;"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "the headings to the clauses are for ease of reference only and shall not affect the interpretation of the DESTINA 1 Distributorship Rules and Regulations; and"),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "references to any party,including its successors in title and permitted assigns."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Application for Distributorship"),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Only applicants aged 18 years and above may apply to become a Distributor."),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "To become a Distributor of DESTINA 1, an applicant is required to complete and sign the Distributorship Application Form and shall irrevocably agree to abide by the DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan and any of its policies, including but not limited to any variation, amendment or modification. Any distributorship application is subject to the approval of DESTINA 1. The completed Distributorship Application Form must be handed to any Service Centre, Stockist Centre, Destina 1 Country Licensee Office, Destina 1 branch office or Head Office, where receipt of the payment submission will be acknowledged with a cash bill issued."),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "A Distributor is prohibited from submitting false or inaccurate information to DESTINA 1. A Distributor shall inform DESTINA 1 of any changes affecting the accuracy of the Distributor's details. DESTINA 1 reserves the right to terminate any distributorship immediately if it determines that the Distributor provided false or inaccurate information."),

              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Status of Distributorship"),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "Application can be submitted for the following status:"),

              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Husband and wife are automatically deemed to be registered as Joint Distributors with a single distributorship code. Suppose the husband or wife is found to have registered as a Distributor of DESTINA 1 after the spouse has earlier been a Distributor of DESTINA 1. In that case, the later registration of distributorship will be cancelled and/or the whole group will be transferred to the spouse. However, in the event, if a couple marries after both of their joint dates, they are allowed to hold two separate distributorship codes."),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "A husband with more than one legal wife can only elect ONE wife for the husband and wife partnership, subject to the appropriate local legislation. Subsequent wives who wish to be Distributors MUST join as a SINGLE identity without the presence of a spouse."),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "A corporation cannot be accepted as a Distributor of DESTINA 1. Nevertheless, if a Distributor wishes to change his distributorship to a private company or a partnership, written approval from DESTINA 1 shall be obtained. If DESTINA 1 has approved the distributorship application by a corporation, private company, or partnership, any change to the equity structure of the said corporation, private company, or partnership must first obtain the approval of DESTINA 1. If DESTINA 1 determines that false or inaccurate information was provided or any change to the equity structure has been done without the consent of DESTINA 1, DESTINA 1 reserves the right to terminate the distributorship."),

              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Conditional Life Distributorship"),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "A distributorship with DESTINA 1 is for a lifetime, and no yearly renewal of the distributorship is necessary. PROVIDED THAT the Distributor must have at least one (1) personal purchase transaction with CV in each calendar year. Personal purchase transaction refers to purchasing DESTINA 1 Products(s) with CV, regardless of amount, made in theDistributor's name."),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Failure to comply with the above requirement shall render the distributorship of the concerned to lapse on 31st December of that calendar year without further notice. Any reinstatement may be done between 1st January and 31st March in the same calendar year of expiry in a single cash bill subject to the following:-"),
              const SpaceHeightWidget(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "the Distributor has achieved the minimum monthly PCV required for the bonus; and"),
              ),

              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "the reinstatement is endorsed by the CDC and approved by the management of DESTINA 1"),
              ),

              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "For new distributorship joining between 1st October and 31st December, the expiry date shall be extended until 31st December of the following year."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A distributor whose distributorship has lapsed may re-register as a new Distributor under the same or another Sponsor; however, he will be considered and deemed as a new Distributor and, therefore, not entitled to his former networks."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The reinstatement would be effective upon due approval from DESTINA 1's management. In other words, the reinstatement would not be backdated. Purchases, if any, made after the lapse of distributorship would be accumulated and encoded according to the marketing plan in the month of reinstatement"),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor who fails to reinstate his distributorship within the above said grace period may not be entitled to reinstate his former network upon their re-registration after the grace period."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor's distributorship shall be terminated if he (or any one of the spouse/partner/party/member of the company including proxy) is directly or indirectly involved in any of the disciplinary cases such as:"),

              const SpaceHeightWidget(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "sponsoring other Distributors in an improper/invalid manner;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "changing the selling price of a product without obtaining prior approval of DESTINA 1;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "involved in other direct sales companies or any company having direct competition with DESTINA 1;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "in breach of DESTINA 1 Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan or any of its policies;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "conducting any activities that directly or indirectly will bring adverse effects to DESTINA 1 or affect DESTINA 1's goodwill;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "selling or distributing other countries Products in another country in which DESTINA 1's market has been established;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "delivering, distributing or selling DESTINA 1's Products from one country to another country (in which DESTINA 1's market has been established) without written approval from DESTINA 1;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "making false claims about the Product(s) or the DESTINA 1 Marketing Plan."),
              ),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Registration Fee"),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "The registration fee is to be determined by DESTINA 1, which is subject to change at any point and shall take effect immediately upon issuing any official announcement or notice."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "DESTINA 1 Starter Kit & Replicated Website"),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Distributors will receive a DESTINA 1 Starter Kit & Replicated Website upon registration. The Starter Kit, business materials or sales aids' price is set at a cost: not a service or franchising fee, strictly to offset costs incurred by DESTINA 1 in producing and distributing the marketing tools and materials. No CV shall be given, and no commissions or bonuses shall be paid on the purchase of the starter kit or business materials, or sales aid. The Distributor may purchase additional kits for reselling to recruits. The Starter Kit shall be sold at a price fixed by DESTINA 1 and is strictly prohibited from being sold/resold for profit or markup."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Distributor's Purchase Order"),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Products can be purchased by cash (or by any mode of payment so accepted by DESTINA 1) from DESTINA 1 and valid stockists. A cash bill will be issued for each private purchase (Distributor). All purchases after the month's end cannot be backdated from the date of purchase."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Entitlement to Monthly Bonus"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor must maintain a monthly PCV for bonus qualification and commission overriding. Bonuses are paid according to DESTINA 1's Marketing Plan when and where a Distributor has maintained the required monthly PCV."),

              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "In addition, DESTINA 1 reserves the right to recoup any bonuses paid to any Distributors on Products or services under the following circumstances:"),
              const SpaceHeightWidget(height: 5),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data: "returned under DESTINA 1's refund policy"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data: "returned to an authorised stockist; or"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data: "stolen or obtained by fraudulent means."),
              ),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "The discrepancy in Monthly Bonus Statement"),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "DESTINA 1 shall be informed in writing within thirty (30) days from the date of the monthly bonus statement being made available to the Distributor or the date of receipt of the monthly bonus statement of any discrepancy in the said statement, after which at the end of the specified period, all monthly bonus statement shall be deemed as final and conclusive, and DESTINA 1 shall not entertain any inquiry or complaint."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "Suspension and Termination of Bonuses, Incentives and Benefits"),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "DESTINA 1 reserves the complete and absolute right, at any point in time, to withhold or suspend or terminate a Distributor's benefits, including but not limited to bonuses, incentives, commissions, benefits, entitlements, etc., in the event:"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor has been issued with an SCN for violating any provisions of the DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan or any of its policies; or"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor who is currently in the process of due inquiry conducted by DESTINA 1 for allegedly violating any provisions of the DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan or any of its policies; or"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor who has been found liable by DESTINA 1 for violating any provisions of the DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan or any of its policies; or"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Pending the finalisation of the transfer of the distributorship to the beneficiary; or"),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Any other causes/reasons deemed necessary and fit by DESTINA 1.."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Responsibilities of a Distributor"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor is independent and is free to operate on his own. Therefore, a Distributor shall not claim or represent as an employee of or havean employment relationship with DESTINA 1. A Distributor is strictly prohibited from representing himself as such. Disciplinary action shall be taken against those who have breached this regulation."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall represent the Products, services, and opportunity of becoming a Distributor ethically and professionally."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "No representation or sales offers may be made relating to Products and services which are inaccurate in price, grade, quality, and liability."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "No unreasonable, misleading, or unrepresentative earnings claims may be made. No income guarantees of any kind shall be made."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor may not solicit or persuade any other Distributor to sell or purchase products or services other than those offered by DESTINA 1. A Distributor agrees that violatingthese rules inflicts irreparable harm to DESTINA 1 and agrees that injunctive relief is an appropriate remedy to prevent it."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor is responsible for his own business decisions and expenditures."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall comply with the DESTINA 1 Distributorship Rules & Regulations, Code of Conduct, DESTINA 1 Marketing Plan and any of its policies."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor is personally responsible and accountable for compliance with all applicable national, state, municipal and local laws and regulations."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall comply with all laws, regulations and codes of practice applying to the operation of his distributorship and shall not engage in any activity which may bring disrepute to themselves or DESTINA 1."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall not make any representation to a prospective recruit and/or customer which cannot be verified or make any promise which cannot be fulfilled. A Distributor shall not present any information to the customer/prospect falsely or deceptively."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Restriction / Right to Area"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor is not allowed to have any right or restrict a particular area. Itis strictly prohibited to declare that they have any specific right in a particular site."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor is strictly prohibited from distributing or selling any Products manufactured explicitly for a particular country in any other country unless written approval from DESTINA 1."),

              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Restriction on Products"),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "DESTINA 1's Products are prohibited from being sold or exhibited in grocery shops, stores, mini-markets / supermarkets, military stores or trade fairs."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Manner of Selling and Selling Price"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The selling price of any DESTINA 1 Product is determined by DESTINA 1, and no Distributor shall be allowed to reduce or increase the price including by way of tampering with the selling price as affixed or determined by DESTINA 1 on the label or packaging of the product. Breach of this regulation shall result in having their distributorship suspended or terminated by DESTINA 1."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "DESTINA 1 reserves the right to revise the selling price, including but not limited to the CV of the Product, without any prior notice and the revised price so determined or fixed shall have immediate effect upon its official announcement."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor is not allowed to deliver, distribute or sell any Products by way of discounts, gifts, or promotion that in aggregate or anyhow are confirming the Products are distributed or sold below or above the selling price so determined and permitted by DESTINA 1 unless the discounts, gift or promotion is organised and approved by DESTINA 1"),
              const SpaceHeightWidget(height: 5),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Product Claims"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall not make any medical claim for any Product nor specifically prescribe any given Product as suitable for any ailment, as that type of representation implies the Products are drugs rather than cosmetics or nutritional. Under no circumstances should any Products be likened to drugs and or medicine prescribed for treating specific ailments."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A distributor shall be held liable and responsible for any false claims of the product, leading to disciplinary or suspension or termination of distributorship."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "While DESTINA 1 makes every effort to comply with complicated and periodically amended regulations fully, no Distributor should or attempt to state or claim that any Product is approved by the Ministry of Health or any other governmental authority."),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Improper Sponsoring of Distributor and Penalty"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Improper sponsoring and its penalty improper ways of sponsoring Distributors in the following context are prohibited:"),
              const SpaceHeightWidget(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "sponsoring a Distributor who is already a Distributor of another group or upline;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "sponsoring the spouse of a person who is already a Distributor of another group"),
              ),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The following actions will be taken if improper sponsoring is proven to have occurred:"),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "Distributorship shall be terminated with immediate effect. If the distributorship is terminated, all Distributors who were also improperly sponsored will have their distributorships terminated. The said terminated Distributors may appeal to Destina 1 to have their distributorships replaced or transferred to the Original or New Sponsor subject to Destina 1's sole discretion and upon terms & conditions which may be imposed by Destina 1."),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "If the spouse of a Distributor is found to have become a Distributor of another group, B's distributorship shall be terminated immediately."),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "Penalty letters will be issued to all those who are involved."),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data: "No arrears of bonus will be considered."),
              ),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: "Proxy and its Penalty"),
              const SpaceHeightWidget(height: 5),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      "Suppose a Distributor establishes a group not under his hierarchy but has a self-interest in developing the group. In that case, the Distributor is deemed involved in this activity, and his distributorship will be suspended or terminated. "),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Involvement in other Direct Sales Company"),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor who has achieved the status of Diamond and above is not allowed to be involved directly or indirectly (including by proxy) in any other direct sales companies or activities that will negatively affect DESTINA 1. Any Distributor who commits such an offence shall have his distributorship terminated immediately by DESTINA 1."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall not directly or indirectly and whether on his behalf or with or for any other person, solicit, promote or recruit any member of their down-line organisation to join or participate in any other direct selling or network marketing business or to distribute, sell or promote any products or services competitive with DESTINA 1."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "Breach of the DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan and Any of its Policies"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Suppose a Distributor breaches DESTINA 1 Distributorship Rules and Regulations, Code of Conduct provisions. In that case, DESTINA 1 Marketing Plan or any of its policies, the Distributor's distributorship may be suspended or terminated immediately."),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "During the period of DESTINA 1's investigation or issuance of SCN or suspension notice for the alleged violation of the DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan and or any of its policies, the following shall be applied:"),
              const SpaceHeightWidget(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "DESTINA 1 may provide verbal reprimand or issue a Warning Notice to the Distributor for the violation of the DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan or any of its policies;"),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "In the event that an SCN is issued to a Distributor, the Distributor shall, within fourteen (14) days from the date of the same, provide his written explanation relating to the allegations for consideration by DESTINA 1. DESTINA 1 reserves the right to suspend the said Distributor from participating in or carrying out activities which include but are not limited to placing orders, making sales or purchases, dealing with DESTINA 1's Products, dealing with networks, sponsoring, modifying Distributors information, attend training, participate in DESTINA 1's activities, participate in promotional activities or incentives campaigns, receiving bonuses, commissions or incentives until a final decision is made by DESTINA 1."),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "If the Distributor fails to provide any written reply to the SCN within the said period, DESTINA 1 shall have the right to take such actions as it considers proper."),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "Based on any information obtained from collateral sources or DESTINA 1's investigation of the statements and facts taken together with information submitted to DESTINA 1 during the response period, DESTINA 1 shall make a final decision regarding the appropriate remedy, which includes the termination of the Distributor's distributorship. DESTINA 1 reserves the right to impose any remedies for similar violations of DESTINA 1 Distributorship Rules and Regulations, Code of Conduct, DESTINA 1 Marketing Plan or any of its policies on a case-by-case basis. DESTINA 1 will notify the Distributor of its decision, and all remedies will be effective forthwith as of the date on which notice of DESTINA 1's decision is served."),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "In the event of termination of the Distributor's distributorship, the Distributor's distributorship /status and all benefits according to the DESTINA 1 Marketing Plan, including but not limited to benefits on promotion activities, incentives campaigns, and entitlements shall be forfeited. Henceforth, the terminated Distributor is automatically prohibited from dealing in whatsoever manner with DESTINA 1's Products, networks and activities."),
              ),
              const SpaceHeightWidget(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "Any Distributor terminated may apply for a new distributorship from DESTINA 1 after six (6) months. However, acceptance of the application is subject to verification and approval by DESTINA 1."),
              ),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Beneficiary"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor may appoint any person of the same nationality as his beneficiary. If no beneficiary is named in the distributorship form, the beneficiary shall be the next of kin. However, if there is a dispute relating to the beneficiary after the death of a Distributor, the appropriate court shall decide the beneficiary. DESTINA 1 reserves the right to suspend any benefits, including but not limited to bonuses and commissions, until the court makes a final decision."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall not transfer, allocate, or otherwise transfer any right conveyed under his distributorship to any person without written approval from DESTINA 1. A Distributor may delegate his responsibilities but be and is ultimately responsible for ensuring compliance with the applicable laws and regulations."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Properties of DESTINA 1"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "DESTINA 1 logos, trademarks, service marks, Product names, and other tangible or intangible commercial assets, registered or otherwise, videotapes, stationeries, and printed materials provided and related to DESTINA 1 are the properties of DESTINA 1. Henceforth, they are not to be used, extracted or reproduced by any Distributor without written approval from DESTINA 1."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "All promotional materials including but not limited to flyers, business cards, pamphlets, brochures, and books prepared in accordance with the sub-clause below, may be distributed through personal contact only. They may not be posted in public places, mass mailed, put in mailboxes, or disseminated by any other non-personal communication means. Materials may not be distributed through unsolicited faxed or E-mail messages."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The aiming Protection Reserved by Destina 1. In addition to any relevant intellectual property laws, the following list of names is also reserved and restricted from use by Distributors in their Distributor activities except in the case of promoting Destina 1 without any misrepresentation or malice: D1 International, Destina 1 International Sdn.Bhd, Bio.Matrix.Science, Destina 1 and all other names of companies under the D1 Group. These names are also prohibited from use by Distributors concerning their Distributor business activities on their website and/or e-mail addresses."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "Distributor Agreement;An Agreement between a Distributor and DESTINA 1 takes effect as soon as the distributorship is approved by DESTINA 1."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "Transfer of Distributorship; Transfer of distributorship is divided into two categories:"),
              const SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontColor: middleBlackColor,
                  titleName: "DEATH:"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "If a Distributor passes away, the beneficiary will automatically take over the distributorship. If no beneficiary is named, the distributorship transfer will be determined per the law prevailing in the country. Simultaneously, DESTINA 1 reserves the right to suspend all benefits, including but not limited to bonuses and commissions, until the issue is resolved."),
              const SpaceHeightWidget(height: 10),
              CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  fontColor: middleBlackColor,
                  titleName: "INDISPOSITION:"),
              const SpaceHeightWidget(height: 10),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor who has reached age 65 or cannot continue the DESTINA 1 business due to health complications, if accepted by DESTINA 1, shall be allowed to transfer the distributorship to anyone as he wishes or to his beneficiary."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Double Registration"),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A married couple at the point of registration as DESTINA 1 Distributor shall be given a standard code, which means a single DESTINA 1 distributorship entity; thus, at any one moment, a registered DESTINA 1 Distributor with a married status is prohibited from applying or acquiring an additional new distributorship under his name or his spouse name."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "In the event that a double registration has been detected and confirmed as such, DESTINA 1 reserves the right and shall terminate the newer distributorship code with immediate effect without further reference or notice. Accordingly, DESTINA 1 shall transfer all the newer distributorship code's down-lines and accumulated CVs to the old distributorship code."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Disciplinary action such as suspension or termination shall be applied towards any Distributor or Sponsor directly, indirectly or accidentally found to be involved in double registration."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Request for Changing Sponsors"),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Application for change of Sponsor is not allowed by DESTINA 1."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Suppose a Distributor insists on changing his Sponsor. In that case, he can write to DESTINA 1 to terminate his existing distributorship and wait six (6) months before re-applying for distributorship under a new Sponsor."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "For a Distributor whose distributorship has lapsed, a distributor may request to change his Sponsor by re-registering by following the procedure stated in Clause 3."),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "A Distributor shall not directly or indirectly encourage, persuade, involve or assist another Distributor to transfer to a different Sponsor. This includes offering financial or other tangible or intangible incentives or benefits to induce the Distributor to terminate his existing distributorship and re-register under a different sponsor. Any Distributor liable to be involved in such practice may result in their distributorship being suspended or terminated immediately."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Direct Sales Contract and Cooling Off Period"),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "For any purchase of RM300 and above, A Distributor must offer a fourteen (14 ) days cooling-off period to his customers and notify each customer by a legally prescribed form of his right to rescind or terminate the purchase or retail sale contract within fourteen (14 ) days commencing the day after the purchase or agreement is made and provide to the customer the legally prescribed form of the notice of rescission for the retail customer's use if he so chooses. During the cooling-off period, no Products shall be delivered to the customer, and no payment shall be accepted from the customer unless the customer has given a seventy-two (72) hours written notice or more after signing the sale contract, requiring the delivery of the said products or goods before the expiry of the cooling off period."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "DESTINA 1 encourages Distributors to honour a request for a refund or Product exchange made within the cooling-off period. Moreover, a Distributor must offer his retail customer a fourteen days money-back guarantee. This means that a Distributor must, for any reason and upon request, give the customer a full refund of the purchase price. The only requirement is that the retail customer can request the refund within fourteen (14) business days after the date of delivery of the Products and returns the unused product to the Distributor."),

              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Buy Back Policy"),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      'DESTINA 1 practices a Buy Back Policy to ensure maximum satisfaction of its Distributors. This policy allows every Distributor to return unsold DESTINA 1 Products in their original condition and of merchantable quality within one hundred eighty (180) days from the date the Products were purchased. Products in the "original condition and of merchantable quality" means the Products which are still in the market (the production has not yet stopped), with the price label still intact and clean, in unopened boxes and good condition. DESTINA 1 reserves the right to reject any returned Product that does not meet such specification or requirement. The Distributors must fill out the Distributor Buy Back Forms in any DESTINA 1 Services or Stockist Centre.'),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Distributors who wish to terminate their distributorship must submit the completed Distributor Resignation Form to Destina 1. Subsequently, they can return to any of the DESTINA 1 Service or Stockist centres all unsold DESTINA 1 Products that are in the original condition and of merchantable quality within one hundred eighty (180) days from the date the Products were purchased."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data: "Return of Inventory and Sales Aids by Distributors."),
              const SpaceHeightWidget(height: 5),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  size: 14,
                  titleName:
                      'Upon cancellation of a Distributor\'s Agreement, the Distributor may return inventory and sales aids for a refund if they cannot sell or use the merchandise. A Distributor may only return products and sales aids purchased by them that are in resalable condition. Upon receipt of the products and sales aids, the Distributor will be reimbursed 90% of the net cost of the original purchase price(s), less shipping and handling charges. The refund will be credited to the same account if the purchases were made through a credit or debit card. The company shall deduct from the reimbursement paid to the Distributor any commissions, bonuses, rebates, or other incentives the Distributor received associated with the returned merchandise.'),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "DESTINA 1 will deduct 85% fromthe CV for all returned Products for a bonus paid eighty percent (80%) and a five percentage (5%) handling fee."),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The following documents should accompany the products returned:"),
              const SpaceHeightWidget(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "Relevant cash bills/invoices (only original copy is considered valid);"),
              ),
              const SpaceHeightWidget(height: 5),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data:
                        "Distributor Welcome Letter, which is still good; and"),
              ),
              const SpaceHeightWidget(height: 5),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomRoundBullet(
                    fontSize: 14,
                    verticalPadding: 1,
                    data: "Distributor Resignation Form"),
              ),
              const SpaceHeightWidget(height: 5),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "DESTINA 1 will send the refund using crossed cheque after deducting the bonus paid, handling fee and whatever balance is due. The cheque will be sent to the Distributor by registered mail or courier within thirty (30) days from the return date."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Distributors are advised not to purchase over. Products should be purchased based on a realistic estimation of the customer's orders."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The distributor must inspect all products ordered at the time of delivery. Once the distributors accept the product, it shall be deemed to conform to the distributors' order and be free from defects. In the event any of the products come with a manufacturer warranty, the period of the warranty and its terms & conditions shall apply."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "The company will only exchange the product if the returned products are damaged during shipment, incorrectly sent, or of substandard quality."),
              const SpaceHeightWidget(height: 10),

              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName: "Distributor Website Regulations"),
              const SpaceHeightWidget(height: 10),

              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "Any distributor wishing to establish a link to the DESTINA 1 website or its subsidiary sites must submit an application stating its purposes and be approved by DESTINA 1 before posting the link."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "No site references DESTINA 1, its Products or links to the DESTINA 1 website is permitted to make unsubstantiated income or Product claims."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "No site should make it appear that it is a DESTINA 1 subsidiary or that the site is in any way sanctioned, approved or endorsed by DESTINA 1."),
              const SpaceHeightWidget(height: 5),
              const CustomBulletTextWidget(
                  fontSize: 14,
                  verticalPadding: 1,
                  data:
                      "All site links to DESTINA 1 must first obtain written approval from Destina 1 and clearly state in a prominent location that an independent distributor is operating them."),
              const SpaceHeightWidget(height: 5),

              // CommonTitle(
              // textAlign: TextAlign.justify,
              // fontFamily: "OnestRegular",
              // size: 14,
              // titleName: ""),

              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
