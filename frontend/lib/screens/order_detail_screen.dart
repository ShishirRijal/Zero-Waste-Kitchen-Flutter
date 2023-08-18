import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/models/food_order.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/services/food_services.dart';
import 'package:zero_waste_kitchen/widgets/popups.dart';

import 'sucess_donation_request.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen(this.foodOrder, {super.key});
  final FoodOrder foodOrder;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  void takeOrder(FoodOrder foodOrder) async {
    try {
      await FoodServices.updateFoodStatus(context,
          isDonation: !currentUser!.isDonor,
          foodOrder: foodOrder,
          userId: currentUser!.id);
      // show a success screen and go to home screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SucessDonationRequest(isTaken: true)));
    } catch (e) {
      print(e.toString());
      showDialog(
          context: context,
          builder: (context) => const ErrorPopup(
                errorText:
                    "An unknown error occurred!\nPlease try again later...",
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            child:
                Text(widget.foodOrder.isTaken ? "Already Taken" : "Take Order"),
            onPressed: () => takeOrder(widget.foodOrder),
          ),
        ));
  }
}
