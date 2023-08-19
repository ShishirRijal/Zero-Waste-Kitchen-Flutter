import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/models/user_model.dart';
import 'package:zero_waste_kitchen/screens/main/history_screen.dart';
import 'package:zero_waste_kitchen/screens/main/home_screen.dart';
import 'package:zero_waste_kitchen/screens/main/profile_screen.dart';
import 'package:zero_waste_kitchen/screens/screens.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

import '../auth/auth_controller.dart';

User? currentUser;

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
    CreateDonationPost(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  Future<User?> getCurrentUser() async {
    currentUser = await context.read<AuthController>().getCurrentUser();
    return currentUser;
  }

  @override
  void initState() {
    super.initState();
    // getCurrentUser(); // get current user
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    // context.read<AuthController>().logout(context);
    return Scaffold(
      body: FutureBuilder(
          future: InternetConnectionChecker().hasConnection,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError ||
                snapshot.data == null ||
                snapshot.data == false) {
              return Center(
                  child: LottieBuilder.asset('assets/json/no-internet.json'));
            }

            // in case there's internet connection
            return FutureBuilder(
                future: getCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    return _screens[_currentIndex];
                  } else {
                    return const Text("Something went wrong");
                  }

                  // else {
                  //   return Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Center(
                  //         child: LottieBuilder.asset('assets/json/error.json')),
                  //   );
                  // }
                });
          }),

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
