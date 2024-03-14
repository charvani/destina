import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../commons/common_widgets.dart';
import '../../commons/constants.dart';

class WebUrlScreen extends StatefulWidget {
  final String redirectUrl, from;
  const WebUrlScreen(
      {super.key, required this.redirectUrl, required this.from});

  @override
  State<WebUrlScreen> createState() => _WebUrlScreenState();
}

class _WebUrlScreenState extends State<WebUrlScreen> {
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
    print("my url...${widget.redirectUrl}");
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
          title: widget.from,
        ),
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
