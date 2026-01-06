import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_final/core/constants/constants.dart';

class AppDrawer extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  AppDrawer({required this.currentIndex, required this.onTap});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Map<int, bool> _hoverStates = {};

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(AppConstants.primaryColor),
            ),
            child: Text(
              AppConstants.appTitle,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDrawerItem(context, 0, Icons.home, AppConstants.homeTitle),
          _buildDrawerItem(context, 1, Icons.restaurant_menu, AppConstants.recipesTitle),
          _buildDrawerItem(context, 2, Icons.category, AppConstants.categoriesTitle),
          _buildDrawerItem(context, 3, Icons.photo_library, AppConstants.galleryTitle),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, int index, IconData icon, String title) {
    bool isSelected = widget.currentIndex == index;
    bool isHovered = _hoverStates[index] ?? false;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoverStates[index] = true),
      onExit: (_) => setState(() => _hoverStates[index] = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        color: isHovered ? Colors.grey[200] : Colors.transparent,
        child: ListTile(
          leading: AnimatedScale(
            scale: isSelected ? 1.1 : 1.0,
            duration: Duration(milliseconds: 200),
            child: Icon(icon, color: isSelected ? Color(AppConstants.primaryColor) : null),
          ),
          title: AnimatedDefaultTextStyle(
            style: GoogleFonts.poppins(
              color: isSelected ? Color(AppConstants.primaryColor) : null,
              fontWeight: isSelected ? FontWeight.bold : null,
              fontStyle: (isSelected && index == 0) ? FontStyle.italic : FontStyle.normal,
            ),
            duration: Duration(milliseconds: 200),
            child: Text(title),
          ),
          onTap: () {
            widget.onTap(index);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}