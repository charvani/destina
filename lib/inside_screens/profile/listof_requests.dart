import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdationReportScreen extends StatefulWidget {
  const UpdationReportScreen({super.key});

  @override
  State<UpdationReportScreen> createState() => _UpdationReportScreenState();
}

final MainController _litsOfReqController = Get.put(MainController());
dynamic userid, username;

class _UpdationReportScreenState extends State<UpdationReportScreen> {
  final ScrollController _scrollController = ScrollController();
  DataTableSource tSource = MyData();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userid = Constants.prefs.getString("user_id");
      username = Constants.prefs.getString("user_name");
      dataFun();
    });
  }

  dataFun() async {
    Map bdata = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
    };
    await _litsOfReqController.getListOfReq(bdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "List of Request", backNavigation: true),
      body: Obx(() {
        return _litsOfReqController.loading.value
            ? loader
            : SingleChildScrollView(
                child: Column(
                children: [
                  const SpaceHeightWidget(height: 10),
                  Scrollbar(
                    interactive: true,
                    trackVisibility: true,
                    controller: _scrollController,
                    thumbVisibility: true,
                    thickness: 8,
                    radius: const Radius.circular(10),
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: PaginatedDataTable(
                        controller: _scrollController,
                        columnSpacing: 0,
                        horizontalMargin: 0,
                        headingRowColor: MaterialStatePropertyAll(
                            lightDarKBlue.withOpacity(0.2)),
                        columns: [
                          DataColumn(label: tableTitleWidget("S.No")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(label: tableTitleWidget("Name")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(label: tableTitleWidget("Update Type")),
                          DataColumn(label: _verticalDivider),
                          DataColumn(label: tableTitleWidget("Update Date")),
                        ],
                        source: tSource),
                  ),
                  const SpaceHeightWidget(height: 20)
                ],
              ));
      }),
    );
  }
}

tableTitleWidget(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Text(
      title,
      style: TextStyle(
          fontFamily: "OnestSemiBold", fontSize: 12, color: blackColor),
    ),
  );
}

Dialog memberProfile() {
  return Dialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 6),
    backgroundColor: blackColor.withOpacity(0.8),
    child: StatefulBuilder(builder: (context, myState) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: blackColor.withOpacity(0.8)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile update request of :${_litsOfReqController.approvedProfileData.value.fname}",
                      style: TextStyle(
                          fontFamily: "OnestBold",
                          fontSize: 16,
                          color: whiteColor),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          size: 16,
                          color: whiteColor,
                        ))
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: whiteColor,
                ),
                padding: const EdgeInsets.all(7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceHeightWidget(height: 20),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: lightDarKBlue.withOpacity(0.2))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    tableTitleWidget("S.No"),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Divider(
                                        thickness: 1,
                                        color: lightDarKBlue.withOpacity(0.1),
                                      ),
                                    ),
                                    rowTextWidget("1")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    tableTitleWidget("Name"),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Divider(
                                        thickness: 1,
                                        color: lightDarKBlue.withOpacity(0.1),
                                      ),
                                    ),
                                    rowTextWidget(username ?? "")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    tableTitleWidget("User ID"),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Divider(
                                        thickness: 1,
                                        color: lightDarKBlue.withOpacity(0.1),
                                      ),
                                    ),
                                    rowTextWidget(
                                        userid.toString().toUpperCase())
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: lightDarKBlue.withOpacity(0.2))),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 380,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    tableTitleWidget("Old Details"),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Divider(
                                        thickness: 1,
                                        color: lightDarKBlue.withOpacity(0.1),
                                      ),
                                    ),
                                    oldDetailsWidget()
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: lightDarKBlue.withOpacity(0.2))),
                                width: 380,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    tableTitleWidget("New Details"),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Divider(
                                        thickness: 1,
                                        color: lightDarKBlue.withOpacity(0.1),
                                      ),
                                    ),
                                    newDetailsWidget()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}

rowTextWidget(String title) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      if (title == "Member Profile") {
        Get.dialog(memberProfile());
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "OnestRegular",
            fontSize: 12,
            color: title == "Member Profile" ? darkRedColor : blackColor),
      ),
    ),
  );
}

