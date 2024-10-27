import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/domain/quiz/quiz_model.dart';
import 'package:stress_and_coping_application/presentation/quizzes_screen/start_quiz_screen.dart';
import 'package:stress_and_coping_application/presentation/quizzes_screen/widgets/quiz_screen_card_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  List<Quiz> quizzes = [];
  // List<dynamic> quizzes = [];

  @override
  void initState() {
    super.initState();
    loadQuizzes();
  }

  Future<void> loadQuizzes() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/quizzes.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Ensure that jsonData['quizzes'] is indeed a List
      print(quizzes);
      setState(
        () {
          quizzes = (jsonData['quizzes'] as List).map(
            (item) {
              return Quiz.fromJson(item as Map<String, dynamic>);
            },
          ).toList();
        },
      );
      print(quizzes);
    } catch (e) {
      print('Error loading quizzes: $e');
      setState(() {
        quizzes = []; // Clear quizzes on error
      });
      // print(quizzes);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    const String summaryContent =
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
            loadQuizzes();
          },
        ),
        title: const Text(
          'Quizzes',
          style: TextStyle(color: Colors.white),
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
          quizzes.isNotEmpty
              ? ListView.builder(
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    final quiz = quizzes[index];
                    return QuizScreenCardWidget(
                      thumbnail: ImageConstant.imgRelaxingMusic,
                      title: quiz.title,
                      summaryContent: quiz.summary,
                      instructionContent: summaryContent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartQuizScreen(quiz: quiz),
                          ),
                        );
                      },
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                  // child: Text("HI"),
                ),
        ],
      ),
      backgroundColor: appTheme.blueGray900,
    );
  }
}


/*
{
            "title": "Emotional Intelligence Quiz",
            "summary": "This quiz assesses your awareness and management of emotions, both your own and others’. It can guide you on building emotional awareness, empathy, and resilience.",
            "questions": [
                {
                    "question": "How often do you recognize your emotions?",
                    "options": [
                        "Always",
                        "Sometimes",
                        "Rarely",
                        "Never"
                    ]
                },
                {
                    "question": "How comfortable are you discussing your feelings?",
                    "options": [
                        "Very comfortable",
                        "Somewhat comfortable",
                        "Uncomfortable",
                        "Very uncomfortable"
                    ]
                },
                {
                    "question": "How do you handle others’ emotions?",
                    "options": [
                        "With empathy",
                        "I try to understand",
                        "I feel overwhelmed",
                        "I avoid it"
                    ]
                },
                {
                    "question": "How often do you practice active listening?",
                    "options": [
                        "Always",
                        "Sometimes",
                        "Rarely",
                        "Never"
                    ]
                },
                {
                    "question": "How do you respond to conflict?",
                    "options": [
                        "I seek resolution",
                        "I try to understand",
                        "I avoid it",
                        "I get defensive"
                    ]
                },
                {
                    "question": "How do you feel about your ability to manage stress?",
                    "options": [
                        "Very capable",
                        "Somewhat capable",
                        "Struggle",
                        "Very overwhelmed"
                    ]
                },
                {
                    "question": "How often do you reflect on your reactions?",
                    "options": [
                        "Regularly",
                        "Occasionally",
                        "Rarely",
                        "Never"
                    ]
                },
                {
                    "question": "How comfortable are you with expressing your emotions?",
                    "options": [
                        "Very comfortable",
                        "Somewhat comfortable",
                        "Uncomfortable",
                        "Very uncomfortable"
                    ]
                },
                {
                    "question": "How do you feel about your empathy toward others?",
                    "options": [
                        "Strong",
                        "Somewhat strong",
                        "Weak",
                        "Very weak"
                    ]
                },
                {
                    "question": "How do you react to criticism?",
                    "options": [
                        "I learn from it",
                        "I feel hurt",
                        "I ignore it",
                        "I take it personally"
                    ]
                },
                {
                    "question": "How often do you seek feedback from others?",
                    "options": [
                        "Regularly",
                        "Occasionally",
                        "Rarely",
                        "Never"
                    ]
                },
                {
                    "question": "How do you feel about your emotional awareness?",
                    "options": [
                        "High",
                        "Moderate",
                        "Low",
                        "Very low"
                    ]
                }
            ]
        },
        {
            "title": "Self-Care Assessment",
            "summary": "Reflect on your self-care habits and discover how well you prioritize your own well-being. This quiz highlights your strengths and areas for improvement in maintaining a healthy self-care routine.",
            "questions": [
                {
                    "question": "How often do you prioritize self-care?",
                    "options": [
                        "Daily",
                        "Weekly",
                        "Monthly",
                        "Rarely"
                    ]
                },
                {
                    "question": "Which self-care activity do you enjoy most?",
                    "options": [
                        "Exercise",
                        "Reading",
                        "Socializing",
                        "Watching TV"
                    ]
                },
                {
                    "question": "How do you usually feel after practicing self-care?",
                    "options": [
                        "Refreshed",
                        "Neutral",
                        "Indifferent",
                        "Guilty"
                    ]
                },
                {
                    "question": "What prevents you from practicing self-care?",
                    "options": [
                        "Time constraints",
                        "Lack of interest",
                        "Financial reasons",
                        "Feeling undeserving"
                    ]
                },
                {
                    "question": "How often do you take breaks throughout your day?",
                    "options": [
                        "Regularly",
                        "Occasionally",
                        "Rarely",
                        "Never"
                    ]
                },
                {
                    "question": "Do you set boundaries to protect your time?",
                    "options": [
                        "Yes, always",
                        "Sometimes",
                        "Rarely",
                        "Never"
                    ]
                },
                {
                    "question": "How well do you listen to your body’s needs?",
                    "options": [
                        "Very well",
                        "Somewhat well",
                        "Poorly",
                        "Not at all"
                    ]
                },
                {
                    "question": "Which of these do you consider self-care?",
                    "options": [
                        "Going to bed early",
                        "Overworking",
                        "Skipping meals",
                        "Watching social media"
                    ]
                },
                {
                    "question": "How often do you engage in creative activities?",
                    "options": [
                        "Frequently",
                        "Occasionally",
                        "Rarely",
                        "Never"
                    ]
                },
                {
                    "question": "What’s your primary motivation for self-care?",
                    "options": [
                        "Physical health",
                        "Mental health",
                        "Social acceptance",
                        "Habit"
                    ]
                },
                {
                    "question": "How do you celebrate your accomplishments?",
                    "options": [
                        "With a reward",
                        "I don’t celebrate",
                        "With a gathering",
                        "With a treat"
                    ]
                },
                {
                    "question": "How do you feel about your current self-care routine?",
                    "options": [
                        "Satisfied",
                        "Needs improvement",
                        "Lacking",
                        "Nonexistent"
                    ]
                }
            ]
        }
*/