import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:text_scroll/text_scroll.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';
import '../inside_screens/register_cart_screen.dart';

class RegisterScreen extends StatefulWidget {
  final String countryId;
  final String packageCode;
  const RegisterScreen(
      {super.key, required this.countryId, required this.packageCode});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  MainController registerController = Get.put(MainController());
  final formKey = GlobalKey<FormState>();
  TextEditingController userIdController = TextEditingController();
  TextEditingController sponsorIdTController = TextEditingController();
  TextEditingController sponsorNameTController = TextEditingController();
  TextEditingController placementIdTController = TextEditingController();
  TextEditingController palcementNameTController = TextEditingController();
  TextEditingController userNameTController = TextEditingController();
  TextEditingController passwordTController = TextEditingController();
  TextEditingController confirmPasswordTController = TextEditingController();
  TextEditingController fullNameTController = TextEditingController();
  TextEditingController mobileTController = TextEditingController();
  TextEditingController emailTController = TextEditingController();
  TextEditingController address1TController = TextEditingController();
  TextEditingController address2TController = TextEditingController();
  TextEditingController cityTController = TextEditingController();
  TextEditingController zipcodeTController = TextEditingController();

  String groupVal = "";
  String namePrefix = "";
  String gender = "Male";
  String? state;
  String stateId = "";
  String? country;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    print("register screen from...${widget.countryId}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      stateDataFun();
    });
  }

  stateDataFun() async {
    Map params = {"CountryID": widget.countryId};
    dynamic res = await registerController.getStateData(params);
    setState(() {
      country = res['Country'];
    });
    print("country ..$country");
  }

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

  bool userIdInvalid = false;
  Future<bool> userCheckFun() async {
    if (userNameTController.text != "") {
      print("klij");
      Map params = {"ID": userNameTController.text};
      dynamic res = await registerController.getUserCheckDb(params);
      print("userCheckFun id res...$res");
      if (res['Msg'].toString().toLowerCase() != "success") {
        CommonToast(res['Message']);
        setState(() {
          userNameTController.text = "";
          userIdInvalid = true;
        });
        return false;
      } else {
        setState(() {
          userIdInvalid = false;
        });
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Scaffold(
            appBar: commonAppBar(backNavigation: true, title: "Register"),
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
                        // editFun: (){
                        //   print(object)
                        // },
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
                      const RegisterTitleWidget(title: "PERSONAL INFORMATION"),
                      const SpaceHeightWidget(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RegisterDropDown(
                              labelText: "Title",
                              hintText: "Title",
                              items: const [
                                "Mr",
                                "Mrs",
                                "Ms",
                                "M/S.",
                                "Md.",
                                "Dr"
                              ],
                              onChangedFun: (val) {
                                setState(() {
                                  namePrefix = val.toString();
                                });
                              },
                              validationFun: (val) {
                                if (val == "" || val == null) {
                                  return "Title";
                                } else {
                                  return null;
                                }
                              },
                              value: namePrefix,
                            ),
                          ),
                          const SpaceWidthWidget(width: 5),
                          Expanded(
                            flex: 3,
                            child: RegisterTextField(
                              textInputType: TextInputType.name,
                              labelText: "FULL NAME AS PER NRIC",
                              hintText: "Ex: Michale John Lee",
                              controller: fullNameTController,
                              validation: (val) {
                                if (val!.isEmpty) {
                                  return "Full name as per NRIC";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      RegisterTextField(
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(15)
                        ],
                        textInputType: TextInputType.number,
                        labelText: "MOBILE NO.",
                        hintText: "Ex: 9979685757 (Without County Code)",
                        controller: mobileTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Mobile number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      RegisterDropDown(
                        hintText: "Gender",
                        labelText: "GENDER",
                        items: const ["Male", "Female"],
                        onChangedFun: (val) {
                          setState(() {
                            gender = val.toString();
                          });
                        },
                        value: gender,
                        validationFun: (val) {
                          if (val == "" || val == null) {
                            return "Gender";
                          } else {
                            return null;
                          }
                        },
                      ),
                      RegisterTextField(
                        textInputType: TextInputType.emailAddress,
                        labelText: "EMAIL ADDRESS",
                        hintText: "EX: jhonlee@gmail.com",
                        controller: emailTController,
                        validation: (val) {
                          RegExp reg = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                          if (val!.isEmpty) {
                            return "Email address";
                          } else if (!reg.hasMatch(val)) {
                            return "Enter valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SpaceHeightWidget(height: 25),
                      const RegisterTitleWidget(title: "ADDRESS INFORMATION"),
                      const SpaceHeightWidget(height: 10),
                      RegisterTextField(
                        textInputType: TextInputType.name,
                        labelText: "Address 1",
                        hintText: "Enter Your address 1",
                        controller: address1TController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Address";
                          } else if (val.length < 3) {
                            return "Enter valid address";
                          } else {
                            return null;
                          }
                        },
                      ),
                      RegisterTextField(
                        textInputType: TextInputType.name,
                        labelText: "Address 2",
                        hintText: "Enter Your address 2",
                        controller: address2TController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Address";
                          } else if (val.length < 3) {
                            return "Enter valid address";
                          } else {
                            return null;
                          }
                        },
                      ),
                      RegisterTextField(
                        textInputType: TextInputType.name,
                        labelText: "City/Area",
                        hintText: "Enter Your City",
                        controller: cityTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "City/Area";
                          } else if (val.length < 3) {
                            return "Enter valid City/Area";
                          } else {
                            return null;
                          }
                        },
                      ),
                      RegisterTextField(
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(15)
                        ],
                        textInputType: TextInputType.number,
                        labelText: "Area/Zip Code",
                        hintText: "Enter your Area/Zip code",
                        controller: zipcodeTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Area/Zip Code";
                          } else if (val.length < 5) {
                            return "Enter valid Area/Zip Code";
                          } else {
                            return null;
                          }
                        },
                      ),
                      if (country != null)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 40,
                          child: DropdownButtonFormField<String>(
                              value: country,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: blackColor.withOpacity(0.5),
                              ),
                              isDense: true,
                              decoration: InputDecoration(
                                  labelText: "COUNTRY",
                                  hintStyle: TextStyle(
                                      fontFamily: "OnestRegular",
                                      fontSize: 14,
                                      color: blackColor.withOpacity(0.5)),
                                  labelStyle: TextStyle(
                                      fontFamily: "OnestSemiBold",
                                      fontSize: 14,
                                      color: blackColor),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color:
                                              lightDarKBlue.withOpacity(0.3))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 3.5,
                                          color: blueColor.withOpacity(0.5)))),
                              padding: const EdgeInsets.all(0),
                              borderRadius: BorderRadius.circular(5),
                              style: TextStyle(
                                  fontFamily: "OnestRegular",
                                  color: blackColor.withOpacity(0.7)),
                              items: [
                                DropdownMenuItem<String>(
                                    value: country,
                                    child: Text(country.toString()))
                              ],
                              onChanged: (va) {}),
                        ),
                      Obx(() {
                        return registerController.loading.value
                            ? loader
                            : RegisterDropDown(
                                validationFun: (val) {
                                  if (val == "" || val == null) {
                                    return "State";
                                  } else {
                                    return null;
                                  }
                                },
                                labelText: "STATE",
                                hintText: "Select State",
                                items: registerController
                                    .signuploadData.value.stateDetailsRpt
                                    .map((e) => e.stateName)
                                    .toList(),
                                onChangedFun: (val) {
                                  setState(() {
                                    state = val.toString();
                                  });
                                  for (int i = 0;
                                      i <
                                          registerController.signuploadData
                                              .value.stateDetailsRpt.length;
                                      i++) {
                                    if (registerController.signuploadData.value
                                            .stateDetailsRpt[i].stateName ==
                                        val) {
                                      setState(() {
                                        stateId = registerController
                                            .signuploadData
                                            .value
                                            .stateDetailsRpt[i]
                                            .stateId;
                                      });
                                    }
                                  }
                                  print(stateId);
                                },
                                value: state,
                              );
                      }),
                      const SpaceHeightWidget(height: 25),
                      const RegisterTitleWidget(title: "LOGIN INFORMATION"),
                      const SpaceHeightWidget(height: 10),
                      RegisterTextField(
                        onchangeFun: (val) {
                          setState(() {
                            userIdInvalid = false;
                          });
                        },
                        textInputType: TextInputType.name,
                        labelText: "USERNAME",
                        hintText: "Alpha-Numeric Only",
                        controller: userNameTController,
                        validation: (val) {
                          if (userIdInvalid) {
                            return "User Name Already Exists";
                          } else if (val!.isEmpty) {
                            return "Username";
                          } else if (val.length < 3) {
                            return "Enter valid username";
                          } else {
                            return null;
                          }
                        },
                      ),
                      RegisterTextField(
                        onTapFun: () {
                          print("heloo");
                          userCheckFun();
                        },
                        textInputType: TextInputType.name,
                        labelText: "LOGIN/TRANSACTION PASSWORD",
                        hintText: "Enter your Login/Transaction password",
                        controller: passwordTController,
                        validation: (val) {
                          RegExp pattern =
                              RegExp(r'[~`!@#\$%^&*()\-_+={}[\]\\|;:"<>,./]');
                          if (val!.isEmpty) {
                            return "Your Login/Transaction password";
                          } else if (pattern.hasMatch(val)) {
                            return "Input should not contains special characters";
                          } else if (val.length < 6) {
                            return "Characters should be more than 5";
                          } else {
                            return null;
                          }
                        },
                      ),
                      RegisterTextField(
                        onTapFun: () {
                          userCheckFun();
                        },
                        textInputType: TextInputType.name,
                        labelText: "CONFIRM LOGIN/TRANSACTION PASSWORD",
                        hintText: "Confirm your Login/Transaction password",
                        controller: confirmPasswordTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Confirm your Login/Transaction password";
                          } else if (val != passwordTController.text) {
                            return "Confirm password not matched to Login/Transaction password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Text(
                        "Note:",
                        style: TextStyle(
                            fontFamily: "OnestRegular",
                            color: brownColor,
                            fontSize: 12),
                      ),
                      Text(
                        "Passwords must contain:",
                        style: TextStyle(
                            fontFamily: "OnestRegular",
                            color: blackColor,
                            fontSize: 12),
                      ),
                      const SpaceHeightWidget(height: 5),
                      const CustomBulletTextWidget(
                        verticalPadding: 0,
                        data:
                            'No any special character: ~`!@#\$%^&*()-_+={}[]|;:"<>,./',
                      ),
                      const CustomBulletTextWidget(
                          verticalPadding: 0,
                          data:
                              "Passwords must be at least 6 characters long but can be much longer."),
                      const SpaceHeightWidget(height: 20),
                      Container(
                        height: 35,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 100,
                          child: submitLoad
                              ? loader
                              : CommonOulineTextButton(
                                  titleFontSize: 15,
                                  onTapFun: () async {
                                    // _focusNode.unfocus();
                                    FocusScope.of(context).unfocus();
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        submitLoad = true;
                                      });
                                      if (groupVal != "") {
                                        bool sponsor =
                                            await sponsorIdCheckFun();
                                        if (sponsor) {
                                          bool placementId =
                                              await placementIdCheckFun();
                                          if (placementId) {
                                            bool placecheck =
                                                await placementPlaceCheckFun();
                                            if (placecheck) {
                                              bool userchek =
                                                  await userCheckFun();
                                              if (userchek) {
                                                signUpFun();
                                              }
                                              //  else {
                                              //   CommonToast("Please check all data");
                                              // }
                                            }
                                          }
                                        }
                                        setState(() {
                                          submitLoad = true;
                                        });
                                      } else {
                                        CommonToast(
                                            "Select placement Left or Right");
                                      }
                                    }
                                    // Get.to(
                                    //     () => const CartScreen(from: "after_enroll"));
                                  },
                                  title: "Submit",
                                  backgroundColor: blueColor,
                                  textColor: whiteColor,
                                  borderColor: blueColor,
                                ),
                        ),
                      ),
                      const SpaceHeightWidget(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
          scrollingTextWidget()
        ],
      ),
    );
  }

  scrollingTextWidget() {
    return SafeArea(
      child: Container(
        // color: Colors.amber,
        padding: const EdgeInsets.only(top: 20),
        width: 150,
        child: TextScroll(
          '* All Fields Are Mandatory           ',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          // mode: TextScrollMode.endless,
          fadedBorderWidth: 0.03,
          fadedBorder: true,
          velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
          // delayBefore: const Duration(seconds: 2),
          // pauseBetween: const Duration(seconds: 2),
          style: TextStyle(
              fontFamily: "OnestRegular", color: brownColor, fontSize: 12),
        ),
      ),
    );
  }

  bool submitLoad = false;
  signUpFun() async {
    Map params = {
      "SprID": sponsorNameTController.text,
      "placementID": palcementNameTController.text,
      "Place": groupVal == "Left" ? "0" : "1",
      "hidUid": Constants.prefs.get("uniq_id"),
      "Password": passwordTController.text,
      "Title": namePrefix,
      "Name": fullNameTController.text,
      "Gender": gender == "Male" ? "0" : "1",
      "Mobile": mobileTController.text,
      "Email": emailTController.text,
      "Address": address1TController.text,
      "Location": address2TController.text,
      "City": cityTController.text,
      "ZipCode": zipcodeTController.text,
      "StateID": stateId,
      "CountryID": widget.countryId,
      "LoginID": userNameTController.text,
      "SessionID": Constants.prefs.get("ss_id")
    };
    print("signup params...$params");
    dynamic res = await registerController.getRegister(params);
    if (res['Msg'].toString().toLowerCase() == "success") {
      // ignore: use_build_context_synchronously
      // MotionToast.success(
      //   title: const Text("Congartulations!"),
      //   description: const Text("Successfully Registered."),
      // ).show(context);
      Get.back();
      Get.off(() => RegisterCartScreen(
            sponsorId: sponsorIdTController.text.removeAllWhitespace,
            packageCode: widget.packageCode,
            countryId: widget.countryId,
          ));
    } else {
      CommonToast(res['Message']);
    }
  }
}
