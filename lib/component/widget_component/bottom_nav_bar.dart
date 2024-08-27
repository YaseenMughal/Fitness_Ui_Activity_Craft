import 'package:calories_fitness_app/component/constant_component/color_constant.dart';
import 'package:calories_fitness_app/provider/bottom_navigation_povider.dart';
import 'package:calories_fitness_app/screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    screens = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];

    return Consumer<BottomBarProvider>(
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            items: const <Widget>[
              Icon(Icons.home, size: 30, color: AppColor.greyColor),
              Icon(Icons.calendar_month, size: 30, color: AppColor.greyColor),
              Icon(Icons.add, size: 30, color: AppColor.whiteColor),
              Icon(Icons.analytics_sharp, size: 30, color: AppColor.greyColor),
              Icon(Icons.person, size: 30, color: AppColor.greyColor),
            ],
            height: 60,
            animationDuration: const Duration(milliseconds: 700),
            backgroundColor: AppColor.whiteColor,
            color: AppColor.mainColor,
            buttonBackgroundColor: Colors.green,
            index: value.pageIndex,
            onTap: (index) => value.setpageIndex(index),
          ),
          body: screens[value.pageIndex],
        );
      },
    );
  }
}
