import 'dart:io';

import 'package:destina_1_international/inside_screens/profile/listofreq_approvedprofile_model.dart';
import 'package:destina_1_international/models/cartitem_model.dart';
import 'package:destina_1_international/models/checkcountry_model.dart';
import 'package:destina_1_international/models/dashboard_model.dart';
import 'package:destina_1_international/models/genelogyview_model.dart';
import 'package:destina_1_international/models/groupsales_model.dart';
import 'package:destina_1_international/models/listofreq_model.dart';
import 'package:destina_1_international/models/loadcountry_model.dart';
import 'package:destina_1_international/models/order_acknowledgemodel.dart';
import 'package:destina_1_international/models/order_reportmodel.dart';
import 'package:destina_1_international/models/packagedetails_model.dart';
import 'package:destina_1_international/models/selpackage_model.dart';
import 'package:destina_1_international/models/shipping_ordermodel.dart';
import 'package:destina_1_international/models/view_profile_model.dart';
import 'package:destina_1_international/service_call/api_call.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../models/awardreport_model.dart';
import '../models/bank_model.dart';
import '../models/checkupdation_model.dart';
import '../models/enrolldata_model.dart';
import '../models/geneology_popupmodel.dart';
import '../models/groupsales_cvmodel.dart';
import '../models/myteam_viewmodel.dart';
import '../models/ordermall_model.dart';
import '../models/packageitems_model.dart';
import '../models/product_categoryitem_model.dart';
import '../models/productdetails_model.dart';
import '../models/registercart_item_model.dart';
import '../models/serviceslist_model.dart';
import '../models/signupLoad_model.dart';
import '../service_call/api_data.dart';

class MainController extends GetxController {
  RxBool loading = false.obs;
  RxBool listOfMemberLoading = false.obs;
  RxBool genealogyLoading = false.obs;

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
  Rx<DashboardModel> dashboardData = DashboardModel(
          myIncome: [],
          myDownlineLRpt: [],
          myDownlineRRpt: [],
          msg: "",
          message: "",
          pdName: "",
          pdSponsorId: "",
          pdJoinDate: "",
          pdStatus: "",
          pdMobileNo: "",
          remdays: "",
          days: 0,
          currentDashbordDate: "",
          bdActivBuss: "",
          bdRetBuss: "",
          bdPreCustBuss: "",
          bdSalesBuss: "",
          bdActivBussM: "",
          bdRetBussM: "",
          bdPreCustBussM: "",
          bdSalesBussM: "",
          commissonEMny: "",
          prepaidEMny: "",
          stockLicEMny: "",
          prepaidECard: "",
          redmptionEMny: "",
          newLeftCv: "",
          newRightCv: "",
          leftCarryFwd: "",
          rightCarryFwd: "",
          netSteps: "",
          cashBack: "",
          creRebate: "",
          dpPts: "",
          redmMsg: "",
          flushMsg: "",
          pkageName: "",
          rankname: "",
          symbol: "",
          incRemarks: "",
          icons: "",
          mbdBonus: "",
          mainForCurMnt: "",
          mainForNxtMnt: "",
          rentMntsMaintain: "",
          licenseType: "",
          commisions: "",
          licenseCode: "",
          licenseName: "",
          country: "",
          state: "",
          showRes: "",
          remainingDays: "",
          pkmall: "",
          catRemainingDays: "",
          reqcv: "",
          upgcat: "",
          upgsteps: "",
          upgpack: "",
          catUpg: false,
          catSteps: false)
      .obs;

