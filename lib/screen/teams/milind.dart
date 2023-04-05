import 'package:flutter/material.dart';
import 'package:food_donation/screen/about.dart';

class Milind extends StatelessWidget {
  const Milind({super.key});

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
                builder: (ctx) => About(),
              ),
            );
          },
        ),
        //elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 114, 243, 118),
        title: const Text(
          "Milind Murmu",
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
