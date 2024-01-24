import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_address/mac_address.dart';
import 'package:permission_handler/permission_handler.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../commons/constants.dart';
import '../dashboard_screens/bottombar_screen.dart';
import 'countryselect_screen.dart';
import 'forgotpass_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idTController = TextEditingController();
  TextEditingController passwordTController = TextEditingController();
  bool visible = true;
  dynamic mobileInfo;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String? imei, macAddress;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  bool getPermission = false;
  String? deviceImei;
  String message = "Please allow permission request!";
  final MainController _loginController = Get.put(MainController());
  deviceInfoFun() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    macAddress = await GetMac.macAddress;
    imei = await DeviceInformation.deviceIMEINumber;
    _loginController.imeiNum.value = imei;
    mobileInfo = "MOBILENO:"
        ";SIMSERIAL:"
        ";IMEI:$imei;SUBID:"
        ";WLANMAC:$macAddress;ANDROIDID:${androidInfo.id};VERSION:${Constants.appversion}";
    print("mobile infor....$mobileInfo");
    _loginController.mobileInfo.value = mobileInfo;
  }

  void checkPermission() async {
    var status = await Permission.phone.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.phone.request();
      if (status != PermissionStatus.granted) {
        // Handle the case where the user denies the permission request.
      }
    }

    // Now you can proceed with using the READ_PHONE_STATE permission.
    deviceInfoFun();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 20,
          alignment: Alignment.center,
          width: double.infinity,
          child: const VersionText()),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/images/login_background.png",
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontFamily: "OnestBold",
                              fontSize: 20,
                              color: naviBlue),
                        ),
                        Text(
                          "Hope you enjoy shopping with us",
                          style: TextStyle(
                              fontFamily: "OnestRegular",
                              fontSize: 18,
                              color: naviBlue),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SpaceHeightWidget(height: 10),
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "OnestBold",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: darkBlue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeightWidget(height: 10),
                        const Text(
                          "User ID",
                          style: TextStyle(
                            fontFamily: "OnestSemiBold",
                            fontSize: 14,
                          ),
                        ),
                        LoginTextField(
                          // focusNode: _focusNode,
                          suffix: Icon(
                            Icons.perm_identity_rounded,
                            color: middleBlackColor.withOpacity(0.5),
                          ),
                          textInputType: TextInputType.name,
                          labelText: "",
                          hintText: "User Id",
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
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: "OnestSemiBold",
                            fontSize: 14,
                          ),
                        ),
                        LoginTextField(
                          obscureText: visible,
                          suffix: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            child: Icon(
                              !visible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: middleBlackColor.withOpacity(0.5),
                            ),
                          ),
                          padding: 5,
                          textInputType: TextInputType.name,
                          labelText: "",
                          hintText: "Password",
                          controller: passwordTController,
                          validation: (val) {
                            if (val!.isEmpty) {
                              return "Your password";
                            } else if (val.length < 5) {
                              return "Enter valid password";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SpaceHeightWidget(height: 10),
                        Obx(() {
                          return _loginController.loading.value
                              ? loader
                              : CustomElevatedButton(
                                  onTapFun: () async {
                                    if (_formKey.currentState!.validate()) {
                                      print("charvani");
                                      Map bodyData = {
                                        "idno": idTController.text.trim(),
                                        "Pwd": passwordTController.text.trim(),
                                        "FcmId": "1233455",
                                        "IMEI": imei,
                                        "MOBINFO": mobileInfo,
                                      };
                                      dynamic res = await _loginController
                                          .getMemberLogin(bodyData);
                                      if (res != null) {
                                        print(res);
                                        if (res['Msg']
                                                .toString()
                                                .toUpperCase() ==
                                            "SUCCESS") {
                                          CommonToastTrue("Login successful");
                                          Constants.prefs.setString(
                                              "user_id", idTController.text);
                                          Constants.prefs.setString("password",
                                              passwordTController.text);
                                          Get.offAll(() => BottomBarScreen(
                                                index: 4,
                                                bannerPopup: _loginController
                                                    .bannerPopUp,
                                                data: res,
                                              ));
                                        }
                                      }
                                    }
                                  },
                                  title: "Submit");
                        }),
                        Center(
                          child: CommonTextButton(
                            onTapFun: () {
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            title: 'Forgot Password?',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomBorderElevatedButton(
                    bgcolor: whiteColor,
                    onTapFun: () {
                      Get.to(() => const CountySelectScreen());
                    },
                    title: "Register Member"),
              ),
              const SpaceHeightWidget(height: 20),
              // UnderLineTextButton(
              //     onTapFun: () {
              //       Get.offAll(() => const BottomBarScreen());
              //     },
              //     titile: "Shop now",
              //     fontSize: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                width: double.infinity,
                child: SizedBox(
                  width: 200,
                  height: 35,
                  child: IconElevatedButton(
                    onTapFun: () {
                      Get.offAll(() => const BottomBarScreen(
                            index: 0,
                          ));
                    },
                    imagePath: 'assets/images/shopping_cart_img.jpg',
                    labelColor: whiteColor,
                    buttonColor: lightDarKBlue,
                    titile: "Shopp Now",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
