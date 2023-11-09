import 'package:destina_1_international/service_call/api_call.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../models/product_categoryitem_model.dart';
import '../models/productdetails_model.dart';
import '../service_call/api_data.dart';

class MainController extends GetxController {
  RxBool loading = false.obs;
  RxList<ProductCategoryItem> productItemList = <ProductCategoryItem>[].obs;
  Rx<ProductDetails> productDetails = ProductDetails(
          productImages: [],
          videos: [],
          endorsements: [],
          tabs: [],
          tabcontent: [],
          msg: '',
          message: '',
          available: false,
          pkid: 0,
          pcode: '',
          name: '',
          url: '',
          category: '',
          description: '',
          currency: '',
          price: '',
          downloadpdf: '',
          pType: '',
          howtoUse: '',
          videoUrl: '',
          cv: ""
          )
      .obs;
  getCountryCode() async {
    dynamic res = await ApiCall().getMethodFun(url: ApiData().countryUrl);
    return res;
  }

  getProducts(String productType) async {
    loading.value = true;
    Map parameters = {
      "action": productType,
      "pcode": "0",
      "country": Constants().country
    };
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().productCategoryMethod, params: parameters);
    productItemList.clear();
    if (res['productRpt'].length > 0) {
      for (int i = 0; i < res['productRpt'].length; i++) {
        productItemList.add(ProductCategoryItem.fromJson(res['productRpt'][i]));
      }
    }
    print(productItemList.length);
    loading.value = false;
    return res;
  }

  getProductDetails(String productCode) async {
    loading.value = true;
    Map parameters = {
      "action": "GetSingleproductdata",
      "pcode": productCode,
      "country": Constants().country
    };
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().productDetailsMethod, params: parameters);
    productDetails.value = ProductDetails.fromJson(res);
    loading.value = false;
    return res;
  }
}
