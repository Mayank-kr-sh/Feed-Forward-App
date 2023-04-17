import 'package:flutter/material.dart';
import 'package:food_donation/screen/about.dart';
import 'package:food_donation/screen/components/banner.dart';

class Hotels extends StatelessWidget {
  const Hotels({super.key});

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdBannerWidget(),
              ),
            );
          },
        ),
        //elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 114, 243, 118),
        title: const Text(
          "Hotels",
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
