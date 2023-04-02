import 'package:flutter/material.dart';

class MyTextPass extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  MyTextPass(this.controller, this.hint);

  @override
  State<MyTextPass> createState() => _MyTextPassState();
}

class _MyTextPassState extends State<MyTextPass> {
  bool obscureText1 = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText1,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText1 = !obscureText1;
            });
          },
          child: Icon(
            obscureText1 == true ? Icons.visibility : Icons.visibility_off,
            color: const Color.fromARGB(139, 0, 0, 0),
          ),
        ),
        fillColor: const Color.fromARGB(196, 159, 241, 204),
        filled: true,
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
