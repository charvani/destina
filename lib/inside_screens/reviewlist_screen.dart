import 'package:destina_1_international/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../commons/cmnproduct_detailswdgts.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Review & Ratings", backNavigation: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            for (int i = 0; i < 15; i++) viewRatingWidget(),
          ]),
        ),
      ),
    );
  }
}
