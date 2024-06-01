import 'package:catalogue/home/model/technical_info_model.dart';
import 'package:catalogue/home/utils/constant.dart';
import 'package:catalogue/home/view/screens/technical_information/common_pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdCommonScreen extends StatefulWidget {
  final String name;
  final List<SubmittalItem>? submittalItem;
  const ThirdCommonScreen({super.key, required this.name, this.submittalItem});

  @override
  State<ThirdCommonScreen> createState() => _ThirdCommonScreenState();
}

class _ThirdCommonScreenState extends State<ThirdCommonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 17.sp,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        double height;
        double paddingValue; // Default padding value
        double fontSize;
        double paddingValue2;
        if (constraints.maxWidth > 600 &&
            MediaQuery.of(context).orientation == Orientation.landscape) {
          height = 70;
          paddingValue2 = 20;
          paddingValue = 50.0; // Adjusted padding value for landscape mode
          fontSize = 8.sp;
        } else {
          paddingValue = 10;
          paddingValue2 = 10;
          height = 60.h;
          fontSize = 17.sp;
        }
        return ListView.builder(
          itemCount: widget.submittalItem?.length ?? 0,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingValue.w, vertical: paddingValue2.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommonPdfPage(
                                      name: widget.submittalItem![index].name,
                                submittalData:
                                    widget.submittalItem![index].value,
                                index: index,
                              )));
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
                          widget.submittalItem![index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                          ),
                        ),
                        const Icon(
                          Icons.favorite_border,
                          size: 25,
                          color: Constant.scaffoldBackground,
                        ),
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
