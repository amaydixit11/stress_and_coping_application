import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/domain/quiz/quiz_model.dart';
import 'package:stress_and_coping_application/presentation/quizzes_screen/question_screen.dart';

class ResultsScreen extends StatefulWidget {
  final Quiz quiz;
  final List<int> answers;
  const ResultsScreen({
    super.key,
    required this.quiz,
    required this.answers,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int _score = 0;
  String _resultTitle = "text";
  String _resultDesc = "text";
  @override
  void initState() {
    super.initState();
    _calculateScore();
  }

  void _calculateScore() {
    print("Answers: ${widget.answers}");
    print("Quiz Answers: ${widget.quiz.answers}");
    for (var i = 0; i < widget.answers.length; i++) {
      if (widget.answers[i] != -1) {
        _score += widget.answers[i];
      }
    }

    print("Score: $_score");
    print("Length: ${widget.answers.length}");
    print(
        "Normalised Score: ${(_score / widget.quiz.resultsTitle.length).floor() - 1}");
    print("Results Title: ${widget.quiz.resultsTitle}");
    print("Results Description: ${widget.quiz.resultsDescription}");

    if ((_score / widget.quiz.resultsTitle.length).floor() - 1 >= 0 &&
        (_score / widget.quiz.resultsTitle.length).floor() - 1 <
            widget.quiz.resultsTitle.length) {
      _resultTitle = widget.quiz
          .resultsTitle[(_score / widget.quiz.resultsTitle.length).floor() - 1];
      _resultDesc = widget.quiz.resultsDescription[
          (_score / widget.quiz.resultsTitle.length).floor() - 1];
    } else {
      _resultTitle = "Unexpected Score";
      _resultDesc = "Your score exceeded the expected range.";
    }
  }

  void _showAnswers() {}
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.quiz.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: appTheme.gray90004,
      ),
      body: Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEpisodeBackgroundRelax,
            height: screenHeight * 0.9,
            width: screenWidth,
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 6.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Results",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(4.0, 0, 2.0, 16.0),
                            child: Text(
                              _resultTitle,
                              style: const TextStyle(
                                color: Color(0xFFB5F2FF),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(4.0, 0, 2.0, 16.0),
                            child: Text(
                              _resultDesc,
                              style: const TextStyle(
                                color: Color(0xFFB5F2FF),
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: _showAnswers,
                            child: Container(
                              width: screenWidth / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFF3F4553),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: Center(
                                  child: Text(
                                    "View Answers",
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
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuestionScreen(quiz: widget.quiz),
                                ),
                              )
                            },
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
                                    "Go to quiz page",
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
            ),
          )
        ],
      ),
    );
  }
}