int? selectInt;
updateTypeTextWidget(String title, int index) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () async {
      selectInt = index;
      if (title == "Member Profile") {
        Map bData = {
          "Action": "getrptbyid",
          "sno": _litsOfReqController.listofReqs[index].sno,
          "regid": "",
          "status": "0",
          "remarks": "",
          "sesuser": ""
        };
        dynamic res = await _litsOfReqController.getListOfMemberProfile(bData);
        if (res != null) {
          Get.dialog(memberProfile());
        }
      }
      selectInt = null;
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Obx(() {
        return _litsOfReqController.listOfMemberLoading.value &&
                selectInt == index
            ? loader
            : Text(
                title,
                style: TextStyle(
                    fontFamily: "OnestRegular",
                    fontSize: 12,
                    color:
                        title == "Member Profile" ? darkRedColor : blackColor),
              );
      }),
    ),
  );
}

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        rowTextWidget((index + 1).toString()),
      ),
      DataCell(_verticalDivider),
      DataCell(
        rowTextWidget(_litsOfReqController.listofReqs[index].name),
      ),
      DataCell(_verticalDivider),
      DataCell(updateTypeTextWidget(
          _litsOfReqController.listofReqs[index].updateType, index)),
      DataCell(_verticalDivider),
      DataCell(
        rowTextWidget(_litsOfReqController.listofReqs[index].updateDate),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _litsOfReqController.listofReqs.length;

  @override
  int get selectedRowCount => 0;
}

Widget _verticalDivider = VerticalDivider(
  color: lightBlackColor,
  thickness: 1,
);

oldDetailsWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Gender:",
            info: _litsOfReqController.approvedProfileData.value.osex),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Address 1:",
            info: _litsOfReqController.approvedProfileData.value.oadd1),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Address 2:",
            info: _litsOfReqController.approvedProfileData.value.oadd2),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "City/Area:",
            info: _litsOfReqController.approvedProfileData.value.ocity),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Area/Zip Code:",
            info: _litsOfReqController.approvedProfileData.value.opin),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Passport/IC/DL:",
            info: _litsOfReqController.approvedProfileData.value.opasport),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Email Address:",
            info: _litsOfReqController.approvedProfileData.value.oemail),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Dial Code:",
            info: _litsOfReqController.approvedProfileData.value.odcode),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Land Line:",
            info: _litsOfReqController.approvedProfileData.value.oline),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Mobile:",
            info: _litsOfReqController.approvedProfileData.value.omobile),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Bank Name:",
            info: _litsOfReqController.approvedProfileData.value.obenname),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Bank IFSC Code/\nRouting Number:",
            info: _litsOfReqController.approvedProfileData.value.oifscode),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Bank Swift Code:",
            info: _litsOfReqController.approvedProfileData.value.oswiftcode),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Bank Branch:",
            info: _litsOfReqController.approvedProfileData.value.obranch),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Account Number:",
            info: _litsOfReqController.approvedProfileData.value.oaccno),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Account Holder's Name\n(Same as the Bank Account):",
            info: _litsOfReqController.approvedProfileData.value.obenname),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Nominee's Name (next of kin)",
            info: _litsOfReqController.approvedProfileData.value.onominee),
        ViewProfileWidget(
            fontfamily: "OnestRegular",
            title: "Nominee's Relationship:",
            info: _litsOfReqController.approvedProfileData.value.onomrel),
      ],
    ),
  );
}

newDetailsWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.sex,
          fontfamily: "OnestRegular",
          title: "Gender:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.add1,
          fontfamily: "OnestRegular",
          title: "Address 1:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.add2,
          fontfamily: "OnestRegular",
          title: "Address 2:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.city,
          fontfamily: "OnestRegular",
          title: "City/Area:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.pin,
          fontfamily: "OnestRegular",
          title: "Area/Zip Code:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.passport,
          fontfamily: "OnestRegular",
          title: "Passport/IC/DL:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.email,
          fontfamily: "OnestRegular",
          title: "Email Address:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.stdcode,
          fontfamily: "OnestRegular",
          title: "Dial Code:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.landline,
          fontfamily: "OnestRegular",
          title: "Land Line:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.mobile,
          fontfamily: "OnestRegular",
          title: "Mobile:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.bank,
          fontfamily: "OnestRegular",
          title: "Bank Name:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.ifsccode,
          fontfamily: "OnestRegular",
          title: "Bank IFSC Code/\nRouting Number:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.swiftcode,
          fontfamily: "OnestRegular",
          title: "Bank Swift Code:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.branch,
          fontfamily: "OnestRegular",
          title: "Bank Branch:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.accno,
          fontfamily: "OnestRegular",
          title: "Account Number:",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.benname,
          fontfamily: "OnestRegular",
          title: "Account Holder's Name\n(Same as the Bank Account):",
          infoColor: darkRedColor,
        ),
        
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.nominee,
          fontfamily: "OnestRegular",
          title: "Nominee's Name (next of kin)",
          infoColor: darkRedColor,
        ),
        ViewProfileWidget(
          info: _litsOfReqController.approvedProfileData.value.nomrel,
          fontfamily: "OnestRegular",
          title: "Nominee's Relationship:",
          infoColor: darkRedColor,
        ),
      ],
    ),
  );
}
