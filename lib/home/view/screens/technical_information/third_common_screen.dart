import 'package:catalogue/home/view/widget/reusable_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdCommonScreen extends StatefulWidget {
  const ThirdCommonScreen({super.key});

  @override
  State<ThirdCommonScreen> createState() => _ThirdCommonScreenState();
}

class _ThirdCommonScreenState extends State<ThirdCommonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double height;
        double paddingValue = 10.0; // Default padding value
        if (constraints.maxWidth > 600 &&
            MediaQuery.of(context).orientation == Orientation.landscape) {
          height = 90;
          paddingValue = 50.0; // Adjusted padding value for landscape mode
        } else {
          height = 80;
        }
        return ReusableListView(
          paddingValue: paddingValue,
          height: height,
          length: 6,
          technicalInfo: const [],
          onTabTapped: () {
            context.pushNamed('/pdfscreen');
          },
          submittalCategories: const [], fontSize: 10, paddingValue2: 0,
        );
      }),
    );
  }
}
