import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  BoxDecoration dec = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: lightBlackColor.withOpacity(0.5)));

  final MainController _profileController = Get.put(MainController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataFun();
    });
  }

  dataFun() {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    _profileController.getViewProfile(bdata);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "View Profile", backNavigation: true),
      body: Obx(() {
        return _profileController.loading.value
            ? loader
            : SingleChildScrollView(
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
                        child: Column(children: [
                          ViewProfileWidget(
                            title: "Full Name",
                            info: _profileController
                                .viewProfileData.value.fullName,
                          ),
                          ViewProfileWidget(
                            title: "Date of Birth",
                            info: _profileController.viewProfileData.value.dob,
                          ),
                          ViewProfileWidget(
                            title: "Joining Type",
                            info: _profileController
                                .viewProfileData.value.joinType,
                          ),
                          ViewProfileWidget(
                            title: "Passport/IC/DL",
                            info: _profileController
                                .viewProfileData.value.passport,
                          ),
                          ViewProfileWidget(
                            title: "Father/Spouse Name",
                            info: _profileController
                                .viewProfileData.value.fathSpousName,
                          ),
                          ViewProfileWidget(
                              title: "Gender",
                              info: _profileController
                                  .viewProfileData.value.gender),
                          ViewProfileWidget(
                            title: "SSN/EIN/ITIN/ATIN/PTIN/CBP",
                            info:
                                _profileController.viewProfileData.value.ssnein,
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
                        child: Column(children: [
                          ViewProfileWidget(
                            title: "Address 1",
                            info: _profileController.viewProfileData.value.add1,
                          ),
                          ViewProfileWidget(
                            title: "City/Area",
                            info: _profileController.viewProfileData.value.city,
                          ),
                          ViewProfileWidget(
                            title: "Area/Zip Code",
                            info: _profileController
                                .viewProfileData.value.zipCode,
                          ),
                          ViewProfileWidget(
                            title: "Dial Code",
                            info: _profileController
                                .viewProfileData.value.dialCode,
                          ),
                          ViewProfileWidget(
                            title: "Email Address",
                            info:
                                _profileController.viewProfileData.value.email,
                          ),
                          ViewProfileWidget(
                              title: "Address 2",
                              info: _profileController
                                  .viewProfileData.value.add2),
                          ViewProfileWidget(
                            title: "State/Province",
                            info:
                                _profileController.viewProfileData.value.state,
                          ),
                          ViewProfileWidget(
                            title: "Country Name",
                            info: _profileController
                                .viewProfileData.value.countryName,
                          ),
                          ViewProfileWidget(
                            title: "Land Line",
                            info: _profileController
                                .viewProfileData.value.landLine,
                          ),
                          ViewProfileWidget(
                            title: "Mobile",
                            info:
                                _profileController.viewProfileData.value.mobile,
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
                        child: Column(children: [
                          ViewProfileWidget(
                            title: "Bank Name",
                            info: _profileController
                                .viewProfileData.value.bankName,
                          ),
                          ViewProfileWidget(
                            title: "Account Number",
                            info: _profileController.viewProfileData.value.acNo,
                          ),
                          ViewProfileWidget(
                            title: "Bank Swift Code",
                            info: _profileController
                                .viewProfileData.value.bankSwiftCode,
                          ),
                          ViewProfileWidget(
                            title: "Type Of Account",
                            info: _profileController
                                .viewProfileData.value.typeOfAc,
                          ),
                          ViewProfileWidget(
                            title: "Bank Branch",
                            info: _profileController
                                .viewProfileData.value.bankBranch,
                          ),
                          ViewProfileWidget(
                              title: "Bank IFSC Code/Routing Number",
                              info: _profileController
                                  .viewProfileData.value.ifscCode),
                          ViewProfileWidget(
                            title:
                                "Account Holder's Name( Same as the Bank Account )",
                            info: _profileController
                                        .viewProfileData.value.acHolderName ==
                                    "0"
                                ? ""
                                : _profileController
                                    .viewProfileData.value.acHolderName,
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
                        child: Column(children: [
                          ViewProfileWidget(
                              title: "Nominee's Name (next of kin)",
                              info: _profileController
                                          .viewProfileData.value.nomieeName ==
                                      "0"
                                  ? ""
                                  : _profileController
                                      .viewProfileData.value.nomieeName),
                          ViewProfileWidget(
                            title: "Nominee's Relationship",
                            info: _profileController
                                .viewProfileData.value.nomieeRelation,
                          ),
                        ]),
                      ),
                      const SpaceHeightWidget(height: 20),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
