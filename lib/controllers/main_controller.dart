import 'package:destina_1_international/models/cartitem_model.dart';
import 'package:destina_1_international/models/checkcountry_model.dart';
import 'package:destina_1_international/models/loadcountry_model.dart';
import 'package:destina_1_international/models/packagedetails_model.dart';
import 'package:destina_1_international/models/selpackage_model.dart';
import 'package:destina_1_international/service_call/api_call.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../models/enrolldata_model.dart';
import '../models/packageitems_model.dart';
import '../models/product_categoryitem_model.dart';
import '../models/productdetails_model.dart';
import '../models/registercart_item_model.dart';
import '../models/signupLoad_model.dart';
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

  RxList<SelPackageModel> selPackageItemList = <SelPackageModel>[].obs;
  RxList<SelPackageModel> relPackageItemList = <SelPackageModel>[].obs;

  Rx<PackageDetailsModel> packageDetailsData = PackageDetailsModel(
          packageDescriptionRpt1: [],
          packageDescriptionRpt2: [],
          msg: "",
          message: "",
          desc: "",
          overview: "",
          info: "",
          pkid: "",
          pkcode: "",
          pkname: "",
          mrp: "",
          pImage: "",
          codeNo: "",
          cv: "",
          img: "",
          img1: "",
          img2: "",
          img3: "")
      .obs;
  Rx<PackageItemsModel> packPackageDetails = PackageItemsModel(
          getPkgItemsRpt: [],
          msg: "",
          message: "",
          lblMsg: "",
          head: "",
          maxQty: "")
      .obs;
  Rx<EnrollDataModel> enrollData = EnrollDataModel(
          enrollPackageRpt: [], iconDetails: [], msg: "", message: "")
      .obs;

  Rx<SignupLoadModel> signuploadData = SignupLoadModel(
          stateDetailsRpt: [],
          bankDetailsRpt: [],
          secretQuesRpt: [],
          userSinguprulesRpt: [],
          msg: "",
          message: "",
          hidUid: "",
          randomnum: "",
          country: "")
      .obs;
  RxList<RegisterCartItemsModel> registerCartItems =
      <RegisterCartItemsModel>[].obs;
  RxDouble totalAmount = 0.0.obs;
  RxList<String> bannerPopUp = <String>[].obs;

// ********************************************************************************************
  getCountryCode() async {
    dynamic res = await ApiCall().getMethodFun(url: ApiData().countryUrl);
    return res;
  }

  getProducts(String productType) async {
    loading.value = true;
    Map parameters = {
      "action": productType,
      "pcode": "0",
      "country": Constants.prefs.getString("country")
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

  getProductDetails(String packageCode) async {
    loading.value = true;
    Map parameters = {
      "action": "GetSingleproductdata",
      "pcode": packageCode,
      "country": Constants.prefs.getString("country")
    };
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().productDetailsMethod, params: parameters);
    productDetails.value = ProductDetails.fromJson(res);
    loading.value = false;
    return res;
  }

  getProductPackageItems(
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

  getPackageDetails(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().packageDetailsMethod, params: parameters);
    packageDetailsData.value = PackageDetailsModel.fromJson(res);
    loading.value = false;
    return "res";
  }

  getPacktPackageItems({
    required String productCode,
    required String uniqId,
    required String sessionId,
    required String dtype,
  }) async {
    Map parameters = {
      "pkgcode":
          // "MYJD02",
          productCode,
      "dtype": dtype,
      // "Package",
      // "dtype": "Promotion",
      "qty": "1",
      "uniqid": uniqId,
      "sessid": sessionId,
      "Jointype": "Signup"
    };

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().packPackageItemsMethod, params: parameters);
    packPackageDetails.value = PackageItemsModel.fromJson(res);
    return res;
  }

  getPackAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().packAddtoCartMethod, params: parameters);
    return res;
  }

  getEnrollPack(Map parameters) async {
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().enrollPack, params: parameters);
    enrollData.value = EnrollDataModel.fromJson(res);
    return res;
  }

  getStateData(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().stateData, params: parameters);
    signuploadData.value = SignupLoadModel.fromJson(res);
    loading.value = false;
    return res;
  }

  getSponsorCheckDb(Map parameters) async {
    dynamic res = await ApiCall().sponsorPostMethodFun(
        methodName: ApiData().sponsorCheckDB, params: parameters);
    return res;
  }

  getPlacementPlaceCheckDb(Map parameters) async {
    dynamic res = await ApiCall().sponsorPostMethodFun(
        methodName: ApiData().placementPlaceCheckDB, params: parameters);
    return res;
  }

  getUserCheckDb(Map parameters) async {
    dynamic res = await ApiCall().sponsorPostMethodFun(
        methodName: ApiData().userChkLoginID, params: parameters);
    return res;
  }

  getRegister(Map parameters) async {
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().register, params: parameters);
    return res;
  }

  getRegisterCartItems(String from, Map parameters) async {
    if (from == "init") {
      loading.value = true;
    }
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().registerCart, params: parameters);
    registerCartItems.clear();
    totalAmount.value = 0.0;
    print("cart_itmes...${registerCartItems.length}");
    if (res['SGCartItemRpt'].length > 0) {
      for (int i = 0; i < res['SGCartItemRpt'].length; i++) {
        registerCartItems
            .add(RegisterCartItemsModel.fromJson(res['SGCartItemRpt'][i]));
        totalAmount.value = totalAmount.value +
            (double.parse(res['SGCartItemRpt'][i]['mrp']) *
                int.parse(res['SGCartItemRpt'][i]['Qty']));
      }
    }
    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getMemberLogin(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().login, params: parameters);
    if (res != null) {
      if (res['Msg'].toString().toUpperCase() == "SUCCESS") {
        for (int i = 0; i < res['MemberPopuprpt'].length; i++) {
          if (res['MemberPopuprpt'][i]['MemPopup'] != null ||
              res['MemberPopuprpt'][i]['MemPopup'] != "") {
            bannerPopUp.add(res['MemberPopuprpt'][i]['MemPopup']);
          }
        }
      }
      print("bbbb....${bannerPopUp.length}");
    }
    loading.value = false;
    return res;
  }
}
