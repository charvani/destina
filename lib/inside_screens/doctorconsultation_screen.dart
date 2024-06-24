import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/main_controller.dart';

class DoctorConsultationScreen extends StatefulWidget {
  const DoctorConsultationScreen({super.key});

  @override
  State<DoctorConsultationScreen> createState() =>
      _DoctorConsultationScreenState();
}

class _DoctorConsultationScreenState extends State<DoctorConsultationScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameTController = TextEditingController();
  TextEditingController emailTController = TextEditingController();
  TextEditingController phoneNumTController = TextEditingController();
  TextEditingController addressTController = TextEditingController();
  TextEditingController dateTController = TextEditingController();
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();
  final MainController _bookingController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CommonCachedNetworkImage(
                imagePath:
                    "https://www.destina1.com/images/Health-consultation-banner.jpg"),
            const SpaceHeightWidget(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTitle(
                      titleName: "Consult with our Expert",
                      fontColor: darkBlue,
                      size: 20,
                    ),
                    const SpaceHeightWidget(height: 10),
                    const Text(
                      "Enter Your Name",
                      style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 14,
                      ),
                    ),
                    LoginTextField(
                      textInputType: TextInputType.name,
                      labelText: "",
                      hintText: "Enter Your Name",
                      controller: nameTController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Enter Your Name";
                        } else if (val.length < 3) {
                          return "Enter valid Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Text(
                      "Enter Phone Number",
                      style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 14,
                      ),
                    ),
                    LoginTextField(
                      textInputType: TextInputType.phone,
                      labelText: "",
                      hintText: "Enter Phone Number",
                      controller: phoneNumTController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Enter Phone Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Text(
                      "Enter Email Address",
                      style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 14,
                      ),
                    ),
                    LoginTextField(
                      textInputType: TextInputType.emailAddress,
                      labelText: "",
                      hintText: "Enter Email Address",
                      controller: emailTController,
                      validation: (val) {
                        RegExp reg = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                        if (val!.isEmpty) {
                          return "Enter Email Address";
                        } else if (!reg.hasMatch(val)) {
                          return "Enter Valid Email Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Text(
                      "Appointment Date",
                      style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 14,
                      ),
                    ),
                    LoginTextField(
                        readOnly: true,
                        onTapFun: () async {
                          final DateTime? picked = await showDatePicker(
                            builder: (context, child) {
                              return Theme(
                                  data: Theme.of(context).copyWith(
                                    primaryColor: blackColor,
                                    colorScheme: ColorScheme.light(
                                        primary: blackColor,
                                        onPrimary: whiteColor),
                                    buttonTheme: const ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary),
                                  ),
                                  child: child!);
                            },
                            lastDate: DateTime(2100, 0),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900, 0),
                          );
                          if (picked != null) {
                            final DateFormat formatter =
                                DateFormat('dd-MM-yyyy');
                            setState(() {
                              dateTController.text = formatter.format(picked);
                            });
                          }
                        },
                        suffix: Icon(
                          Icons.calendar_month_rounded,
                          color: middleBlackColor.withOpacity(0.5),
                        ),
                        controller: dateTController,
                        hintText: "dd-mm-yyyy",
                        textInputType: TextInputType.datetime,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Select Appointment Date";
                          } else {
                            return null;
                          }
                        },
                        labelText: ""),
                    const Text(
                      "Address",
                      style: TextStyle(
                        fontFamily: "OnestSemiBold",
                        fontSize: 14,
                      ),
                    ),
                    AccountTextField(
                      minLines: 3,
                      onchangeFun: (val) {},
                      outsideFun: (val) async {},
                      textInputType: TextInputType.multiline,
                      hintText: "",
                      controller: addressTController,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Enter Address";
                        } else if (val.length < 2) {
                          return "Enter valid Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return _bookingController.loading.value
                  ? loader
                  : CustomAutoWidthButton(
                      onTapFun: () {
                        if (formKey.currentState!.validate()) {
                          appointmentFun();
                        }
                      },
                      title: "Get Your Appointment");
            }),
            const CommonCachedNetworkImage(
                imagePath: "https://www.destina1.com/images/appointment.jpg")
          ],
        ),
      ),
    );
  }

  appointmentFun() async {
    Map bData = {
      "Name": nameTController.text,
      "Email": emailTController.text,
      "Mobile": phoneNumTController.text,
      "AptDate": dateTController.text,
      "Address": addressTController.text
    };
    print("getting b data...$bData");
    dynamic res = await _bookingController.getDoctorAppointment(bData);
    if (res != null) {
      print("res...$res");
      if (res['Msg'] == "SUCCESS") {
        Get.dialog(OkDialog(
          title: "Your Appointment Request has been sent to Support Team.",
          onTapFun: () async {
            print("charvani...");
            Get.back();
            var contact = "+919885723423";
            var Url =
                "whatsapp://send?phone=$contact&text=Name: ${nameTController.text}\nPhone Number: ${phoneNumTController.text}\nEmail: ${emailTController.text}\nAppointment Date: ${dateTController.text}\nAddress: ${addressTController.text}";
            await launchUrl(Uri.parse(Url));
          },
        ));
      }
    }
  }
}
