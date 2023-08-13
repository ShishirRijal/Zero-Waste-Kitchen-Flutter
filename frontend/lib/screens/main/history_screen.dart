import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';
import 'package:zero_waste_kitchen/widgets/history_box.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Donation History",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalPadding),
        child: const Column(
          children: [
            SizedBox(
              height: 20,
            ),
            HistoryBox(
                image: 'assets/images/beneficiary.png',
                name: "Khaja Ghar",
                address: "Nadipur-2",
                foodItems: "Chicken ,Naan",
                date: "2080-02-15",
                time: "9:40 PM"),
            SizedBox(
              height: 20,
            ),
            HistoryBox(
                image: 'assets/images/beneficiary.png',
                name: "Khaja Ghar",
                address: "Nadipur-2",
                foodItems: "Chicken ,Naan",
                date: "2080-02-15",
                time: "9:40 PM"),
          ],
        ),
      ),
    );
  }
}
