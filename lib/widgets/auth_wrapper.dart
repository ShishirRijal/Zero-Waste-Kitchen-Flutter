import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/screens/auth/auth_controller.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/screens/screens.dart';
import 'package:zero_waste_kitchen/utils/shared_prefs.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<SharedPrefs>(context).getOnboardingStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 3,
            ));
          } else if (snapshot.data == false) {
            return const LandingScreen();
          } else {
            return FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == true) {
                    return const MainScreen();
                  } else {
                    return const LoginScreen();
                  }
                } else {
                  return const LandingScreen();
                }
              },
              future:
                  Provider.of<AuthController>(context).isUserAuthenticated(),
            );
          }
        });

    // first check for onboarding
    // return FutureBuilder(
    //   future: Provider.of<SharedPrefs>(context).getOnboardingStatus(),
    //   builder: (context, snapshot) => (snapshot.connectionState ==
    //           ConnectionState.waiting)
    //       ? const Scaffold(
    //           body: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         )
    //       : (snapshot.data == null || snapshot.data == false)
    //           ? const LandingScreen()
    //           // now check for auth
    //           : FutureBuilder(
    //               future: Provider.of<SharedPrefs>(context).getAuthStatus(),
    //               builder: (context, snapshot) =>
    //                   (snapshot.connectionState == ConnectionState.waiting)
    //                       ? const Scaffold(
    //                           body: Center(
    //                             child: CircularProgressIndicator(),
    //                           ),
    //                         )
    //                       : (snapshot.data == null || snapshot.data == false)
    //                           ? const LoginScreen()
    //                           : const MainScreen(),
    //             ),
    // );
  }
}
