import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:app_final/core/constants/constants.dart';

class AppCurvedNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  AppCurvedNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      height: 60.0,
      items: <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.restaurant_menu, size: 30, color: Colors.white),
        Icon(Icons.category, size: 30, color: Colors.white),
        Icon(Icons.photo_library, size: 30, color: Colors.white),
      ],
      color: Color(AppConstants.primaryColor),
      buttonBackgroundColor: Color(AppConstants.secondaryColor),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: onTap,
    );
  }
}