import 'package:flutter/material.dart';
import 'package:food_donation/category/About.dart';

class Tanush extends StatelessWidget {
  const Tanush({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const About(),
              ),
            );
          },
        ),
        title: const Text(
          "Korgaokar Tanush Dharmesh",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            //fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
