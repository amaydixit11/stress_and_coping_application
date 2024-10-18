import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/fact_of_the_day_widget.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/mood.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/stress_data_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'widgets/listsettings_item_widget.dart';
import 'widgets/quiz_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Container(
            height: screenHeight,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse179508x182,
                  height: screenHeight,
                  width: screenWidth,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgEpisodeBackground,
                  height: screenHeight,
                  width: screenWidth,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: appTheme.blueGray900,
                    shape: RoundedRectangleBorder(),
                    child: Container(
                      height: screenHeight,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray900,
                        borderRadius: BorderRadiusStyle.roundedBorder30,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appTheme.teal900,
                              borderRadius: BorderRadiusStyle.roundedBorder16,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.01,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          ImageConstant.imgHomeBG,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: screenHeight * 0.05),
                                        _buildWelcomeUser(
                                            context, screenHeight, screenWidth),
                                        SizedBox(height: screenHeight * 0.03),
                                        MoodSelect(),
                                        SizedBox(height: screenHeight * 0.02),
                                        FactOfTheDayWidget(),
                                        SizedBox(height: screenHeight * 0.03),
                                        StressDataWidget(),
                                        SizedBox(height: screenHeight * 0.03),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(child: QuizWidget()),
                                            SizedBox(
                                              width: screenWidth * 0.01,
                                            ),
                                            Expanded(child: QuizWidget()),
                                          ],
                                        ),
                                        SizedBox(height: screenHeight * 0.05),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }

  Widget _buildWelcomeUser(
      BuildContext context, double screenHeight, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.02),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hi, ",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  TextSpan(
                    text: "Kabeer\n",
                    style: CustomTextStyles.titleLargeDeepOrange300,
                  ),
                  TextSpan(
                    text: "Welcome Back",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.02),
            child: Text(
              "Good Morning",
              style: CustomTextStyles.bodyLargeLeagueSpartan,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {},
      ),
    );
  }
}
