import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/chatroom_screen/chatroom_screen.dart';
import 'package:stress_and_coping_application/presentation/resources_screen/resources_screen.dart';
import 'package:stress_and_coping_application/presentation/home_screen/home_screen.dart';
import 'package:stress_and_coping_application/presentation/profile_screen/profile_screen.dart';
import 'package:stress_and_coping_application/presentation/relax_screen/relax_screen.dart';
import 'package:stress_and_coping_application/widgets/custom_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  final User? user;
  MainScreen({
    Key? key,
    this.user,
  }) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Initialize the _screens list here
    _screens = [
      HomeScreen(user: widget.user), // Pass the user to HomeScreen
      ChatroomScreen(), // Adjust as necessary
      RelaxScreen(),
      ResourcesScreen(),
      ProfileScreen()
    ];
  }

  void _onBottomNavTapped(BottomBarEnum type) {
    setState(() {
      _selectedIndex = type.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        onChanged: _onBottomNavTapped,
      ),
    );
  }
}
