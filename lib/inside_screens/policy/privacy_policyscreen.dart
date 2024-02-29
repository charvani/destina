import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Privacy Policy", backNavigation: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/privacy-banner.jpg",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Destina 1 International Sdn. Bhd. (also referred to as 'DESTINA 1, 'we', 'us' throughout this document), a member of the D1 Group is committed to protecting your privacy and developing technology to give you a powerful and safe online experience. This Statement of Privacy applies to the DESTINA 1 website http://www.destina1.com and our mobile application and governs data collection and usage. Using the DESTINA 1 website, you consent to the data practices described in this statement."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                      size: 14,
                      titleName: "Collection of your Personal Information"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 collects personally identifiable information, such as your email address, name, home or work address, telephone number, and a pin. DESTINA 1 also collects anonymous demographic information, which is not unique to you, such as your ZIP/Postal code, age, gender, preferences, interests and favourites."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 collects certain types of personally identifiable information from businesses such as company name, location address, contact person, position, phone number, email address, valid ID document type and number, registered date of the company, and a pin. We may collect information about third parties from you, such as details of names, email addresses, and date of birth data. The information is requested to nominate a beneficiary for your Representatives with DESTINA 1 or shipping purposes. If your spouse or family members wish to have their information removed from our site, they may contact us at [email protected]"),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "There is also information about your computer hardware and software that is automatically collected by DESTINA 1. This information can include your IP address, browser type, domain names, access times and referring website addresses. This information is used by DESTINA 1 for the operation of the service, to maintain the quality of the service, and to provide general statistics regarding the use of the DESTINA 1 website. Our website offers publicly accessible blogs or community forums. You should be aware that any information you provide in these areas may be read, collected, and used by others who can access them. To request the removal of your personal information from our blog or community forum, contact us at [email protected]. In some cases, we may be unable to remove your personal information, so we will let you know if we cannot and why."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 encourages you to review the privacy statements of websites you link to from DESTINA 1 to understand how those websites collect, use and share your information. DESTINA 1* is not responsible for the privacy statements or other content of websites outside of the DESTINA 1 website and the DESTINA 1 family of websites."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "When you download and use our services, we automatically collect information on the type of device you use, operating system version, and device identifier (UDID)."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "We do not ask you to access or track location-based information from your mobile device while downloading or using our mobile applications or services."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                      size: 14, titleName: "Use of your Personal Information"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 collects and uses your personal information to help you operate the DESTINA 1 website and deliver the services you have requested, such as allowing you to keep track of new referrals, track shipments, orders and payments, account balances, transactions, activity and performance, commissions and your D1 Global Support Centre (D1GSC). DESTINA 1 also uses your personally identifiable information to respond to your enquiries, allow you to subscribe to RSS feeds, newsletters, articles, and updates, and inform you of other products or services available from DESTINA 1 and its affiliates. DESTINA 1 may also contact you via surveys to research your opinions of current services or potential new services. We may require you to provide us with certain demographic information (such as zip code). We will also use this information to monitor traffic and personalise the site."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 collects and uses your personal information to create your business account and allow you to sell items on the site to individuals, delivering the requested services. We may also use your information to send you relevant newsletters, respond to your enquiries, and allow you to subscribe to RSS feeds, newsletters, articles and updates. Please see the paragraph below to learn how to opt-out/ unsubscribe from certain types of communications."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 does not share, sell, rent or lease its customer information lists to third parties other than as disclosed in this privacy policy. DESTINA 1 may occasionally contact you on behalf of external business partners about a particular offering that may interest you. In those cases, your unique personally identifiable information (email, name, address, telephone number) will not be transferred to the third party. In addition, DESTINA 1 may share data with trusted partners to help us perform statistical analysis, send you email or postal mail, provide customer support, process payments, or arrange deliveries. All such third parties are prohibited from using your personal information except to provide these services to DESTINA 1, and they are required to maintain the confidentiality of your data. Suppose you wish to refrain from receiving email offers, newsletters, articles, or updates. In that case, you may opt-out at any time by using the unsubscribe link at the bottom of each communication or by emailing us at [email protected]."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "We may also disclose your personal information as required by law, such as to comply with a subpoena or similar legal process, when we believe in good faith that disclosure is necessary to protect our rights, to protect your safety or the safety of others, investigate fraud, or respond to a government request."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Suppose we are involved in a merger, acquisition, or sale of all or a portion of our assets. In that case, you will be notified via email and prominent notice on our website of any change in ownership or uses of your personal information and any choices you may have regarding your personal information."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Without your explicit consent, DESTINA 1 does not use or disclose sensitive personal information, such as race, religion, or political affiliations. DESTINA 1 keeps track of the websites and pages our customers visit within DESTINA 1 to determine what DESTINA 1 services are the most popular. This data is used to deliver customised content and advertising within DESTINA 1 to customers whose behaviour indicates interest in a particular subject area."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(size: 14, titleName: "Use of Cookies"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "The DESTINA 1 website use cookies to help you personalise your online experience. A cookie is a text file placed on your hard disk by a web page server. Cookies cannot be used to run programs or deliver viruses to your computer. Cookies are uniquely assigned to you and can only be read by a web server in the domain that issued the cookie."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "One of the primary purposes of cookies is to provide convenient features to save you time. The purpose of a cookie is to tell the web server that you have returned to a specific page. For example, if you personalise DESTINA1's pages or register with the DESTINA 1 site or services, a cookie helps DESTINA 1 to recall your specific information on subsequent visits. This simplifies recording your personal information, such as billing addresses, shipping addresses and so on. When you return to the same DESTINA 1 website, the information you previously provided can be retrieved, so you can easily use the DESTINA 1 features that you customise."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "You can accept or decline cookies. Most web browsers automatically accept cookies, but you can modify your browser setting to decline cookies. If you choose to decline cookies, you may not be able to fully experience the interactive features of the DESTINA 1 services or websites you visit."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Our privacy statement does not cover the use of third-party cookies. We do not have access to or control over these cookies."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                      size: 14, titleName: "Clear Gifs(Web Beacons/Web Bugs)"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Our third-party tracking utility partner employs a software technology called clear gifs (a.k.a. Web Beacons/Web Bugs), which helps us better manage content on our site by informing us what content is effective. Clear gifs are tiny graphics with a unique identifier, similar in function to cookies, and are used to track the online movements of web users. In contrast to cookies, which are stored on a user's computer hard drive, clear gifs are embedded invisibly on web pages and are about the size of the full stop at the end of this sentence. We do not tie the information gathered by clear gifs to our customer's personally identifiable information."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(size: 14, titleName: "Flash LSOs"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "We use local shared objects, also known as flash cookies, to store your preferences, such as volume control, or display content based on what you view on the DESTINA 1 site to personalise your visit. Third parties, with whom we partner to provide certain features on our site or to display advertising based on your web browsing activity, use flash cookies to collect and store information."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Flash cookies differ from browser cookies because of the amount of data, the type of data used, and how data is stored. Cookie management tools provided by your browser will not remove flash cookies. To learn how to manage privacy and storage settings for Flash cookies, click here."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(size: 14, titleName: "Mobile Analytics"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "We use mobile analytics software to allow us to better understand the functionality of our Mobile Software on your phone. This software may record information such as how often you use the application, the events that occur within the application, aggregated usage, performance data, and where the application was downloaded from. We do not link the information we store within the analytics software to any personally identifiable information you submit within the mobile app."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                      size: 14,
                      titleName: "Security of Your Personal Information"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 uses best industry practices to ensure that it secures your personal information from unauthorised access, use or disclosure and secures the personally identifiable information you provide on computer servers in a controlled, secure environment., protected from unauthorised access, use or disclosure. When personal information (such as a credit card number) is transmitted to other websites, it is protected through encryption, such as the Secure Socket Layer (SSL) protocol."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 follows generally accepted industry standards to protect the personal information submitted to us during transmission and after receiving it. However, no method of transmission over the Internet or electronic storage method is 100% secure. Therefore, we cannot guarantee its absolute security."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                      size: 14,
                      titleName: "Social Media (Features) and Widgets"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Our website includes Social Media Features, such as the Facebook 'Like' button and Widgets, such as the 'Share this' button or interactive mini programmes on our site. These features may collect your IP address and which page you visit on our site and set a cookie to enable the feature to function correctly. Social Media Features and Widgets are hosted by a third party or hosted directly on our website. The company's privacy policy governs your interactions with these features."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(size: 14, titleName: "Testimonials"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "We post testimonials on our website, which may contain personal information. We obtain the customer's consent before posting the testimonial to post their name and testimonial. To request the removal of your personal information from our testimonials, contact us at [email protected]. In some cases, we may be unable to remove your personal information, so we will let you know if we cannot and why."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                      size: 14,
                      titleName: "Access to Your Personal Information"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Suppose your personal information changes or you no longer desire our service. In that case, you may correct, delete inaccuracies, or update them by selecting 'Profile' once logged into your account or contacting us at [email protected]. We will respond to your enquiries within 30 days. We will retain your information for as long as your account is active or as needed to keep providing you with our services. If you wish to cancel your account or request that we no longer use your information to provide services, contact us at the email address listed above. We will retain and use your information as necessary to comply with our legal obligations, resolve disputes, and enforce our agreements."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(
                      size: 14, titleName: "Changes to this Statement"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "We may update this privacy statement to reflect changes to our information practices. Suppose we make any changes we deem material changes. In that case, we will notify you by email (sent to the email address registered to your account) or through a notice on the DESTINA 1 website before the change becomes effective. Please periodically review this page for the latest information on our privacy practices."),
                  const SpaceHeightWidget(height: 15),
                  const CommonTitle(size: 14, titleName: "Contact Information"),
                  const SpaceHeightWidget(height: 5),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "DESTINA 1 welcomes your comments regarding this Statement of Privacy. If you believe that DESTINA 1 has not adhered to this statement, contact DESTINA 1's webmaster. We will use commercially reasonable efforts to determine and remedy the problem promptly."),
                  const SpaceHeightWidget(height: 8),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "Destina 1 International Sdn. Bhd."),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "SUITE F-3-3 & F-3A-3 ,"),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "SETIAWALK, PERSIARAN WAWASAN,"),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "PUSAT BANDAR PUCHONG,"),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "47160, PUCHONG,"),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "SELANGOR DARUL EHSAN, MALAYSIA."),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName:
                          "Tel : (603) - 5888-7789, (603) - 8600-4650, (603) - 8600-4651"),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "Fax : (603) - 5879-9789"),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "Whatsapp/Telegram Support : 6011 1026 1789"),
                  CommonTitle(
                      fontColor: middleBlackColor,
                      fontFamily: "OnestRegular",
                      size: 13,
                      titleName: "Email : [email protected]"),
                  const SpaceHeightWidget(height: 35),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
