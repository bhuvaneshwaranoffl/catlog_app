import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double radius;

  const CustomTextFormField({super.key, 
    required this.labelText,
    this.onSaved,
    this.validator, required this.radius,
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
          borderRadius: BorderRadius.circular(radius)
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
