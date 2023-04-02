import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  final Function()? ontap;
  final String question;
  final String sub;
  HaveAccount({
    required this.question,
    required this.sub,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: ontap,
          child: Text(
            sub,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
          ),
        )
      ],
    );
  }
}
