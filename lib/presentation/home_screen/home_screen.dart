import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/fact_of_the_day_widget.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/logout_dialog.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/mood.dart';
import 'package:stress_and_coping_application/presentation/home_screen/widgets/stress_data_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'widgets/listsettings_item_widget.dart';
import 'widgets/quiz_widget.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  HomeScreen({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final String userID = widget.user?.email ?? 'Guest';
    final String userName = widget.user?.displayName ?? "Guest";
    final String userPhoto = widget.user?.photoURL ?? "Guest";
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    int _selectedIndex = 0;

    void _onBottomNavTapped(BottomBarEnum type) {
      setState(() {
        _selectedIndex = type.index; // Update selected index based on enum
        // pageController.jumpToPage(_selectedIndex); // Move the PageView
      });
    }

    return SafeArea(
      child: SizedBox(
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
                                      SizedBox(height: screenHeight * 0.02),
                                      _buildWelcomeUser(
                                          context, screenHeight, screenWidth),
                                      SizedBox(height: screenHeight * 0.03),
                                      MoodSelect(
                                        userID: userID,
                                      ),
                                      SizedBox(height: screenHeight * 0.02),
                                      FactOfTheDayWidget(),
                                      SizedBox(height: screenHeight * 0.02),
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
    );
  }

  Widget _buildWelcomeUser(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    final String userID = widget.user?.email ?? 'Guest';
    final String userName = widget.user?.displayName ?? "Guest";
    final String userPhoto = widget.user?.photoURL ?? "Guest";
    void _onTap() {
      // Show the confirmation dialog
      showDialog(
        context: context,
        barrierDismissible:
            true, // Allows dismissing the dialog by tapping outside
        builder: (BuildContext context) {
          return LogoutDialog(
            userID: userID,
            userName: userName,
            userPhoto: userPhoto,
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                        text: "${userName}\n",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: appTheme.deepOrange300,
                        ),
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
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _onTap,
                child: CircleAvatar(
                  radius: screenWidth * 0.075,
                  backgroundImage: NetworkImage(userPhoto),
                ),
              ),
            ),
          ],
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
}
