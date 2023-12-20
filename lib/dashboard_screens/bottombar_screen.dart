import 'package:destina_1_international/commons/colors.dart';
import 'package:destina_1_international/commons/constants.dart';
import 'package:destina_1_international/dashboard_screens/cart_screen.dart';
import 'package:destina_1_international/dashboard_screens/home_screen.dart';
import 'package:destina_1_international/dashboard_screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_screen.dart';
import 'promotions_screen.dart';

class BottomBarScreen extends StatefulWidget {
  final int? productIndex;
  final int? index;
  final List<String>? bannerPopup;

  const BottomBarScreen(
      {Key? key, this.index, this.productIndex, this.bannerPopup})
      : super(
          key: key,
        );

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedIndex = 0;

  /// widget list
  List<Widget> bottomBarPages = [
    const HomeScreen(),
    const ProductsScreen(
      from: "bottombar",
    ),
    const CartScreen(
      from: "bottombar",
    ),
    const PromotionsScreen(),
    const AccountScreen()
  ];
  int badgeCount = 0;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index ?? 0;
    if (widget.index != null) {
      bottomBarPages = [
        HomeScreen(
          bannerPopUpImages: widget.bannerPopup,
        ),
        ProductsScreen(
          from: "bottombar",
          index: widget.productIndex,
        ),
        const CartScreen(
          from: "bottombar",
        ),
        const PromotionsScreen(),
        const AccountScreen()
      ];
    }
    badgeCount = Constants.prefs.getInt("cart_count") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: bottomBarPages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: darkBlue,
          currentIndex: selectedIndex,
          unselectedItemColor: blackColor.withOpacity(0.8),
          unselectedLabelStyle: TextStyle(
              fontFamily: "OnestSemiBold", color: blackColor, fontSize: 10),
          selectedLabelStyle: TextStyle(
              fontFamily: "OnestSemiBold", color: darkBlue, fontSize: 10),
          elevation: 0,
          // iconSize: 25,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          mouseCursor: SystemMouseCursors.grab,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? Image.asset(
                        "assets/images/home.png",
                        color: darkBlue,
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/outline_home.png",
                        color: blackColor.withOpacity(0.8),
                        height: 23,
                      ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.manage_search_outlined,
                  color: selectedIndex == 1
                      ? darkBlue
                      : blackColor.withOpacity(0.8),
                  size: 27,
                ),
                label: "Products"),
            BottomNavigationBarItem(
                icon: badgeCount > 0
                    ? Badge.count(
                        count: badgeCount,
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: selectedIndex == 2
                              ? darkBlue
                              : blackColor.withOpacity(0.8),
                        ))
                    : Icon(
                        Icons.shopping_bag_outlined,
                        color: selectedIndex == 2
                            ? darkBlue
                            : blackColor.withOpacity(0.8),
                      ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/promotion_icon.png",
                  color: selectedIndex == 3
                      ? darkBlue
                      : blackColor.withOpacity(0.8),
                  height: 24,
                ),
                label: "Promotion"),
            BottomNavigationBarItem(
                icon: selectedIndex == 4
                    ? Image.asset(
                        "assets/images/person_filled.png",
                        color: darkBlue,
                        height: 24,
                      )
                    : Icon(
                        Icons.person_outline_sharp,
                        color: blackColor.withOpacity(0.8),
                      ),
                label: "Account"),
          ],
          onTap: (index) {
            if (index == 2) {
              Get.to(() => const CartScreen(from: "onTapB"));
            } else {
              setState(() {
                selectedIndex = index;
              });
            }
          },
        ));
  }
}
