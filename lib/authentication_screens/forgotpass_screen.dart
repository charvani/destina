import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController idTController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(title: "Forgot Password", backNavigation: true),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SpaceHeightWidget(height: 15),
                Image.asset(
                  "assets/images/forgot-password.png",
                  height: 150,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: darkBlue.withOpacity(0.05)),
                  child: Column(
                    children: [
                      const Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontFamily: "OnestSemiBold", fontSize: 20),
                      ),
                      const SpaceHeightWidget(height: 15),
                      const Text(
                        "It happens to all of us. Just enter the userid you registered with and we'll email the details to reset your password",
                        style:
                            TextStyle(fontFamily: "OnestRegular", fontSize: 14),
                      ),
                      const SpaceHeightWidget(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "User ID*",
                              style: TextStyle(
                                  fontFamily: "OnestSemiBold", fontSize: 15),
                            ),
                            LoginTextField(
                              // focusNode: _focusNode,
                              suffix: Icon(
                                Icons.perm_identity_rounded,
                                color: middleBlackColor.withOpacity(0.5),
                              ),
                              textInputType: TextInputType.name,
                              labelText: "",
                              hintText: "Enter user Id",
                              controller: idTController,
                              validation: (val) {
                                if (val!.isEmpty) {
                                  return "Your Id";
                                } else if (val.length < 3) {
                                  return "Enter valid  user Id";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SpaceHeightWidget(height: 15),
                            SizedBox(
                              child: CustomElevatedButton(
                                  onTapFun: () {
                                    if (_formKey.currentState!.validate()) {}
                                    // Get.to(() => const PackageDetailsScreen(
                                    //       from: "register",
                                    //       countryid: "1",
                                    //       packageCode: "MYJD01",
                                    //     ));
                                  },
                                  title: "Submit"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ));
  }
}
