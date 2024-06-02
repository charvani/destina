import 'dart:async';

import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/inside_screens/profile/listofreq_approvedprofile_model.dart';
import 'package:destina_1_international/models/activationbonus_model.dart';
import 'package:destina_1_international/models/businessbonus_model.dart';
import 'package:destina_1_international/models/cartitem_model.dart';
import 'package:destina_1_international/models/checkcountry_model.dart';
import 'package:destina_1_international/models/customerbonus_model.dart';
import 'package:destina_1_international/models/dashboard_model.dart';
import 'package:destina_1_international/models/ecard_model.dart';
import 'package:destina_1_international/models/faq_model.dart';
import 'package:destina_1_international/models/genelogyview_model.dart';
import 'package:destina_1_international/models/groupsales_model.dart';
import 'package:destina_1_international/models/listofreq_model.dart';
import 'package:destina_1_international/models/loadcountry_model.dart';
import 'package:destina_1_international/models/order_acknowledgemodel.dart';
import 'package:destina_1_international/models/order_reportmodel.dart';
import 'package:destina_1_international/models/packagedetails_model.dart';
import 'package:destina_1_international/models/packreview_model.dart';
import 'package:destina_1_international/models/personalbonus_model.dart';
import 'package:destina_1_international/models/retailbonus_model.dart';
import 'package:destina_1_international/models/selpackage_model.dart';
import 'package:destina_1_international/models/shipping_ordermodel.dart';
import 'package:destina_1_international/models/special_leadershipmodel.dart';
import 'package:destina_1_international/models/testimonial_model.dart';
import 'package:destina_1_international/models/view_profile_model.dart';
import 'package:destina_1_international/models/withdraw_statusmodel.dart';
import 'package:destina_1_international/models/withdrawal_infomodel.dart';
import 'package:destina_1_international/service_call/api_call.dart';
import 'package:get/get.dart';

import '../commons/constants.dart';
import '../inside_screens/tools/ftaafterreg_screen.dart';
import '../models/awardreport_model.dart';
import '../models/bank_model.dart';
import '../models/checkupdation_model.dart';
import '../models/d1cashbackpoints_model.dart';
import '../models/dpproduct_model.dart';
import '../models/ecard_reqreport_model.dart';
import '../models/enrolldata_model.dart';
import '../models/ftaregistration_model.dart';
import '../models/ftareport_modle.dart';
import '../models/geneology_popupmodel.dart';
import '../models/groupsales_cvmodel.dart';
import '../models/maintanenceCV_model.dart';
import '../models/maintenancelist_model.dart';
import '../models/member_productdetail_model.dart';
import '../models/myteam_viewmodel.dart';
import '../models/news_model.dart';
import '../models/newsdetails_model.dart';
import '../models/ordermall_model.dart';
import '../models/packageitems_model.dart';
import '../models/packcart_model.dart';
import '../models/product_categoryitem_model.dart';
import '../models/productdetails_model.dart';
import '../models/promo_cartitem_model.dart';
import '../models/registercart_item_model.dart';
import '../models/reviewdata_model.dart';
import '../models/rollupbonus_model.dart';
import '../models/salesmall_cartitem_model.dart';
import '../models/salesmall_model.dart';
import '../models/salesproductDet_model.dart';
import '../models/serviceslist_model.dart';
import '../models/signupLoad_model.dart';
import '../models/teambuilder_model.dart';
import '../models/trendingSM_model.dart';
import '../models/upgradeList_model.dart';
import '../models/upgrade_cartItem_model.dart';
import '../models/upgrade_promotion_model.dart';
import '../service_call/api_data.dart';

class MainController extends GetxController {
  RxBool loading = false.obs;
  RxBool socialMedialoading = false.obs;
  RxBool listOfMemberLoading = false.obs;
  RxBool genealogyLoading = false.obs;
  Rx<dynamic> imeiNum = "".obs;
  Rx<dynamic> mobileInfo = "".obs;
  Rx<dynamic> memberMallCartCount = "0".obs;

  RxBool cartLoading = false.obs;

