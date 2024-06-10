import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:math';

import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/service_call/encryption.dart';
import 'package:get/get.dart';
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

  saleMallPostMethodFun(
      {required String methodName, required Map params}) async {
    print("method...$methodName");
    print("params...$params");
//encryption
    dynamic encryptedText = Encrypt.encryptStringResponse(json.encode(params));
    print("Encrypted text....$encryptedText");
    http.Response response = await http.post(
        Uri.parse(ApiData().baseUrl + methodName),
        body: {"Info": encryptedText.toString()});
    dynamic convertedData = convert.jsonDecode(response.body);

    return convertedData;
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

  ///previous upload review code::::::::::::::::::::::::::::::::
  ///:::::::::::::::::::::::::::::::
  // uploadReview({required bData, required apiEndPoint}) async {
  //   String endUrl = ApiData().baseUrl + apiEndPoint;
  //   print("getting url...$endUrl");

  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse(endUrl),
  //       body: bData,
  //     );

  //     print("cherry.....${response.body}");
  //     print("response.statusCode.....${response.statusCode}");
  //     print("response.reasonPhrase.....${response.reasonPhrase}");

  //     if (response.statusCode == 200) {
  //       dynamic convertedData = convert.jsonDecode(response.body);

  //       return convertedData;
  //     } else {
  //       dynamic convertedData = convert.jsonDecode(response.body);

  //       print("get error....${convertedData['Message']}");
  //       CommonToast(convertedData['Message']);
  //     }
  //   } catch (e) {
  //     print("getting error....$e");
  //     Get.dialog(OkDialog(title: e.toString()));
  //   }
  // }
  uploadReview({required bData, required apiEndPoint}) async {
    String endUrl = ApiData().baseUrl + apiEndPoint;
    print("getting url...$endUrl");

    try {
      http.Response response = await http.post(Uri.parse(endUrl),
          body: jsonEncode(bData),
          headers: {'Content-Type': 'application/json'});

      print("cherry.....${response.body}");
      print("response.statusCode.....${response.statusCode}");
      print("response.reasonPhrase.....${response.reasonPhrase}");

      if (response.statusCode == 200) {
        dynamic convertedData = convert.jsonDecode(response.body);

        return convertedData;
      } else {
        dynamic convertedData = convert.jsonDecode(response.body);

        print("get error....${convertedData['Message']}");
        CommonToast(convertedData['Message']);
      }
    } catch (e) {
      print("getting error....$e");
      Get.dialog(OkDialog(title: e.toString()));
    }
  }

  rawFun({required params, required endUrl}) async {
    print("method....$endUrl");
    print("params....$params");

    http.Response response =
        await http.post(Uri.parse(ApiData().baseUrl + endUrl), body: params);

    print("cherry.....${response.body}");
    dynamic convertedData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return convertedData;
    } else {
      print("get error....${convertedData['Message']}");
      CommonToast(convertedData['Message']);
    }
  }
}
