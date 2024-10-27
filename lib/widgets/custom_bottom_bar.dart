import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Home, Chatroom, Relax, Resources, Profile }

class CustomBottomBar extends StatefulWidget {
  final int selectedIndex;
  final Function(BottomBarEnum)? onChanged;

  CustomBottomBar({Key? key, required this.selectedIndex, this.onChanged})
      : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;

    return Container(
      height: screenHeight * 0.09,
      decoration: BoxDecoration(
        color: appTheme.gray90004,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: _bottomMenuList.map((menu) {
          return BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: widget.selectedIndex == _bottomMenuList.indexOf(menu)
                    ? Color(0xFFB5F2FF)
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.fromLTRB(6.0, 0, 6.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    menu.icon,
                    color: const Color(0XFFD9D9D9),
                    size: 24,
                  ),
                  Text(
                    menu.title ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(
                color: Color(0xFFB5F2FF),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.fromLTRB(8.0, 0.5, 8.0, 0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    menu.activeIcon,
                    color: Colors.white,
                    size: 24,
                  ),
                  Text(
                    menu.title ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            label: "",
          );
        }).toList(),
        onTap: (index) {
          if (widget.onChanged != null) {
            widget.onChanged!(_bottomMenuList[index].type);
          }
        },
      ),
    );
  }

  static List<BottomMenuModel> get _bottomMenuList => [
        BottomMenuModel(
          icon: Icons.home,
          activeIcon: Icons.home,
          title: "Home",
          type: BottomBarEnum.Home,
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
