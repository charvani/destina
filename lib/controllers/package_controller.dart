import 'package:get/get.dart';

import '../models/selpackage_model.dart';
import '../service_call/api_call.dart';
import '../service_call/api_data.dart';

class PackageController extends GetxController {
  RxBool loading = false.obs;
  List<SelPackageModel> selPackageItemList = <SelPackageModel>[].obs;
  List<SelPackageModel> relPackageItemList = <SelPackageModel>[].obs;

  getPackages({required String packageMalVal, required String countyId}) async {
    loading.value = true;
    Map parameters = {
      "action": "GetMDiPackagesNew",
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
}
