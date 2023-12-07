import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class EcardTransferScreen extends StatefulWidget {
  final String from;
  const EcardTransferScreen({super.key,required this.from});

  @override
  State<EcardTransferScreen> createState() => _EcardTransferScreenState();
}

class _EcardTransferScreenState extends State<EcardTransferScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController toTController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController passwordTController = TextEditingController();

  bool visible = false;
  dynamic eMoneyType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: "ECard Transfer"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: lightDarKBlue.withOpacity(0.3))),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ViewProfileWidget(title: "From", info: "DESTINA1INT"),
                const SpaceHeightWidget(height: 10),
                const SideTitle(title: "To"),
                AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "",
                  controller: toTController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Enter Transfer To";
                    } else {
                      return null;
                    }
                  },
                ),
                const ViewProfileWidget(title: "Balance", info: "22149.61 RM"),
                const SpaceHeightWidget(height: 10),
                const SideTitle(title: "Transfer Amount"),
                AccountTextField(
                  onchangeFun: (val) {},
                  outsideFun: (val) async {},
                  textInputType: TextInputType.name,
                  hintText: "",
                  controller: toTController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Enter Transfer Amount";
                    } else {
                      return null;
                    }
                  },
                ),
                const SideTitle(title: "EMoney Type"),
                ProfileDropDown(
                  value: eMoneyType,
                  hintText: "Select",
                  onChangedFun: (val) {
                    setState(() {
                      eMoneyType = val!;
                    });
                  },
                  items: const [
                    "Ecard",
                  ],
                  validationFun: (val) {
                    if (val == "" || val == null) {
                      return "Select EMoney Type";
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
                      return "Enter Remarks";
                    } else if (val.length < 2) {
                      return "Enter valid Remarks";
                    } else {
                      return null;
                    }
                  },
                ),
                const SideTitle(title: "Transaction Password"),
                LoginTextField(
                  obscureText: visible,
                  suffix: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    child: Icon(
                      !visible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: middleBlackColor.withOpacity(0.5),
                    ),
                  ),
                  padding: 5,
                  textInputType: TextInputType.name,
                  labelText: "",
                  hintText: "Password",
                  controller: passwordTController,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return "Enter Transaction Password";
                    } else if (val.length < 5) {
                      return "Enter valid password";
                    } else {
                      return null;
                    }
                  },
                ),
                const SpaceHeightWidget(height: 15),
                CustomElevatedButton(
                    onTapFun: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    title: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
