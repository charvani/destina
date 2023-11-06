import 'package:destina_1_international/dashboard_screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_scroll/text_scroll.dart';

import '../commons/colors.dart';
import '../commons/common_widgets.dart';

class RegisterScreen extends StatefulWidget {
  final String from;
  const RegisterScreen({super.key, required this.from});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userIdController = TextEditingController();
  String groupVal = "";
  String namePrefix = "Mr";
  String gender = "Male";
  String? state;
  String? country;
  @override
  void initState() {
    super.initState();
    print("register screen from...${widget.from}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Scaffold(
            appBar: commonAppBar(backNavigation: true),
            body: SingleChildScrollView(
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
                      textInputType: TextInputType.name,
                      hintText: "ex: John Lee",
                      labelText: "Sponsor User ID",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "Sponsor Name",
                      hintText: "ex: John Lee",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "Placement ID",
                      hintText: "ex: John Lee133",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "Placement ID Name",
                      hintText: "ex: John Lee",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
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
                                  }),
                              const Text("Left"),
                              Radio(
                                  value: "Right",
                                  groupValue: groupVal,
                                  onChanged: (val) {
                                    setState(() {
                                      groupVal = val.toString();
                                    });
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
                            hintText: "Mr",
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
                            controller: userIdController,
                            validation: (val) {
                              if (val!.isEmpty) {
                                return "Please enter";
                              } else {
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "MOBILE NO.",
                      hintText: "Ex: 9979685757 (Without County Code)",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterDropDown(
                      hintText: "Male",
                      labelText: "GENDER",
                      items: const ["Male", "Female"],
                      onChangedFun: (val) {
                        setState(() {
                          gender = val.toString();
                        });
                      },
                      value: gender,
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "EMAIL ADDRESS",
                      hintText: "jhonlee@gmail.com",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
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
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "Address 2",
                      hintText: "Enter Your address 2",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "City/Area",
                      hintText: "Enter Your City",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "Area/Zip Code",
                      hintText: "Enter your Area/Zip code",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterDropDown(
                      labelText: "COUNTRY",
                      hintText: "Select Country",
                      items: const ["INDIA", "MALAYSIA", "AMERICA", "DUBAI"],
                      onChangedFun: (val) {
                        setState(() {
                          country = val.toString();
                        });
                      },
                      value: country,
                    ),
                    RegisterDropDown(
                      labelText: "STATE",
                      hintText: "Select State",
                      items: const [
                        "AndraPradesh",
                        "Telengana",
                        "Tamilnadu",
                        "Karnataka"
                      ],
                      onChangedFun: (val) {
                        setState(() {
                          state = val.toString();
                        });
                      },
                      value: state,
                    ),
                    const SpaceHeightWidget(height: 25),
                    const RegisterTitleWidget(title: "LOGIN INFORMATION"),
                    const SpaceHeightWidget(height: 10),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "USERNAME",
                      hintText: "Alpha-Numeric Only",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "LOGIN/TRANSACTION PASSWORD",
                      hintText: "Enter your Login/Transaction password",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    RegisterTextField(
                      textInputType: TextInputType.name,
                      labelText: "CONFIRM LOGIN/TRANSACTION PASSWORD",
                      hintText: "Confirm your Login/Transaction password",
                      controller: userIdController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please enter";
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
                        child: CommonOulineTextButton(
                          titleFontSize: 15,
                          onTapFun: () {
                            if (widget.from == "enroll_package") {
                              Get.to(
                                  () => const CartScreen(from: "after_enroll"));
                            }
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
}
