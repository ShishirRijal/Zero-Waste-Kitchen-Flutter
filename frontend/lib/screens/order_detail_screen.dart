import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/models/food_order.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/services/food_services.dart';
import 'package:zero_waste_kitchen/widgets/popups.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

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
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.maxFinite,
              child: Image.network(
                'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                fit: BoxFit.fill,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 0.75,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: OverlayContainer(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class OverlayContainer extends StatefulWidget {
  const OverlayContainer({super.key});

  @override
  State<OverlayContainer> createState() => _OverlayContainerState();
}

class _OverlayContainerState extends State<OverlayContainer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "HAMRO RESTRO",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Container(
                width: 350,
                height: 205,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const FoodDetails(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                "Description of the food:",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 8),
              child: Text(
                "Tkjdcjkbdcbdcjbjhdbccdjbhjsbdcjhbschjbcbcbjbjchbcjbkjbcjbc",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18, color: Colors.grey),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Take Order"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Food Name: Masu Bhat",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "Issued Date: 2023-08-18",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "Expiry Date:2023-08-19 ",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "Type: Non-Veg",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "Address: Pokhara",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "Food Quantity (in person): 4",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
