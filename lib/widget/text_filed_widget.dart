import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  late TextEditingController Controller;
  TextInputType textInputType;
  String hint;
  bool obscureText;
  Icon icon;
  GestureDetector? gestureDetector;

  TextFieldWidget(this.Controller, this.hint, this.textInputType, this.icon,
      [this.obscureText = false, this.gestureDetector,]);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? x) {
        if (x == null || x.isEmpty) {
          return 'this field the required';
        }
      },
      obscureText: obscureText,
      controller: Controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: icon,
        suffixIcon: gestureDetector,
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
