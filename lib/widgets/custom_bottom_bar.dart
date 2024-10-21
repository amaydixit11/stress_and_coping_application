import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/presentation/home_screen/home_screen.dart';
import 'package:stress_and_coping_application/presentation/relax_screen/relax_screen.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Chatroom, Relax, Resources, Profile, Home }

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

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onChanged?.call(bottomMenuList[index].type);

    // Navigate to the respective screen
    switch (bottomMenuList[index].type) {
      case BottomBarEnum.Home:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case BottomBarEnum.Chatroom:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case BottomBarEnum.Relax:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RelaxScreen()));
        break;
      case BottomBarEnum.Resources:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case BottomBarEnum.Profile:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
    }
  }

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
                    color: selectedIndex == bottomMenuList.indexOf(menu)
                        ? appTheme.gray90004
                        : Colors.white,
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
        onTap: _onItemTapped,
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
