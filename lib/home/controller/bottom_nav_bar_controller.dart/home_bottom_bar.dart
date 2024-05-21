import 'package:catalogue/home/view/screens/contact_screen/contact_page.dart';
import 'package:catalogue/home/view/screens/home_page.dart';
import 'package:catalogue/home/view/widget/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0;
  List body = const [HomePage(), ContactPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
         onTabTapped: (index){
          setState(() {
            _currentIndex=index;
          });
         })
    );
  }
}
