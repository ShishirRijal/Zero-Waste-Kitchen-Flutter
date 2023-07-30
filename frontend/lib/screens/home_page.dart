import 'package:flutter/material.dart';

//import 'package:zero_waste_kitchen/utils/constants.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zero_waste_kitchen/widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtomNavBar(),
    );
  }
}
