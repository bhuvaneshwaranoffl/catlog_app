import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThrustForce extends StatefulWidget {
  const ThrustForce({super.key});

  @override
  State<ThrustForce> createState() => _ThrustForceState();
}

class _ThrustForceState extends State<ThrustForce> {
  String? selectedValue1;
  String? selectedValue2;

  List<String> dropdownValues1 = ['1', '2', '9'];
  List<String> dropdownValues2 = ['4', '5', '6'];
  

  void clearDropdowns() {
    setState(() {
      selectedValue1 = null;
      selectedValue2 = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Thrust Force",
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
                  hintText: "Head Pressure (ft. of Water)",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    minimumSize: Size(100.sp, 40.sp),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Constant.scaffoldBackground,
                    ),
                  ),
                ),
                SizedBox(width: 30.sp),
                ElevatedButton(
                  onPressed: () {
                    clearDropdowns();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Constant.scaffoldBackground,
                    minimumSize: Size(80.sp, 40.sp),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color:Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            Text(
              "The Thrust forces calculator will assist the designer in determining how properly restrain the cast iron soil pipe system",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
