import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/on_boarding_one_screen/widgets/circles_painter_widget.dart';
import '../../core/app_export.dart';

class OnBoardingOneScreen extends StatefulWidget {
  const OnBoardingOneScreen({super.key});

  @override
  State<OnBoardingOneScreen> createState() => _OnBoardingOneScreenState();
}

class _OnBoardingOneScreenState extends State<OnBoardingOneScreen> {
  String _displayText = "Welcome";
  String _displayImage = ImageConstant.imgImage;

  void _changeScreen() {
    setState(() {
      _displayText = _displayText == "Welcome"
          ? "Are You Ready to Start your journey of Mental Health?"
          : "Welcome";
    });
    setState(() {
      _displayImage = _displayImage == ImageConstant.imgImage
          ? ImageConstant.imgImage176
          : ImageConstant.imgImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray900,
        body: SizedBox(
          width: double.infinity,
          // child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                _buildTopLeftImage(screenHeight),
                _buildCenterImage(screenHeight),
                _buildContent(screenHeight),
              ],
            ),
          ),
          // ),
        ),
      ),
    );
  }

  Widget _buildTopLeftImage(double screenHeight) {
    return CustomImageView(
      imagePath: ImageConstant.imgEllipse179,
      height: screenHeight * 0.46,
      width: screenHeight * 0.18,
      alignment: Alignment.topLeft,
    );
  }

  Widget _buildCenterImage(double screenHeight) {
    return CustomImageView(
      imagePath: ImageConstant.imgEllipse181,
      height: screenHeight * 0.55,
      width: screenHeight * 0.24,
    );
  }

  Widget _buildContent(double screenHeight) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: screenHeight * 1,
        margin: EdgeInsets.only(top: screenHeight * 0.02),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildWelcomeContainer(screenHeight),
            _buildNextSectionContainer(screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeContainer(double screenHeight) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: screenHeight * 0.005),
        padding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.02,
          vertical: screenHeight * 0.12,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.imgGroup4),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildWelcomeSection(),
            SizedBox(height: screenHeight * 0.5),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        children: [
          Text(
            // "Are You Ready to Start your journey of Mental Health?",
            // "Welcome",
            _displayText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge!.copyWith(
              height: 1.30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextSectionContainer(double screenHeight) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenHeight * 0.03,
        vertical: screenHeight * 0.04,
      ),
      decoration: BoxDecoration(
        color: appTheme.gray90004,
        // borderRadius: BorderRadiusStyle.roundedBorder70,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70.0), // Top left rounded
          topRight: Radius.circular(70.0), // Top right rounded
          bottomLeft: Radius.circular(0), // Bottom left unrounded
          bottomRight: Radius.circular(0), // Bottom right unrounded
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildNextSection(screenHeight),
          SizedBox(height: screenHeight * 0.07),
        ],
      ),
    );
  }

  Widget _buildNextSection(double screenHeight) {
    void _onTap() {
      _changeScreen();
    }

    return Column(
      children: [
        CustomImageView(
          imagePath: _displayImage,
          height: screenHeight * 0.30,
          width: double.infinity,
          radius: BorderRadius.circular(screenHeight * 0.075),
          fit: BoxFit.contain, // Ensure the whole image is visible
        ),
        SizedBox(height: screenHeight * 0.015),
        GestureDetector(
          onTap: _onTap, // Tap handler
          child: Text(
            "Next",
            style: theme.textTheme.headlineLarge,
          ),
        ),
        // CustomImageView(
        //   imagePath: ImageConstant.imgSettings,
        //   height: screenHeight * 0.013,
        //   width: screenHeight * 0.05,
        // ),
        SizedBox(height: screenHeight * 0.02),
        Circles(screenHeight), // Custom SVG circle widget for the circles
      ],
    );
  }

  Widget Circles(double screenHeight) {
    return Container(
      width: 42, // Same width as in the SVG
      height: 13, // Same height as in the SVG
      child: CustomPaint(
        painter: CirclesPainter(),
      ),
    );
  }
}
