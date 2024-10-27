import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/domain/quiz/quiz_model.dart';
import 'package:stress_and_coping_application/presentation/quizzes_screen/question_screen.dart';

class StartQuizScreen extends StatefulWidget {
  final Quiz quiz;
  const StartQuizScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    const String instructions =
        '''Read Each Question Carefully: Take your time to understand what each question is asking.
Select the Most Appropriate Answer: Choose the option (A, B, C, or D) that best reflects your thoughts, feelings, or behaviors.
Record Your Responses: You can jot down your answers on a piece of paper or keep a mental note.
Tally Your Responses: After completing the quiz, count how many answers you selected for each letter (A, B, C, D).
Refer to the Results Section: Match your answers to the corresponding results provided at the end of each quiz. This will help you identify your strengths and areas for growth.
Reflect on the Insights: Take time to think about the results and how they resonate with your current mental health status. Consider setting goals or seeking resources for areas needing improvement.''';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.quiz.title,
          style: TextStyle(
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
                      const Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 6.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Instructions",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4.0, 0, 2.0, 16.0),
                            child: Text(
                              instructions,
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
                            onTap: () => {},
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
                                    "View Past Scores",
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
            ),
          )
        ],
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
