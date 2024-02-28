import 'dart:async';

// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../commons/colors.dart';
import 'network_controller.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  final NetworkController _networkController = Get.find<NetworkController>();

  // CategoryController _netWorkController = Get.find<CategoryController>();

  // final Connectivity _connectivity = Connectivity();

  // StreamSubscription _streamSubscription;

  callbackmethod() {
    if (_networkController.connectionStatus.value != 0) {
      autoLoginfun();
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var currentBackPressTime;
  // ignore: prefer_typing_uninitialized_variables
  var orderid;
  @override
  void initState() {
    super.initState();

    // callbackmethod();
    print(" at nointernet page");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) {
        onWillPop(pop);
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                        // width: 160,
                        child: Lottie.asset(
                      "assets/lotties/no_internet.json",
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    )
                        //  Image(
                        //   image: AssetImage("assets/images/noInternet.jpg"),
                        // )
                        ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: const Text("Oops!",
                          style: TextStyle(color: Colors.black, fontSize: 30))),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "NO ",
                          style: TextStyle(color: darkRedColor, fontSize: 25),
                        ),
                        TextSpan(
                          text: "INTERNET",
                          style: TextStyle(color: darkRedColor, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return greenColor;
                            }
                            return darkBlue; // Use the component's default.
                          },
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        )),
                      ),
                      onPressed: () => {
                        callbackmethod(),
                      }, //set both onPressed and onLongPressed to null to see the disabled properties
                      child: const Text(
                        'Try again',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "OnestSemiBold"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onWillPop(pop) {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tap back again to leave');

      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  autoLoginfun() async {
    Timer(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }
}
