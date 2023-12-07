import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

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
                const ViewProfileWidget(
                  title: "User ID",
                  info: "DESTINA1INT",
                ),
                const ViewProfileWidget(
                  title: "Name",
                  info: "DESTINA1",
                ),
                const ViewProfileWidget(
                  title: "Country",
                  info: "Malaysia",
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: CustomElevatedButton(
                      onTapFun: () {
                        if (_formKey.currentState!.validate()) {
                          print("validate");
                        }
                      },
                      title: "UPDATE"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
