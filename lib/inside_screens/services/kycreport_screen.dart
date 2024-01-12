import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';
import '../../models/bankkycreport_model.dart';

class KycReportScreen extends StatefulWidget {
  final String kycType;
  final dynamic res;
  const KycReportScreen({super.key, required this.kycType, required this.res});

  @override
  State<KycReportScreen> createState() => _KycReportScreenState();
}

class _KycReportScreenState extends State<KycReportScreen> {
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
  BoxDecoration decr = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: lightBlackColor.withOpacity(0.5),
      ));
  final MainController _dataController = Get.put(MainController());
  BankKycReporModel bankData = BankKycReporModel(
      msg: "",
      message: "",
      userId: "",
      pwd: "",
      bankName: "",
      branch: "",
      acNo: "",
      ifscCode: "",
      remarks: "",
      status: "",
      filename: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = Constants.prefs.getString("user_id");
    password = Constants.prefs.getString("password");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        bankData = BankKycReporModel.fromJson(widget.res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "KYC Report", backNavigation: true),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SpaceHeightWidget(height: 10),
          if (bankData.message != "SUCCESS" && widget.kycType == "Bank")
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTitle(
                  titleName: "You Are Already Having KYC Request In Pending..!",
                  fontColor: greenColor,
                )),
          if (bankData.message != "APPSUCC" && widget.kycType == "Application")
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTitle(
                  titleName:
                      "You Are Already Having Application Request In Pending..!",
                  fontColor: greenColor,
                )),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: decr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.kycType == "Bank") bankWidget(),
                if (widget.kycType == "Application") applicationWidget(),
              ],
            ),
          ),
        ],
      )),
    );
  }

  bankWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewProfileWidget(title: "Bank Name:", info: bankData.bankName),
        ViewProfileWidget(title: "Bank Branch:", info: bankData.branch),
        ViewProfileWidget(title: "A/c Number:", info: bankData.acNo),
        ViewProfileWidget(title: "IFSC Code:", info: bankData.ifscCode),
        ViewProfileWidget(title: "Remarks:", info: bankData.remarks),
        const SpaceHeightWidget(height: 10),
        if (bankData.filename != null)
          Column(
            children: [
              const SideTitle(title: "Uploaded Image"),
              CommonCachedNetworkImage(
                imagePath: bankData.filename,
                height: 100,
              ),
            ],
          ),
        const SpaceHeightWidget(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SideTitle(title: "Your Status: "),
            Flexible(
              child: CommonTitle(
                  titleName: bankData.message == "SUCCESS"
                      ? "Your KYC Successfully Approved"
                      : "Your KYC details are under verification",
                  size: 14,
                  fontColor: bankData.message == "SUCCESS"
                      ? greenColor
                      : darkRedColor),
            )
          ],
        ),
      ],
    );
  }

  applicationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewProfileWidget(title: "Remarks:", info: bankData.remarks),
        const SpaceHeightWidget(height: 10),
        if (bankData.filename != null)
          Column(
            children: [
              const SideTitle(title: "Uploaded Image"),
              CommonCachedNetworkImage(
                imagePath: bankData.filename,
                height: 100,
              ),
            ],
          ),
        const SpaceHeightWidget(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SideTitle(title: "Your Status: "),
            Flexible(
              child: CommonTitle(
                  titleName: bankData.message == "APPSUCC"
                      ? "Your Application Successfully Approved"
                      : "Your Application details are under verification",
                  size: 14,
                  fontColor: bankData.message == "APPSUCC"
                      ? greenColor
                      : darkRedColor),
            )
          ],
        ),
      ],
    );
  }
}
