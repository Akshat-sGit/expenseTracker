import 'package:expense_tracker/view/add_expense_screen.dart';
import 'package:expense_tracker/view/home_screen.dart';
// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../config/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String id = 'Main';

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: AppColors.tertiaryColor.withOpacity(0.25),
        activeColor: AppColors.accentColor,
        inactiveColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.home_outline,
              size: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.add_circle_outline,
              size: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.wallet_outline,
              size: 24.0,
            ),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return const HomeScreen();
              case 1:
                return const AddExpense(); 
              case 2:
                return Scaffold(
                  body: Container(
                    color: AppColors.backgroundColor,
                    child: const Center(
                      child: Text(
                        'Wallet',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              default:
                return const HomeScreen();
            }
          },
        );
      },
    );
  }
}
