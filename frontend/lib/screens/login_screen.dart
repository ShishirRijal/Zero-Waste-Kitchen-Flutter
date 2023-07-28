import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Constants.kWhiteColor,
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              children: [
                Text(
                  "Welcome Back",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
