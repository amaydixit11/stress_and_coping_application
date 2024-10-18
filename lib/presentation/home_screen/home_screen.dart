import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/fact_of_the_day_widget.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/mood.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'widgets/listsettings_item_widget.dart';
import 'widgets/quizandstreaksection_item_widget.dart';

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
          child: SingleChildScrollView(
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
                                          _buildWelcomeUser(context,
                                              screenHeight, screenWidth),
                                          SizedBox(height: screenHeight * 0.03),
                                          MoodSelect(),
                                          SizedBox(height: screenHeight * 0.02),
                                          FactOfTheDayWidget(),
                                          SizedBox(height: screenHeight * 0.03),
                                          _buildStressLevelSection(
                                              context, screenWidth),
                                          SizedBox(height: screenHeight * 0.03),
                                          _buildQuizAndStreakSection(
                                              context, screenWidth),
                                          SizedBox(height: screenHeight * 0.12),
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
        ),
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

  Widget _buildStressLevelSection(BuildContext context, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: appTheme.gray90004,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenWidth * 0.25,
              width: screenWidth * 0.27,
              margin: EdgeInsets.only(top: screenWidth * 0.01),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "9,999",
                          style: CustomTextStyles.titleLargeSFProDisplayGray300,
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgIconTeal500,
                                height: screenWidth * 0.04,
                                width: screenWidth * 0.04,
                              ),
                              Text(
                                "10%",
                                style: CustomTextStyles
                                    .labelLargeSFProTextTeal1500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: screenWidth * 0.25,
                      width: screenWidth * 0.25,
                      child: CircularProgressIndicator(
                        value: 0.16,
                        backgroundColor: appTheme.gray90004,
                        strokeWidth: 2.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Avg Stress level: 44%",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallPoppins.copyWith(
                      height: 1.47,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: Text(
                      "Moderate Stress",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallPoppinsLime700.copyWith(
                        height: 1.47,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizAndStreakSection(BuildContext context, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.02),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: screenWidth * 0.03,
          children: List.generate(2, (index) {
            return QuizandstreaksectionItemWidget();
          }),
        ),
      ),
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
