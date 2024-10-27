import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/chatroom_screen/chatroom_screen.dart';
import '../presentation/resources_screen/resources_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/on_boarding_one_screen/on_boarding_one_screen.dart';
// import '../presentation/on_boarding_two_screen/on_boarding_two_screen.dart';
// import '../presentation/practical_guides_screen/practical_guides_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/relax_screen/relax_screen.dart';
import '../presentation/forgot_password_screen/forgot_password_screen.dart';
import '../presentation/sign_in_screen/sign_in_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String onBoardingOneScreen = '/on_boarding_one_screen';
  static const String onBoardingTwoScreen = '/on_boarding_two_screen';
  static const String signInScreen = '/sign_in_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String chatroomScreen = '/chatroom_screen';
  static const String profileScreen = '/profile_screen';
  static const String profileInitialPage = '/profile_initial_page';
  static const String homeScreen = '/home_screen';
  static const String relaxScreen = '/relax_screen';
  static const String educationalContentScreen = '/educational_content_screen';
  static const String practicalGuidesScreen = '/practical_guides_screen';
  static const String supportResourcesPage = '/support_resources_page';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    onBoardingOneScreen: (context) => OnBoardingOneScreen(),
    // onBoardingTwoScreen: (context) => OnBoardingTwoScreen(),
    // signInScreen: (context) => SignInScreen(),
    // signUpScreen: (context) => SignUpScreen(),
    // resetPasswordScreen: (context) => ResetPasswordScreen(),
    // chatroomScreen: (context) => ChatroomScreen(),
    // profileScreen: (context) => ProfileScreen(),
    // homeScreen: (context) => HomeScreen(),
    // relaxScreen: (context) => RelaxScreen(),
    // educationalContentScreen: (context) => EducationalContentScreen(),
    // practicalGuidesScreen: (context) => PracticalGuidesScreen(),
    // appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => OnBoardingOneScreen(),
  };
}
