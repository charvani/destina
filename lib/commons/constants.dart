import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

String appversion = "1.0";
String country = "MY";

class Constants {
  static late SharedPreferences prefs;
}

Center loader = Center(
  child: SizedBox(
    height: 20,
    width: 20,
    child: CircularProgressIndicator(
      color: darkNaviBlueColor,
      strokeWidth: 2,
    ),
  ),
);

// Center loader = Center(
//     child: CupertinoActivityIndicator(
//   color: appthemeColor,
//   radius: 45,
// ));
