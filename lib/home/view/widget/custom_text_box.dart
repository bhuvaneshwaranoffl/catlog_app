import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextFormField({super.key, 
    required this.labelText,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          // borderSide:BorderSide(
          //   color: Colors.red.shade900,
          // ),
          borderRadius: BorderRadius.circular(20.r)
        ),
        labelText: labelText,
        labelStyle:const TextStyle(
          fontWeight: FontWeight.w300
        )
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
