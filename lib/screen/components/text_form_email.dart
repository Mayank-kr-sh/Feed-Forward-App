import 'package:flutter/material.dart';

class MyTextEmail extends StatelessWidget {
  TextEditingController controller;
  String hint;
  MyTextEmail({
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(196, 159, 241, 204),
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
