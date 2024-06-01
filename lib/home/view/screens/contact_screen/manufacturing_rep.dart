import 'dart:convert';

import 'package:catalogue/home/model/manufacturing_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManufacturingRep extends StatefulWidget {
  const ManufacturingRep({super.key});

  @override
  State<ManufacturingRep> createState() => _ManufacturingRepState();
}

class _ManufacturingRepState extends State<ManufacturingRep> {
  String? selectedValue;
  List<ManufacturingContact> contacts = [];
  List<String> contactItems = [
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
  void initState() {
    super.initState();
    loadContacts();
  }

  List<ManufacturingContact> parseContacts(Map<String, dynamic> json) {
    final List<dynamic> contactsJson = json['manufacturingContacts'];
    return contactsJson
        .map((dynamic item) => ManufacturingContact.fromJson(item))
        .toList();
  }

  Future<void> loadContacts() async {
    final String response =
        await rootBundle.loadString('assets/json/manufacturing_contact.json');
    final data = await json.decode(response);
    setState(() {
      contacts = parseContacts(data);
    });
  }

  List<ManufacturingContact> get filteredContacts {
    if (selectedValue == null) return [];
    return contacts.where((contact) => contact.place == selectedValue).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Manufacturing Representative"),
        centerTitle: false,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            double padding = 8.0;
            double fontSize = 13.sp;
            double fontSize1 = 11.sp;
            double sizedBox = 11.w;
            double height = 80.h;
            double circleAvatar = 30.r;

            if (orientation == Orientation.landscape) {
              padding = 13.0;
              fontSize = 8.sp;
              fontSize1 = 6.sp;
              sizedBox = 6.w;
              height = 190.h;
              circleAvatar = 50.r;
            }

            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButtonFormField<String>(
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        items: contactItems.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        isExpanded: true, // Add this line
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Search',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = filteredContacts[index];
                        return Padding(
                          padding: EdgeInsets.all(padding),
                          child: Container(
                            height: height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3.0,
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: circleAvatar,
                                  ),
                                  SizedBox(width: sizedBox),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name: ${contact.name}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: fontSize,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "E-mail: ${contact.email}",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600,
                                            fontSize: fontSize1,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "Designation: ${contact.designation}",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600,
                                            fontSize: fontSize1,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
