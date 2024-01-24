import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/controllers/main_controller.dart';
import 'package:destina_1_international/dashboard_screens/bottombar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/colors.dart';
import '../../service_call/api_data.dart';
import '../checkout_screen.dart';

class PromoCartScreen extends StatefulWidget {
  final String pkMallNum, packCode;

  const PromoCartScreen(
      {super.key, required this.pkMallNum, required this.packCode});

  @override
  State<PromoCartScreen> createState() => _PromoCartScreenState();
}

class _PromoCartScreenState extends State<PromoCartScreen> {
  TextEditingController sponsorController = TextEditingController();

  int itemCount = 4;
  int cartCount = 0;
  int cartItemCount = 0;
  dynamic uniqId;
  dynamic sessionId, regId, packCode;
  MainController cartController = Get.put(MainController());
  bool packageLoading = false;
  @override
  void initState() {
    super.initState();

    uniqId = Constants.prefs.getString("uniq_id");
    sessionId = Constants.prefs.getString("ss_id");
    regId = Constants.prefs.getString("reg_id");

    sponsorController.text = "";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if (uniqId != null && sessionId != null) {
      getData("init");
      // }
    });
  }

  Map cartParams = {};
  bool showProductsSelection = false;
  getData(String from) async {
    if (from != "init") {
      setState(() {
        screenLoad = true;
      });
    }

    cartParams = {
      "countryname": Constants.prefs.get("country_id"),
      "pkcode": widget.packCode,
      "Uniqid": uniqId,
      "sessid": sessionId,
      "sprno": widget.pkMallNum == "3"
          ? Constants.prefs.get("reg_id")
          : Constants.prefs.get("user_id"),
      "MallID": widget.pkMallNum,
    };

    print("cart params...$cartParams");
    dynamic res = await cartController.getPromoCartItems(
        from,
        cartParams,
        widget.pkMallNum == "3"
            ? ApiData().selPackageDetailsPro
            : ApiData().selPackageDetailsUpgPro);
    print("cart res...$res");

    if (from != "init") {
      setState(() {
        screenLoad = false;
      });
    }
  }

  bool checkOutShow = false;
  bool readOnly = false;
  final _fomkey = GlobalKey<FormState>();
  List<TextEditingController> textEControllerList = [];

  bool screenLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            onPressed: () {
              Get.back();
            }),
        title: const Text(
          "Cart",
          style: TextStyle(fontFamily: "OnestSemiBold", fontSize: 20),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
              child: SizedBox(
            width: double.infinity,
            child: screenLoad
                ? SizedBox(height: 400, child: loader)
                : Obx(() {
                    return Column(
                      children: [
                        cartController.loading.value
                            ? Container(
                                height: 500,
                                alignment: Alignment.center,
                                child: Center(child: withoutCartCountWidget()))
                            : widget.pkMallNum == "3"
                                ? commonCartWidget(
                                    itemPrice: cartController
                                        .promoCartItemData.value.totMrp,
                                    itemName: cartController
                                        .promoCartItemData.value.name,
                                    proCode: cartController
                                        .promoCartItemData.value.pkcode,
                                    qty: cartController
                                        .promoCartItemData.value.qty,
                                    dp: cartController
                                        .promoCartItemData.value.dp,
                                    mrp: cartController
                                        .promoCartItemData.value.totMrp)
                                : commonCartWidget(
                                    itemPrice: cartController
                                        .upgradePromoCartItemData.value.totMrp,
                                    itemName: cartController
                                        .upgradePromoCartItemData.value.name,
                                    proCode: cartController
                                        .upgradePromoCartItemData.value.pcode,
                                    qty: cartController
                                        .upgradePromoCartItemData.value.qty,
                                    dp: "",
                                    mrp: cartController
                                        .upgradePromoCartItemData.value.totMrp),
                        const SpaceHeightWidget(height: 40)
                      ],
                    );
                  }),
          )),
        ),
      ),
    );
  }

  Widget commonCartWidget(
      {required itemPrice,
      required itemName,
      required proCode,
      required qty,
      required dp,
      required mrp}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CartItemWidget(
              removeCartOption: true,
              imagePath: "",
              removeFun: () {},
              itemsPrice: itemPrice,
              itemname: itemName,
              productCode: proCode,
              itemCount: qty,
              dp: dp,
            ),
            const CommonDivider(),
          ],
        ),
        const SpaceHeightWidget(height: 10),
        const SpaceHeightWidget(height: 15),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
              color: lightDarKBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Summary",
                style: TextStyle(
                  fontFamily: "OnestBold",
                  fontSize: 17,
                ),
              ),
              const SpaceHeightWidget(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(
                      fontFamily: "OnestRegular",
                      fontSize: 15,
                    ),
                  ),
                  Obx(() {
                    return cartController.loading.value
                        ? const Text("RM 0.0")
                        : Text(
                            mrp,
                            style: const TextStyle(
                              fontFamily: "OnestRegular",
                              fontSize: 15,
                            ),
                          );
                  }),
                ],
              ),
              const SpaceHeightWidget(height: 10),
              const CommonDivider(),
              const SpaceHeightWidget(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimated Total",
                    style: TextStyle(
                      fontFamily: "OnestSemiBold",
                      fontSize: 15,
                      color: darkBlue,
                    ),
                  ),
                  Obx(() {
                    return cartController.loading.value
                        ? const Text("RM 0.0")
                        : Text(
                            mrp,
                            style: TextStyle(
                              fontFamily: "OnestSemiBold",
                              fontSize: 15,
                              color: darkBlue,
                            ),
                          );
                  }),
                ],
              ),
              const SpaceHeightWidget(height: 20),
              SizedBox(
                width: 200,
                height: 35,
                child: IconElevatedButton(
                  onTapFun: () async {
                    if (widget.pkMallNum == "3") {
                      print(
                          "https://showcase.worldunityfoundation.org/MobileAppCheckout/PromoCheckoutParam.html?RegId=$regId&sessid=$sessionId&uniqId=$uniqId");
                    } else {
                      print(
                          "https://showcase.worldunityfoundation.org/MobileAppCheckout/UpgradePromoCheckoutParam.html?RegId=$regId&sessid=$sessionId&uniqId=$uniqId");
                    }
                    Get.off(() => CheckOutScreen(
                        redirectUrl: widget.pkMallNum == "3"
                            ? "https://showcase.worldunityfoundation.org/MobileAppCheckout/PromoCheckoutParam.html?RegId=$regId&sessid=$sessionId&uniqId=$uniqId"
                            : "https://showcase.worldunityfoundation.org/MobileAppCheckout/UpgradePromoCheckoutParam.html?RegId=$regId&sessid=$sessionId&uniqId=$uniqId"));
                  },
                  imagePath: 'assets/images/shopping_cart_img.jpg',
                  labelColor: whiteColor,
                  buttonColor: lightDarKBlue,
                  titile: "Checkout",
                ),
              )
            ],
          ),
        ),
        const SpaceHeightWidget(height: 20),
      ],
    );
  }

  Widget withoutCartCountWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceHeightWidget(height: 10),
        Transform.flip(
          flipX: true,
          child: Image.asset(
            "assets/images/cart_draw.png",
            height: 150,
          ),
        ),
        const SpaceHeightWidget(height: 20),
        Text(
          "Your Destina 1 cart is empty",
          style: TextStyle(
              fontFamily: "OnestRegular",
              fontSize: 15,
              color: blackColor.withOpacity(0.7)),
        ),
        const SpaceHeightWidget(height: 3),
        Text(
          "Shop today's deals",
          style: TextStyle(
              fontFamily: "OnestRegular",
              fontSize: 15,
              color: blackColor.withOpacity(0.7)),
        ),
        const SpaceHeightWidget(height: 10),
        SizedBox(
          height: 30,
          child: CommonOulineTextButton(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            onTapFun: () {
              Get.offAll(() => const BottomBarScreen(
                    index: 1,
                  ));
            },
            title: "Shopping",
            titleFontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget signInReqWidget() {
    return Container(
      height: 100,
      // width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/signin_cartbanner.png",
              ),
              opacity: 0.7)),
      child: Row(
        children: [
          const SpaceWidthWidget(width: 80),
          Flexible(
            child: Text(
              "Already an account? Sign in now for special promotion.",
              maxLines: 3,
              style: TextStyle(
                  color: blackColor,
                  fontFamily: "OnestSemiBold",
                  fontSize: 12.5),
            ),
          ),
          SizedBox(
              width: 95,
              height: 35,
              child: CustomElevatedButton(onTapFun: () {}, title: "Sign in")),
          const SpaceWidthWidget(width: 5)
        ],
      ),
    );
  }

  bool loading = false;
  bool showQtyErrorText = false;
  List<String> pidList = [];
}
