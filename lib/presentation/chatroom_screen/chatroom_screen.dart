import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/home_screen/home_screen.dart';
import 'package:stress_and_coping_application/widgets/custom_bottom_bar.dart';

class ChatroomScreen extends StatefulWidget {
  const ChatroomScreen({super.key});

  @override
  State<ChatroomScreen> createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatroom Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      // body: _pages[_currentIndex],
      // bottomNavigationBar: CustomBottomBar(),
    );
  }
}
