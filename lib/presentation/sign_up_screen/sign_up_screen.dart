// import 'package:flutter/material.dart';
// import '../../core/app_export.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_text_form_field.dart';

// // ignore_for_file: must_be_immutable
// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({Key? key}) : super(key: key);

//   TextEditingController emailInputController = TextEditingController();
//   TextEditingController fullNameInputController = TextEditingController();
//   TextEditingController mobileInputController = TextEditingController();
//   TextEditingController passwordInputController = TextEditingController();
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.gray90005,
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
//                         margin: EdgeInsets.only(left: 4.h, top: 16.h),
//                         padding: EdgeInsets.symmetric(horizontal: 18.h),
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(ImageConstant.imgGroup4),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgGroup371,
//                               height: 242.h,
//                               width: double.maxFinite,
//                               margin: EdgeInsets.only(left: 26.h, right: 24.h),
//                             ),
//                             SizedBox(height: 60.h),
//                             Text(
//                               "Sign up",
//                               style: theme.textTheme.displayMedium,
//                             ),
//                             SizedBox(height: 14.h),
//                             _buildEmailInput(context),
//                             SizedBox(height: 14.h),
//                             _buildFullNameInput(context),
//                             SizedBox(height: 18.h),
//                             _buildMobileInput(context),
//                             SizedBox(height: 18.h),
//                             _buildPasswordInput(context),
//                             SizedBox(height: 36.h),
//                             Container(
//                               width: 318.h,
//                               margin: EdgeInsets.only(left: 4.h),
//                               child: RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text:
//                                           "By Signing up, you're agreeing to our ",
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                     TextSpan(
//                                       text: "Terms & Conditions",
//                                       style: CustomTextStyles.bodyMediumBlue700,
//                                     ),
//                                     TextSpan(
//                                       text: " and ",
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                     TextSpan(
//                                       text: "Privacy Policy",
//                                       style: CustomTextStyles.bodyMediumBlue700,
//                                     ),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.left,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             SizedBox(height: 24.h),
//                             _buildContinueButton(context),
//                             SizedBox(height: 12.h),
//                             Align(
//                               alignment: Alignment.center,
//                               child: RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: "Joined before? ",
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                     TextSpan(
//                                       text: "Login",
//                                       style: CustomTextStyles.bodyMediumBlue700,
//                                     ),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.left,
//                               ),
//                             ),
//                             SizedBox(height: 54.h),
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
//   Widget _buildEmailInput(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 4.h),
//       child: CustomTextFormField(
//         width: 202.h,
//         controller: emailInputController,
//         hintText: "itsnaeemanjum@gmail.com",
//         textInputType: TextInputType.emailAddress,
//         contentPadding: EdgeInsets.all(12.h),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildFullNameInput(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 4.h),
//       child: CustomTextFormField(
//         width: 70.h,
//         controller: fullNameInputController,
//         hintText: "Full name",
//         contentPadding: EdgeInsets.all(12.h),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildMobileInput(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 4.h),
//       child: CustomTextFormField(
//         width: 50.h,
//         controller: mobileInputController,
//         hintText: "Mobile",
//         textInputType: TextInputType.phone,
//         contentPadding: EdgeInsets.all(12.h),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildPasswordInput(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 4.h),
//       child: CustomTextFormField(
//         width: 72.h,
//         controller: passwordInputController,
//         hintText: "Password",
//         textInputAction: TextInputAction.done,
//         textInputType: TextInputType.visiblePassword,
//         obscureText: true,
//         contentPadding: EdgeInsets.all(12.h),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildContinueButton(BuildContext context) {
//     return CustomElevatedButton(
//       text: "Continue",
//       margin: EdgeInsets.only(left: 2.h, right: 4.h),
//     );
//   }
// }
