import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinSlope extends StatefulWidget {
  const MinSlope({super.key});

  @override
  State<MinSlope> createState() => _MinSlopeState();
}

class _MinSlopeState extends State<MinSlope> {
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;

  List<String> dropdownValues1 = ['1', '2', '3'];
  List<String> dropdownValues2 = ['4', '5', '6'];
  List<String> dropdownValues3 = ['7', '8', '9'];

  void clearDropdowns() {
    setState(() {
      selectedValue1 = null;
      selectedValue2 = null;
      selectedValue3 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DWV Min Slope",
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
       body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: DropdownButtonFormField<String>(
                value: selectedValue1,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue1 = newValue;
                  });
                },
                items: dropdownValues1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Pipe Size (in)",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: DropdownButtonFormField<String>(
                value: selectedValue2,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue2 = newValue;
                  });
                },
                items: dropdownValues2.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Percent Full",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: DropdownButtonFormField<String>(
                value: selectedValue3,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue3 = newValue;
                  });
                },
                items: dropdownValues3.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Velocity (ft/sec)",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.scaffoldBackground,
                    minimumSize: Size(160.sp, 45.sp),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 30.sp),
                ElevatedButton(
                  onPressed: () {
                    clearDropdowns();
                  },
                  style: ElevatedButton.styleFrom(
                    //backgroundColor:Constant.scaffoldBackground,
                    minimumSize: Size(80.sp, 45.sp),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Constant.scaffoldBackground,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            Text(
              "The DWV minimum slope calculator will assist the designer in determining how to lay out the system and determine the required amount of pipe and fittings that will be needed.",
              style: TextStyle(
                color:Constant.scaffoldBackground,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
