import 'dart:io';

import 'package:destina_1_international/authentication_screens/splash_screen.dart';
import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/network_connectivity/network_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

//charvani 06/11/23 initial commint static design
void main() async {
  // HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        initialBinding: NetworkBinding(),
        title: 'Destina 1 International',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: IconThemeData(color: darkBlue),
          focusColor: darkBlue,
          primaryColor: darkBlue,
          colorScheme:
              ColorScheme.fromSeed(primary: darkBlue, seedColor: darkBlue),
          useMaterial3: true,
        ),
        // home:
        // const RegisterScreen(countryId: "1", packageCode: "MYJD02")
        //  const RegisterCartScreen(
        //   packageCode: "MYJD02",
        // ),
        // home: LoginScreen(),
        // home: const PackageDetailsScreen(
        //   from: "register",
        //   countryid: "1",
        //   packageCode: "MYJD02",
        // )
        home: const SplashScreen(),
      ),
    );
  }
}
