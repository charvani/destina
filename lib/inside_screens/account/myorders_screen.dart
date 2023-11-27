import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Order History"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomElevatedButton(onTapFun: () {}, title: "Filter"),
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, i) => MyOrderItemWidget(
            categoryName: "Health Care",
            itemCount: i,
            itemName: "D1 ADVANCE SCALAR ENERGIZED FLASK  ",
            itemRate: "444",
            imgPath: "assets/images/health1.jpg",
            mrpRate: "dfsf",
            orderStatus: i == 0
                ? "Cancelled"
                : i == 1
                    ? "Delivered"
                    : "On the way",
          ),
          itemCount: 3,
        ));
  }
}
