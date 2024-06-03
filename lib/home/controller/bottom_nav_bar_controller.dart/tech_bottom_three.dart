import 'package:catalogue/home/view/screens/contact_screen/contact_page.dart';
import 'package:catalogue/home/view/screens/home_page.dart';
import 'package:catalogue/home/view/widget/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class TechBottomThree extends StatefulWidget {
  const TechBottomThree({super.key});

  @override
  State<TechBottomThree> createState() => _TechBottomThreeState();
}

class _TechBottomThreeState extends State<TechBottomThree> {
  int _currentIndex = 0;
  List body = const [HomePage(), ContactPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body[_currentIndex],
        bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: _currentIndex,
            onTabTapped: (index) {
              setState(() {
                _currentIndex = index;
              });
            }));
  }
}
