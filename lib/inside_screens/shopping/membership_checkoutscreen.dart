import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../commons/common_widgets.dart';
import '../../commons/constants.dart';
import '../../controllers/main_controller.dart';

class MemberShipCheckOutScreen extends StatefulWidget {
  final String redirectUrl;
  const MemberShipCheckOutScreen({super.key, required this.redirectUrl});

  @override
  State<MemberShipCheckOutScreen> createState() =>
      _MemberShipCheckOutScreenState();
}

class _MemberShipCheckOutScreenState extends State<MemberShipCheckOutScreen> {
  int cartCount = 0;
  int cartItemCount = 0;
  String? handlingMethod;
  String? paymentType;
  TextEditingController couponController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  late final WebViewController _webcontroller;
  late final Future<WebViewController> webViewControllerFuture;

  final MainController _loginController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    cartCount = Constants.prefs.getInt("cart_count") ?? 0;
    cartItemCount = cartCount;

    webViewControllerFuture = createController();
  }

  Future<WebViewController> createController() async {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.redirectUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(
            backNavigation: true,
            title: "Checkout",
            onTapFun: () async {
              Map bodyData = {
                "idno": Constants.prefs.getString("user_id").toString().trim(),
                "Pwd": Constants.prefs.getString("password").toString().trim(),
                "FcmId": "1233455",
                "IMEI": _loginController.imeiNum.value,
                "MOBINFO": _loginController.mobileInfo.value,
              };
              _loginController.getMemberLogin(bodyData);
              Get.back();
              await Constants.prefs.remove("uniq_id");
              await Constants.prefs.remove("ss_id");
              _loginController.memberMallCartCount.value = "0";
            }),
        body: PopScope(
          canPop: false,
          child: FutureBuilder<WebViewController>(
              future: webViewControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  WebViewController webcontroller = snapshot.data!;
                  return WebViewWidget(controller: webcontroller);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(child: loader);
                }
              }),
        ));
  }
}
