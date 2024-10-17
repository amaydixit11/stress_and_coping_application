// import 'package:flutter/material.dart';
// import '../../core/app_export.dart';
// import '../../widgets/app_bar/appbar_title_image.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_bottom_bar.dart';
// import '../../widgets/custom_search_view.dart';

// // ignore_for_file: must_be_immutable
// class PracticalGuidesScreen extends StatelessWidget {
//   PracticalGuidesScreen({Key? key}) : super(key: key);

//   TextEditingController searchController = TextEditingController();
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SizedBox(
//           width: double.maxFinite,
//           child: SingleChildScrollView(
//             child: Container(
//               height: 982.h,
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   CustomImageView(
//                     imagePath: ImageConstant.imgEllipse179508x182,
//                     height: 508.h,
//                     width: 184.h,
//                   ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       height: 850.h,
//                       child: Stack(
//                         alignment: Alignment.bottomCenter,
//                         children: [
//                           Align(
//                             alignment: Alignment.topCenter,
//                             child: Container(
//                               width: double.maxFinite,
//                               decoration: BoxDecoration(
//                                 color: appTheme.blueGray900,
//                                 borderRadius: BorderRadiusStyle.roundedBorder30,
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   SizedBox(
//                                     width: double.maxFinite,
//                                     child: Opacity(
//                                       opacity: 0.5,
//                                       child: Container(
//                                         width: double.maxFinite,
//                                         decoration: BoxDecoration(
//                                           color: appTheme.gray90087,
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               width: double.maxFinite,
//                                               padding: EdgeInsets.symmetric(
//                                                   vertical: 24.h),
//                                               decoration: BoxDecoration(
//                                                 color: appTheme.teal900,
//                                                 borderRadius: BorderRadiusStyle
//                                                     .roundedBorder16,
//                                               ),
//                                               child: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   SizedBox(
//                                                     width: double.maxFinite,
//                                                     child:
//                                                         _buildAppBar(context),
//                                                   ),
//                                                   SizedBox(height: 12.h),
//                                                   Container(
//                                                     width: double.maxFinite,
//                                                     margin:
//                                                         EdgeInsets.symmetric(
//                                                             horizontal: 22.h),
//                                                     child: Column(
//                                                       children: [
//                                                         _buildSearchSection(
//                                                             context),
//                                                         SizedBox(height: 14.h),
//                                                         SizedBox(
//                                                           width:
//                                                               double.maxFinite,
//                                                           child:
//                                                               _buildContentSectionTwo(
//                                                             context,
//                                                             userImage:
//                                                                 ImageConstant
//                                                                     .imgImage3,
//                                                             titleText:
//                                                                 "How to deal with Stress",
//                                                             descriptionText:
//                                                                 "Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah",
//                                                           ),
//                                                         ),
//                                                         SizedBox(height: 14.h),
//                                                         SizedBox(
//                                                           width:
//                                                               double.maxFinite,
//                                                           child:
//                                                               _buildContentSectionTwo(
//                                                             context,
//                                                             userImage:
//                                                                 ImageConstant
//                                                                     .imgImage4,
//                                                             titleText:
//                                                                 "How to deal with Stress",
//                                                             descriptionText:
//                                                                 "Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah",
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 116.h),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 42.h),
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
//         bottomNavigationBar: Container(
//           width: double.maxFinite,
//           margin: EdgeInsets.symmetric(horizontal: 74.h),
//           child: _buildBottomBar(context),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       title: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.h),
//         child: Row(
//           children: [
//             AppbarTitleImage(
//               imagePath: ImageConstant.imgGroup2610030,
//               margin: EdgeInsets.symmetric(vertical: 5.h),
//             ),
//             Spacer(),
//             AppbarTitleImage(
//               imagePath: ImageConstant.imgUser,
//               margin: EdgeInsets.only(left: 99.h),
//             ),
//             AppbarTitleImage(
//               imagePath: ImageConstant.imgFrame,
//               margin: EdgeInsets.only(left: 100.h, top: 7.h, bottom: 7.h),
//             ),
//           ],
//         ),
//       ),
//       bottom: PreferredSize(
//         preferredSize: Size.fromHeight(5.h),
//         child: Divider(
//           color: appTheme.gray700,
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildSearchSection(BuildContext context) {
//     return SizedBox(
//       width: double.maxFinite,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Practical guides",
//             style: theme.textTheme.titleLarge,
//           ),
//           SizedBox(height: 10.h),
//           CustomSearchView(
//             controller: searchController,
//             hintText: "Search",
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 8.h,
//               vertical: 6.h,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildFooterNavigation(BuildContext context) {
//     return Container(
//       height: 214.h,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 24.h),
//                   width: double.maxFinite,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           width: double.maxFinite,
//                           decoration: BoxDecoration(
//                             color: appTheme.blueGray100,
//                             borderRadius: BorderRadiusStyle.roundedBorder34,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CustomImageView(
//                                 imagePath: ImageConstant.imgImage5,
//                                 height: 152.h,
//                                 width: double.maxFinite,
//                                 radius: BorderRadius.vertical(
//                                   top: Radius.circular(30.h),
//                                 ),
//                               ),
//                               SizedBox(height: 60.h),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   /// Common widget
//   Widget _buildContentSectionTwo(BuildContext context,
//       {required String userImage,
//       required String titleText,
//       required String descriptionText}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: appTheme.gray90004,
//         borderRadius: BorderRadiusStyle.roundedBorder34,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 152.h,
//             width: double.maxFinite,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CustomImageView(
//                   imagePath: userImage,
//                   height: 152.h,
//                   width: double.maxFinite,
//                   radius: BorderRadius.vertical(
//                     top: Radius.circular(30.h),
//                   ),
//                 ),
//                 CustomImageView(
//                   imagePath: ImageConstant.imgOverflowMenu,
//                   height: 42.h,
//                   width: 44.h,
//                   alignment: Alignment.bottomCenter,
//                   margin: EdgeInsets.only(bottom: 46.h),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 2.h),
//           Padding(
//             padding: EdgeInsets.only(left: 24.h),
//             child: Text(
//               titleText,
//               style: theme.textTheme.titleSmall!.copyWith(
//                 color: theme.colorScheme.onErrorContainer.withOpacity(1),
//               ),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           Container(
//             width: 254.h,
//             margin: EdgeInsets.only(left: 24.h),
//             child: Text(
//               descriptionText,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: theme.textTheme.bodySmall!.copyWith(
//                 color: appTheme.gray600,
//                 height: 1.08,
//               ),
//             ),
//           ),
//           SizedBox(height: 6.h),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildBottomBar(BuildContext context) {
//     return CustomBottomBar(
//       onChanged: (BottomBarEnum type) {
//         // Handle bottom bar navigation
//       },
//     );
//   }
// }
