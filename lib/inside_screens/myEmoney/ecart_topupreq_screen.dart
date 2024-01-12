import 'dart:io';

import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EcardTopupRequestScreen extends StatefulWidget {
  const EcardTopupRequestScreen({super.key});

  @override
  State<EcardTopupRequestScreen> createState() =>
      _EcardTopupRequestScreenState();
}

class _EcardTopupRequestScreenState extends State<EcardTopupRequestScreen> {
  dynamic radioData;
  TextEditingController fullNameTController = TextEditingController();
  TextEditingController userIdTController = TextEditingController();
  TextEditingController phoneNumTController = TextEditingController();
  TextEditingController ecardUserIdTController = TextEditingController();
  TextEditingController totalAmountTController = TextEditingController();
  List<String> paymentMode = [
    "Cash Deposit",
    "Check Deposit",
    "ZellePay",
    "Phone-In Order",
    "Telegraphic Transfer",
    "Credit Card"
  ];
  dynamic paymentType;
  File? selectedFile;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameTController.text = "DESTINA1";
    userIdTController.text = "DESTINA1INT";
    phoneNumTController.text = "162635294";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "Ecard Topup Request"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SpaceHeightWidget(height: 10),
                const CommonTitle(
                  titleName:
                      "KINDLY COMPLETE THIS FORM TO RECEIVE YOUR ECARD TOPUP.",
                  size: 12.5,
                ),
                const SpaceHeightWidget(height: 10),
                const CommonTitle(
                  titleName:
                      "Cash/Cheque Bank Deposit receipt, ZellePay,telegraphic transfer receipt, or Phone-In CC Orders only. All others, go to DESTINA1.COM for instant activation using Credit Card Payment.",
                  size: 12,
                ),
                const SpaceHeightWidget(height: 10),
                CommonTitle(
                  titleName:
                      "NOTE: Be Sure to make payment FIRST before completing this order form. Refer to the Product Price List.",
                  size: 12.5,
                  fontFamily: "OnestRegular",
                  fontColor: darkRedColor,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: lightDarKBlue.withOpacity(0.15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SideTitle(
                          title:
                              "Has your upgrade period expired? If so, Add 20% to your order."),
                      Row(
                        children: [
                          Radio(
                              value: "Yes",
                              groupValue: radioData,
                              onChanged: (val) {
                                setState(() {
                                  radioData = val;
                                });
                              }),
                          const SideTitle(title: "Yes"),
                          const SpaceWidthWidget(width: 25),
                          Radio(
                              value: "No",
                              groupValue: radioData,
                              onChanged: (val) {
                                setState(() {
                                  radioData = val;
                                });
                              }),
                          const SideTitle(title: "No")
                        ],
                      ),
                      const CommonTitle(
                        titleName: "Distributor Details :",
                        size: 14,
                        fontFamily: "OnestSemiBold",
                      ),
                      const SpaceHeightWidget(height: 5),
                      const SideTitle(title: "Full Name"),
                      AccountTextField(
                        readOnly: true,
                        backgroundColor: lightDarKBlue.withOpacity(0.1),
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "ex: John Lee",
                        controller: fullNameTController,
                        validation: (val) {
                          return null;
                        },
                      ),
                      const SideTitle(title: "USER ID"),
                      AccountTextField(
                        readOnly: true,
                        backgroundColor: lightDarKBlue.withOpacity(0.1),
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "ex: John Lee",
                        controller: userIdTController,
                        validation: (val) {
                          return null;
                        },
                      ),
                      const SideTitle(title: "Phone Number"),
                      AccountTextField(
                        readOnly: true,
                        backgroundColor: lightDarKBlue.withOpacity(0.1),
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "ex: John Lee",
                        controller: phoneNumTController,
                        validation: (val) {
                          return null;
                        },
                      ),
                      const SideTitle(title: "Email"),
                      AccountTextField(
                          readOnly: true,
                          backgroundColor: lightDarKBlue.withOpacity(0.1),
                          onchangeFun: (val) {},
                          outsideFun: (val) async {},
                          textInputType: TextInputType.name,
                          hintText: "ex: johnLee@gmail.com",
                          controller: phoneNumTController,
                          validation: (val) {
                            return null;
                          },
                          bottomGap: 0),
                      CommonTitle(
                        titleName: "[email protected]",
                        fontColor: middleBlackColor.withOpacity(0.5),
                        fontFamily: "OnestRegular",
                        size: 12,
                      ),
                      const SpaceHeightWidget(height: 5),
                      Row(
                        children: [
                          const SideTitle(title: "Mode Of Payment :"),
                          CommonTitle(
                            titleName: " *",
                            fontColor: darkRedColor,
                            fontFamily: "OnestRegular",
                            size: 20,
                          ),
                        ],
                      ),
                      for (int i = 0; i < paymentMode.length; i++)
                        Row(
                          children: [
                            Radio(
                                value: paymentMode[i],
                                groupValue: paymentType,
                                onChanged: (val) {
                                  setState(() {
                                    paymentType = val;
                                  });
                                }),
                            const SpaceWidthWidget(width: 10),
                            CommonTitle(
                              titleName: paymentMode[i],
                              size: 14,
                              fontFamily: "OnestRegular",
                            )
                          ],
                        ),
                      const SpaceHeightWidget(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Photo Of : Cash/Cheque Bank Deposit Receipt, ZellePay Confirmation Email,telegraphic transfer receipt, Phone-In Order Receipt Email",
                                  style: TextStyle(
                                      fontFamily: "OnestRegular",
                                      fontSize: 14,
                                      color: blackColor)),
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                      color: darkRedColor,
                                      fontFamily: "OnestRegular",
                                      fontSize: 20))
                            ])),
                          ),
                        ],
                      ),
                      if (selectedFile != null)
                        if (selectedFile!.path.contains("png") ||
                            selectedFile!.path.contains("jpg"))
                          Container(
                              padding: const EdgeInsets.all(4),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: appthemeColor.withOpacity(0.5),
                                    width: 1),
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
                                      color: appthemeColor.withOpacity(0.5),
                                      width: 1)),
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
                                      color: appthemeColor.withOpacity(0.5),
                                      width: 1)),
                              child: Icon(
                                Icons.file_copy_outlined,
                                color: darkRedColor,
                                size: 45,
                              )),
                      const SpaceHeightWidget(height: 10),
                      if (selectedFile != null)
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                selectedFile!.path.split('file_picker/').last,
                                style: const TextStyle(
                                    fontFamily: "OnestRegular", fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      const SpaceHeightWidget(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: lightDarKBlue.withOpacity(0.1))),
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                                width: 120,
                                height: 30,
                                child: CommonOulineTextButton(
                                    onTapFun: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                              type: FileType.custom,
                                              allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png'
                                          ]);

                                      if (result != null) {
                                        File file =
                                            File(result.files.single.path!);
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
                            const SpaceWidthWidget(width: 10),
                            if (selectedFile == null)
                              CommonTitle(
                                titleName: "No file chosen",
                                fontColor: middleBlackColor.withOpacity(0.5),
                                fontFamily: "OnestRegular",
                                size: 14,
                              ),
                          ],
                        ),
                      ),
                      CommonTitle(
                        titleName:
                            "Click to Upload your Proof of Purchase Receipt as stated above",
                        fontColor: middleBlackColor.withOpacity(0.5),
                        fontFamily: "OnestRegular",
                        size: 12,
                      ),
                      const SpaceHeightWidget(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "User ID where ECard Topup will go to : ",
                                  style: TextStyle(
                                      fontFamily: "OnestRegular",
                                      fontSize: 14,
                                      color: blackColor)),
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                      color: darkRedColor,
                                      fontFamily: "OnestRegular",
                                      fontSize: 20))
                            ])),
                          ),
                        ],
                      ),
                      AccountTextField(
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.name,
                        hintText: "",
                        controller: ecardUserIdTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Enter user id";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Total Amount Deposited (RM) :",
                                  style: TextStyle(
                                      fontFamily: "OnestRegular",
                                      fontSize: 14,
                                      color: blackColor)),
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                      color: darkRedColor,
                                      fontFamily: "OnestRegular",
                                      fontSize: 20))
                            ])),
                          ),
                        ],
                      ),
                      AccountTextField(
                        bottomGap: 0,
                        onchangeFun: (val) {},
                        outsideFun: (val) async {},
                        textInputType: TextInputType.number,
                        hintText: "",
                        controller: totalAmountTController,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Enter total amount";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CommonTitle(
                        titleName: "Must Match Deposit Slip",
                        fontColor: middleBlackColor.withOpacity(0.5),
                        fontFamily: "OnestRegular",
                        size: 12,
                      ),
                    ],
                  ),
                ),
                const SpaceHeightWidget(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomElevatedButton(
                      onTapFun: () {
                        if (_formKey.currentState!.validate()) {
                          if (paymentType == null) {
                            CommonToast("Please select payment mode");
                          } else {
                            if (selectedFile == null) {
                              CommonToast("Please select file");
                            }
                          }
                        }
                      },
                      title: "Submit"),
                ),
                const SpaceHeightWidget(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
