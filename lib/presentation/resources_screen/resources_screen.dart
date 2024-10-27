import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/presentation/home_screen/home_screen.dart';
import 'package:stress_and_coping_application/presentation/relax_screen/widgets/relax_screen_card_widget.dart';
import 'package:stress_and_coping_application/presentation/resources_screen/educational_content_screen.dart';
import 'package:stress_and_coping_application/presentation/resources_screen/practical_guides_screen.dart';
import 'package:stress_and_coping_application/presentation/resources_screen/support_resources_screen.dart';
import 'package:stress_and_coping_application/presentation/resources_screen/widgets/custom_search_bar.dart';
import 'package:stress_and_coping_application/widgets/custom_bottom_bar.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  int _currentIndex = 0;

  final List<Widget> _screenList = [
    EducationalContentScreen(),
    PracticalGuidesScreen(),
    SupportResourcesScreen(),
  ];
  final List<String> _textList = [
    "Educational Content",
    "Practical Guides",
    "Support Resources",
  ];
  final List<Widget> _iconList = [
    Icon(
      Icons.stacked_bar_chart,
      color: Colors.white,
    ),
    CustomImageView(
      imagePath: ImageConstant.imgMeditationIcon,
    ),
    CustomImageView(
      imagePath: ImageConstant.imgCallIcon,
    ),
  ];
  final List<Widget> _activeIconList = [
    Icon(
      Icons.stacked_bar_chart,
      color: Colors.white,
    ),
    CustomImageView(
      imagePath: ImageConstant.imgMeditationIcon,
    ),
    CustomImageView(
      imagePath: ImageConstant.imgCallIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      body: Stack(children: [
        CustomImageView(
          imagePath: ImageConstant.imgEpisodeBackgroundRelax,
          height: screenHeight * 1,
          width: screenWidth,
        ),
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_iconList.length, (index) {
                return IconButton(
                  icon: _currentIndex == index
                      ? _activeIconList[index]
                      : _iconList[index],
                  onPressed: () {
                    setState(
                      () {
                        _currentIndex = index;
                      },
                    );
                  },
                );
              }),
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
              indent: screenWidth * 0.075,
              endIndent: screenWidth * 0.075,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28.0,
                          ),
                          child: Text(
                            _textList[_currentIndex],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontFamily: "Montserrat",
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.0,
                        vertical: 2.0,
                      ),
                      child: CustomSearchBar(),
                    ),
                    _screenList[_currentIndex],
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
      backgroundColor: appTheme.blueGray900,
    );
  }
}
