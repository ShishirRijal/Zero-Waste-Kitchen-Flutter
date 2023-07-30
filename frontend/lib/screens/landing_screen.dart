import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_waste_kitchen/screens/role_screen.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: Constants.kPrimaryColor,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: SvgPicture.asset("assets/images/savefood.svg",
                  width: 250, height: 250, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Find local charities to donate food",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Constants.kWhiteColor,
                    ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RoleScreen()));
                  },
                  child: const Text("Get Started"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
            //  Text("Landing Page",
            //    style: Theme.of(context)
            //      .textTheme
            //    .displayMedium!
            //  .copyWith(color: Theme.of(context).colorScheme.primary)),
            */
