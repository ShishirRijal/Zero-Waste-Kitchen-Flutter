import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_waste_kitchen/screens/auth/login_screen.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';
import 'package:zero_waste_kitchen/utils/shared_prefs.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    SharedPrefs.setOnboardingStatus();
  }

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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
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