  List<SelPackageModel> selPackageItemList = <SelPackageModel>[].obs;
  List<SelPackageModel> relPackageItemList = <SelPackageModel>[].obs;
  List<String> notificationData = <String>[].obs;
  List<TestimonialModel> testimonialData = <TestimonialModel>[].obs;
  List<NewsModel> newsData = <NewsModel>[].obs;
  RxList<PackCartModel> packCartList = <PackCartModel>[].obs;
  Rx<double> cvVal = 0.0.obs;
  Rx<double> priceVal = 0.0.obs;
  RxList<ProductCategoryItem> productItemList = <ProductCategoryItem>[].obs;
  RxList<ProductCategoryItem> searchProductItemList =
      <ProductCategoryItem>[].obs;
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
          img3: "",
          rp: "")
      .obs;
  Rx<PackageItemsModel> packPackageDetails = PackageItemsModel(
    getPkgItemsRpt: [],
    msg: "",
    message: "",
    lblMsg: "",
    head: "",
    maxQty: "",
  ).obs;
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
  RxDouble totalCV = 0.0.obs;
  RxInt totalItems = 0.obs;
  RxList<String> bannerPopUp = <String>[].obs;
  Rx<DashboardModel> dashboardData = DashboardModel(
          pkCode: "",
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
          catSteps: false,
          pkgUpgrade: "",
          nupgdate: "",
          endDate: "")
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
  RxList<MyTeamViewModel> idteamviewList = <MyTeamViewModel>[].obs;
  RxList<OrderMallTypeModel> mallData = <OrderMallTypeModel>[].obs;
  RxList<OrderReportModel> orderReportData = <OrderReportModel>[].obs;
  RxList<ShippingOrderModel> shippingOrderData = <ShippingOrderModel>[].obs;
  RxList<OrderAcknowledgeModel> orderAcknowledgeData =
      <OrderAcknowledgeModel>[].obs;
  Rx<CheckUpdationModel> updationData =
      CheckUpdationModel(chechUpdrpt: [], msg: "", message: "").obs;
  Rx<EcardModel> ecardData = EcardModel(
          emoneyrpt: [],
          msg: "",
          message: "",
          ecard: "",
          ePin: "",
          totalCredit: "",
          totalDebit: "",
          balenceAmount: "",
          symbol: "",
          ecardButton: false,
          withDrawButton: false)
      .obs;

  Rx<WithdrawalnfoModel> withdrawalInfoData = WithdrawalnfoModel(
          msg: "",
          message: "",
          userId: "",
          name: "",
          city: "",
          balance: "",
          withdrawalAmount: "",
          minWithdrawalAmount: "",
          tChrgsType: "",
          scChrgsType: "",
          symbol: "",
          schead: "",
          tchead: "",
          scChrgs: "",
          tChrgs: "",
          dollarValue: "",
          ecardButton: false,
          withdrawalButton: false)
      .obs;
  Rx<WithdraStatusModel> withdrawStatusData = WithdraStatusModel(
          tpCheckWithdrawrpt: [], msg: "", message: "", ecardButton: false)
      .obs;
  RxList<EcardReqReportModel> ecardReqReportList = <EcardReqReportModel>[].obs;
  Rx<D1CashBackPointsModel> d1cashbackpointsData = D1CashBackPointsModel(
          d1CreditRSummaryRpt: [],
          msg: "",
          message: "",
          totalD1Credit: "",
          totalD1Debit: "",
          d1BalenceAmount: "",
          ecardButton: false,
          withDrawButton: false)
      .obs;
  RxList<UpgradeListModel> upgradeList = <UpgradeListModel>[].obs;
  RxList<MaintenanceListModel> maintenanceList = <MaintenanceListModel>[].obs;
  RxList<MaintanenceCvModel> maintenanceCVData = <MaintanenceCvModel>[].obs;

  RxList<RetailBonusModel> retailBonusList = <RetailBonusModel>[].obs;
  RxDouble retailTotal = 0.0.obs;
  RxList<CustomerBonusModel> customerBonusList = <CustomerBonusModel>[].obs;
  RxDouble customerBonusTotal = 0.0.obs;
  RxList<RollupBonusModel> rollupBonusList = <RollupBonusModel>[].obs;
  RxDouble rollupBonusTotal = 0.0.obs;
  RxList<BusinessBonusModel> businessBonusList = <BusinessBonusModel>[].obs;
  RxDouble businessBonusTotal = 0.0.obs;
  RxList<TeamBuilderBonusModel> teamBuilderBonusList =
      <TeamBuilderBonusModel>[].obs;
  RxDouble teamBuilderBonusTotal = 0.0.obs;
  RxList<SpecialLeadershipBonusModel> specialLeaderBonusList =
      <SpecialLeadershipBonusModel>[].obs;
  RxDouble specialLeaderBonusTotal = 0.0.obs;
  RxList<PersonalBonusModel> pesonalBonusList = <PersonalBonusModel>[].obs;
  RxDouble pesonalBonusTotal = 0.0.obs;
  RxList<ActivationBonusModel> activationBonusList =
      <ActivationBonusModel>[].obs;
  RxDouble activationBonusTotal = 0.0.obs;
  RxList<FaqModel> bonusfaqList = <FaqModel>[].obs;
  RxList<FaqModel> d1pendantfaqList = <FaqModel>[].obs;
  RxList<FaqModel> waterfaqList = <FaqModel>[].obs;
  RxList<PackageReviewModel> packReviewList = <PackageReviewModel>[].obs;
  RxList<FtaReportModel> ftaReportList = <FtaReportModel>[].obs;

  Rx<FtaRegistrationModel> ftaRegData = FtaRegistrationModel(
          result: "",
          ftaName: "",
          ftaProofNo: "",
          ftaContact: 0,
          ftaEmail: "",
          invName: "",
          invProofNo: "",
          invContact: 0,
          invEmail: "",
          fdated: "",
          logName: "",
          ldated: "",
          add1: "",
          add2: "",
          city: "",
          stateName: "",
          name: "",
          email: "",
          faxno: "",
          companyName: "",
          mobile: "",
          website: "",
          vatno: "")
      .obs;
  RxList<SalesOrderModel> salesOrdersList = <SalesOrderModel>[].obs;
  Rx<SalesProductModel> saleProductDetails = SalesProductModel(
          overviewRpt: [],
          reviewRpt: [],
          endorsements: [],
          categoryRpt: [],
          productRpt: [],
          msg: "",
          message: "",
          pkid: 0,
          pkcode: "",
          pkname: "",
          mrp: "",
          pimage: "",
          codeNo: "",
          cv: "",
          img: "",
          img1: "",
          img2: "",
          img3: '',
          url: "",
          pdfPath: "")
      .obs;
  RxList<SalesMallCartItemModel> salesMallCartItems =
      <SalesMallCartItemModel>[].obs;
  RxDouble salesMallTAmount = 0.0.obs;
  RxDouble salesMallTCV = 0.0.obs;

  Rx<DpProdccutModel> dpProductdata = DpProdccutModel(
          msg: "",
          message: "",
          pkid: 0,
          pkcode: "",
          pkname: "",
          mrp: "",
          dpPrice: "",
          pimage: "",
          codeNo: "",
          cv: "",
          img: "",
          img1: "",
          img2: "",
          img3: "",
          url: "",
          pdfPath: "")
      .obs;
  RxDouble dpMallDPAmount = 0.0.obs;
  RxDouble dpMallRMAmount = 0.0.obs;
  RxDouble dpMallCV = 0.0.obs;

  Rx<MemberProductModel> memberProductData = MemberProductModel(
          overviewRpt: [],
          reviewRpt: [],
          endorsements: [],
          categoryRpt: [],
          productRpt: [],
          distSelPackageRpt: [],
          msg: "",
          message: "",
          pkid: 0,
          pkcode: "",
          pkname: "",
          mrp: "",
          pimage: "",
          codeNo: "",
          cv: "",
          category: "",
          img: "",
          img1: "",
          img2: "",
          img3: "",
          url: "",
          pdfPath: "",
          overview: "",
          descrip: "",
          info: "",
          howtoUse: "",
          videoUrl: "",
          dpPrice: "")
      .obs;

  Rx<UpgradeCartItemModel> upgradeCartData = UpgradeCartItemModel(
          msg: "",
          message: "",
          pkid: "",
          pkcode: "",
          pkname: "",
          mrp: "",
          pImage: "",
          adMsg: "",
          promorpt: false)
      .obs;

  Rx<PromoCartItemModel> promoCartItemData = PromoCartItemModel(
          pid: "",
          pkcode: "",
          name: "",
          qty: "",
          shipPrice: "",
          rpShipPrice: "",
          rp: "",
          dp: "",
          cv: "",
          totMrp: "",
          discAmt: "",
          emoney: "",
          totRp: "")
      .obs;
  Rx<UpgradePromotionModel> upgradePromoCartItemData = UpgradePromotionModel(
          pid: "",
          pcode: "",
          name: "",
          qty: "",
          shipPrice: "",
          mrp: "",
          cv: "",
          totMrp: "")
      .obs;
  Rx<ReviewData> reviewData = ReviewData(
          reviewReport1: [],
          reviewReport2: [],
          reviewReport3: [],
          reviewReport4: [],
          msg: "",
          message: "",
          avgRating: "",
          totalRating: "")
      .obs;
  Rx<NewsDetailsModel> singleNewsDetails = NewsDetailsModel(
          newsRpt: [], newsImagesRpt: [], msg: "", message: "", found: false)
      .obs;
  RxList<TrendingOnSocialMModel> socialMediaData =
      <TrendingOnSocialMModel>[].obs;
  RxList<TrendingOnSocialMModel> promotionsData =
      <TrendingOnSocialMModel>[].obs;
