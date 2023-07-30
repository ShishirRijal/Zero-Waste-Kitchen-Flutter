import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ModifiedTextField extends StatelessWidget {
  const ModifiedTextField(
      {required this.hintText, required this.controller, super.key});
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Constants.kGrey),
      ),
    );
  }
}
