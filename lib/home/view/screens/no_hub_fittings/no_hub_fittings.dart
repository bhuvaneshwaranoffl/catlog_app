import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoHubFittings extends StatelessWidget {
  const NoHubFittings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        centerTitle: true,
        title: Text(
          "No-HUB Fittings",
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
    );
  }
}