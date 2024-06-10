import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../commons/common_widgets.dart';
import '../commons/constants.dart';

class CheckOutScreen extends StatefulWidget {
  final String redirectUrl;
  final String? fromScreen;
  const CheckOutScreen({super.key, required this.redirectUrl, this.fromScreen});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
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
      ..loadRequest(Uri.parse(
       
          widget.redirectUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(
            backNavigation: true,
            title: "Checkout",
            onTapFun: () async {
              Get.back();
              Get.back();

              if (widget.fromScreen != "OpenCart") {
                await Constants.prefs.remove("uniq_id");
                await Constants.prefs.remove("ss_id");
              }

              
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
        )
      
        );
  }
}
