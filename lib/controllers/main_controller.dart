import 'package:destina_1_international/models/cartitem_model.dart';
import 'package:destina_1_international/models/checkcountry_model.dart';
import 'package:destina_1_international/models/loadcountry_model.dart';
import 'package:destina_1_international/service_call/api_call.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../models/packageitems_model.dart';
import '../models/product_categoryitem_model.dart';
import '../models/productdetails_model.dart';
import '../service_call/api_data.dart';

class MainController extends GetxController {
  RxBool loading = false.obs;
  RxList<ProductCategoryItem> productItemList = <ProductCategoryItem>[].obs;
  Rx<ProductDetails> productDetails = ProductDetails(
          similarProducts: [],
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
          cv: "")
      .obs;

  Rx<PackageItemsModel> packageDetails = PackageItemsModel(
          getPkgItemsRpt: [],
          msg: "",
          message: "",
          lblMsg: "",
          head: "",
          maxQty: "")
      .obs;
  RxList<CartItemModel> cartItemsList = <CartItemModel>[].obs;
  RxList<LoadCountryModel> countriesList = <LoadCountryModel>[].obs;
  Rx<CheckCountryModel> checkCountryData = CheckCountryModel(
          msg: "",
          message: "",
          result: "",
          countryFlag: "",
          dRenFee: "",
          dcRenFee: "",
          pcRenFee: "",
          diRenFee: "",
          dCiRenFee: "",
          pCiRenFee: "",
          dRenF: "",
          dcRenF: "",
          pcRenF: "",
          dcCnt: "",
          pcCnt: "",
          name: "")
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

  getPackageItems(
      {required String productCode,
      required String uniqId,
      required String sessionId,
      required String quantity}) async {
    Map parameters = {
      "pkgcode": productCode,
      "dtype": "Package",
      "qty": quantity,
      "uniqid": uniqId,
      "sessid": sessionId,
      "Jointype": "Retailer"
    };

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().packageItemsMethod, params: parameters);
    packageDetails.value = PackageItemsModel.fromJson(res);
    return res;
  }

  getAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().addtoCartMethod, params: parameters);
    return res;
  }

  getCartItems(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().cartItemsMethod, params: parameters);
    cartItemsList.clear();
    print("cart_itmes...${cartItemsList.length}");
    if (res['packageDataRpt'].length > 0) {
      for (int i = 0; i < res['packageDataRpt'].length; i++) {
        cartItemsList.add(CartItemModel.fromJson(res['packageDataRpt'][i]));
      }
    }
    print(cartItemsList.length);
    loading.value = false;
    return res;
  }

  getRemoveCartItem(Map parameters, cartParameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().removeCartItemMethod, params: parameters);
    getCartItems(cartParameters);
    return res;
  }

  getCheckSponsor(String id) async {
    Map parameters = {"SponsorID": id};
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().checkSdponsorMethod, params: parameters);
    return res;
  }

  getCheckOutCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().checkoutCartItemsMethod, params: parameters);
    return res;
  }

  getCountries() async {
    loading.value = true;
    Map parameters = {
      "ID": "OpenReg",
    };
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().countryLoadMethod, params: parameters);
    countriesList.clear();
    for (int i = 0; i < res['CountryRpt'].length; i++) {
      countriesList.add(LoadCountryModel.fromJson(res['CountryRpt'][i]));
    }
    loading.value = false;

    return res;
  }

  getcheckCountry(String countryId) async {
    loading.value = true;
    Map parameters = {"Action": "GetCountryDetails", "Cid": countryId};
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().countryCheckMethod, params: parameters);
    checkCountryData.value = CheckCountryModel.fromJson(res);
    loading.value = false;

    return res;
  }
}
