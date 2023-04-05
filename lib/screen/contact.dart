import 'package:flutter/material.dart';
import 'package:food_donation/screen/admin.dart';
import 'package:food_donation/screen/homepage.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Widget _boxShadow({required Function() admin, required String image}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => admin(),
          ),
        );
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 222, 216, 198),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 25,
            ),
          ],
          image: DecorationImage(
            image: AssetImage('images/$image.jpg'),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(150, 22, 44, 33),
              BlendMode.darken,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

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
                builder: (ctx) => HomePage(),
              ),
            );
          },
        ),
        //elevation: 0.0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 243, 118),
        title: const Text(
          "Contact Us",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            //fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _boxShadow(admin: () => const Admin(), image: 'team'),
              const SizedBox(height: 50),
              _boxShadow(admin: () => const Admin(), image: 'Ngo'),
              const SizedBox(height: 50),
              _boxShadow(admin: () => const Admin(), image: 'Banner1'),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
