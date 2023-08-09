import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/screens/screens.dart';
import 'package:zero_waste_kitchen/utils/shared_prefs.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // first check for onboarding
    return FutureBuilder(
      future: Provider.of<SharedPrefs>(context).getOnboardingStatus(),
      builder: (context, snapshot) => (snapshot.connectionState ==
              ConnectionState.waiting)
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : (snapshot.data == null || snapshot.data == false)
              ? const LandingScreen()
              // now check for auth
              : FutureBuilder(
                  future: Provider.of<SharedPrefs>(context).getAuthStatus(),
                  builder: (context, snapshot) =>
                      (snapshot.connectionState == ConnectionState.waiting)
                          ? const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : (snapshot.data == null || snapshot.data == false)
                              ? const LoginScreen()
                              : const MainScreen(),
                ),
    );
  }
}