  Rx<ViewProfileModel> viewProfileData = ViewProfileModel(
          msg: "",
          message: "",
          fullName: "",
          fathSpousName: "",
          dob: "",
          gender: "",
          joinType: "",
          ssnein: "",
          passport: "",
          add1: "",
          add2: "",
          city: "",
          state: "",
          zipCode: "",
          countryName: "",
          dialCode: "",
          landLine: "",
          email: "",
          mobile: "",
          bankid: "",
          bankName: "",
          bankBranch: "",
          acNo: "",
          ifscCode: "",
          bankSwiftCode: "",
          acHolderName: "",
          typeOfAc: "",
          nomieeName: "",
          nomieeRelation: "",
          eText: "",
          deduction: "")
      .obs;
  RxList<ListOfReqModel> listofReqs = <ListOfReqModel>[].obs;
  RxList<BankIdModel> bankIdData = <BankIdModel>[].obs;
  Rx<ListOfReqProfileApproveModel> approvedProfileData =
      ListOfReqProfileApproveModel(
              msg: "",
              message: "",
              sno: "",
              idno: "",
              regid: "",
              fname: "",
              fathername: "",
              dob: "",
              sex: "",
              passport: "",
              ssn: "",
              add1: "",
              add2: "",
              city: "",
              pin: "",
              email: "",
              mobile: "",
              stdcode: "",
              landline: "",
              bank: "",
              branch: "",
              accno: "",
              ifsccode: "",
              swiftcode: "",
              benname: "",
              benrelation: "",
              nominee: "",
              nomrel: "",
              oadd1: "",
              oadd2: "",
              ocity: "",
              opin: " ",
              omobile: " ",
              oemail: "",
              odcode: "",
              oline: " ",
              obenname: "",
              obank: "",
              oaccno: "",
              obranch: "",
              oifscode: "",
              oswiftcode: "",
              obrel: "",
              onominee: "",
              onomrel: "",
              odob: "",
              osex: "",
              ofname: "",
              opasport: "",
              ossn: "",
              oname: "")
          .obs;
  Rx<AwardReportModel> awardReportData = AwardReportModel(
          countRpt: [],
          msg: "",
          message: "",
          offername: "",
          sdate: "",
          edate: "",
          descr: "",
          bonusRequirement: false,
          requirement1: false,
          requirement2: false,
          requirement3: false,
          requirement4: false,
          requirement5: false,
          requirement6: false,
          req1Psales1: "",
          req1Pcv1: "",
          req1Lsalecnt1: "",
          req1Rsalecnt1: "",
          req1Lsalecv1: "",
          req1Rsalecv1: "",
          req1Ldirspr1: "",
          req1Rdirspr1: "",
          req1Steps1: "",
          req1Achpsale1: "",
          req1Achpcv1: "",
          req1Lachsalecnt1: "",
          req1Rachsalecnt1: "",
          req1Lachsalecv1: "",
          req1Rachsalecv1: "",
          req1Lachdirspr1: "",
          req1Rachdirspr1: "",
          req1AchSteps1: "",
          req1Balpsales1: "",
          req1Balpcv1: "",
          req1Sts: "",
          req1Lbalsalecnt1: "",
          req1Rbalsalecnt1: "",
          req1Lbalsalecv1: "",
          req1Rbalsalecv1: "",
          req1Lbaldirspr1: "",
          req1Rbaldirspr1: "",
          req1BalSteps1: "",
          req1Stps: 0,
          req1Achstps: 0,
          req2Psales2: "",
          req2Pcv2: "",
          req2Lsalecnt2: "",
          req2Rsalecnt2: "",
          req2Lsalecv2: "",
          req2Rsalecv2: "",
          req2Ldirspr2: "",
          req2Rdirspr2: "",
          req2Steps2: "",
          req2Achpsale2: "",
          req2Achpcv2: "",
          req2Lachsalecnt2: "",
          req2Rachsalecnt2: "",
          req2Lachsalecv2: "",
          req2Rachsalecv2: "",
          req2Lachdirspr2: "",
          req2Rachdirspr2: "",
          req2AchSteps2: "",
          req2Balpsales2: "",
          req2Balpcv2: "",
          req2Sts: "",
          req3Lsalecnt3: "",
          req3Rsalecnt3: "",
          req3Lsalecv3: "",
          req3Rsalecv3: "",
          req3Ldirspr3: "",
          req3Rdirspr3: "",
          req3Steps3: "",
          req3Achpsale3: "",
          req3Achpcv3: "",
          req3Lachsalecnt3: "",
          req3Rachsalecnt3: "",
          req3Lachsalecv3: "",
          req3Rachsalecv3: "",
          req3Lachdirspr3: "",
          req3Rachdirspr3: "",
          req3AchSteps3: "",
          req3Balpsales3: "",
          req3Balpcv3: "",
          req3Sts: "",
          req4Steps4: "",
          req4Achpsale4: "",
          req4Achpcv4: "",
          req4Lachsalecnt4: "",
          req4Rachsalecnt4: "",
          req4Lachsalecv4: "",
          req4Rachsalecv4: "",
          req4Lachdirspr4: "",
          req4Rachdirspr4: "",
          req4AchSteps4: "",
          req4Balpsales4: "",
          req4Balpcv4: "",
          req4Sts: "",
          req5Lsalecnt5: "",
          req5Rsalecnt5: "",
          req5Lsalecv5: "",
          req5Rsalecv5: "",
          req5Ldirspr5: "",
          req5Rdirspr5: "",
          req5Steps5: "",
          req5Achpsale5: "",
          req5Achpcv5: "",
          req5Lachsalecnt5: "",
          req5Rachsalecnt5: "",
          req5Lachsalecv5: "",
          req5Rachsalecv5: "",
          req5Lachdirspr5: "",
          req5Rachdirspr5: "",
          req5AchSteps5: "",
          req5Balpsales5: "",
          req5Balpcv5: "",
          req5Sts: "",
          req6Achstps: 0,
          req6OachGrpcv6: "",
          req6OGrpcv6: "",
          req6ObalGrpcv6: "",
          req6IachDirRnk6: "",
          req6IDirRnk6: "",
          req6IbalDirRnk6: "",
          status: "",
          req4Lbalsalecnt4: "",
          req4Rbalsalecnt4: "",
          req4Lbalsalecv4: "",
          req4Rbalsalecv4: "",
          req4Lbaldirspr4: "",
          req4Rbaldirspr4: "",
          req4BalSteps4: "",
          req4Stps: 0,
          req4Achstps: 0,
          req4OachGrpcv4: "",
          req4OGrpcv4: "",
          req4ObalGrpcv4: "",
          req5Psales5: "",
          req5Pcv5: "",
          req2Lbalsalecnt2: "",
          req2Rbalsalecnt2: "",
          req2Lbalsalecv2: "",
          req2Rbalsalecv2: "",
          req2Lbaldirspr2: "",
          req2Rbaldirspr2: "",
          req2BalSteps2: "",
          req2Lachdircv2: "",
          req2Rachdircv2: "",
          req2Ldircv2: "",
          req2Rdircv2: "",
          req2Lbaldircv2: "",
          req2Rbaldircv2: "",
          req3Odircv3: "",
          req3Psales3: "",
          req3Pcv3: "",
          req3Lbalsalecnt3: "",
          req3Rbalsalecnt3: "",
          req3Lbalsalecv3: "",
          req3Rbalsalecv3: "",
          req3Lbaldirspr3: "",
          req3Rbaldirspr3: "",
          req3BalSteps3: "",
          req3Obaldircv3: "",
          req3Oachdircv3: "",
          req4Psales4: "",
          req4Pcv4: "",
          req4Lsalecnt4: "",
          req4Rsalecnt4: "",
          req4Lsalecv4: "",
          req4Rsalecv4: "",
          req4Ldirspr4: "",
          req4Rdirspr4: "",
          req5Lbalsalecnt5: "",
          req5Rbalsalecnt5: "",
          req5Lbalsalecv5: "",
          req5Rbalsalecv5: "",
          req5Lbaldirspr5: "",
          req5Rbaldirspr5: "",
          req5BalSteps5: "",
          req5OachGrpcv5: "",
          req5OGrpcv5: "",
          req5ObalGrpcv5: "",
          req5AchDirRnk5: "",
          req5DirRnk5: "",
          req5BalDirRnk5: "",
          req6Psales6: "",
          req6Pcv6: "",
          req6Lsalecnt6: "",
          req6Rsalecnt6: "",
          req6Lsalecv6: "",
          req6Rsalecv6: "",
          req6Ldirspr6: "",
          req6Rdirspr6: "",
          req6Steps6: "",
          req6Achpsale6: "",
          req6Achpcv6: "",
          req6Lachsalecnt6: "",
          req6Rachsalecnt6: "",
          req6Lachsalecv6: "",
          req6Rachsalecv6: "",
          req6Lachdirspr6: "",
          req6Rachdirspr6: "",
          req6AchSteps6: "",
          req6Balpsales6: "",
          req6Balpcv6: "",
          req6Sts: "",
          req6Lbalsalecnt6: "",
          req6Rbalsalecnt6: "",
          req6Lbalsalecv6: "",
          req6Rbalsalecv6: "",
          req6Lbaldirspr6: "",
          req6Rbaldirspr6: "",
          req6BalSteps6: "",
          req2Stps: 0,
          req2Achstps: 0,
          req3Stps: 0,
          req3Achstps: 0,
          req5Stps: 0,
          req5Achstps: 0,
          req6Stps: 0)
      .obs;

