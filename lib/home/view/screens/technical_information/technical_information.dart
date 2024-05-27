// ignore_for_file: avoid_print

import 'package:catalogue/home/provider/technical_info_provider.dart';
import 'package:catalogue/home/view/widget/reusable_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TechnnicalResistance extends StatefulWidget {
  const TechnnicalResistance({super.key});

  @override
  State<TechnnicalResistance> createState() => _TechnnicalResistanceState();
}

class _TechnnicalResistanceState extends State<TechnnicalResistance> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch data asynchronously
    fetchData();
  }

  Future<void> fetchData() async {
    final getData = Provider.of<TechnicalInfoProvider>(context, listen: false);

    try {
      await getData.fetchTechnicalInfo();
    } catch (error) {
      // Handle error if any
      print('Error fetching data: $error');
    } finally {
      // Set isLoading to false once data is fetched
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<TechnicalInfoProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Technical  Information",
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading indicator
          : LayoutBuilder(builder: (context, constraints) {
              double height;
              double paddingValue; // Default padding value
              double fontSize;
              double paddingValue2;
              if (constraints.maxWidth > 600 &&
                  MediaQuery.of(context).orientation == Orientation.landscape) {
                height = 90;
                paddingValue2 = 10;
                paddingValue =
                    50.0; // Adjusted padding value for landscape mode
                fontSize = 10.sp;
              } else {
                paddingValue = 10;
                paddingValue2 = 10;
                height = 60.h;
                fontSize = 17.sp;
              }
              return ReusableListView(
                paddingValue: paddingValue,
                height: height,
                length: getData.technicalInfo.length,
                technicalInfo: getData.technicalInfo,
                onTabTapped: () {
                  //  context.pushNamed("/secondscreen");
                },
                submittalCategories: const [],
                fontSize: fontSize,
                paddingValue2: paddingValue2,
              );
            }),
    );
  }
}
