import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/sign_in_screen/sign_in_screen.dart';
import '../../core/app_export.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray900,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                _buildTopLeftImage(screenHeight),
                _buildCenterImage(screenHeight),
                _buildContent(screenHeight, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopLeftImage(double screenHeight) {
    return CustomImageView(
      imagePath: ImageConstant.imgEllipse179,
      // height: screenHeight * 0.46,
      height: screenHeight,
      // width: screenHeight * 0.18,
      width: screenHeight,
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

  Widget _buildContent(double screenHeight, BuildContext context) {
    return Container(
      height: screenHeight * 1,
      width: double.infinity,
      margin: EdgeInsets.only(left: screenHeight * 0.005),
      padding: EdgeInsets.symmetric(
        horizontal: screenHeight * 0.02,
        vertical: screenHeight * 0.10,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.imgGroup4),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            "Reset",
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.1,
            ),
          ),
          Text(
            "Password",
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.1,
            ),
          ),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          // _buildSubText(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          _buildContactInfoRow(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          _buildChangePasswordButton(context),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.001,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgResetPasswordGroup,
            height: screenHeight * 0.3,
            width: screenWidth * 0.9,
            margin: EdgeInsets.only(left: screenWidth * 0.02),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoRow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final verticalSpacing = screenWidth * 0.0005;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(context, "New Password"),
          _buildTextField(context, "Confirm Password"),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String text) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomTextFormField(
      controller: emailController,
      hintText: text,
      textInputType:
          text == "Email" ? TextInputType.emailAddress : TextInputType.text,
      contentPadding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.02,
        horizontal: screenWidth * 0.04,
      ),
      borderDecoration: TextFormFieldStyleHelper.underlineGray,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.04,
        color: appTheme.gray900,
      ),
      hintStyle: TextStyle(
        fontSize: screenWidth * 0.035,
        color: appTheme.gray600,
      ),
    );
  }

  Widget _buildSubText(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Don’t Worry it happens. Please Enter an email or Mobile associated with your account",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: screenWidth * 0.033,
          ),
        ),
      ),
    );
  }

  Widget _buildChangePasswordButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomElevatedButton(
      text: "Change Password",
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      buttonTextStyle: CustomTextStyles.bodyLargeBlack90001?.copyWith(
        fontSize: screenWidth * 0.045,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF003257),
        borderRadius: BorderRadius.circular(10),
      ),
      width: screenWidth * 0.9,
      height: screenWidth * 0.12,
      onPressed: () {},
    );
  }
}
