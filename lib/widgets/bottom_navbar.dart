import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/profile_page.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final String username;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.username});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: username),
        ),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(username: username),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.pink[300],
      unselectedItemColor: Colors.grey,
    );
  }
}
