import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  BoxDecoration decr = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: lightBlackColor.withOpacity(0.5),
      ));
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
              const SideTitle(title: "Proof Type"),
              ProfileDropDown(
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
              if (proofType != null)
                proofType == "Bank" ? bankWidget() : applicationWidget(),
              const SpaceHeightWidget(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: proofType != null
                    ? CustomElevatedButton(
                        onTapFun: () {
                          if (_formKey.currentState!.validate()) {
                            print("Update fun");
                          }
                        },
                        title: "Update")
                    : CustomElevatedButton(
                        onTapFun: () {
                          if (_formKey.currentState!.validate()) {
                            print("submit fun");
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
}
