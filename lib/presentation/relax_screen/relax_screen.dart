import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/presentation/games_screen/games_screen.dart';
import 'package:stress_and_coping_application/presentation/quizzes_screen/quizzes_screen.dart';
import 'package:stress_and_coping_application/presentation/relax_screen/widgets/relax_screen_card_widget.dart';
import 'package:stress_and_coping_application/presentation/test/code_files.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Relax Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: appTheme.gray90004,
      ),
      body: Stack(children: [
        CustomImageView(
          imagePath: ImageConstant.imgEpisodeBackgroundRelax,
          height: screenHeight * 0.9,
          width: screenWidth,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              RelaxScreenCardWidget(
                thumbnail: ImageConstant.imgRelaxingMusic,
                title: "Quizzes",
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(),
                    ),
                  )
                },
              ),
              RelaxScreenCardWidget(
                thumbnail: ImageConstant.imgRelaxingMusic,
                title: "Games",
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BubbleScreen(),
                    ),
                  )
                },
              ),
              RelaxScreenCardWidget(
                thumbnail: ImageConstant.imgRelaxingMusic,
                title: "Relaxing Music",
              ),
              RelaxScreenCardWidget(
                thumbnail: ImageConstant.imgRelaxingMusic,
                title: "Relaxing Music",
              ),
            ],
          ),
        ),
      ]),
      backgroundColor: appTheme.blueGray900,
    );
  }
}
