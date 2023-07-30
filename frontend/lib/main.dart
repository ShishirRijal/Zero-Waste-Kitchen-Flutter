import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/screens/screens.dart';

//import 'package:zero_waste_kitchen/screens/sucess_donation_request.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const LoginPage(),
    );
  }
}
