import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //prevention of bottom pixel overflow when keyboard pop up
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: Constants.kWhiteColor,
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Back!",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Constants.kPrimaryColor,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "Sign into your account",
                  //  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //  fontWeight: FontWeight.w400,
                  // color: Constants.kGrey,
                  //fontSize: 18,
                  //),
                  style: TextStyle(
                    color: Constants.kGrey,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                    color: Constants.kGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onTapOutside: (_) {
                    WidgetsBinding.instance.focusManager.primaryFocus
                        ?.unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                    color: Constants.kGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const TextField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Constants.kPrimaryColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 75,
                      width: 330,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Continue")),
                    )),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "New User? Sign up",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Constants.kBlackColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
