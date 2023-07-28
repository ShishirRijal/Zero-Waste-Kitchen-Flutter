import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

import 'screens.dart';

class SucessDonationRequest extends StatelessWidget {
  const SucessDonationRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kSuccessColor,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 120,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Constants.kWhiteColor),
              child: const Icon(
                Icons.check,
                size: 65,
                color: Constants.kSuccessColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Thank You",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Constants.kWhiteColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Your donation request has been sucessfully submitted to the The Food Centre.",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Constants.kWhiteColor, fontWeight: FontWeight.w100),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "\"Be ready with your food\"",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Constants.kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Constants.kWhiteColor),
                  foregroundColor:
                      MaterialStatePropertyAll(Constants.kSuccessColor),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoleScreen()));
                },
                child: Text(
                  "Back to homescreen",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Constants.kSuccessColor,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
