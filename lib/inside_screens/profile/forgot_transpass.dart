import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class ForgotTransPassScreen extends StatefulWidget {
  const ForgotTransPassScreen({super.key});

  @override
  State<ForgotTransPassScreen> createState() => _ForgotTransPassScreenState();
}

class _ForgotTransPassScreenState extends State<ForgotTransPassScreen> {
  TextEditingController emailTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final MainController _forgotController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: "Forgot Transaction Password", backNavigation: true),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: lightBlackColor.withOpacity(0.5),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SideTitle(title: "Email ID"),
              AccountTextField(
                onchangeFun: (val) {},
                outsideFun: (val) async {},
                textInputType: TextInputType.name,
                hintText: "ex: Destina1@gmail.com",
                controller: emailTController,
                validation: (val) {
                  RegExp reg = RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                  if (val!.isEmpty) {
                    return "Email ID";
                  } else if (!reg.hasMatch(val)) {
                    return "Enter valid email";
                  } else {
                    return null;
                  }
                },
              ),
              const SpaceHeightWidget(height: 15),
              Obx(() {
                return _forgotController.loading.value
                    ? loader
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: CustomElevatedButton(
                            onTapFun: () async {
                              if (_formKey.currentState!.validate()) {
                                Map bdata = {
                                  "UserId":
                                      Constants.prefs.getString("user_id"),
                                  "Pwd": Constants.prefs.getString("password"),
                                  "EmailId": emailTController.text
                                };
                                dynamic res = await _forgotController
                                    .getForgotTranPass(bdata);
                                if (res != null) {
                                  if (res['Msg'] == "SUCCESS") {
                                    CommonToastTrue(res['Message']);
                                  }
                                }
                              }
                            },
                            title: "SUBMIT"),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
