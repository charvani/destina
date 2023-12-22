import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldpassController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final MainController _changePassController = Get.put(MainController());
  dynamic userId, name, country;
  @override
  void initState() {
    super.initState();
    userId = Constants.prefs.getString("user_id");
    name = Constants.prefs.getString("user_name");
    country = Constants.prefs.getString("country_name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppBar(title: "Change Account Password", backNavigation: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: lightBlackColor.withOpacity(0.5))),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ViewProfileWidget(
                  title: "User ID",
                  info: userId,
                ),
                ViewProfileWidget(
                  title: "Name",
                  info: name,
                ),
                ViewProfileWidget(
                  title: "Country",
                  info: country,
                ),
                const SpaceHeightWidget(height: 20),
                const SideTitle(title: "Old Password"),
                AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "Alpha-Numeric Only",
                  controller: oldpassController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Old Password";
                    } else if (val.length < 6) {
                      return "Characters more than 5";
                    } else {
                      return null;
                    }
                  },
                ),
                const SideTitle(title: "New Password"),
                AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "Alpha-Numeric Only",
                  controller: newpassController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "New Password";
                    } else if (val.length < 6) {
                      return "Characters more than 5";
                    } else {
                      return null;
                    }
                  },
                ),
                Text(
                    "Password Should Be Alpha Numeric Without Special characters",
                    style: TextStyle(
                        color: darkRedColor,
                        fontSize: 10,
                        fontFamily: "OnestRegular")),
                const SpaceHeightWidget(height: 10),
                const SideTitle(title: "Confirm Password"),
                AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "Alpha-Numeric Only",
                  controller: confirmPassController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Confirm Password";
                    } else if (newpassController.text !=
                        confirmPassController.text) {
                      return "New password and confirm password\nshould be same";
                    } else {
                      return null;
                    }
                  },
                ),
                const SpaceHeightWidget(height: 30),
                Obx(() {
                  return _changePassController.loading.value
                      ? loader
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: CustomElevatedButton(
                              onTapFun: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (Constants.prefs.getString("password") ==
                                      oldpassController.text) {
                                    Map bdata = {
                                      "UserId": userId,
                                      "Pwd":
                                          Constants.prefs.getString("password"),
                                      "OldPwd": oldpassController.text,
                                      "NewPwd": newpassController.text,
                                    };
                                    dynamic res = await _changePassController
                                        .getChangePassword(bdata);
                                    if (res != null) {
                                      if (res['Msg'] == "SUCCESS") {
                                        Constants.prefs.setString(
                                            "password", newpassController.text);
                                        CommonToastTrue(res['Message']);
                                      }
                                    }
                                  } else {
                                    CommonToast("Invalid old password");
                                  }
                                }
                              },
                              title: "UPDATE"),
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
