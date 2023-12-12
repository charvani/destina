import 'package:destina_1_international/authentication_screens/register_screen.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';
import '../controllers/main_controller.dart';

class SponsorCheckScreen extends StatefulWidget {
  final String packageCode;
  final String countryId;
  const SponsorCheckScreen(
      {super.key, required this.countryId, required this.packageCode});

  @override
  State<SponsorCheckScreen> createState() => _SponsorCheckScreenState();
}

class _SponsorCheckScreenState extends State<SponsorCheckScreen> {
  MainController registerController = Get.put(MainController());

  final formKey = GlobalKey<FormState>();
  TextEditingController sponsorIdTController = TextEditingController();
  TextEditingController sponsorNameTController = TextEditingController();
  TextEditingController placementIdTController = TextEditingController();
  TextEditingController palcementNameTController = TextEditingController();
  bool sponsorIdInvalid = false;
  bool placemetnIdInvalid = false;

  Future<bool> sponsorIdCheckFun() async {
    if (sponsorIdTController.text != "" && sponsorIdInvalid == false) {
      Map params = {"Action": "GetSponsor", "ID": sponsorIdTController.text};
      dynamic res = await registerController.getSponsorCheckDb(params);
      print("sponsor id res...$res");
      if (res['Msg'].toString().toLowerCase() != "success") {
        CommonToast("Invalid sponsor id");
        setState(() {
          sponsorIdInvalid = true;
          sponsorIdTController.text = "";
          sponsorNameTController.text = "Invalid sponsor id";
        });
        return false;
      } else {
        setState(() {
          sponsorNameTController.text = res['GetID'];
          sponsorIdInvalid = false;
        });
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> placementIdCheckFun() async {
    if (placementIdTController.text != "" && placemetnIdInvalid == false) {
      Map params = {"Action": "GetSponsor", "ID": placementIdTController.text};
      dynamic res = await registerController.getSponsorCheckDb(params);
      print("placementIdTController id res...$res");
      if (res['Msg'].toString().toLowerCase() != "success") {
        CommonToast("Invalid placement id");

        setState(() {
          placemetnIdInvalid = true;
          placementIdTController.text = "";
          palcementNameTController.text = "Invalid placement id";
        });
        return false;
      } else {
        setState(() {
          placemetnIdInvalid = false;
          palcementNameTController.text = res['GetID'];
        });
        return true;
      }
    } else {
      return false;
    }
  }

  String groupVal = "";

  Future<bool> placementPlaceCheckFun() async {
    if (placemetnIdInvalid == false &&
        sponsorIdInvalid == false &&
        placementIdTController.text != "" &&
        sponsorIdTController.text != "" &&
        groupVal != "") {
      Map params = {
        "SprID": sponsorIdTController.text,
        "PlaceID": placementIdTController.text,
        "Placement": groupVal == "Left" ? "0" : "1"
      };
      dynamic res = await registerController.getPlacementPlaceCheckDb(params);
      print("getPlacementPlaceCheckDb id res...$res");
      if (res['Msg'].toString().toLowerCase() != "success") {
        CommonToast(res['Message']);
        if (res['Message'].toString().contains('Placement ID')) {
          setState(() {
            placementIdTController.text = "";
            palcementNameTController.text = "";
            groupVal = "";
          });
          return false;
        } else {
          setState(() {
            sponsorIdTController.text = "";
            sponsorNameTController.text = "";
            groupVal = "";
          });
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Sponsor Information"),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SpaceHeightWidget(height: 10),
                const RegisterTitleWidget(title: "SPONSOR INFORMATION"),
                const SpaceHeightWidget(height: 15),
                RegisterTextField(
                  onTapFun: () {
                    placementIdCheckFun();
                  },
                  onchangeFun: (val) {
                    setState(() {
                      sponsorIdInvalid = false;
                    });
                  },
                  outsideFun: (val) async {
                    // sponsorIdCheckFun();
                    // placementPlaceCheckFun();
                  },
                  textInputType: TextInputType.name,
                  hintText: "ex: John Lee",
                  labelText: "Sponsor User ID",
                  controller: sponsorIdTController,
                  validation: (val) {
                    if (sponsorIdInvalid) {
                      return "Invalid sponsor id";
                    } else if (val!.isEmpty) {
                      return "Sponsor user id";
                    } else {
                      return null;
                    }
                  },
                ),
                RegisterTextField(
                  readOnly: true,
                  onTapFun: () {
                    sponsorIdCheckFun();
                    placementPlaceCheckFun();
                  },
                  textInputType: TextInputType.name,
                  labelText: "Sponsor Name",
                  hintText: "ex: John Lee",
                  controller: sponsorNameTController,
                  validation: (val) {
                    return null;
                  },
                ),
                RegisterTextField(
                  onTapFun: () {
                    sponsorIdCheckFun();
                  },
                  onchangeFun: (val) {
                    setState(() {
                      placemetnIdInvalid = false;
                    });
                  },
                  outsideFun: (val) async {
                    // placementIdCheckFun();
                    // placementPlaceCheckFun();
                  },
                  textInputType: TextInputType.name,
                  labelText: "Placement ID",
                  hintText: "ex: John Lee133",
                  controller: placementIdTController,
                  validation: (val) {
                    if (placemetnIdInvalid) {
                      return "Invalid placement id";
                    } else if (val!.isEmpty) {
                      return "Placement id";
                    } else {
                      return null;
                    }
                  },
                ),
                RegisterTextField(
                  onTapFun: () {
                    placementIdCheckFun();
                    placementPlaceCheckFun();
                  },
                  readOnly: true,
                  textInputType: TextInputType.name,
                  labelText: "Placement ID Name",
                  hintText: "ex: John Lee",
                  controller: palcementNameTController,
                  validation: (val) {
                    return null;
                  },
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: lightDarKBlue.withOpacity(0.3))),
                      child: Row(
                        children: [
                          Radio(
                              value: "Left",
                              groupValue: groupVal,
                              onChanged: (val) {
                                setState(() {
                                  groupVal = val.toString();
                                });
                                placementPlaceCheckFun();
                                sponsorIdCheckFun();
                                placementIdCheckFun();
                              }),
                          const Text("Left"),
                          Radio(
                              value: "Right",
                              groupValue: groupVal,
                              onChanged: (val) {
                                setState(() {
                                  groupVal = val.toString();
                                });
                                placementPlaceCheckFun();
                                sponsorIdCheckFun();
                                placementIdCheckFun();
                              }),
                          const Text("Right")
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        color: whiteColor,
                        width: 95,
                        child: Text(
                          "Select Placement",
                          style: TextStyle(
                              fontFamily: "OnestSemiBold",
                              fontSize: 10,
                              color: blackColor),
                        ))
                  ],
                ),
                const SpaceHeightWidget(height: 35),
                CustomElevatedButton(
                    onTapFun: () {
                      if (formKey.currentState!.validate()) {
                        if (groupVal != "") {
                          Get.to(() => RegisterScreen(
                                placementId: palcementNameTController.text,
                                sponsorId: sponsorNameTController.text,
                                countryId: widget.countryId,
                                packageCode: widget.packageCode,
                                groupVal: groupVal == "Left" ? "0" : "1",
                              ));
                        } else {
                          CommonToast("Select placement Left or Right");
                        }
                      }
                    },
                    title: "Submit"),
                const SpaceHeightWidget(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
