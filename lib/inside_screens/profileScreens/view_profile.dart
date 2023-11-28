import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  BoxDecoration dec = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: lightBlackColor.withOpacity(0.5)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "View Profile", backNavigation: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeightWidget(height: 10),
              const CommonTitle(titleName: "Personal Details"),
              const SpaceHeightWidget(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: dec,
                child: const Column(children: [
                  ViewProfileWidget(
                    title: "Full Name",
                    info: "Mr. DESTINA1",
                  ),
                  ViewProfileWidget(
                    title: "Date of Birth",
                    info: "28 Jul 2012",
                  ),
                  ViewProfileWidget(
                    title: "Joining Type",
                    info: "Personal",
                  ),
                  ViewProfileWidget(
                    title: "Passport/IC/DL",
                    info: "790126075411",
                  ),
                  ViewProfileWidget(
                    title: "Father/Spouse Name",
                    info: "DESTINA1",
                  ),
                  ViewProfileWidget(title: "Gender", info: "Male"),
                  ViewProfileWidget(
                    title: "SSN/EIN/ITIN/ATIN/PTIN/CBP",
                    info: "0",
                  ),
                ]),
              ),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(titleName: "Address Details"),
              const SpaceHeightWidget(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: dec,
                child: const Column(children: [
                  ViewProfileWidget(
                    title: "Address 1",
                    info: "Suite 3.2 Level 3, Block B",
                  ),
                  ViewProfileWidget(
                    title: "City/Area",
                    info: "PETALING JAYA",
                  ),
                  ViewProfileWidget(
                    title: "Area/Zip Code",
                    info: "46050",
                  ),
                  ViewProfileWidget(
                    title: "Dial Code",
                    info: "61",
                  ),
                  ViewProfileWidget(
                    title: "Email Address",
                    info: "balajirao.s@gmail.com",
                  ),
                  ViewProfileWidget(
                      title: "Address 2", info: "Bangunan Pan Global"),
                  ViewProfileWidget(
                    title: "State/Province",
                    info: "Johor",
                  ),
                  ViewProfileWidget(
                    title: "Country Name",
                    info: "Malaysia",
                  ),
                  ViewProfileWidget(
                    title: "Land Line",
                    info: "123",
                  ),
                  ViewProfileWidget(
                    title: "Mobile",
                    info: "162635294",
                  ),
                ]),
              ),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(titleName: "Bank Details"),
              const SpaceHeightWidget(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: dec,
                child: const Column(children: [
                  ViewProfileWidget(
                    title: "Bank Name",
                    info: "MAYBANK",
                  ),
                  ViewProfileWidget(
                    title: "Account Number",
                    info: "512884092299",
                  ),
                  ViewProfileWidget(
                    title: "Bank Swift Code",
                    info: "mbbemykl",
                  ),
                  ViewProfileWidget(
                    title: "Type Of Account",
                    info: "0",
                  ),
                  ViewProfileWidget(
                    title: "Bank Branch",
                    info: "PUCHONG",
                  ),
                  ViewProfileWidget(
                      title: "Bank IFSC Code/Routing Number", info: "maybank"),
                  ViewProfileWidget(
                    title: "Account Holder's Name( Same as the Bank Account )",
                    info: "",
                  ),
                ]),
              ),
              const SpaceHeightWidget(height: 10),
              const CommonTitle(titleName: "Nominee Details"),
              const SpaceHeightWidget(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: dec,
                child: const Column(children: [
                  ViewProfileWidget(
                    title: "Nominee's Name (next of kin)",
                    info: "0",
                  ),
                  ViewProfileWidget(
                    title: "Nominee's Relationship",
                    info: "Son",
                  ),
                ]),
              ),
              const SpaceHeightWidget(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
