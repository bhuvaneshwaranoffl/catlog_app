import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CalciMainPage extends StatelessWidget {
  const CalciMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Engineering Calculator",
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          children: [
            Text(
              "Engineering Calculators to design with cast iron  soil pipe",
              style: TextStyle(color: Colors.white, fontSize: 17.sp),
            ),
            SizedBox(
              height: 150.h,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed("/thrustforce");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350.w, 50.h),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Thrust Force',
                style: TextStyle(
                    fontSize: 18.0, color: Constant.scaffoldBackground),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed("/minslope");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350.w, 50.h),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'DWV Min Slope',
                style: TextStyle(
                    fontSize: 18.0, color: Constant.scaffoldBackground),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