// *********************** *********************************************************************
  getCountryCode() async {
    dynamic res = await ApiCall().getMethodFun(url: ApiData().countryUrl);
    return res;
  }

  getVersionCheck(Map params) async {
    dynamic res = await ApiCall()
        .listPostMethodFun(methodName: "VersionChk", params: params);
    return res;
  }

  getProducts(String productType, dynamic key) async {
    loading.value = true;
    Map parameters = {
      "action": productType,
      "pcode": key ?? "0",

      // "action": "MAGetKproducts",
      // "pcode": "Jewellery sets",
      "country": Constants.prefs.getString("open_country")
    };
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().productCategoryMethod, params: parameters);
    productItemList.clear();
    if (res != null) {
      if (res['productRpt'].length > 0) {
        for (int i = 0; i < res['productRpt'].length; i++) {
          productItemList
              .add(ProductCategoryItem.fromJson(res['productRpt'][i]));
        }
      }
    }

    print(productItemList.length);
    loading.value = false;
    return res;
  }

  getKritaliaProducts(String selectedType) async {
    loading.value = true;
    Map parameters = {
      "action": "MAGetKproducts",
      "pcode": selectedType.toString().capitalizeFirst,
      "country": Constants.prefs.getString("open_country")
    };
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().productCategoryMethod, params: parameters);
    productItemList.clear();
    if (res != null) {
      if (res['productRpt'].length > 0) {
        for (int i = 0; i < res['productRpt'].length; i++) {
          productItemList
              .add(ProductCategoryItem.fromJson(res['productRpt'][i]));
        }
      }
    }

    print(productItemList.length);
    loading.value = false;
    return res;
  }

  getSearchProducts(String productType, dynamic key) async {
    genealogyLoading.value = true;
    Map parameters = {
      "action": productType,
      "pcode": key ?? "0",
      "country": Constants.prefs.getString("open_country")
    };
    searchProductItemList.clear();
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().productCategoryMethod, params: parameters);
    searchProductItemList.clear();

    if (res['productRpt'].length > 0) {
      for (int i = 0; i < res['productRpt'].length; i++) {
        searchProductItemList
            .add(ProductCategoryItem.fromJson(res['productRpt'][i]));
      }
    }
    print("searchProductItemList.length.....${searchProductItemList.length}");
    genealogyLoading.value = false;
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

  getRegPackAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().nSGAddToCartItems, params: parameters);
    return res;
  }

  getAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().addtoCartMethod, params: parameters);
    return res;
  }

  getCartItems(Map parameters, String from) async {
    if (from == "init") {
      loading.value = true;
    }
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().cartItemsMethod, params: parameters);
    cartItemsList.clear();
    totalAmount.value = 0.0;
    totalCV.value = 0.0;
    totalItems.value = 0;

    print("cart_itmes...${cartItemsList.length}");
    if (res['packageDataRpt'].length > 0) {
      for (int i = 0; i < res['packageDataRpt'].length; i++) {
        cartItemsList.add(CartItemModel.fromJson(res['packageDataRpt'][i]));
        totalAmount.value = totalAmount.value +
            (double.parse(res['packageDataRpt'][i]['packMrp']) *
                int.parse(res['packageDataRpt'][i]['packQuantity']));
        totalCV.value = totalCV.value +
            (double.parse(res['packageDataRpt'][i]['CV']) *
                int.parse(res['packageDataRpt'][i]['packQuantity']));
        totalItems.value = totalItems.value +
            int.parse(res['packageDataRpt'][i]['packQuantity']);
      }
    }
    print(cartItemsList.length);
    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getRemoveCartItem(Map parameters, cartParameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().removeCartItemMethod, params: parameters);
    getCartItems(cartParameters, "init");
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
    print("res...$res");
    packageDetailsData.value = PackageDetailsModel.fromJson(res);
    loading.value = false;
    return "res";
  }

  getPacktPackageItems(
      {required String productCode,
      required String uniqId,
      required String sessionId,
      required String dtype,
      required Map params}) async {
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
        methodName: ApiData()
            .
            // registerCart,

            packPackageItemsMethod,
        params: parameters);
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

  getForgotPass(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().forgotPwd, params: parameters);
    loading.value = false;

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
    totalCV.value = 0.0;
    print("cart_itmes...${registerCartItems.length}");
    if (res['SGCartItemRpt'].length > 0) {
      for (int i = 0; i < res['SGCartItemRpt'].length; i++) {
        registerCartItems
            .add(RegisterCartItemsModel.fromJson(res['SGCartItemRpt'][i]));
        totalAmount.value = totalAmount.value +
            (double.parse(res['SGCartItemRpt'][i]['mrp']) *
                int.parse(res['SGCartItemRpt'][i]['Qty']));
        totalCV.value = totalCV.value +
            (double.parse(res['SGCartItemRpt'][i]['CV']) *
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
        Constants.prefs.setString("country", res['CountryCode']);
        Constants.prefs.setString("country_name", res['Country']);
        Constants.prefs.setString("country_id", res['CountryID']);
        Constants.prefs.setString("reg_id", res['RegId']);
        Constants.prefs.setString("city", res['City']);
        Constants.prefs.setString("user_name", res['Name']);
        Constants.prefs.setString("user_type", res['PkType']);
        Constants.prefs.setString("profile_image", res['Memberphoto']);
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

    return res;
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

  getUploadPhoto(String image64) async {
    loading.value = true;

    dynamic res = await ApiCall().uploadImage(
      imageFile: image64,
      endUrl: ApiData().uploadPhoto,
    );
    print("ressss....$res");
    loading.value = false;

    return res;
  }

  getUploadFile(Map bodyData, String endUrl) async {
    loading.value = true;
    dynamic res = await ApiCall().uploadFile(
      bodyData: bodyData,
      endUrl: endUrl,
    );
    print("ressss....$res");
    loading.value = false;

    return res;
  }

  getKycReport(
    Map bodyData,
  ) async {
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().loadKYCReport, params: bodyData);
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

  getD1Voucher(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().discountVoucherReport, params: parameters);
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
    if (res != null) {
      if (res.length > 0 && res.toString() != "[]") {
        for (int i = 0; i < res.length; i++) {
          myGenelogoyListData.add(GeneologyViewModel.fromJson(res[i]));
        }
      }
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

  getIdTeamView(Map parameters, String from) async {
    loading.value = true;
    idteamviewList.clear();
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().myTeamView, params: parameters);
    if (res != null) {
      if (from == "left") {
        for (int i = 0; i < res['MyLVrpt'].length; i++) {
          idteamviewList.add(MyTeamViewModel.fromJson(res['MyLVrpt'][i]));
        }
      } else {
        for (int i = 0; i < res['MyRVrpt'].length; i++) {
          idteamviewList.add(MyTeamViewModel.fromJson(res['MyRVrpt'][i]));
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

  getEcard(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().tPCheckEcard, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        ecardData.value = EcardModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getEcardMoneyType(Map parameters) async {
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().emoneyType, params: parameters);
    print("res...$res");
    return res;
  }

  getEcardTransferMoney(Map parameters) async {
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().ecardTransfer, params: parameters);
    return res;
  }

  getCommission(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().tPCheckEcard, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        ecardData.value = EcardModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getWithdrawalInfo(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().withdrawalEMoney, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        withdrawalInfoData.value = WithdrawalnfoModel.fromJson(res);
      }
    }
    loading.value = false;

    return res;
  }

  getWithdrawalAmt(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().withdrawalEMoneySubmit, params: parameters);
    return res;
  }

  getWithdrawalStatus(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().tPCheckWithdraw, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        withdrawStatusData.value = WithdraStatusModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getEcardReqReports(Map parameters) async {
    loading.value = true;
    ecardReqReportList.clear();
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().ecardRequestReport, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        if (res.length > 0) {
          for (int i = 0; i < res['GetECardRpt'].length; i++) {
            ecardReqReportList
                .add(EcardReqReportModel.fromJson(res['GetECardRpt'][i]));
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getD1cashBack(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().d1CashBackSummary, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        d1cashbackpointsData.value = D1CashBackPointsModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getD1creditRebate(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().d1CreditRSummary, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        d1cashbackpointsData.value = D1CashBackPointsModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getDPSummary(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().dPSummary, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        d1cashbackpointsData.value = D1CashBackPointsModel.fromJson(res);
      }
    }
    loading.value = false;
    return res;
  }

  getUpgradeList(Map parameters) async {
    loading.value = true;
    upgradeList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().upgradeReport, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          upgradeList.add(UpgradeListModel.fromJson(res[i]));
        }
      }
    }
    loading.value = false;
    return res;
  }

  getMaintenance(Map parameters) async {
    loading.value = true;
    maintenanceList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().accMaintence, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          maintenanceList.add(MaintenanceListModel.fromJson(res[i]));
        }
      }
    }
    loading.value = false;
    return res;
  }

  getMaintenanceDetails(Map parameters) async {
    loading.value = true;
    maintenanceCVData.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().accMaintenceDetails, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          maintenanceCVData.add(MaintanenceCvModel.fromJson(res[i]));
        }
      }
      print("///...${maintenanceCVData.length}");
    }
    loading.value = false;
    return res;
  }

  getRetailBonus(Map parameters) async {
    loading.value = true;
    retailTotal.value = 0.0;
    retailBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().retailBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          retailBonusList.add(RetailBonusModel.fromJson(res[i]));
          if (retailBonusList[i].netAmt != "") {
            retailTotal.value =
                retailTotal.value + double.parse(retailBonusList[i].netAmt);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getCustomerBonus(Map parameters) async {
    loading.value = true;
    customerBonusTotal.value = 0.0;
    customerBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().custAcqBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          customerBonusList.add(CustomerBonusModel.fromJson(res[i]));
          if (customerBonusList[i].netBonus != "") {
            customerBonusTotal.value = customerBonusTotal.value +
                double.parse(customerBonusList[i].netBonus);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getRollupBonus(Map parameters) async {
    loading.value = true;
    rollupBonusTotal.value = 0.0;
    rollupBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().passUpBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          rollupBonusList.add(RollupBonusModel.fromJson(res[i]));
          if (rollupBonusList[i].netBonus != "") {
            rollupBonusTotal.value = rollupBonusTotal.value +
                double.parse(rollupBonusList[i].netBonus);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getUpgradeBonus(Map parameters) async {
    loading.value = true;
    customerBonusTotal.value = 0.0;
    customerBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().upgAcqBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          customerBonusList.add(CustomerBonusModel.fromJson(res[i]));
          if (customerBonusList[i].netBonus != "") {
            customerBonusTotal.value = customerBonusTotal.value +
                double.parse(customerBonusList[i].netBonus);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getBusinessBonus(Map parameters) async {
    loading.value = true;
    businessBonusTotal.value = 0.0;
    businessBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().bussDevBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          businessBonusList.add(BusinessBonusModel.fromJson(res[i]));
          if (businessBonusList[i].netBonus != "") {
            businessBonusTotal.value = businessBonusTotal.value +
                double.parse(businessBonusList[i].netBonus);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getTeamBuilderBonus(Map parameters) async {
    loading.value = true;
    teamBuilderBonusTotal.value = 0.0;
    teamBuilderBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().teamBuildBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          teamBuilderBonusList.add(TeamBuilderBonusModel.fromJson(res[i]));
          if (teamBuilderBonusList[i].netBonus != "") {
            teamBuilderBonusTotal.value = teamBuilderBonusTotal.value +
                double.parse(teamBuilderBonusList[i].netBonus);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getGlobalLBonus(Map parameters) async {
    loading.value = true;
    // teamBuilderBonusTotal.value = 0.0;
    // teamBuilderBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().globalLeadBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        // for (int i = 0; i < res.length; i++) {
        //   teamBuilderBonusList.add(TeamBuilderBonusModel.fromJson(res[i]));
        //   if (teamBuilderBonusList[i].netBonus != "") {
        //     teamBuilderBonusTotal.value = teamBuilderBonusTotal.value +
        //         double.parse(teamBuilderBonusList[i].netBonus);
        //   }
        // }
      }
    }
    loading.value = false;
    return res;
  }

  getSpecialBonus(Map parameters) async {
    loading.value = true;
    // teamBuilderBonusTotal.value = 0.0;
    // teamBuilderBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().specialBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        // for (int i = 0; i < res.length; i++) {
        //   teamBuilderBonusList.add(TeamBuilderBonusModel.fromJson(res[i]));
        //   if (teamBuilderBonusList[i].netBonus != "") {
        //     teamBuilderBonusTotal.value = teamBuilderBonusTotal.value +
        //         double.parse(teamBuilderBonusList[i].netBonus);
        //   }
        // }
      }
    }
    loading.value = false;
    return res;
  }

  getSpecialBonusSponsor(Map parameters) async {
    loading.value = true;
    // teamBuilderBonusTotal.value = 0.0;
    // teamBuilderBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().specialBonusSpr, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        // for (int i = 0; i < res.length; i++) {
        //   teamBuilderBonusList.add(TeamBuilderBonusModel.fromJson(res[i]));
        //   if (teamBuilderBonusList[i].netBonus != "") {
        //     teamBuilderBonusTotal.value = teamBuilderBonusTotal.value +
        //         double.parse(teamBuilderBonusList[i].netBonus);
        //   }
        // }
      }
    }
    loading.value = false;
    return res;
  }

  getSpecialLeadershipBonus(Map parameters) async {
    loading.value = true;
    specialLeaderBonusTotal.value = 0.0;
    specialLeaderBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().specialLeadrBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          specialLeaderBonusList
              .add(SpecialLeadershipBonusModel.fromJson(res[i]));
          if (specialLeaderBonusList[i].netBonus != "") {
            specialLeaderBonusTotal.value = specialLeaderBonusTotal.value +
                double.parse(specialLeaderBonusList[i].netBonus);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getPersonalBonus(Map parameters) async {
    loading.value = true;
    pesonalBonusTotal.value = 0.0;
    pesonalBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().personalSaleBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          pesonalBonusList.add(PersonalBonusModel.fromJson(res[i]));
          if (pesonalBonusList[i].netBonus != "") {
            pesonalBonusTotal.value = pesonalBonusTotal.value +
                double.parse(pesonalBonusList[i].netBonus);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getActivationBonus(Map parameters) async {
    loading.value = true;
    activationBonusTotal.value = 0.0;
    activationBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().activationBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          activationBonusList.add(ActivationBonusModel.fromJson(res[i]));
          if (activationBonusList[i].netProfit != "") {
            activationBonusTotal.value = activationBonusTotal.value +
                double.parse(activationBonusList[i].netProfit);
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getDistributorBonus(Map parameters) async {
    loading.value = true;
    // teamBuilderBonusTotal.value = 0.0;
    // teamBuilderBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().directDistSaleBonus, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        // for (int i = 0; i < res.length; i++) {
        //   teamBuilderBonusList.add(TeamBuilderBonusModel.fromJson(res[i]));
        //   if (teamBuilderBonusList[i].netBonus != "") {
        //     teamBuilderBonusTotal.value = teamBuilderBonusTotal.value +
        //         double.parse(teamBuilderBonusList[i].netBonus);
        //   }
        // }
      }
    }
    loading.value = false;
    return res;
  }

  getFlushCvBonus(Map parameters) async {
    loading.value = true;
    // teamBuilderBonusTotal.value = 0.0;
    // teamBuilderBonusList.clear();
    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().flushCVRpt, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        // for (int i = 0; i < res.length; i++) {
        //   teamBuilderBonusList.add(TeamBuilderBonusModel.fromJson(res[i]));
        //   if (teamBuilderBonusList[i].netBonus != "") {
        //     teamBuilderBonusTotal.value = teamBuilderBonusTotal.value +
        //         double.parse(teamBuilderBonusList[i].netBonus);
        //   }
        // }
      }
    }
    loading.value = false;
    return res;
  }

  getFaqs(Map parameters) async {
    loading.value = true;
    bonusfaqList.clear();
    d1pendantfaqList.clear();
    waterfaqList.clear();
    dynamic res = await ApiCall()
        .listPostMethodFun(methodName: ApiData().fAQs, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          if (res[i]['Title'] == "Bonus") {
            bonusfaqList.add(FaqModel.fromJson(res[i]));
          }
          if (res[i]['Title'] == "Uniwave Energy Pendant") {
            d1pendantfaqList.add(FaqModel.fromJson(res[i]));
          }
          if (res[i]['Title'] == "Uniwave Energized Alkaline Water") {
            waterfaqList.add(FaqModel.fromJson(res[i]));
          }
        }
      }
    }
    loading.value = false;
    return res;
  }

  getPackageReviews(Map parameters) async {
    loading.value = true;

    packReviewList.clear();
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().packageReview, params: parameters);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        for (int i = 0; i < res['PackageRevRpt'].length; i++) {
          packReviewList
              .add(PackageReviewModel.fromJson(res['PackageRevRpt'][i]));
        }
      }
    }
    loading.value = false;
    return res;
  }

  getPackageReviewUpload(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().writeReview, params: parameters);

    loading.value = false;
    return res;
  }

  getFTARegistration(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall().listPostMethodFun(
        methodName: ApiData().fTARegistration, params: parameters);
    print("getFTARegistration...res...$res");
    if (res != null) {
      if (res.length > 0) {
        ftaRegData.value = FtaRegistrationModel.fromJson(res[0]);
        Get.to(() => const FTAAfterRegScreen());
      } else {
        CommonToast("Record existed, take new registration");
      }
    }
    loading.value = false;
    return res;
  }

  getFTAReport(Map parameters) async {
    loading.value = true;

    ftaReportList.clear();
    dynamic res = await ApiCall()
        .listPostMethodFun(methodName: ApiData().fTARegRpt, params: parameters);
    if (res != null) {
      if (res.length > 0) {
        for (int i = 0; i < res.length; i++) {
          ftaReportList.add(FtaReportModel.fromJson(res[i]));
        }
      }
    }
    loading.value = false;
    return res;
  }

  getSalesMall(Map parameters) async {
    loading.value = true;
    salesOrdersList.clear();
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().loadSalesMall, params: parameters);
    if (res != null) {
      for (int i = 0; i < res['DistSelPackageRpt'].length; i++) {
        salesOrdersList
            .add(SalesOrderModel.fromJson(res['DistSelPackageRpt'][i]));
      }
    }
    loading.value = false;
    return res;
  }

  getSalesProductDetails(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getSalesSingleProduct, params: parameters);
    if (res != null) {
      saleProductDetails.value = SalesProductModel.fromJson(res);
    }
    loading.value = false;
    return res;
  }

  getSalesMallProductItems(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().packageItemsMethod, params: parameters);
    packageDetails.value = PackageItemsModel.fromJson(res);
    return res;
  }

  getSalesMallAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().pAddtoCartOpenSales, params: parameters);
    return res;
  }

  getSalesMCartItems(String from, Map parameters) async {
    print("in cont...$from");
    if (from == "init") {
      loading.value = true;
    }

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().checkOutSalesCartItems, params: parameters);
    salesMallCartItems.clear();
    salesMallTAmount.value = 0.0;
    salesMallTCV.value = 0.0;
    print("cart_itmes...${salesMallCartItems.length}");
    if (res != null) {
      if (res['SalesPackgeRpt'].length > 0 &&
          res['SalesPackgeRpt'].toString() != "[]") {
        for (int i = 0; i < res['SalesPackgeRpt'].length; i++) {
          salesMallCartItems
              .add(SalesMallCartItemModel.fromJson(res['SalesPackgeRpt'][i]));
          salesMallTAmount.value = salesMallTAmount.value +
              (double.parse(res['SalesPackgeRpt'][i]['mrp']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
          salesMallTCV.value = salesMallTCV.value +
              (double.parse(res['SalesPackgeRpt'][i]['CV']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
        }
      }
    } else {
      Timer(const Duration(seconds: 1), () {
        Get.back();
      });
    }

    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getMallCartItems(String from, Map parameters, String apiName) async {
    print("in cont...$from");
    if (from == "init") {
      loading.value = true;
    }

    dynamic res = await ApiCall()
        .saleMallPostMethodFun(methodName: apiName, params: parameters);
    salesMallCartItems.clear();
    salesMallTAmount.value = 0.0;
    salesMallTCV.value = 0.0;
    print("cart_itmes...${salesMallCartItems.length}");
    if (res != null) {
      if (res['SalesPackgeRpt'].length > 0 &&
          res['SalesPackgeRpt'].toString() != "[]") {
        for (int i = 0; i < res['SalesPackgeRpt'].length; i++) {
          salesMallCartItems
              .add(SalesMallCartItemModel.fromJson(res['SalesPackgeRpt'][i]));
          salesMallTAmount.value = salesMallTAmount.value +
              (double.parse(res['SalesPackgeRpt'][i]['mrp']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
          salesMallTCV.value = salesMallTCV.value +
              (double.parse(res['SalesPackgeRpt'][i]['CV']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
        }
      }
    }
    // else {
    //   Timer(const Duration(seconds: 1), () {
    //     Get.back();
    //   });
    // }

    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getSalesMallItemRemove(Map parameters, cartParameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().removeSalesProduct, params: parameters);
    getSalesMCartItems("init", cartParameters);
    return res;
  }

  getRedemptionMall(Map parameters) async {
    loading.value = true;
    salesOrdersList.clear();
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().loadRedemMall, params: parameters);
    if (res != null) {
      for (int i = 0; i < res['DistSelPackageRpt'].length; i++) {
        salesOrdersList
            .add(SalesOrderModel.fromJson(res['DistSelPackageRpt'][i]));
      }
    }
    loading.value = false;
    return res;
  }

  getRedemptionProductDetails(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getRedemptionSingleProduct, params: parameters);
    if (res != null) {
      saleProductDetails.value = SalesProductModel.fromJson(res);
    }
    loading.value = false;
    return res;
  }

  getRedemptionMallPackageItems(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getPkgItemsRedem, params: parameters);
    packageDetails.value = PackageItemsModel.fromJson(res);
    return res;
  }

  getRedemptionMallAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().pAddtoCartOpenRedem, params: parameters);
    return res;
  }

  getRedemptionMCartItems(String from, Map parameters) async {
    if (from == "init") {
      loading.value = true;
    }

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getRedemPackages, params: parameters);
    salesMallCartItems.clear();
    salesMallTAmount.value = 0.0;
    salesMallTCV.value = 0.0;

    print("cart_itmes...${salesMallCartItems.length}");
    if (res != null) {
      if (res['SalesPackgeRpt'].length > 0 &&
          res['SalesPackgeRpt'].toString() != "[]") {
        for (int i = 0; i < res['SalesPackgeRpt'].length; i++) {
          salesMallCartItems
              .add(SalesMallCartItemModel.fromJson(res['SalesPackgeRpt'][i]));
          salesMallTAmount.value = salesMallTAmount.value +
              (double.parse(res['SalesPackgeRpt'][i]['mrp']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
          salesMallTCV.value = salesMallTCV.value +
              (double.parse(res['SalesPackgeRpt'][i]['CV']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
        }
      }
    } else {
      Timer(const Duration(seconds: 1), () {
        Get.back();
      });
    }
    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getRedemptionMallItemRemove(Map parameters, cartParameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().removeRedemProduct, params: parameters);
    getRedemptionMCartItems("init", cartParameters);
    return res;
  }

  getDPMall(Map parameters) async {
    loading.value = true;
    salesOrdersList.clear();
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().loadDPMall, params: parameters);
    if (res != null) {
      for (int i = 0; i < res['DistSelPackageRpt'].length; i++) {
        salesOrdersList
            .add(SalesOrderModel.fromJson(res['DistSelPackageRpt'][i]));
      }
    }
    loading.value = false;
    return res;
  }

  getDPProductDetails(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getDPSingleProduct, params: parameters);
    if (res != null) {
      dpProductdata.value = DpProdccutModel.fromJson(res);
    }
    loading.value = false;
    return res;
  }

  getDPMallAddToCart(Map parameters) async {
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().addtoCartDP, params: parameters);
    return res;
  }

  getDPMCartItems(String from, Map parameters) async {
    if (from == "init") {
      loading.value = true;
    }

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().getdppackages, params: parameters);
    dpMallDPAmount.value = 0.0;
    dpMallRMAmount.value = 0.0;
    dpMallCV.value = 0.0;
    salesMallCartItems.clear();

    if (res != null) {
      if (res['DPPackageRpt'].length > 0 &&
          res['DPPackageRpt'].toString() != "[]") {
        for (int i = 0; i < res['DPPackageRpt'].length; i++) {
          salesMallCartItems
              .add(SalesMallCartItemModel.fromJson(res['DPPackageRpt'][i]));

          final endIndex = res['DPPackageRpt'][i]['mrp'].indexOf("DP", 0);
          print(
              "dp val..${res['DPPackageRpt'][i]['mrp'].substring(0, endIndex)}");
          String dpval = res['DPPackageRpt'][i]['mrp'].substring(0, endIndex);
          List<dynamic> split1 =
              res['DPPackageRpt'][i]['mrp'].toString().split('+');

          List<dynamic> split2 = split1[1].toString().trim().split(' ');

          dpMallDPAmount.value = dpMallDPAmount.value +
              (double.parse(dpval) *
                  double.parse(res['DPPackageRpt'][i]['qty']));

          dpMallRMAmount.value = dpMallRMAmount.value +
              (double.parse(split2[1]) *
                  double.parse(res['DPPackageRpt'][i]['qty']));
          dpMallCV.value = dpMallCV.value +
              (double.parse(res['DPPackageRpt'][i]['CV']) *
                  double.parse(res['DPPackageRpt'][i]['qty']));
        }
      }
    } else {
      Timer(const Duration(seconds: 1), () {
        Get.back();
      });
    }
    print("cart_itmes...${salesMallCartItems.length}");

    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getDpMallLoadCartItems(String from, Map parameters) async {
    if (from == "init") {
      loading.value = true;
    }

    dynamic res = await ApiCall().saleMallPostMethodFun(
        methodName: ApiData().getdppackages, params: parameters);
    dpMallDPAmount.value = 0.0;
    dpMallRMAmount.value = 0.0;
    dpMallCV.value = 0.0;
    salesMallCartItems.clear();

    if (res != null) {
      if (res['DPPackageRpt'].length > 0 &&
          res['DPPackageRpt'].toString() != "[]") {
        for (int i = 0; i < res['DPPackageRpt'].length; i++) {
          salesMallCartItems
              .add(SalesMallCartItemModel.fromJson(res['DPPackageRpt'][i]));

          final endIndex = res['DPPackageRpt'][i]['mrp'].indexOf("DP", 0);
          print(
              "dp val..${res['DPPackageRpt'][i]['mrp'].substring(0, endIndex)}");
          String dpval = res['DPPackageRpt'][i]['mrp'].substring(0, endIndex);

          print(
              "rm val ...${res['DPPackageRpt'][i]['mrp'].substring(res['DPPackageRpt'][i]['mrp'].indexOf("RM"), res['DPPackageRpt'][i]['mrp'].length - 1).replaceAll("RM", "")}");
          String rmval = res['DPPackageRpt'][i]['mrp']
              .substring(res['DPPackageRpt'][i]['mrp'].indexOf("RM"),
                  res['DPPackageRpt'][i]['mrp'].length - 1)
              .replaceAll("RM", "");
          dpMallDPAmount.value = dpMallDPAmount.value +
              (double.parse(dpval) *
                  double.parse(res['DPPackageRpt'][i]['qty']));

          dpMallRMAmount.value = dpMallRMAmount.value +
              (double.parse(rmval) *
                  double.parse(res['DPPackageRpt'][i]['qty']));
          dpMallCV.value = dpMallCV.value +
              (double.parse(res['DPPackageRpt'][i]['CV']) *
                  double.parse(res['DPPackageRpt'][i]['qty']));
        }
      }
    }
    print("cart_itmes...${salesMallCartItems.length}");

    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getDPMallItemRemove(Map parameters, cartParameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().removeDPProduct, params: parameters);
    getDPMCartItems("init", cartParameters);
    return res;
  }

  getMembershipMall(Map parameters) async {
    loading.value = true;
    salesOrdersList.clear();
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().loadMembershipMall, params: parameters);
    if (res != null) {
      for (int i = 0; i < res['DistSelPackageRpt'].length; i++) {
        salesOrdersList
            .add(SalesOrderModel.fromJson(res['DistSelPackageRpt'][i]));
      }
    }
    loading.value = false;
    return res;
  }

  getMemberProductDetails(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getMemberSingleProduct, params: parameters);
    if (res != null) {
      memberProductData.value = MemberProductModel.fromJson(res);
    }
    loading.value = false;
    return res;
  }

  getMemberMallAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().pAddtoCartMembership, params: parameters);
    return res;
  }

  getMemberMCartItems(String from, Map parameters) async {
    if (from == "init") {
      loading.value = true;
    }

    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getMemberPackages, params: parameters);
    salesMallCartItems.clear();
    salesMallTAmount.value = 0.0;
    salesMallTCV.value = 0.0;
    memberMallCartCount.value = "0";
    print("cart_itmes...${salesMallCartItems.length}");
    if (res != null) {
      if (res['SalesPackgeRpt'].length > 0 &&
          res['SalesPackgeRpt'].toString() != "[]") {
        for (int i = 0; i < res['SalesPackgeRpt'].length; i++) {
          salesMallCartItems
              .add(SalesMallCartItemModel.fromJson(res['SalesPackgeRpt'][i]));
          salesMallTAmount.value = salesMallTAmount.value +
              (double.parse(res['SalesPackgeRpt'][i]['mrp']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
          salesMallTCV.value = salesMallTCV.value +
              (double.parse(res['SalesPackgeRpt'][i]['CV']) *
                  double.parse(res['SalesPackgeRpt'][i]['qty']));
        }
      }
    } else {
      if (from != "screen") {
        Timer(const Duration(seconds: 1), () {
          Get.back();
        });
      }
    }
    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getMemberMCheckOut(Map parameters) async {
    genealogyLoading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().checkOutMemberCartItems, params: parameters);
    genealogyLoading.value = false;

    return res;
  }

  getMemberMallItemRemove(Map parameters, cartParameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().removeMemberProduct, params: parameters);
    getMemberMCartItems("init", cartParameters);
    return res;
  }

  getUpgradeMall(Map parameters) async {
    loading.value = true;
    salesOrdersList.clear();
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().loadUpgradeMall, params: parameters);
    if (res != null) {
      for (int i = 0; i < res['DistSelPackageRpt'].length; i++) {
        salesOrdersList
            .add(SalesOrderModel.fromJson(res['DistSelPackageRpt'][i]));
      }
    }
    loading.value = false;
    return res;
  }

  getUpgradeMallAddToCart(Map parameters) async {
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().productsAddtoCartOpenUpg, params: parameters);
    return res;
  }

  getUpgradeMCartItems(String from, Map parameters) async {
    if (from == "init") {
      loading.value = true;
    }
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().cartItemsUpg, params: parameters);
    print("cart_itmes...${salesMallCartItems.length}");
    if (res != null) {
      upgradeCartData.value = UpgradeCartItemModel.fromJson(res);
    } else {
      Timer(const Duration(seconds: 1), () {
        Get.back();
      });
    }
    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getPromoPacks(Map parameters, String endUrl) async {
    dynamic res =
        await ApiCall().postMethodFun(methodName: endUrl, params: parameters);
    packageDetails.value = PackageItemsModel.fromJson(res);
    return res;
  }

  getPromoPackAddToCart(Map parameters, String endUrl) async {
    dynamic res =
        await ApiCall().postMethodFun(methodName: endUrl, params: parameters);
    return res;
  }

  getPromoCartItems(String from, Map parameters, String endUrl) async {
    if (from == "init") {
      loading.value = true;
    }

    dynamic res = await ApiCall().postMethodFun(
      methodName: endUrl,
      params: parameters,
    );

    if (res != null) {
      if (res['GetCouStMalRpt'].length > 0 &&
          res['GetCouStMalRpt'].toString() != "[]") {
        promoCartItemData.value =
            PromoCartItemModel.fromJson(res['GetCouStMalRpt'][0]);
      } else if (res['GetsubCouStMalRpt'].length > 0 &&
          res['GetsubCouStMalRpt'].toString() != "[]") {
        upgradePromoCartItemData.value =
            UpgradePromotionModel.fromJson(res['GetsubCouStMalRpt'][0]);
      }
    } else {
      Get.back();
    }
    if (from == "init") {
      loading.value = false;
    }
    return res;
  }

  getDashboardRedemPoints(
    Map parameters,
  ) async {
    listOfMemberLoading.value = true;
    dynamic res = await ApiCall().postMethodFun(
        methodName: ApiData().getRedeemPoints, params: parameters);
    listOfMemberLoading.value = false;

    return res;
  }

  getDashboardRedemReq(
    Map parameters,
  ) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().redeemRequest, params: parameters);
    loading.value = false;

    return res;
  }

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

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().nSGCartItems, params: params);
    packCartList.clear();
    cvVal.value = 0.0;
    priceVal.value = 0.0;
    if (res != null) {
      for (int i = 0; i < res['SGCartItemRpt'].length; i++) {
        packCartList.add(PackCartModel.fromJson(res['SGCartItemRpt'][i]));
        cvVal.value = cvVal.value +
            (double.parse(res['SGCartItemRpt'][i]['CV']) *
                double.parse(res['SGCartItemRpt'][i]['Qty']));
        priceVal.value = priceVal.value +
            (double.parse(res['SGCartItemRpt'][i]['mrp']) *
                double.parse(res['SGCartItemRpt'][i]['Qty']));
      }
    }
    cartLoading.value = false;
    return res;
  }

  getUpgradeCartData2(Map params) async {
    cartLoading.value = true;

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().nSGCartItems, params: params);
    totalAmount.value = 0.0;
    packCartList.clear();
    cvVal.value = 0.0;
    if (res != null) {
      for (int i = 0; i < res['SGCartItemRpt'].length; i++) {
        packCartList.add(PackCartModel.fromJson(res['SGCartItemRpt'][i]));
        cvVal.value = cvVal.value + double.parse(res['SGCartItemRpt'][i]['CV']);

        totalAmount.value = totalAmount.value +
            (double.parse(res['SGCartItemRpt'][i]['mrp']) *
                double.parse(res['SGCartItemRpt'][i]['Qty']));
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

  getReviewUpload(Map bdata, reviewDataParams) async {
    loading.value = true;
    dynamic res =
        await ApiCall().uploadReview(bData: bdata, apiEndPoint: "WriteNReview");
    print("ressss....$res");
    loading.value = false;
    getReviewData(reviewDataParams, "init");
    return res;
  }

  getReviewVideoUpload(
    Map bdata,
  ) async {
    loading.value = true;
    dynamic res =
        await ApiCall().uploadReview(bData: bdata, apiEndPoint: "UploadVideo");
    print("ressss....$res");
    loading.value = false;
    return res;
  }

  getReviewData(Map params, String from) async {
    if (from == "init") {
      genealogyLoading.value = true;
    }
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().getReviewsdata, params: params);
    if (res != null) {
      reviewData.value = ReviewData.fromJson(res);
    }
    genealogyLoading.value = false;
    return res;
  }

  getHelpFulFun(Map params, reviewDataParams) async {
    dynamic res =
        await ApiCall().rawFun(endUrl: "AddRevHelpful", params: params);
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        CommonToastTrue(res['Message']);
        getReviewData(reviewDataParams, "helpFun");
      } else {
        CommonToast(res['Message']);
      }
    }
  }

  getReviewReportingFun(
    Map params,
  ) async {
    dynamic res =
        await ApiCall().rawFun(endUrl: "AddRevReport", params: params);
    if (res != null) {
      print("res...$res");
      if (res['Msg'] == "SUCCESS") {
        CommonToastTrue(res['Message']);
      } else {
        CommonToast(res['Message']);
      }
    }
  }

  getNotificationData(Map parameters) async {
    loading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().dashboard, params: parameters);
    notificationData.clear();
    if (res != null) {
      if (res['Msg'] == "SUCCESS") {
        if (res['Notificationsrpt'].length > 0) {
          for (int i = 0; i < res['Notificationsrpt'].length; i++) {
            notificationData.add(res['Notificationsrpt'][i]['message']);
          }
        }
      }
    }

    loading.value = false;
    return res;
  }

  getTestimonials(Map params) async {
    loading.value = true;
    testimonialData.clear();
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().getTestimonials, params: params);
    if (res != null) {
      print("res...$res");
      if (res['Message'] == "SUCCESS") {
        for (int i = 0; i < res['TestimonialsRpt'].length; i++) {
          testimonialData
              .add(TestimonialModel.fromJson(res["TestimonialsRpt"][i]));
        }
      }
    }
    loading.value = false;
  }

  getHomeNews(Map parameters) async {
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().getNewsEvents, params: parameters);
    newsData.clear();
    if (res != null) {
      if (res['newsdataRpt'].length > 0) {
        for (int i = 0; i < 10; i++) {
          newsData.add(NewsModel.fromJson(res['newsdataRpt'][i]));
        }
      }
    }
    return res;
  }

  getHomeNewsDetails(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().getNewsdata, params: parameters);
    if (res != null) {
      singleNewsDetails.value = NewsDetailsModel.fromJson(res);
    }
    loading.value = false;
  }

  getHomeTrending(Map parameters) async {
    socialMedialoading.value = true;
    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().getSMTrending, params: parameters);
    socialMediaData.clear();
    if (res != null) {
      print("res...$res");
      for (int i = 0; i < res['SMdataRpt'].length; i++) {
        socialMediaData
            .add(TrendingOnSocialMModel.fromJson(res['SMdataRpt'][i]));
      }
    }
    socialMedialoading.value = false;
  }

  getPromotions(Map parameters) async {
    loading.value = true;

    dynamic res = await ApiCall()
        .postMethodFun(methodName: ApiData().getPromotions, params: parameters);
    promotionsData.clear();

    if (res != null) {
      print("res...$res");

      for (int i = 0; i < res['SMdataRpt'].length; i++) {
        promotionsData
            .add(TrendingOnSocialMModel.fromJson(res['SMdataRpt'][i]));
      }
    }
    loading.value = false;
  }
}
