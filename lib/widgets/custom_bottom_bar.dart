import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Chatroom, Relax, Resources, Profile }

class CustomBottomBar extends StatefulWidget {
  final Function(BottomBarEnum)? onChanged;

  CustomBottomBar({Key? key, this.onChanged}) : super(key: key);

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Icons.home,
      activeIcon: Icons.home,
      title: "Home",
      type: BottomBarEnum.Chatroom,
    ),
    BottomMenuModel(
      icon: Icons.message_rounded,
      activeIcon: Icons.message_rounded,
      title: "Chatroom",
      type: BottomBarEnum.Chatroom,
    ),
    BottomMenuModel(
      icon: CupertinoIcons.game_controller_solid,
      activeIcon: CupertinoIcons.game_controller_solid,
      title: "Relax",
      type: BottomBarEnum.Relax,
    ),
    BottomMenuModel(
      icon: Icons.menu_book_rounded,
      activeIcon: Icons.menu_book_rounded,
      title: "Resources",
      type: BottomBarEnum.Resources,
    ),
    BottomMenuModel(
      icon: Icons.person,
      activeIcon: Icons.person,
      title: "Profile",
      type: BottomBarEnum.Profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.gray90004,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: bottomMenuList.map((menu) {
          return BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: selectedIndex == bottomMenuList.indexOf(menu)
                    ? Color(0xFFB5F2FF)
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.all(6.0),
              child: Icon(menu.icon,
                  color: const Color(0XFFD9D9D9),
                  size: 30), // Set the size here
            ),
            activeIcon: Container(
              decoration: BoxDecoration(
                color: Color(0xFFB5F2FF),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                menu.activeIcon,
                color: selectedIndex == bottomMenuList.indexOf(menu)
                    ? appTheme.gray90004
                    : Colors.white,
                size: 30, // Set the size here
              ),
            ),
            label: menu.title,
          );
        }).toList(),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onChanged?.call(bottomMenuList[index].type);
        },
      ),
    );
  }
}

class BottomMenuModel {
  final IconData icon;
  final IconData activeIcon;
  final String? title;
  final BottomBarEnum type;

  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });
}
