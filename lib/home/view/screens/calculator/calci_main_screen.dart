import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CalciMainPage extends StatelessWidget {


  const CalciMainPage({super.key });

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
      body: LayoutBuilder(
        builder:  (context, constraints) {
          double height;
          double width;
          double fontSize;
          double padding;
          double sizeBox;
                    double sizeBox2;
           if (constraints.maxWidth > 600 &&
              MediaQuery.of(context).orientation == Orientation.landscape) {
            height = 50;
            width =390;
            fontSize = 10.sp;
            padding=50;
            sizeBox =80;
                        sizeBox2 = 20;
          } else {
            height = 40.h;
            width =390;
            fontSize = 17.sp;
            padding=22;
            sizeBox=150;
                        sizeBox2 = 10;
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
              children: [
                Text(
                  "Engineering Calculators to design with cast iron  soil pipe",
                  style: TextStyle(color: Constant.scaffoldBackground,
                   fontSize:fontSize),
                ),
                SizedBox(
                  height: sizeBox,
                ),
                 ElevatedButton(
                  onPressed: () {
                    context.pushNamed("/thrustforce");
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child:  Text(
                    'Thrust Force',
                    style: TextStyle(
                        fontSize:fontSize, color: Constant.scaffoldBackground),
                  ),
                ),
                SizedBox(
                  height:sizeBox2,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed("/minslope");
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child:  Text(
                    'DWV Min Slope',
                    style: TextStyle(
                        fontSize:fontSize, color: Constant.scaffoldBackground),
                  ),
                ),
              ],
                      ),
                    ),
            ));
        },
        
      ),
    );
  }
}
