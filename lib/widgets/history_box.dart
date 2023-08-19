import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zero_waste_kitchen/models/food_order.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';

class HistoryBox extends StatelessWidget {
  final FoodOrder foodOrder;

  const HistoryBox({
    super.key,
    required this.foodOrder,
  });
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 1;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 240, 245, 245),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(foodOrder.imageUrl,
                        height: 60, width: 100, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width - 100 - 80,
                        child: Text(
                          foodOrder.name,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: width - 100 - 80,
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  Icons.place,
                                  size: 24,
                                  color: Colors.red,
                                ),
                              ),
                              TextSpan(
                                text: foodOrder.location,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodOrder.name,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    foodOrder.acceptedDateTime == null
                        ? "Scheduled for pickup"
                        : "${DateFormat('yyyy-MM-dd').format(foodOrder.cookDateTime)} | ${DateFormat('HH:mm:a').format(foodOrder.cookDateTime)}",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 28,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: foodOrder.isTaken ? Colors.green : Colors.red),
            child: Text(
              !foodOrder.isTaken
                  ? "Pending"
                  : currentUser!.isDonor
                      ? "Donated"
                      : "Accepted",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
