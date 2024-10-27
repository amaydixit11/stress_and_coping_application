import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/games_screen/bubbles_screen.dart';
import 'package:stress_and_coping_application/presentation/home_screen/home_screen.dart';
import 'package:stress_and_coping_application/presentation/quizzes_screen/start_quiz_screen.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
      ),
      body: BubblesScreen(
        menuItems: [
          NavigationItem(
            label: 'Home',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
            color: Colors.blue, // Optional custom color
          ),
          NavigationItem(
            label: 'Profile',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
          NavigationItem(
            label: 'Settings',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
          // Add more menu items as needed
        ],
      ),
    );
  }
}
