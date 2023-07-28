import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';
import 'package:zero_waste_kitchen/widgets/role_choose.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  bool isBeneficiary = true;
  bool isDonor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.kHorizontalPadding, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  child: Image.asset('assets/images/food_bowl.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Care",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)
                              // TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 50,
                              //     fontWeight: FontWeight.bold),
                              ),
                          TextSpan(
                              text: "Food",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Constants.kPrimaryColor,
                                      fontWeight: FontWeight.bold)
                              // TextStyle(
                              //     color: Constants.kPrimaryColor,
                              //     fontSize: 50,
                              //     fontWeight: FontWeight.bold),
                              ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Where everyone has the food they need; where all the food produced goes first and foremost to feed people.",
                      style: TextStyle(
                        color: Constants.kGrey,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose your role",
                    // style: TextStyle(
                    //   color: Colors.black,

                    //   fontSize: 30,
                    // ),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // donor
                SizedBox(
                  height: 80,
                  child: GestureDetector(
                    onTap: () {
                      isBeneficiary = false;
                      if (!isDonor) {
                        isDonor = true;
                        setState(() {});
                      }
                    },
                    child: RoleChooseBox(
                      user: "Donor",
                      imageLocation: 'assets/images/beneficiary.png',
                      isSelected: isDonor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // beneficiary
                SizedBox(
                  height: 80,
                  child: GestureDetector(
                    onTap: () {
                      isDonor = false;
                      if (!isBeneficiary) {
                        isBeneficiary = true;
                        setState(() {});
                      }
                    },
                    child: RoleChooseBox(
                      user: "Beneficiary",
                      imageLocation: 'assets/images/beneficiary.png',
                      isSelected: isBeneficiary,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      "Continue",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
