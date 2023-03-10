import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meko/Ui/Pages/Home.dart';
import 'package:meko/Ui/Pages/Profile.dart';
import 'package:meko/Ui/Pages/Refer.dart';
import 'package:meko/Ui/Pages/Task.dart';
import 'package:meko/Widgets/Colors.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

// connect pages with icons in navbar--------------------------------------

  final pages = [
    HomePage(),
    TaskPage(),
    ReferPage(),
    ProfilePage(),
  ];

// which icon will show first while opening the app-------------------------
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
//!Icons used for NavBar--------------------------------------------------------

      // ignore: deprecated_member_use
      FaIcon(FontAwesomeIcons.home),
      Icon(
        Icons.task,
        size: 30,
      ),

      Icon(
        Icons.child_friendly_sharp,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
// Icons used for NavBar--------------------------------------------------------
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Theme(
          // to change Icon color----------------------------------------------------
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.black)),
          // to change Icon color----------------------------------------------------

          child: CurvedNavigationBar(
            key: navigationKey,
            color: bgcolor,
            buttonBackgroundColor: bggrey,
            backgroundColor: Colors.white,

            // to change Icon animation speed----------------------------------------------------
            animationCurve: Curves.easeInOut,
            // animationDuration: Duration(microseconds: 100),
            // to change Icon animation speed----------------------------------------------------

            index: index,
            items: items,
            height: 60,
            // while tab on the icon
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
        body: pages[index],
      ),
    );
  }
}
