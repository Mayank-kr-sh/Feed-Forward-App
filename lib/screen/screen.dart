import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_donation/screen/homepage.dart';
import 'package:food_donation/screen/login.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/screen.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(150, 22, 44, 33),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
