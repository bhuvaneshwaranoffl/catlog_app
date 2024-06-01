import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Constant.scaffoldBackground,
      onTap: onTabTapped,
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 400),
     // backgroundColor: const Color.fromARGB(255, 137, 24, 16),
     backgroundColor: Colors.white,
      items: [
        _buildNavItem(Icons.home, "Home"),
        _buildNavItem(Icons.contact_page, "Contact"),
      ],
      index: selectedIndex,
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:Colors.white,
          ),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color:Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
