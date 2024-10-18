import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:stress_and_coping_application/presentation/home_screen/home_screen.dart';
import 'package:stress_and_coping_application/presentation/sign_up_screen/sign_up_screen.dart';
import '../../core/app_export.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

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
      height: screenHeight,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            "Login",
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.1,
            ),
          ),
          _buildContactInfoRow(context),
          _buildPasswordRow(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          _buildForgotPasswordColumn(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _buildContinueButton(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          _buildGoogleLoginButton(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _buildRegisterPromptColumn(context),
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
            imagePath: ImageConstant.imgGroup,
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
    final iconSize = screenWidth * 0.05;
    final horizontalPadding = screenWidth * 0.01;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCall,
            height: iconSize,
            width: iconSize * 1.17,
            margin: EdgeInsets.only(top: 20),
          ),
          SizedBox(width: horizontalPadding * 0.5),
          _buildEmail(context),
        ],
      ),
    );
  }

  Widget _buildEmail(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Email ID or Mobile",
        textInputType: TextInputType.emailAddress,
        contentPadding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03,
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
      ),
    );
  }

  Widget _buildPasswordRow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.05;

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgBag,
            height: iconSize,
            width: iconSize * 1.17,
            margin: EdgeInsets.only(top: 20),
          ),
          SizedBox(width: screenWidth * 0.03),
          _buildPasswordInput(context, screenWidth),
        ],
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context, double screenWidth) {
    return Expanded(
      child: CustomTextFormField(
        controller: passwordInputController,
        hintText: "Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03,
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
      ),
    );
  }

  Widget _buildForgotPasswordColumn(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    void _onTap() {
      // Navigate to login page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPasswordScreen(),
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: _onTap,
          child: Text(
            "Forgot password?",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    void _onPressed() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    return CustomElevatedButton(
      text: "Continue",
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
      onPressed: _onPressed,
    );
  }

  Widget _buildGoogleLoginButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomElevatedButton(
      text: "Login with Google",
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      leftIcon: Container(
        margin: EdgeInsets.only(right: screenWidth * 0.075),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: screenWidth * 0.045,
          width: screenWidth * 0.045,
          fit: BoxFit.contain,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: CustomTextStyles.bodyLargeBlack90001?.copyWith(
        fontSize: screenWidth * 0.04,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      width: screenWidth * 0.9,
      height: screenWidth * 0.12,
      onPressed: () => onTapGoogleLoginButton(context),
    );
  }

  Widget _buildFacebookLoginButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomElevatedButton(
      text: "Login with Facebook",
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      leftIcon: Container(
        margin: EdgeInsets.only(right: screenWidth * 0.075),
        child: CustomImageView(
          imagePath: ImageConstant.imgFacebook,
          height: screenWidth * 0.045,
          width: screenWidth * 0.045,
          fit: BoxFit.contain,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: CustomTextStyles.bodyLargeBlack90001?.copyWith(
        fontSize: screenWidth * 0.04,
      ),
      width: screenWidth * 0.9,
      height: screenWidth * 0.12,
      onPressed: () => onTapFacebookLoginButton(context),
    );
  }

  Widget _buildRegisterPromptColumn(BuildContext context) {
    // TODO: Center the text
    final screenWidth = MediaQuery.of(context).size.width;

    void _onTap() {
      // Navigate to login page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 0),
      padding: EdgeInsets.only(right: screenWidth * 0.15),
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: _onTap,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "New to us? ",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                TextSpan(
                  text: " Register",
                  style: CustomTextStyles.titleSmallPlusJakartaSans?.copyWith(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTapGoogleLoginButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User data is empty')),
        );
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(onError.toString())),
      );
    });
  }

  Future<void> onTapFacebookLoginButton(BuildContext context) async {
    print("Facebook Login!!!!");
  }
}
