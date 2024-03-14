import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class IncomeandEarningsScreen extends StatefulWidget {
  const IncomeandEarningsScreen({super.key});

  @override
  State<IncomeandEarningsScreen> createState() =>
      _IncomeandEarningsScreenState();
}

class _IncomeandEarningsScreenState extends State<IncomeandEarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Income & Earnings"),
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
                  titleName:
                      "We try to represent these products and services and their income potential accurately."),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  fontColor: middleBlackColor,
                  size: 14,
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  titleName:
                      "Earning and/or income statements from DESTINA 1 and/or Independent Distributors estimate what you can earn. There is no guarantee that you will make these income levels, and you accept the risk that the earnings and income statements differ by individual. The examples should not be interpreted as any guarantee, promise, representation and/or assurance. We do not purport our business and/or being in a 'get rich scheme'."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "As with any business, your results may vary based on your capacities, business experiences, expertise, and level of desire."),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  fontColor: middleBlackColor,
                  size: 14,
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  titleName:
                      "There are no guarantees, promises, representations and/or assurances concerning the level of success you may experience. Your level of success in attaining the results claimed depends on the time you devote to the business, the ideas and techniques, your financial knowledge and various skills, as such skills and factors differ according to individuals."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "Testimonials and examples used are exceptional results,"),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  fontColor: middleBlackColor,
                  size: 14,
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  titleName:
                      "which do not, or may not, apply to the average person and are not intended to guarantee, promise, represent and/or assure that anyone will achieve the same or similar results. We reiterate that each individual's success depends on their background, dedication, desires and motivation."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "There is no assurance that examples of past earnings can be duplicated in the future."),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  fontColor: middleBlackColor,
                  size: 14,
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  titleName:
                      "We cannot guarantee your future results and/or success. There are some unknown risks in business and on the Internet that we cannot foresee, which can reduce results. We are not responsible for your actions. Any claims of actual earnings or examples of actual results can be verified upon request."),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(
                  textAlign: TextAlign.justify,
                  size: 14,
                  titleName:
                      "DESTINA 1 information, products and/or services should be based on your due diligence, "),
              const SpaceHeightWidget(height: 5),
              CommonTitle(
                  fontColor: middleBlackColor,
                  size: 14,
                  textAlign: TextAlign.justify,
                  fontFamily: "OnestRegular",
                  titleName:
                      "which you undertake and confirms that you have carried out to your entire satisfaction. You agree that DESTINA 1 is not liable for any success or failure of your business, acts and/or conduct directly or indirectly related to the company and/or the purchase and use of our information, products and/or services."),
              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
