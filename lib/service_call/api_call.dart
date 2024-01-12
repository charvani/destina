import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:math';

import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/service_call/encryption.dart';
import 'package:http/http.dart' as http;

import '../commons/common_widgets.dart';
import 'api_data.dart';

class ApiCall {
  getMethodFun({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      throw e;
    }
  }

  postMethodFun({required String methodName, required Map params}) async {
    print("method...$methodName");
    print("params...$params");
//encryption
    dynamic encryptedText = Encrypt.encryptStringResponse(json.encode(params));
    print("Encrypted text....$encryptedText");
    http.Response response = await http.post(
        Uri.parse(ApiData().baseUrl + methodName),
        body: {"Info": encryptedText.toString()});
    print("cherry.....");
    dynamic convertedData = convert.jsonDecode(response.body);
    print(
        "response.statusCode...${convertedData['Msg'].toString().toLowerCase()}");
    if (response.statusCode == 200 &&
        convertedData['Msg'].toString().toLowerCase() == "success") {
      print("kkkkkkk");
      return convertedData;
    } else {
      CommonToast(convertedData['Message']);
    }
  }

  sponsorPostMethodFun(
      {required String methodName, required Map params}) async {
    print("method...$methodName");
    print("params...$params");
//encryption
    dynamic encryptedText = Encrypt.encryptStringResponse(json.encode(params));
    print("Encrypted text....$encryptedText");
    http.Response response = await http.post(
        Uri.parse(ApiData().baseUrl + methodName),
        body: {"Info": encryptedText.toString()});
    print("cherry.....");
    dynamic convertedData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return convertedData;
    } else {
      CommonToast(convertedData['Message']);
    }
  }

  uploadImage({
    required imageFile,
    required endUrl,
  }) async {
    Map bData = {
      "UserId": Constants.prefs.getString("user_id"),
      "Pwd": Constants.prefs.getString("password"),
      "Name": Constants.prefs.getString("user_name"),
      "Country": Constants.prefs.getString("country_name"),
      "Filename": imageFile
    };
    print("image bdata...$bData");

    http.Response response =
        await http.post(Uri.parse(ApiData().baseUrl + endUrl), body: bData);

    print("cherry.....");
    dynamic convertedData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return convertedData;
    } else {
      CommonToast(convertedData['Message']);
    }
  }

  listPostMethodFun({required String methodName, required Map params}) async {
    print("method...$methodName");
    print("params...$params");
//encryption
    dynamic encryptedText = Encrypt.encryptStringResponse(json.encode(params));
    print("Encrypted text....$encryptedText");
    http.Response response = await http.post(
        Uri.parse(ApiData().baseUrl + methodName),
        body: {"Info": encryptedText.toString()});
    dynamic convertedData = convert.jsonDecode(response.body);

    if (response.statusCode == 200 && convertedData.length > 0) {
      return convertedData;
    } else {
      CommonToast("data not available");
    }
  }

  uploadFile({
    required bodyData,
    required endUrl,
  }) async {
    http.Response response =
        await http.post(Uri.parse(ApiData().baseUrl + endUrl), body: bodyData);
    print("cherry.....");
    dynamic convertedData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return convertedData;
    } else {
      CommonToast(convertedData['Message']);
    }
  }
}
