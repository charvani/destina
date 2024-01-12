import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../service_call/api_data.dart';
import 'kycreport_screen.dart';

class UploadKYCScreen extends StatefulWidget {
  const UploadKYCScreen({super.key});

  @override
  State<UploadKYCScreen> createState() => _UploadKYCScreenState();
}

class _UploadKYCScreenState extends State<UploadKYCScreen> {
  TextEditingController banknameController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController accountNumController = TextEditingController();
  TextEditingController ifscNumController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController applicationRemarksController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  dynamic proofType;
  XFile? bankImage;
  XFile? appicationImage;
  dynamic userId, password;
  bool submitLoading = false;
  bool bankWiget = false;
  bool applicationWiget = false;
  dynamic bankRejText;
  dynamic appRejText;
  BoxDecoration decr = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: lightBlackColor.withOpacity(0.5),
      ));
  final MainController _dataController = Get.put(MainController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "KYC Upload", backNavigation: true),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: decr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (bankRejText != null)
                Column(
                  children: [
                    CommonTitle(
                      titleName: bankRejText,
                      fontColor: darkRedColor,
                    ),
                    const SpaceHeightWidget(height: 15),
                  ],
                ),
              if (appRejText != null)
                Column(
                  children: [
                    CommonTitle(
                      titleName: appRejText,
                      fontColor: darkRedColor,
                    ),
                    const SpaceHeightWidget(height: 15),
                  ],
                ),
              const SideTitle(title: "Proof Type"),
              (applicationWiget || bankWiget)
                  ? Column(
                      children: [
                        CommonTitle(
                          titleName: proofType,
                          size: 14,
                          fontColor: darkBlue,
                        ),
                        const SpaceHeightWidget(height: 10)
                      ],
                    )
                  : ProfileDropDown(
                      hintText: "Select",
                      onChangedFun: (val) {
                        setState(() {
                          proofType = val;
                        });
                      },
                      items: const [
                        "Bank",
                        "Application",
                      ],
                      validationFun: (val) {
                        if (val == "" || val == null) {
                          return "Select proof type";
                        } else {
                          return null;
                        }
                      },
                    ),
              if (bankWiget) bankWidget(),
              if (applicationWiget) applicationWidget(),
              const SpaceHeightWidget(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: applicationWiget || bankWiget
                    ? Obx(() {
                        return _dataController.loading.value
                            ? loader
                            : CustomElevatedButton(
                                onTapFun: () {
                                  if (_formKey.currentState!.validate()) {
                                    print("Update fun");
                                    updateFun();
                                  }
                                },
                                title: "Update");
                      })
                    : submitLoading
                        ? loader
                        : CustomElevatedButton(
                            onTapFun: () {
                              if (_formKey.currentState!.validate()) {
                                submitFun();
                              }
                            },
                            title: "Submit"),
              ),
            ],
          ),
        ),
      )),
    );
  }

  bankWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SideTitle(title: "Bank Name"),
        AccountTextField(
          onchangeFun: (val) {},
          outsideFun: (val) async {},
          textInputType: TextInputType.name,
          hintText: "",
          controller: banknameController,
          validation: (val) {
            if (val!.isEmpty) {
              return "Bank Name";
            } else if (val.length < 2) {
              return "Enter valid bank name";
            } else {
              return null;
            }
          },
        ),
        const SideTitle(title: "Bank Branch"),
        AccountTextField(
          onchangeFun: (val) {},
          outsideFun: (val) async {},
          textInputType: TextInputType.name,
          hintText: "",
          controller: branchController,
          validation: (val) {
            if (val!.isEmpty) {
              return "Bank Branch";
            } else if (val.length < 2) {
              return "Enter valid bank branch";
            } else {
              return null;
            }
          },
        ),
        const SideTitle(title: "A/c Number"),
        AccountTextField(
          onchangeFun: (val) {},
          outsideFun: (val) async {},
          textInputType: TextInputType.name,
          hintText: "",
          controller: accountNumController,
          validation: (val) {
            if (val!.isEmpty) {
              return "A/c Number";
            } else if (val.length < 2) {
              return "Enter valid A/c Number";
            } else {
              return null;
            }
          },
        ),
        const SideTitle(title: "IFSC Code"),
        AccountTextField(
          onchangeFun: (val) {},
          outsideFun: (val) async {},
          textInputType: TextInputType.name,
          hintText: "",
          controller: ifscNumController,
          validation: (val) {
            if (val!.isEmpty) {
              return "IFSC Code";
            } else if (val.length < 2) {
              return "Enter valid IFSC Code";
            } else {
              return null;
            }
          },
        ),
        const SideTitle(title: "Remarks"),
        AccountTextField(
          minLines: 3,
          onchangeFun: (val) {},
          outsideFun: (val) async {},
          textInputType: TextInputType.multiline,
          hintText: "",
          controller: remarksController,
          validation: (val) {
            if (val!.isEmpty) {
              return "Remarks";
            } else if (val.length < 2) {
              return "Enter valid Remarks";
            } else {
              return null;
            }
          },
        ),
        const SideTitle(title: "Upload Image"),
        if (bankImage != null)
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: FileImage(File(bankImage!.path)),
                    fit: BoxFit.cover)),
          ),
        const SpaceHeightWidget(height: 10),
        SizedBox(
            width: 120,
            height: 30,
            child: CommonOulineTextButton(
                onTapFun: () {
                  Get.dialog(ImageOptionsDialog(
                    cameraFun: () async {
                      print("camera");
                      Get.back();
                      XFile imageFile = await imagePickFun("camera");
                      setState(() {
                        bankImage = imageFile;
                      });
                    },
                    galleryFun: () async {
                      print("gallery");
                      Get.back();
                      XFile imageFile = await imagePickFun("gallery");
                      setState(() {
                        bankImage = imageFile;
                      });
                    },
                  ));
                },
                title: bankImage != null ? "Change Image" : "Select Image")),
        const SpaceHeightWidget(height: 10),
        const ViewProfileWidget(
          title: "Your Status",
          info: "-------",
        ),
      ],
    );
  }

  applicationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SideTitle(title: "Upload Image"),
        if (appicationImage != null)
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: FileImage(File(appicationImage!.path)),
                    fit: BoxFit.cover)),
          ),
        const SpaceHeightWidget(height: 10),
        SizedBox(
            width: 120,
            height: 30,
            child: CommonOulineTextButton(
                onTapFun: () {
                  Get.dialog(ImageOptionsDialog(
                    cameraFun: () async {
                      print("camera");
                      Get.back();
                      XFile imageFile = await imagePickFun("camera");
                      setState(() {
                        appicationImage = imageFile;
                      });
                    },
                    galleryFun: () async {
                      print("gallery");
                      Get.back();
                      XFile imageFile = await imagePickFun("gallery");
                      setState(() {
                        appicationImage = imageFile;
                      });
                    },
                  ));
                },
                title:
                    appicationImage != null ? "Change Image" : "Select Image")),
        const SpaceHeightWidget(height: 15),
        const SideTitle(title: "Remarks"),
        AccountTextField(
          minLines: 3,
          onchangeFun: (val) {},
          outsideFun: (val) async {},
          textInputType: TextInputType.multiline,
          hintText: "",
          controller: applicationRemarksController,
          validation: (val) {
            if (val!.isEmpty) {
              return "Remarks";
            } else if (val.length < 2) {
              return "Enter valid Remarks";
            } else {
              return null;
            }
          },
        ),
        const SpaceHeightWidget(height: 10),
        const ViewProfileWidget(
          title: "Your Status",
          info: "-------",
        ),
      ],
    );
  }

  updateFun() async {
    Map bdata = {};
    if (proofType == "Bank") {
      if (bankImage == null) {
        CommonToast("please select image");
      } else {
        final bytes = File(bankImage!.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        bdata = {
          "UserId": userId,
          "Pwd": password,
          "BankName": banknameController.text,
          "Branch": branchController.text,
          "ACNo": accountNumController.text,
          "IFSCCode": ifscNumController.text,
          "Filename": img64,
          "Remarks": remarksController.text,
          "ProofType": "KYC",
        };
        print("update fun bdata...$bdata");
        dynamic res =
            await _dataController.getUploadFile(bdata, ApiData().uploadKYC);
        if (res != null) {
          if (res['Msg'] == "SUCCESS") {
            CommonToastTrue("Uploaded successfully");
            Timer(const Duration(seconds: 1), () {
              Get.back();
            });
          } else {
            CommonToast(res['Message']);
          }
        }
      }
    } else {
      if (appicationImage == null) {
        CommonToast("please select image");
      } else {
        final bytes = File(appicationImage!.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        bdata = {
          "UserId": userId,
          "Pwd": password,
          "BankName": "",
          "Branch": "",
          "ACNo": "",
          "IFSCCode": "",
          "Remarks": applicationRemarksController.text,
          "ProofType": "APP",
          "Filename": img64,
        };
        print("Application fun bdata...$bdata");
        dynamic res =
            await _dataController.getUploadFile(bdata, ApiData().uploadKYC);
        if (res != null) {
          if (res['Msg'] == "SUCCESS") {
            CommonToastTrue("Uploaded successfully");
            Get.back();
          } else {
            CommonToast(res['Message']);
          }
        }
      }
    }
  }

  submitFun() async {
    setState(() {
      submitLoading = true;
    });
    Map bdata = {
      "UserId": userId,
      "Pwd": password,
      "Action": proofType == "Bank" ? "KYC" : "APP",
    };
    dynamic res = await _dataController.getKycReport(bdata);
    setState(() {
      submitLoading = false;
    });
    if (res != null && proofType == "Bank") {
      print("Bank res...$res");

      if (res['Message'] == "NoKYC" ||
          res['Message'] == "KYCREJ" ||
          res['Message'] == "FAIL") {
        setState(() {
          bankWiget = true;
        });
        if (res['Message'] == "KYCREJ") {
          setState(() {
            bankRejText = "Your KYC rejected, upload again.";
          });
        }
      } else if (res['Message'] == "SUCCESS" || res['Message'] == "PEND") {
        setState(() {
          bankRejText = null;
        });
        Get.to(() => KycReportScreen(
              kycType: 'Bank',
              res: res,
            ));
      } else {
        CommonToast(res['Message']);
      }
    } else {
      print("Application res...$res");

      if (res['Message'] == "NoAPP" ||
          res['Message'] == "APPREJ" ||
          res['Message'] == "APPFAIL") {
        setState(() {
          applicationWiget = true;
        });
        if (res['Message'] == "APPREJ") {
          setState(() {
            appRejText = "Your Application rejected, upload again.";
          });
        }
      } else if (res['Message'] == "APPSUCC" || res['Message'] == "APPPEND") {
        setState(() {
          appRejText = null;
        });
        Get.to(() => KycReportScreen(
              kycType: 'Application',
              res: res,
            ));
      } else {
        CommonToast(res['Message']);
      }
    }
  }
}
