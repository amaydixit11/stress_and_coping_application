import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Chatroom, Relax, Resources, Profile }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  final Function(BottomBarEnum)? onChanged;

  CustomBottomBar({Key? key, this.onChanged}) : super(key: key);

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavChatroomBlueGray100,
      activeIcon: ImageConstant.imgNavChatroomBlueGray100,
      title: "Chatroom",
      type: BottomBarEnum.Chatroom,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavChatroomBlueGray100,
      activeIcon: ImageConstant.imgNavChatroomBlueGray100,
      title: "Relax",
      type: BottomBarEnum.Relax,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavResources,
      activeIcon: ImageConstant.imgNavResources,
      title: "Resources",
      type: BottomBarEnum.Resources,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      elevation: 0,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: List.generate(bottomMenuList.length, (index) {
        return BottomNavigationBarItem(
          icon: Container(
            width: 76.h,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimaryContainer,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.h,
                  width: double.maxFinite,
                  color: const Color(0XFFD9D9D9),
                ),
                SizedBox(height: 8.h),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: const Color(0XFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
          activeIcon: Container(
            width: 90.h,
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 14.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimaryContainer,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 24.h,
                  width: 26.h,
                  color: const Color(0XFFD9D9D9),
                ),
                SizedBox(height: 8.h),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: const Color(0XFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
          label: '',
        );
      }),
      onTap: (index) {
        selectedIndex = index;
        widget.onChanged?.call(bottomMenuList[index].type);
        setState(() {});
      },
    );
  }
}

class BottomMenuModel {
  final String icon;
  final String activeIcon;
  final String? title;
  final BottomBarEnum type;

  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
