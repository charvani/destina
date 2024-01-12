import 'dart:convert';
import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../service_call/api_data.dart';

class UploadIDScreen extends StatefulWidget {
  const UploadIDScreen({super.key});

  @override
  State<UploadIDScreen> createState() => _UploadIDScreenState();
}

class _UploadIDScreenState extends State<UploadIDScreen> {
  final _formKey = GlobalKey<FormState>();
  dynamic proofType;
  File? selectedFile;

  BoxDecoration decr = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: lightBlackColor.withOpacity(0.5),
      ));
  final MainController _dataController = Get.put(MainController());
  dynamic userId, password;
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
      appBar: commonAppBar(title: "Upload ID", backNavigation: true),
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
                hintText: "Select ID type",
                onChangedFun: (val) {
                  setState(() {
                    proofType = val;
                  });
                },
                items: const [
                  "RATDION CARD",
                  "DRIVING LICENSE",
                  "ADHAR CARD",
                  "VOTER ID",
                  "PASSPORT",
                  "Government Issued Photo\nIdentification(Id/IC)"
                ],
                validationFun: (val) {
                  if (val == "" || val == null) {
                    return "Select proof type";
                  } else {
                    return null;
                  }
                },
              ),
              const SideTitle(title: "Upload File"),
              const SpaceHeightWidget(height: 10),
              if (selectedFile != null)
                if (selectedFile!.path.contains("png") ||
                    selectedFile!.path.contains("jpg"))
                  Container(
                      padding: const EdgeInsets.all(4),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: appthemeColor.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.file(
                        selectedFile!,
                        fit: BoxFit.cover,
                      )),
              if (selectedFile != null)
                if (selectedFile!.path.contains("pdf"))
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: appthemeColor.withOpacity(0.5), width: 1)),
                      child: Icon(
                        Icons.picture_as_pdf_outlined,
                        color: darkRedColor,
                        size: 45,
                      )),
              if (selectedFile != null)
                if (selectedFile!.path.contains("doc"))
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: appthemeColor.withOpacity(0.5), width: 1)),
                      child: Icon(
                        Icons.file_copy_outlined,
                        color: darkRedColor,
                        size: 45,
                      )),
              if (selectedFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    selectedFile!.path.split('file_picker/').last,
                    style: const TextStyle(
                        fontFamily: "OnestRegular", fontSize: 12),
                  ),
                ),
              const SpaceHeightWidget(height: 10),
              SizedBox(
                  width: 120,
                  height: 30,
                  child: CommonOulineTextButton(
                      onTapFun: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          allowedExtensions: ['jpg', 'pdf', 'png'],
                          type: FileType.custom,
                        );

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          setState(() {
                            selectedFile = file;
                          });
                        } else {
                          print("dfsf");
                          // User canceled the picker
                        }
                      },
                      title: selectedFile != null
                          ? "Change File"
                          : "Select File")),
              const SpaceHeightWidget(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: CustomElevatedButton(
                    onTapFun: () async {
                      if (_formKey.currentState!.validate()) {
                        print("submit fun");
                        if (selectedFile == null) {
                          CommonToast("please select image");
                        } else {
                          final bytes =
                              File(selectedFile!.path).readAsBytesSync();
                          String img64 = base64Encode(bytes);
                          Map bdata = {
                            "UserId": userId,
                            "LPassword": password,
                            "FileName": img64,
                            "IDType": proofType
                          };
                          print("my b ...$bdata");
                          dynamic res = await _dataController.getUploadFile(
                              bdata, ApiData().uploadID);
                          if (res != null) {
                            print("lllll...$res");
                          }
                        }
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
}
