import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePhotoScreen extends StatefulWidget {
  const UpdatePhotoScreen({super.key});

  @override
  State<UpdatePhotoScreen> createState() => _UpdatePhotoScreenState();
}

class _UpdatePhotoScreenState extends State<UpdatePhotoScreen> {
  final MainController _upoladController = Get.put(MainController());

  XFile? image;
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
      appBar: commonAppBar(title: "Upload Photo", backNavigation: true),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: lightBlackColor.withOpacity(0.5))),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewProfileWidget(title: "User ID", info: userId),
              ViewProfileWidget(title: "Name", info: name),
              ViewProfileWidget(title: "Country", info: country),
              const SpaceHeightWidget(height: 20),
              if (image != null)
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: FileImage(File(image!.path)),
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
                              image = imageFile;
                            });
                          },
                          galleryFun: () async {
                            print("gallery");
                            Get.back();
                            XFile imageFile = await imagePickFun("gallery");
                            setState(() {
                              image = imageFile;
                            });
                          },
                        ));
                      },
                      title: "Select Image")),
              const SpaceHeightWidget(height: 40),
              Obx(() {
                return _upoladController.loading.value
                    ? loader
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: CustomElevatedButton(
                            onTapFun: () async {
                              if (image != null) {
                                print("image fun");
                                dynamic res = await _upoladController
                                    .getUploadPhoto(File(image!.path));
                                if (res != null) {
                                  if (res['Msg'] == "SUCCESS") {
                                    CommonToastTrue(res['Message']);
                                  }
                                }
                              } else {
                                CommonToast("Select image");
                              }
                            },
                            title: "UPDATE"),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
