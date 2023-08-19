import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _selectedItem = 0;

  void _onTappedItem(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.house,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.handHoldingHeart,
          ),
          label: "Donate",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.clockRotateLeft),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: "Profile",
        ),
      ],
      currentIndex: _selectedItem,
      onTap: _onTappedItem,
    );
  }
}
