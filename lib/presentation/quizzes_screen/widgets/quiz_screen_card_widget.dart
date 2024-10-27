import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';

class QuizScreenCardWidget extends StatefulWidget {
  final String thumbnail;
  final String title;
  final String summaryContent;
  final String instructionContent;
  final onTap;
  const QuizScreenCardWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.summaryContent,
    required this.instructionContent,
    this.onTap,
  });

  @override
  State<QuizScreenCardWidget> createState() => _QuizScreenCardWidgetState();
}

class _QuizScreenCardWidgetState extends State<QuizScreenCardWidget> {
  bool _viewInstructions = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appTheme.gray90004,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // _viewInstructions ?
              _viewInstructions == false
                  ? Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          child: Image.asset(
                            widget.thumbnail,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0.0,
                            vertical: 6.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            _buildInfoCard(
                                context, Icons.question_mark, "10\nQuestions"),
                            _buildInfoCard(
                                context, Icons.verified, "FACC\nCertified   "),
                            _buildInfoCard(
                                context, Icons.question_mark, "10\nQuestions"),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.0, 0, 2.0, 16.0),
                          child: Text(
                            widget.summaryContent,
                            style: TextStyle(
                              color: Color(0xFFB5F2FF),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                            vertical: 6.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Instructions\n",
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.0, 0, 2.0, 120.0),
                          child: Text(
                            widget.instructionContent,
                            style: TextStyle(
                              color: Color(0xFFB5F2FF),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        _viewInstructions = !_viewInstructions;
                      })
                    },
                    child: Container(
                      width: screenWidth / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF3F4553),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Center(
                          child: Text(
                            !_viewInstructions
                                ? "View Instructions"
                                : "View Summary",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      width: screenWidth / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF3F4553),
                          width: 2.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 6.0),
                        child: Center(
                          child: Text(
                            "Start Quiz",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF3F4553),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 48,
              ),
              const SizedBox(height: 4.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
