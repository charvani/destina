import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:math';

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
    if (response.statusCode == 200 &&
        convertedData['Msg'].toString().toLowerCase() == "success") {
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
}
