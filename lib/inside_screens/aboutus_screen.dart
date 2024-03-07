import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(backNavigation: true, title: "About Us"),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset("assets/images/about-banner.png"),
            const SpaceHeightWidget(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "DESTINA1 BUSINESS",
                      size: 15),
                  const SpaceHeightWidget(height: 3),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "Destina1 is the world's fastest-growing direct-selling company. We manufacture and distribute health, beauty, hair and personal care products exclusively sold in over 80 countries through D1 Independent Representatives.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "INVESTING IN PRODUCT INNOVATION",
                      size: 15),
                  const SpaceHeightWidget(height: 3),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "Destina1 holds more than 50 patents. In the past 12 years, we have invested \$10M in the region's new manufacturing and R&D facilities.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "OUR VISION",
                      size: 15),
                  const SpaceHeightWidget(height: 3),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "To be a global leader in Social Entrepreneurship within the direct-selling industry to provide affordable, high-quality health and wellness solutions using Uniwave Energy By Quantes Technology by developing sustainable and professional network marketing communities worldwide.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 3),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "Destina 1 International adopted the Blue Ocean Strategy for its business growth. The company is successful & committed to building powerful networks. Destina1 creates opportunities globally for members through its DIRECT SELLING system and advanced technology. Its products result from comprehensive R&D in Uniwave Energy by Quantes Technology.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "OUR MISSION",
                      size: 15),
                  const SpaceHeightWidget(height: 3),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "To contribute to the global community through social entrepreneurship to help Mankind. We empower individuals to achieve goals and lead better lives through the socially-driven direct selling platform with innovative health and wellness solution.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 3),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "The core values of Destina 1 International genuinely spell out the company's characteristics; a combination of excellent technologies and customers from all over the world who are using cutting-edge information with a DIRECT SELLING system to market its products. Destina 1's world-class online marketing and delivery tools utilize the latest software technologies.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "OUR CORE VALUES",
                      size: 15),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Our Motto - Destina 1 World No 1",
                      size: 12),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Integrity",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "We believe integrity is more than just honesty, trust is the key to success and truth is more important than money.That is why we at Destina 1 conduct and drive our business with the utmost integrity.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Competency",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "Core ethical competencies in Social Entrepreneurs drive businesses onto a higher rate of success. This in turn, enables the Social Entrepreneurship Platform to shape the direction of the Business Industry.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "The Power of Compassion",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "The power of Compassion lays the foundation for Social Entrepreneurs to work actively towards improving the lives of others through D1’s Social Entrepreneurship platform, Hope For Mankind.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Results - Oriented",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "We are accountable to the success of our requirements-related activities. No matter the challenges faced, we stay resolutely focused on the core principles of gaining alignment and achieving clarity. We also ensure that our efforts are consistently focused on delivering values for our major stakeholders - the company, our shareholders, distributors, customers, employees and community.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Customers For Life",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "To earn our customers' loyalty, we must listen to them, anticipate their needs and acts to create values in their eyes.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Striving for perfection",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "We always seek to improve and innovate. We are here to delight our distributors and customers in everything we do. This gives us the edge.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Serve",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "We succeed through a spirit of excellent service by exceeding our customer's expectations.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Teamwork",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "It needs teamwork to make a company`s dream work. So we work together with the goal to achieve the best for the benefits of our respected Destina 1 distributors.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Just remember T.E.A.M",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName: "Together Everyone Achieves More!",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 10),
                  const CommonTitle(
                      textAlign: TextAlign.justify,
                      titleName: "Leadership",
                      size: 15),
                  CommonTitle(
                    textAlign: TextAlign.justify,
                    titleName:
                        "We are here to lead, to be the best, nothing less.",
                    size: 14,
                    fontFamily: "OnestRegular",
                    fontColor: middleBlackColor,
                  ),
                  const SpaceHeightWidget(height: 20),
                ],
              ),
            ),
          ]),
        ));
  }
}
