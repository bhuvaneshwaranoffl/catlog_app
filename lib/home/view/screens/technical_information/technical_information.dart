// ignore_for_file: avoid_print

import 'package:catalogue/home/provider/technical_info_provider.dart';
import 'package:catalogue/home/view/screens/technical_information/second_common_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
                height = 70;
                paddingValue2 = 20;
                paddingValue =
                    50.0; // Adjusted padding value for landscape mode
                fontSize = 8.sp;
              } else {
                paddingValue = 10;
                paddingValue2 = 10;
                height = 60.h;
                fontSize = 17.sp;
              }
              return ListView.builder(
                itemCount: getData.technicalInfo.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingValue.w, vertical: paddingValue2.h),
                    child: GestureDetector(
                      onTap: () {
                        if (getData.technicalInfo[index].name ==
                            "Frequently Asked Questions") {
                           context.pushNamed('/faq');
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondCommonScreen(
                                        submittalCategory:
                                            getData.technicalInfo[index].value,
                                        name: getData.technicalInfo[index].name,
                                      )));
                        }
                      },
                      child: Container(
                        height: height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2.r,
                              blurRadius: 5.r,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              //   height: 70.h,
                              //   width: 70.w,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8.r),
                              //     color: const Color.fromARGB(245, 254, 14, 14),
                              //   ),
                              //   child: const Icon(
                              //     Icons.person_2_outlined,
                              //     size: 30,
                              //     color: Colors.white,
                              //   ),
                              // ),
                              // SizedBox(width: 20.w),
                              Text(
                                getData.technicalInfo[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize,
                                ),
                              ),
                              // const Icon(
                              //   Icons.folder,
                              //   size: 35,
                              //   color: Constant.scaffoldBackground,
                              // ),
                              Image.asset(getData.technicalInfo[index].img,
                              height: 40,
                              width: 40,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
    );
  }
}
