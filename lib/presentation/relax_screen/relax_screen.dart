import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/home_screen/home_screen.dart';
import 'package:stress_and_coping_application/widgets/custom_bottom_bar.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relax Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      // body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
