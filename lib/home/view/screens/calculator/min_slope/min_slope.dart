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
  String result = '';

  List<String> dropdownValues1 = ['1', '2', '3'];
  List<String> dropdownValues2 = ['4', '5', '6'];
  List<String> dropdownValues3 = ['7', '8', '9'];

  void clearDropdowns() {
    setState(() {
      selectedValue1 = null;
      selectedValue2 = null;
      selectedValue3 = null;
      result = '';
    });
  }

  void calculateMinSlope() {
    if (selectedValue1 != null &&
        selectedValue2 != null &&
        selectedValue3 != null) {
      double pipeSize = double.parse(selectedValue1!);
      double percentFull = double.parse(selectedValue2!);
      double velocity = double.parse(selectedValue3!);
      double minSlope =
          (pipeSize * percentFull) / velocity; // Example calculation

      setState(() {
        result = 'Minimum Slope: $minSlope';
      });
    } else {
      setState(() {
        result = 'Please select values for all dropdowns';
      });
    }
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
      body: LayoutBuilder(builder: (context, constraints) {
        double buttonHeight1;
        double buttonWidth1;
        double buttonHeight2;
        double buttonWidth2;
        double fontSize;
        double fontSize1;
        double padding;
        double sizeBox;
        double sizeBox2;
        if (constraints.maxWidth > 600 &&
            MediaQuery.of(context).orientation == Orientation.landscape) {
          buttonHeight1 = 55;
          buttonWidth1 = 160;
          buttonHeight2 = 55;
          buttonWidth2 = 100;
          fontSize = 10.sp;
          padding = 150;
          sizeBox = 10;
          sizeBox2 = 20;
          fontSize1 = 14.0;
        } else {
          buttonHeight1 = 45.h;
          buttonWidth1 = 160.w;
          buttonHeight2 = 45.h;
          buttonWidth2 = 80.w;
          fontSize = 17.sp;
          padding = 22.w;
          sizeBox = 10.h;
          sizeBox2 = 30.h;
          fontSize1 = 10.sp;
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sizeBox),
                DropdownButtonFormField<String>(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sizeBox),
                DropdownButtonFormField<String>(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sizeBox),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        calculateMinSlope();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.scaffoldBackground,
                        minimumSize: Size(buttonWidth1, buttonHeight1),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: sizeBox2),
                    ElevatedButton(
                      onPressed: () {
                        clearDropdowns();
                      },
                      style: ElevatedButton.styleFrom(
                        //backgroundColor:Constant.scaffoldBackground,
                        minimumSize: Size(buttonWidth2, buttonHeight2),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Constant.scaffoldBackground,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeBox),
                Text(
                  "The DWV minimum slope calculator will assist the designer in determining how to lay out the system and determine the required amount of pipe and fittings that will be needed.",
                  style: TextStyle(
                    color: Constant.scaffoldBackground,
                    fontSize: fontSize1,
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  result,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: fontSize1,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
