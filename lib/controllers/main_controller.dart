import 'package:destina_1_international/service_call/api_call.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../models/product_categoryitem_model.dart';
import '../service_call/api_data.dart';

class MainController extends GetxController {
  RxBool loading = false.obs;
  RxList<ProductCategoryItem> productItemList = <ProductCategoryItem>[].obs;
  getCountryCode() async {
    dynamic res = await ApiCall().getMethodFun(url: countryUrl);
    return res;
  }

  getProducts(String productType) async {
    loading.value = true;
    Map parameters = {"action": productType, "pcode": "0", "country": country};
    dynamic res = await ApiCall()
        .postMethodFun(methodName: productCategoryMethod, params: parameters);
    if (res['productRpt'].length > 0) {
      for (int i = 0; i < res['productRpt'].length; i++) {
        productItemList.add(ProductCategoryItem.fromJson(res['productRpt'][i]));
      }
    }
    print(productItemList.length);
    loading.value = false;
    return res;
  }
}
