// import 'package:flutter/material.dart';
// import '../../core/app_export.dart';
// import '../../domain/facebookauth/facebook_auth_helper.dart';
// import '../../domain/googleauth/google_auth_helper.dart';
// import '../../theme/custom_button_style.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_text_form_field.dart';

// // ignore_for_file: must_be_immutable
// class SignInScreen extends StatelessWidget {
//   SignInScreen({Key? key}) : super(key: key);

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordInputController = TextEditingController();
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.gray900,
//         body: Form(
//           key: _formKey,
//           child: SizedBox(
//             width: double.maxFinite,
//             child: SingleChildScrollView(
//               child: Container(
//                 height: 946.h,
//                 child: Stack(
//                   alignment: Alignment.bottomLeft,
//                   children: [
//                     CustomImageView(
//                       imagePath: ImageConstant.imgEllipse179,
//                       height: 440.h,
//                       width: 176.h,
//                       alignment: Alignment.topLeft,
//                     ),
//                     CustomImageView(
//                       imagePath: ImageConstant.imgEllipse181,
//                       height: 528.h,
//                       width: 222.h,
//                       alignment: Alignment.topRight,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         width: double.maxFinite,
//                         margin: EdgeInsets.only(left: 4.h, top: 18.h),
//                         padding: EdgeInsets.symmetric(horizontal: 8.h),
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(ImageConstant.imgGroup4),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             _buildImageSection(context),
//                             SizedBox(height: 52.h),
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Login",
//                                 style: theme.textTheme.displayMedium,
//                               ),
//                             ),
//                             SizedBox(height: 6.h),
//                             _buildContactInfoRow(context),
//                             SizedBox(height: 14.h),
//                             _buildRowBagOne(context),
//                             SizedBox(height: 8.h),
//                             _buildForgotPasswordColumn(context),
//                             SizedBox(height: 20.h),
//                             _buildContinueButton(context),
//                             SizedBox(height: 48.h),
//                             _buildGoogleLoginButton(context),
//                             SizedBox(height: 6.h),
//                             _buildFacebookLoginButton(context),
//                             SizedBox(height: 18.h),
//                             _buildRegisterPromptColumn(context),
//                             SizedBox(height: 60.h),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildImageSection(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.only(left: 14.h, right: 20.h),
//       padding: EdgeInsets.symmetric(horizontal: 8.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgGroup,
//             height: 246.h,
//             width: double.maxFinite,
//             margin: EdgeInsets.only(left: 8.h),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildEmail(BuildContext context) {
//     return Expanded(
//       child: CustomTextFormField(
//         controller: emailController,
//         hintText: "Email ID or Mobile",
//         textInputType: TextInputType.emailAddress,
//         alignment: Alignment.center,
//         contentPadding: EdgeInsets.fromLTRB(2.h, 12.h, 2.h, 4.h),
//         borderDecoration: TextFormFieldStyleHelper.underlineGray,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildContactInfoRow(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.only(left: 6.h, right: 4.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgCall,
//             height: 12.h,
//             width: 14.h,
//             margin: EdgeInsets.only(top: 4.h),
//           ),
//           SizedBox(width: 12.h),
//           _buildEmail(context),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildPasswordInput(BuildContext context) {
//     return Expanded(
//       child: CustomTextFormField(
//         controller: passwordInputController,
//         hintText: "Password",
//         textInputAction: TextInputAction.done,
//         textInputType: TextInputType.visiblePassword,
//         alignment: Alignment.center,
//         obscureText: true,
//         contentPadding: EdgeInsets.fromLTRB(2.h, 12.h, 2.h, 4.h),
//         borderDecoration: TextFormFieldStyleHelper.underlineGray,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildRowBagOne(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.only(left: 6.h, right: 4.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgBag,
//             height: 12.h,
//             width: 14.h,
//             margin: EdgeInsets.only(top: 4.h),
//           ),
//           SizedBox(width: 12.h),
//           _buildPasswordInput(context),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildForgotPasswordColumn(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.symmetric(horizontal: 16.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             "Forgot password?",
//             style: theme.textTheme.bodyMedium,
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildContinueButton(BuildContext context) {
//     return CustomElevatedButton(
//       text: "Continue",
//       margin: EdgeInsets.only(left: 8.h, right: 4.h),
//     );
//   }

//   /// Section Widget
//   Widget _buildGoogleLoginButton(BuildContext context) {
//     return CustomElevatedButton(
//       text: "Login with Google",
//       margin: EdgeInsets.only(left: 8.h, right: 4.h),
//       leftIcon: Container(
//         margin: EdgeInsets.only(right: 30.h),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgGoogle,
//           height: 18.h,
//           width: 18.h,
//           fit: BoxFit.contain,
//         ),
//       ),
//       buttonStyle: CustomButtonStyles.fillGray,
//       buttonTextStyle: CustomTextStyles.bodyLargeBlack90001,
//       onPressed: () {},
//     );
//   }

//   /// Section Widget
//   Widget _buildFacebookLoginButton(BuildContext context) {
//     return CustomElevatedButton(
//       text: "Login with Facebook",
//       margin: EdgeInsets.only(left: 8.h, right: 4.h),
//       leftIcon: Container(
//         margin: EdgeInsets.only(right: 30.h),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgFacebook,
//           height: 18.h,
//           width: 18.h,
//           fit: BoxFit.contain,
//         ),
//       ),
//       buttonStyle: CustomButtonStyles.fillGray,
//       buttonTextStyle: CustomTextStyles.bodyLargeBlack90001,
//       onPressed: () {},
//     );
//   }

//   /// Section Widget
//   Widget _buildRegisterPromptColumn(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.only(left: 14.h, right: 20.h),
//       padding: EdgeInsets.only(right: 88.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "New to us?",
//                   style: theme.textTheme.bodyMedium,
//                 ),
//                 TextSpan(
//                   text: "Register",
//                   style: CustomTextStyles.titleSmallPlusJakartaSans,
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.left,
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> onTapGoogleLoginButton(BuildContext context) async {
//     await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
//       if (googleUser != null) {
//         // Do something with the Google user
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('User data is empty')),
//         );
//       }
//     }).catchError((onError) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(onError.toString())),
//       );
//     });
//   }

//   Future<void> onTapFacebookLoginButton(BuildContext context) async {
//     await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
//       // Do something with the Facebook user
//     }).catchError((onError) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(onError.toString())),
//       );
//     });
//   }
// }
