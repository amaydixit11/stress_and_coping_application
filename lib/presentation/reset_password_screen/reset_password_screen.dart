// import 'package:flutter/material.dart';
// import '../../core/app_export.dart';
// import '../../widgets/custom_elevated_button.dart';

// class ResetPasswordScreen extends StatelessWidget {
//   const ResetPasswordScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.gray90005,
//         body: SizedBox(
//           width: double.maxFinite,
//           child: SingleChildScrollView(
//             child: Container(
//               height: 946.h,
//               child: Stack(
//                 alignment: Alignment.bottomLeft,
//                 children: [
//                   CustomImageView(
//                     imagePath: ImageConstant.imgEllipse179,
//                     height: 440.h,
//                     width: 176.h,
//                     alignment: Alignment.topLeft,
//                   ),
//                   CustomImageView(
//                     imagePath: ImageConstant.imgEllipse181,
//                     height: 528.h,
//                     width: 222.h,
//                     alignment: Alignment.topRight,
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: double.maxFinite,
//                       margin: EdgeInsets.only(left: 4.h, top: 18.h),
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 12.h,
//                         vertical: 10.h,
//                       ),
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(ImageConstant.imgGroup4),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           CustomImageView(
//                             imagePath: ImageConstant.imgGroup369,
//                             height: 252.h,
//                             width: double.maxFinite,
//                             margin: EdgeInsets.only(left: 8.h, right: 20.h),
//                           ),
//                           SizedBox(height: 50.h),
//                           _buildResetPasswordColumn(context),
//                           SizedBox(height: 84.h),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildResetPasswordColumn(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.only(right: 10.h),
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Reset\nPassword",
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: theme.textTheme.displayMedium!.copyWith(
//                 height: 1.20,
//               ),
//             ),
//           ),
//           SizedBox(height: 36.h),
//           Container(
//             width: double.maxFinite,
//             margin: EdgeInsets.symmetric(horizontal: 6.h),
//             child: _buildPasswordRow(
//               context,
//               passwordText: "New Password",
//             ),
//           ),
//           SizedBox(height: 28.h),
//           Container(
//             width: double.maxFinite,
//             margin: EdgeInsets.symmetric(horizontal: 6.h),
//             child: _buildPasswordRow(
//               context,
//               passwordText: "Confirm Password",
//             ),
//           ),
//           SizedBox(height: 88.h),
//           CustomElevatedButton(
//             height: 40.h,
//             text: "Change Password",
//             margin: EdgeInsets.only(left: 6.h),
//             onPressed: () {
//               // Add your onPressed logic here
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   /// Common widget
//   Widget _buildPasswordRow(BuildContext context,
//       {required String passwordText}) {
//     return Row(
//       children: [
//         CustomImageView(
//           imagePath: ImageConstant.imgBag,
//           height: 12.h,
//           width: 12.h,
//           alignment: Alignment.bottomCenter,
//           margin: EdgeInsets.only(bottom: 2.h),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 14.h),
//           child: Text(
//             passwordText,
//             style: theme.textTheme.bodyLarge!.copyWith(
//               color: theme.colorScheme.onErrorContainer.withOpacity(1),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
