import 'package:flutter/material.dart';

import 'package:zero_waste_kitchen/utils/utils.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const CreateDonationPost(),
    );
  }
}
