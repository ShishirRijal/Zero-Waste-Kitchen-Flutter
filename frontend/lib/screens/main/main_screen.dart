import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zero_waste_kitchen/screens/main/donation_screen.dart';
import 'package:zero_waste_kitchen/screens/main/history_screen.dart';
import 'package:zero_waste_kitchen/screens/main/home_screen.dart';
import 'package:zero_waste_kitchen/screens/main/profile_screen.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({this.currentIndex = 0, super.key});
  final int currentIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;
  // list of screens in bottom nav bar
  final List<Widget> _screens = const [
    HomeScreen(),
    DonationScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(

          // type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(
            color: Constants.kPrimaryColor,
            size: 24,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Constants.kGrey,
            size: 24,
          ),
          selectedItemColor: Constants.kPrimaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  FontAwesomeIcons.house,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  FontAwesomeIcons.handHoldingHeart,
                ),
              ),
              label: "Donate",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(FontAwesomeIcons.clockRotateLeft),
              ),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(FontAwesomeIcons.user),
              ),
              label: "Profile",
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) => setState(
                () {
                  _currentIndex = index;
                },
              )),
    );
  }
}
