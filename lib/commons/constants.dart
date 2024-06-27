import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class Constants {
  static late SharedPreferences prefs;
  static String appversion = "5.0";
  String country = "MY";
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

Center notAvailableW = Center(
    child: Text(
  "Not available",
  style: TextStyle(
      fontFamily: "OnestRegular", fontSize: 12, color: middleBlackColor),
));
