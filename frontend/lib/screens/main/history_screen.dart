import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/services/food_services.dart';
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
          "History",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.kHorizontalPadding, vertical: 20),
          child: FutureBuilder(
              future: FoodServices.getFoods(getDonations: currentUser!.isDonor),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const Center(child: Text("Error"));
                } else {
                  var orders = snapshot.data!;
                  //now filter
                  orders = orders
                      .where((element) => element.userId == currentUser!.id)
                      .toList();
                  return orders.isEmpty
                      ? Center(
                          child: LottieBuilder.asset('assets/json/empty.json'))
                      : ListView.separated(
                          itemCount: orders.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            return HistoryBox(
                              foodOrder: orders[index],
                            );
                          },
                        );
                }
              })),
    );
  }
}
