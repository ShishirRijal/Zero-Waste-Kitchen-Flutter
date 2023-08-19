import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

import '../models/food_order.dart';
import '../screens/order_detail_screen.dart';

class CustomOrderCard extends StatelessWidget {
  const CustomOrderCard(
    this.order, {
    super.key,
  });
  final FoodOrder order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrderDetailScreen(order)));
      },
      child: Container(
        width: double.infinity,
        height: 245,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            // thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                order.imageUrl,
                height: 150,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                        "ID: ${order.id.substring(0, min(order.id.length - 1, 8))}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.circle, size: 10, color: Colors.black54),
                  const SizedBox(width: 10),
                  FittedBox(
                    child: Text(
                        formatDuration(DateTime.now().difference(order.cookDateTime),), 
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 16)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  _CustomLableChip(
                    title: order.isTaken ? "Completed" : "Available",
                    backgroundColor:
                        order.isTaken ? Colors.orange[200] : Colors.blue[200],
                    labelColor:
                        order.isTaken ? Colors.deepOrange : Colors.blue[800],
                  ),
                  const SizedBox(width: 10),
                  _CustomLableChip(
                    title: "Non-Veg",
                    backgroundColor: order.type == FoodType.veg
                        ? Colors.green[100]
                        : Colors.red[100],
                    labelColor: order.type == FoodType.veg
                        ? Colors.green[800]
                        : Colors.red[800],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomLableChip extends StatelessWidget {
  const _CustomLableChip({
    required this.title,
    required this.backgroundColor,
    required this.labelColor,
  });
  final String title;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: backgroundColor,
      label: Text(title,
          style: TextStyle(color: labelColor, fontWeight: FontWeight.bold)),
    );
  }
}
