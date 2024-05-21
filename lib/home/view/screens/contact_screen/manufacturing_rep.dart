import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManufacturingRep extends StatefulWidget {
  const ManufacturingRep({super.key});

  @override
  State<ManufacturingRep> createState() => _ManufacturingRepState();
}

class _ManufacturingRepState extends State<ManufacturingRep> {
  String ? selectedValue;
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
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'Option 1',
                          child: Text('Option 1'),
                        ),
                        DropdownMenuItem(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        DropdownMenuItem(
                          value: 'Option 3',
                          child: Text('Option 3'),
                        ),
                      ],
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        //suffixIcon: const Icon(Icons.arrow_downward_outlined),
                        labelText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.r),
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
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        color: Colors.white,
                        // Your table or list view widgets here,
                      );
                    },
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