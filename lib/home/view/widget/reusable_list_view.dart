// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catalogue/home/model/technical_info_model.dart';
import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableListView extends StatelessWidget {
  final int length;
  final double paddingValue;
  final double height;
  final List<TechnicalInfo> technicalInfo;
  final void Function() onTabTapped;
  final List<SubmittalCategory> submittalCategories;
  final double fontSize;
  final double paddingValue2;

  const ReusableListView({
    super.key,
    required this.length,
    required this.paddingValue,
    required this.height,
    required this.technicalInfo,
    required this.onTabTapped,
    required this.submittalCategories, required this.fontSize, required this.paddingValue2,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (BuildContext context, index) {
        final name = technicalInfo[index].name;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingValue.w,vertical: paddingValue2.h),
          child: GestureDetector(
            onTap: onTabTapped,
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
                      name,
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
  }
}
