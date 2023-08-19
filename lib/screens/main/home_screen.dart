import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zero_waste_kitchen/models/models.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/services/food_services.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

import '../../widgets/custom_order_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(  'Donations'),
          backgroundColor: Constants.kPrimaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: FutureBuilder(
            future: FoodServices.getFoods(getDonations: !currentUser!.isDonor),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('An Unknown Error Occured!'));
              } else {
                List<FoodOrder> foods = snapshot.data as List<FoodOrder>;
 foods.sort((a, b) {
                    if (a.isTaken && !b.isTaken) {
                      return 1; // Order a after b
                    } else if (!a.isTaken && b.isTaken) {
                      return -1; // Order a before b
                    } else {
                      return 0; // No change in order
                    }
                  });
                return foods.isEmpty
                    ? Center(
                        child: LottieBuilder.asset('assets/json/empty.json'))
                    : ListView.separated(
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
