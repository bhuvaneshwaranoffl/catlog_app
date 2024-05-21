import 'package:catalogue/home/view/widget/technical_support_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicalSupport extends StatelessWidget {
  const TechnicalSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Technical Support",
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return TechnicalSupportWidget(
            isLandscape: orientation == Orientation.landscape);
      }),
    );
  }
}