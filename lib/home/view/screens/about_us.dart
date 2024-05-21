import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 24, 16),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/pic22.jpeg", height: 100, width: 100),
            SizedBox(
              height: 30.h,
            ),
            const Text(
              "ABC & FOUNDRY",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30.h,
            ),
            RichText(
                text: const TextSpan(
                    text: "Version",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                  TextSpan(
                      text: Constant.widgetVersion,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800))
                ])),
            SizedBox(
                height: 20.h), // Add some space between version and privacy policy
          ],
        ),
      ),

      bottomSheet: Container(
        color: const Color.fromARGB(255, 137, 24, 16),
        //padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Implement onTap action
                },
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:
                          BorderSide(color: Colors.white), // White underline
                    ),
                  ),
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  // Implement onTap action
                },
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:
                          BorderSide(color: Colors.white), // White underline
                    ),
                  ),
                  child: Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
                
              // Copyright Text
              Align(
                alignment: Alignment.center,
                child: Text(
                  "© ${DateTime.now().year} ABC Foundry. All rights reserved.",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
