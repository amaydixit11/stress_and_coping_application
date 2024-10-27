import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/domain/quiz/question_model.dart';
import 'package:stress_and_coping_application/domain/quiz/quiz_model.dart';
import 'package:stress_and_coping_application/presentation/quizzes_screen/results_screen.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;

  const QuestionScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentIndex = 0;
  int selectedOptionIndex = -1;
  late List<dynamic> realAnswers;
  late List<int> answers;

  @override
  void initState() {
    super.initState();
    answers = List.filled(widget.quiz.questions.length, -1);
    realAnswers = widget.quiz.answers;
  }

  void _handleOptionTap(int index) {
    setState(() {
      selectedOptionIndex = selectedOptionIndex == index ? -1 : index;
    });
  }

  void _handleNext() {
    if (selectedOptionIndex != -1) {
      if (_currentIndex != widget.quiz.questions.length - 1) {
        setState(() {
          answers[_currentIndex] = selectedOptionIndex;
          _currentIndex++;
          selectedOptionIndex = -1;
        });
      } else {
        setState(() {
          answers[_currentIndex] = selectedOptionIndex;
          selectedOptionIndex = -1;
        });
        _endQuiz();
      }
    }
  }

  void _handlePrevious() {
    setState(() {
      _currentIndex--;
      selectedOptionIndex = -1;
    });
  }

  void _handleSkip() {
    if (_currentIndex != widget.quiz.questions.length - 1)
      setState(() {
        _currentIndex++;
        selectedOptionIndex = -1;
      });
    else {
      _endQuiz();
    }
  }

  void _endQuiz() {
    print(answers);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          quiz: widget.quiz,
          answers: answers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    final List<Question> questions = widget.quiz.questions;

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
            height: screenSize.height * 0.9,
            width: screenSize.width,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF1F1F25),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16.0,
                ),
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${_currentIndex + 1}.",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      questions[_currentIndex].question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: screenHeight * 0.4,
                width: screenWidth * 0.8,
                child: ListView.builder(
                  itemCount: questions[_currentIndex].options.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Option(
                      screenWidth: screenWidth,
                      text: questions[_currentIndex].options[index],
                      isSelected: selectedOptionIndex == index,
                      onTap: () => _handleOptionTap(index),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_currentIndex != 0)
                    GestureDetector(
                      onTap: _handlePrevious,
                      child: Container(
                        width: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF3F4553),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Center(
                            child: Text(
                              "Previous Question",
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
                    onTap: _handleNext,
                    child: Container(
                      width: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF3F4553),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Center(
                          child: Text(
                            selectedOptionIndex == -1
                                ? "Select an option"
                                : _currentIndex ==
                                        widget.quiz.questions.length - 1
                                    ? "End\nQuiz"
                                    : "Next Question",
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
                    onTap: _handleSkip,
                    child: Container(
                      width: screenWidth * 0.3,
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
                            "Skip Question",
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
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: appTheme.blueGray900,
    );
  }
}

class Option extends StatelessWidget {
  final double screenWidth;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const Option({
    Key? key,
    required this.screenWidth,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color boxColor = isSelected ? const Color(0xFF8FBDC8) : Colors.transparent;
    Color textColor = isSelected ? Colors.white : const Color(0xFF8FBDC8);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF3F4553),
            width: 2.0,
          ),
          color: boxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
