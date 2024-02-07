import 'package:get/get.dart';

import '../models/packcart_model.dart';
import '../models/selpackage_model.dart';
import '../service_call/api_call.dart';
import '../service_call/api_data.dart';

class PackageController extends GetxController {
  RxBool loading = false.obs;
  RxBool cartLoading = false.obs;

  List<SelPackageModel> selPackageItemList = <SelPackageModel>[].obs;
  List<SelPackageModel> relPackageItemList = <SelPackageModel>[].obs;
  List<PackCartModel> packCartList = <PackCartModel>[].obs;
  RxDouble cvVal = 0.0.obs;
  getPackages({required String packageMalVal, required String countyId}) async {
    loading.value = true;
    Map parameters = {
      // "action": "GetMDiPackagesNew",
      "action": "GetShoppeProducts",
      "CountryID": countyId,
      "MallName": packageMalVal
    };
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().loadDistSelPackageMethod, params: parameters);
    selPackageItemList.clear();
    relPackageItemList.clear();
    if (res['DistSelPackageRpt'].length > 0) {
      for (int i = 0; i < res['DistSelPackageRpt'].length; i++) {
        selPackageItemList
            .add(SelPackageModel.fromJson(res['DistSelPackageRpt'][i]));
      }
    }
    if (res['DistRelPackageRpt'].length > 0) {
      for (int i = 0; i < res['DistRelPackageRpt'].length; i++) {
        relPackageItemList
            .add(SelPackageModel.fromJson(res['DistRelPackageRpt'][i]));
      }
    }
    // print(productItemList.length);
    loading.value = false;
    return res;
  }

  getCartData(Map params) async {
    cartLoading.value = true;
    packCartList.clear();
    cvVal.value = 0.0;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().nSGCartItems, params: params);
    if (res != null) {
      for (int i = 0; i < res['SGCartItemRpt'].length; i++) {
        packCartList.add(PackCartModel.fromJson(res['SGCartItemRpt'][i]));
        cvVal.value = cvVal.value + double.parse(res['SGCartItemRpt'][i]['CV']);
      }
    }
    cartLoading.value = false;
    return res;
  }

  getCheckoutCheck(Map params) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().checkOutSignupCartItems, params: params);
    return res;
  }
}
