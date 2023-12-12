import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  final String fromDate;
  final String toDate;
  const MyOrdersScreen(
      {super.key, required this.fromDate, required this.toDate});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(backNavigation: true, title: ""),
      body: SingleChildScrollView(
        child: Column(children: [
          const SpaceHeightWidget(height: 10),
          for (int i = 0; i < 5; i++)
            MyOrderItemWidget(
              date: "04 Dec 2023",
              itemName: "D1 ASE SCALARVIA",
              imgPath: "assets/images/logo.png",
              mrpRate: "90",
              ordercode: "04122023/1238",
              shippingFun: () {},
              invoiceFun: () {},
            )
        ]),
      ),
    );
  }
}
