import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

class FoodType extends StatelessWidget {
  const FoodType(
      {required this.color,
      required this.onPressed,
      required this.type,
      super.key});
  final String type;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            type,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Constants.kWhiteColor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
