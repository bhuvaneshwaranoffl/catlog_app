import 'dart:convert';
import 'package:catalogue/home/model/customer_service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCustomerSerice extends StatefulWidget {
    final bool isLandscape;
  const CustomCustomerSerice({super.key, required this.isLandscape});

  @override
  State<CustomCustomerSerice> createState() => _CustomCustomerSericeState();
}

class _CustomCustomerSericeState extends State<CustomCustomerSerice> {
    List<CustomerServiceModel> items = [];

  @override
  void initState() {
    super.initState();
    loadCustomerData();
  }

  Future<void> loadCustomerData() async {
    // Load JSON data from the file
    final String data =
        await rootBundle.loadString('assets/json/customer_service.json');
    // Parse JSON data into List<CustomerService>
    final List<dynamic> jsonData = jsonDecode(data);
    setState(() {
      items = jsonData
          .map((item) => CustomerServiceModel(
                name: item['name'],
                designation: item['designation'],
                phn: item['phn'],
                email: item['email'],
              ))
          .toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final double itemHeight = widget.isLandscape ? 100.0 : 120.0;
    final EdgeInsetsGeometry padding = widget.isLandscape
        ? const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0)
        : const EdgeInsets.all(8.0);
        final double itemRadius = widget.isLandscape ? 35.0 :35.0;
        final double itemFont = widget.isLandscape ? 10.0 :13.0;
    return  Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: padding,
            child: Container(
              height: itemHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:const EdgeInsets.all(11),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red[600],
                          maxRadius: itemRadius,
                        ),
                        SizedBox(
                          width:10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].name,
                              style: TextStyle(
                                fontSize: itemFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              items[index].designation,
                              style: TextStyle(
                                fontSize: itemFont,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height:1.h,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.call,
                                  color: Color.fromARGB(255, 190, 18, 6),
                                ),
                                SizedBox(width:10.w),
                                Text(
                                  items[index].phn,
                                  style: TextStyle(
                                    fontSize: itemFont,
                                    fontWeight: FontWeight.w400,
                                    color:const Color.fromARGB(255, 190, 18, 6),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:1.h,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail,
                                  color: Color.fromARGB(255, 190, 18, 6),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  items[index].email,
                                  style: TextStyle(
                                    fontSize: itemFont,
                                    fontWeight: FontWeight.w400,
                                    color:const Color.fromARGB(255, 190, 18, 6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}