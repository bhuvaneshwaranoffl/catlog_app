import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactItem extends StatelessWidget {
  final String itemName;
  final bool isLandscape;
  final VoidCallback? onTap;
  const ContactItem({
    super.key,
    required this.itemName, required this.isLandscape, this.onTap,
  });

  @override
Widget build(BuildContext context) {
    final double itemHeight = isLandscape ? 70.0 : 70.0;
     final EdgeInsetsGeometry padding = isLandscape
        ? const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0)
        : const EdgeInsets.all(10.0);
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap:onTap,
        child: Container(
          height: itemHeight,
          width: isLandscape ? 10.0 : null,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               //const SizedBox(width:10.0),
                Text(
                  itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                  ),
                ),
                  SizedBox(
                  height: 70.0.h,
                  width: 70.0.w,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   color: const Color.fromARGB(245, 254, 14, 14),
                  // ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 25,
                    color: Constant.scaffoldBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
