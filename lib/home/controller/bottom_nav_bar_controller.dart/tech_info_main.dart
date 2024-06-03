import 'package:catalogue/home/view/screens/contact_screen/contact_page.dart';
import 'package:catalogue/home/view/screens/technical_information/technical_information.dart';
import 'package:catalogue/home/view/widget/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class TechBottomMainNavBar extends StatefulWidget {
  const TechBottomMainNavBar({super.key});

  @override
  State<TechBottomMainNavBar> createState() => _TechBottomMainNavBarState();
}

class _TechBottomMainNavBarState extends State<TechBottomMainNavBar> {
  int _currentIndex = 0;
  List body = const [TechnicalInformation(), ContactPage()];
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
