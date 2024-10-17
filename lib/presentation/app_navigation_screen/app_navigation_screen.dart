import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        body: SizedBox(
          width:
              375, // .h removed as not needed unless you use a specific library for responsive sizing
          child: Column(
            children: [
              Container(
                color: const Color(0XFFFFFFFF),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "App Navigation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Check your app's UI from the below demo screens of your app.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF888888),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0XFF000000),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color(0XFFFFFFFF),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "On-Boarding-One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onBoardingOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "On-Boarding-Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onBoardingTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign In",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Reset Password",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.resetPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Chat Room",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.chatroomScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Relax",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.relaxScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Educational-Content",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.educationalContentScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Practical Guides",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.practicalGuidesScreen),
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

  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    required Function onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle();
      },
      child: Container(
        color: const Color(0XFFFFFFFF),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  void onTapScreenTitle(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