  RxList<ServicesListModel> servicesListData = <ServicesListModel>[].obs;
  RxList<GeneologyViewModel> myGenelogoyListData = <GeneologyViewModel>[].obs;
  Rx<GeneologyPopupModel> geneologyPopupData = GeneologyPopupModel(
          msg: "",
          message: "",
          distributorId: "",
          fullName: "",
          joinDate: "",
          sponsorId: "",
          packageNAme: "",
          personalCv: "",
          rankstatus: "",
          leftCv: "",
          rightCv: "",
          totalCv: "",
          totalCount: "",
          directs: "",
          leftCount: "",
          rightCount: "",
          cfLeftCv: "",
          cfRightCv: "")
      .obs;
  Rx<GroupSalesModel> groupSalesData = GroupSalesModel(
          msg: "",
          message: "",
          gcvUserId: "",
          gcvUserNAme: "",
          gcvFromDate: "",
          gcvtoDate: "",
          bussCvTotPrsCv: "",
          bussCvNetLftGrpCv: "",
          bussCvNetRghtGrpCv: "",
          bussCvTotGrpCv: "",
          bussAmtTotPrsAmt: "",
          bussAmtNetLftGrpAmt: "",
          bussAmtNetRgtGrpAmt: "",
          bussTotGrpAmt: "")
      .obs;
  Rx<GroupSalesCvModel> groupsalesCvData =
      GroupSalesCvModel(groupSalSummaryRpt: [], msg: "", message: "").obs;
  RxList<MyTeamViewModel> myteamviewList = <MyTeamViewModel>[].obs;
  RxList<OrderMallTypeModel> mallData = <OrderMallTypeModel>[].obs;
  RxList<OrderReportModel> orderReportData = <OrderReportModel>[].obs;
  RxList<ShippingOrderModel> shippingOrderData = <ShippingOrderModel>[].obs;
  RxList<OrderAcknowledgeModel> orderAcknowledgeData =
      <OrderAcknowledgeModel>[].obs;
  Rx<CheckUpdationModel> updationData =
      CheckUpdationModel(chechUpdrpt: [], msg: "", message: "").obs;

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
        Constants.prefs.setString("country_name", res['Country']);
        Constants.prefs.setString("country_id", res['CountryID']);
        Constants.prefs.setString("city", res['City']);
        Constants.prefs.setString("user_name", res['Name']);
      }
      print("bbbb....${bannerPopUp.length}");
    }
    loading.value = false;
    return res;
  }

  getLogout(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().logout, params: parameters);
    loading.value = false;

    return res;
  }

  getDashboard(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().dashboard, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        dashboardData.value = DashboardModel.fromJson(res);
      }
    }
    loading.value = false;
  }

  getViewProfile(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().viewProfile, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        viewProfileData.value = ViewProfileModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getUpdateProfile(Map parameters) async {
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().updateProfile, params: parameters);
    return res;
  }

  getBankInfo(Map parameters) async {
    bankIdData.clear();
    dynamic res = await ApiCall()
        .listPostMethodFun(methodName: ApiData().bankName, params: parameters);

    for (int i = 0; i < res.length; i++) {
      bankIdData.add(BankIdModel.fromJson(res[i]));
    }
    return res;
  }

  getUploadPhoto(File imageFile) async {
    loading.value = true;

    dynamic res = await ApiCall().uploadImage(
      imageFile: imageFile,
      endUrl: ApiData().uploadPhoto,
    );
    print("ressss....$res");
    loading.value = false;

    return res;
  }

  getChangePassword(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().changePassword, params: parameters);
    loading.value = false;
    return res;
  }

  getChangeTransPassword(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().changeTransPassword, params: parameters);
    loading.value = false;
    return res;
  }

  getListOfReq(Map parameters) async {
    loading.value = true;
    listofReqs.clear();

    List res = await ApiCall().listPostMethodFun(
        methodName: ApiData().listOfRequest, params: parameters);
    for (int i = 0; i < res.length; i++) {
      listofReqs.add(ListOfReqModel.fromJson(res[i]));
    }

    loading.value = false;
    return res;
  }

  getListOfMemberProfile(Map parameters) async {
    listOfMemberLoading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().listOfReqMemberProfile, params: parameters);
    if (res['Msg'] == "SUCCESS") {
      approvedProfileData.value = ListOfReqProfileApproveModel.fromJson(res);
    }
    listOfMemberLoading.value = false;
    return res;
  }

  getForgotTranPass(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().forgotTransPass, params: parameters);
    loading.value = false;
    return res;
  }

  getAwardDropDownData(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().awardQuailfiers, params: parameters);
    loading.value = false;
    return res;
  }

  getAwardData(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().awardReport, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        awardReportData.value = AwardReportModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getSalesTools(Map parameters) async {
    loading.value = true;
    servicesListData.clear();
    dynamic res = await ApiCall()
        .listPostMethodFun(methodName: ApiData().services, params: parameters);
    for (int i = 0; i < res.length; i++) {
      servicesListData.add(ServicesListModel.fromJson(res[i]));
    }
    loading.value = false;
    return res;
  }

  getGenealogyData(Map parameters) async {
    loading.value = true;
    myGenelogoyListData.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().myGenealogy, params: parameters);
    for (int i = 0; i < res.length; i++) {
      myGenelogoyListData.add(GeneologyViewModel.fromJson(res[i]));
    }
    loading.value = false;
    return res;
  }

  getGenealogyPopupData(Map parameters) async {
    genealogyLoading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().genealogyPopup, params: parameters);
    if (res != null && res['Msg'] == "SUCCESS") {
      geneologyPopupData.value = GeneologyPopupModel.fromJson(res);
    }
    genealogyLoading.value = false;
    return res;
  }

  getTeamBuilderView(Map parameters) async {
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().teamBuliderView, params: parameters);

    return res;
  }

  getTeamBuilderViewTeam(Map parameters) async {
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().teamBuliderViewTeam, params: parameters);

    return res;
  }

  getMyTeamView(Map parameters, String from) async {
    loading.value = true;
    myteamviewList.clear();
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().myTeamView, params: parameters);
    if (res != null) {
      if (from == "left") {
        for (int i = 0; i < res['MyLVrpt'].length; i++) {
          myteamviewList.add(MyTeamViewModel.fromJson(res['MyLVrpt'][i]));
        }
      } else {
        for (int i = 0; i < res['MyRVrpt'].length; i++) {
          myteamviewList.add(MyTeamViewModel.fromJson(res['MyRVrpt'][i]));
        }
      }
    }
    loading.value = false;

    return res;
  }

  getMyListViewLevels(Map parameters) async {
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().myListViewGetLevel, params: parameters);
    return res;
  }

  getMyListViewReport(Map parameters) async {
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().myListViewGetReport, params: parameters);
    return res;
  }

  getGroupSales(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().groupSales, params: parameters);
    if (res != null && res['Msg'] == "SUCCESS") {
      groupSalesData.value = GroupSalesModel.fromJson(res);
    }
    loading.value = false;
    return res;
  }

  getGroupSalesCvList(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().groupSalesSummaryReport, params: parameters);
    if (res != null && res['Msg'] == "SUCCESS") {
      groupsalesCvData.value = GroupSalesCvModel.fromJson(res);
    }
    loading.value = false;
    return res;
  }

  getOrdersMall(Map parameters) async {
    loading.value = true;
    mallData.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().getOrdersMall, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          mallData.add(OrderMallTypeModel.fromJson(res[i]));
        }
      }
    }
    loading.value = false;
    return res;
  }

  getOrderReport(Map parameters) async {
    loading.value = true;
    orderReportData.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().orderReport, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          orderReportData.add(OrderReportModel.fromJson(res[i]));
        }
      }
    }
    loading.value = false;
    return res;
  }

  getOrderShipping(Map parameters) async {
    shippingOrderData.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().shippingHistory, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          shippingOrderData.add(ShippingOrderModel.fromJson(res[i]));
        }
      }
    }
    print("shippingOrderData...${shippingOrderData.length}");
    return res;
  }

  getOrderAcknowledgeReport(Map parameters) async {
    loading.value = true;
    orderAcknowledgeData.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().orderAcknowledgeRpt, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          orderAcknowledgeData.add(OrderAcknowledgeModel.fromJson(res[i]));
        }
      }
    }
    loading.value = false;
    return res;
  }

  getOrderAcknowledgeDetails(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().checkUpdation, params: parameters);
    updationData.value = CheckUpdationModel.fromJson(res);
    loading.value = false;
    return res;
  }

  getOrderAcknowledgeUpdation(Map parameters) async {
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().updAcknowledge, params: parameters);
    return res;
  }
}
