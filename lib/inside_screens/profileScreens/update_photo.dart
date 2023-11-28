import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePhotoScreen extends StatefulWidget {
  const UpdatePhotoScreen({super.key});

  @override
  State<UpdatePhotoScreen> createState() => _UpdatePhotoScreenState();
}

class _UpdatePhotoScreenState extends State<UpdatePhotoScreen> {
  XFile? image;
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: CustomElevatedButton(onTapFun: () {}, title: "UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
