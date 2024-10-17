// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../core/app_export.dart';

// class OnBoardingTwoScreen extends StatelessWidget {
//   const OnBoardingTwoScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.gray900,
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
//                   ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       height: 830.h,
//                       margin: EdgeInsets.only(top: 18.h),
//                       child: Stack(
//                         alignment: Alignment.bottomCenter,
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Container(
//                               width: double.maxFinite,
//                               margin: EdgeInsets.only(left: 4.h),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 22.h, vertical: 78.h),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage(ImageConstant.imgGroup4),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   _buildMentalHealthJourneySection(context),
//                                   SizedBox(height: 468.h),
//                                   Container(
//                                     width: double.maxFinite,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 22.h, vertical: 38.h),
//                                     decoration: BoxDecoration(),
//                                     color: appTheme.gray90004,
//                                     borderRadius:
//                                         BorderRadiusStyle.roundedBorder70,
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         CustomImageView(
//                                           imagePath: ImageConstant.imgImage176,
//                                           height: 254.h,
//                                           width: double.maxFinite,
//                                           radius: BorderRadius.circular(64.h),
//                                           margin: EdgeInsets.only(left: 6.h),
//                                         ),
//                                         SizedBox(height: 14.h),
//                                         Text(
//                                           "Next",
//                                           style: theme.textTheme.headlineLarge,
//                                         ),
//                                         SizedBox(height: 12.h),
//                                         AnimatedSmoothIndicator(
//                                           activeIndex: 0,
//                                           count: 2,
//                                           effect: ScrollingDotsEffect(
//                                             spacing: 16,
//                                             activeDotColor: theme
//                                                 .colorScheme.onErrorContainer
//                                                 .withOpacity(1),
//                                             dotHeight: 12.h,
//                                             dotWidth: 12.h,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 118.h),
//                                 ],
//                               ),
//                             ),
//                           ),
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
//   Widget _buildMentalHealthJourneySection(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.only(right: 4.h),
//       padding: EdgeInsets.symmetric(horizontal: 14.h),
//       child: Column(
//         children: [
//           Text(
//             "Are You Ready to Start your journey of Mental Health?",
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//             style: theme.textTheme.headlineLarge!.copyWith(
//               height: 1.30,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
