import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/network_connectivity/network_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication_screens/splash_screen.dart';

void main() async {
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
        home: const SplashScreen(),
      ),
    );
  }
}
