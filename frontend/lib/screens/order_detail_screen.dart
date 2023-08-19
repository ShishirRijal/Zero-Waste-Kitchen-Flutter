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
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: 900,
          color: Constants.kWhiteColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ), //image
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.kWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15, right: 8, left: 8),
                          child: Text(
                            "Description",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                          ),
                        ), //String "description"

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "This is the Description Box. Write the description of food.",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 17),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Food Details",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                          ),
                        ), //String"Food Details"

                        const FoodDetailsContainer(),

                        const SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: 0.6,
                            widthFactor: 1,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Take an Order",
                              ),
                            ),
                          ),
                        ), //elevatedbutton
                      ],
                    ),
                  ),
                ),
              ),
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

  CustomText({super.key, required this.topic, required this.topicDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            topic,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 17),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            topicDetail,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.grey, fontSize: 17),
          ),
        ),
      ],
    );
  }
}

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(topic: "Donor ", topicDetail: "ICES"),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        CustomText(topic: "Food Name", topicDetail: "MASU BHAT"),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        CustomText(topic: "Issued Date", topicDetail: "2023-08-19"),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        CustomText(topic: "Expiry Date", topicDetail: "2023-08-20"),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        CustomText(topic: "Type", topicDetail: "Non-Veg"),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        CustomText(topic: "Address", topicDetail: "Pokhara"),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        CustomText(topic: "Food Quantity", topicDetail: "4"),
      ],
    );
  }
}

class FoodDetailsContainer extends StatelessWidget {
  const FoodDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: const FoodDetails(),
    );
  }
}
