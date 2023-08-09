import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/models/models.dart';
import 'package:zero_waste_kitchen/services/food_services.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

import '../../widgets/custom_order_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Donations'),
          backgroundColor: Constants.kPrimaryColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: FutureBuilder(
            future: FoodServices.getFoods(true),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('An Unknown Error Occured!'));
              } else {
                List<FoodOrder> foods = snapshot.data as List<FoodOrder>;
                return ListView.separated(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return CustomOrderCard(foods[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                );
              }
            },
          ),
        ));
  }
}
