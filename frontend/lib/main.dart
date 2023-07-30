import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:zero_waste_kitchen/screens/screens.dart';

//import 'package:zero_waste_kitchen/screens/sucess_donation_request.dart';
=======

>>>>>>> 35cfa452ca97a2748122994a1a1df95568f5de29
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
<<<<<<< HEAD
      home: const LoginPage(),
=======
      debugShowCheckedModeBanner: false,
      home: const CreateDonationPost(),
>>>>>>> 35cfa452ca97a2748122994a1a1df95568f5de29
    );
  }
}
