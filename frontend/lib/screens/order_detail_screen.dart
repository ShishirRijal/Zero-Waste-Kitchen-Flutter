import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const SucessDonationRequest(isTaken: true)));
    } catch (e) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    widget.foodOrder.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ), //image
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "Description:",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ), //String "description"
                  //
                  Text(
                    widget.foodOrder.description,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  //
                  const SizedBox(height: 15),
                  Text(
                    "Food Details",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ), //String"Food Details"
                  //
                  FoodDetails(widget.foodOrder),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: widget.foodOrder.isTaken
                          ? ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            )
                          : null,
                      onPressed: widget.foodOrder.isTaken
                          ? null
                          : () {
                              takeOrder(widget.foodOrder);
                            },
                      child: Text(
                        widget.foodOrder.isTaken
                            ? "Already Taken"
                            : currentUser!.isDonor
                                ? "Accept Request"
                                : "Accept Donation",
                      ),
                    ),
                  ),
                  //       ),
                ],
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String topic;

  final String topicDetail;

  const CustomText({super.key, required this.topic, required this.topicDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            topic,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            topicDetail,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}

class FoodDetails extends StatelessWidget {
  const FoodDetails(this.foodOrder, {super.key});
  final FoodOrder foodOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 7),
          // CustomText(
          //     topic: "Donor ", topicDetail: foodOrder.userId.substring(0, 8)),
          // Divider(
          //   thickness: 1,
          //   color: Colors.grey.withOpacity(0.3),
          // ),
          CustomText(topic: "Food Name", topicDetail: foodOrder.name),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          CustomText(
              topic: "Cooking Date",
              topicDetail:
                  DateFormat('MMM d, y').format(foodOrder.cookDateTime)),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          CustomText(
              topic: "Cooking Time",
              topicDetail: DateFormat('h:mma').format(foodOrder.cookDateTime)),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          CustomText(
              topic: "Expiry Date",
              topicDetail:
                  DateFormat('MMM d, y').format(foodOrder.cookDateTime)),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          CustomText(
              topic: "Expiry Date",
              topicDetail: DateFormat('h:mma').format(foodOrder.cookDateTime)),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          CustomText(
              topic: "Type",
              topicDetail: foodOrder.type.name == 'veg' ? 'Veg' : 'Non-Veg'),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          CustomText(topic: "Address", topicDetail: foodOrder.location),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          CustomText(
              topic: "Food Quantity",
              topicDetail: "${foodOrder.quantity} Person(s)"),
          SizedBox(height: 7),
        ],
      ),
    );
  }
}
