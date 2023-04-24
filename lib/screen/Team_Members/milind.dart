import 'package:flutter/material.dart';
import 'package:food_donation/Horizantal_Category/About.dart';

class Milind extends StatelessWidget {
  const Milind({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 241, 229),
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 20,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 172, 226, 241),
              Color.fromARGB(255, 18, 160, 248),
              Color.fromARGB(217, 56, 48, 209),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
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
          "Milind Murmu",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            //fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
