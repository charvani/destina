import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class Constants {
  static late SharedPreferences prefs;
  String appversion = "1.0";
  String country = "MY";
  // String ip = "";
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

Center notAvailableW = Center(
    child: Text(
  "Not available",
  style: TextStyle(
      fontFamily: "OnestRegular", fontSize: 12, color: middleBlackColor),
));
