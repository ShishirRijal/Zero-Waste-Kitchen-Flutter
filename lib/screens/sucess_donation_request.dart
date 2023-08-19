import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

class SucessDonationRequest extends StatelessWidget {
  const SucessDonationRequest({this.isTaken = false, super.key});
  final bool isTaken;

  @override
  Widget build(BuildContext context) {
    final isDonor = currentUser!.isDonor;
    var title = isDonor
        ? "Thank You!"
        : (isTaken && !isDonor)
            ? "Congragulations!"
            : "You're all set!";

    var msg = (isDonor && !isTaken)
        ? "Your donation has been sucessfully shared among all the beneficiaries.\nWe appreciate your contribution."
        : (isDonor && isTaken)
            ? "Thank you for your supporting this donation request.\nPlease prepare the food on specified time."
            : (isTaken && !isDonor)
                ? "You've confirmed your interest on this donation.\nPlease take your order on specified time"
                : "Your request has been sucessfully shared among all the donors.\nKeep patience, we will notify you soon.";

    return Scaffold(
      backgroundColor: Constants.kPrimaryColor,
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
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Constants.kWhiteColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              msg,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Constants.kWhiteColor, fontWeight: FontWeight.w100),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "\"Zero Waste Kitchen\"",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Constants.kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Constants.kWhiteColor),
                  foregroundColor:
                      MaterialStatePropertyAll(Constants.kSuccessColor),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
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
