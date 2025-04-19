import 'package:catalogue/home/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DynamicContactPage extends StatefulWidget {
  final String category;
  final List<ContactEntry> entries;

  const DynamicContactPage({
    super.key,
    required this.category,
    required this.entries,
  });

  @override
  State<DynamicContactPage> createState() => _DynamicContactPageState();
}

class _DynamicContactPageState extends State<DynamicContactPage> {

   String? selectedValue;

List<ContactEntry> get filteredContacts {
    if (selectedValue == null) return widget.entries;
    return widget.entries.where((e) => e.state == selectedValue).toList();
  }

    final List<String> states = [
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
      'Andaman and Nicobar Islands',
      'Chandigarh',
      'Lakshadweep',
      'Delhi',
      'Puducherry',
      'Ladakh',
      'Jammu and Kashmir'
    ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            double fontSize = 13.sp;
            double fontSize1 = 11.sp;
            double sizedBox = 11.w;
            double circleAvatar = 30.r;

            if (orientation == Orientation.landscape) {
              fontSize = 8.sp;
              fontSize1 = 6.sp;
              sizedBox = 6.w;
              circleAvatar = 50.r;
            }

            return Column(
              children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        items: states.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: 'Select State',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          contentPadding: EdgeInsets.only(
                              right: 40.w, left: 10.w, top: 10.h, bottom: 10.h),
                        ),
                      ),
                      if (selectedValue != null)
                        Positioned(
                          right: 10.w,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = null;
                              });
                            },
                            child: Icon(Icons.clear, size: 20.sp),
                          ),
                        ),
                    ],
                  ),
                ),
              Expanded(
                  child: ListView.builder(
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      final contact = filteredContacts[index];
                        // 👇 Print all contact details to console
                      print("Contact ${index + 1}:");
                      print("Name: ${contact.name}");
                      print("Mobile: ${contact.mobile}");
                      print("Email: ${contact.email}");
                      print("Division: ${contact.division}");
                      print("Designation: ${contact.designation}");
                      print("State: ${contact.state}");
                      print("------------------------------");
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.w, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(radius: circleAvatar),
                                SizedBox(width: sizedBox),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name: ${contact.name}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: fontSize)),
                                      Text("Email: ${contact.email}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: fontSize1)),
                                      Text(
                                          "Designation: ${contact.designation}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: fontSize1)),
                                      Text("Mobile: ${contact.mobile}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: fontSize1)),
                                      Text("Division: ${contact.division}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: fontSize1)),
                                      Text("State: ${contact.state}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: fontSize1)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )

              ],
            );
          },
        ),
      ),
    );
  }
}
