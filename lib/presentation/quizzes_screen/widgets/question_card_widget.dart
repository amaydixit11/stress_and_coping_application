import 'package:flutter/material.dart';

class QuestionCardWidget extends StatefulWidget {
  const QuestionCardWidget({super.key});

  @override
  State<QuestionCardWidget> createState() => _QuestionCardWidgetState();
}

class _QuestionCardWidgetState extends State<QuestionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1F1F25),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
