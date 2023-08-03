import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/screens/auth/auth_controller.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/screens/screens.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AuthController>(context).authStateChanges,
      builder: (context, snapshot) =>
          (snapshot.connectionState == ConnectionState.waiting)
              ? const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : snapshot.hasData
                  ? const MainScreen()
                  : const LoginScreen(),
    );
  }
}
