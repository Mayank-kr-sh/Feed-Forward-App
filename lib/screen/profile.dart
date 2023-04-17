import 'package:flutter/material.dart';
//import 'package:food_donation/screen/about.dart';
import 'package:food_donation/screen/components/my_button.dart';
import 'package:food_donation/screen/components/text_form_email.dart';
import 'package:food_donation/screen/components/text_form_pss.dart';
import 'package:food_donation/screen/homepage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEdit = false;

  Widget _textForm() {
    return Container(
      height: 400,
      width: 370,
      //color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextEmail(controller: fullname, hint: 'Enter Full Name'),
          MyTextEmail(controller: email, hint: 'Enter Email'),
          MyTextEmail(controller: phone, hint: 'Enter Phone Number'),
          MyTextPass(password, 'Enter Password'),
          MyButton(
            name: "Update",
            onpress: () {
              vaildation(context);
            },
          )
        ],
      ),
    );
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = RegExp(pattern);

  void vaildation(context) {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullname.text.isEmpty &&
        phone.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter All the filed'),
        ),
      );
    }
    // Name required *****************
    else if (fullname.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name Can't be empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Empty'),
        ),
      );
    } else if (phone.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Phone Number Is Empty'),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Not Valid'),
        ),
      );
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Not Valid'),
        ),
      );
    } else {}
  }

  Widget _boxText({required String field, required String name}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: 25,
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              field,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 25,
            width: 180,
            //color: Colors.amber,
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Color.fromARGB(255, 89, 88, 88),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 33, 115, 36),
                Color.fromARGB(255, 114, 243, 118),
                Color.fromARGB(255, 92, 225, 97),
              ],
            ),
          ),
        ),
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
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            //fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
              child: Text(
                isEdit == false ? "Edit" : "Close",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 114, 243, 118),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              maxRadius: 80,
                              backgroundColor:
                                  Color.fromARGB(255, 135, 201, 138),
                              child: CircleAvatar(
                                maxRadius: 75,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('images/Logo.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    color: const Color.fromARGB(255, 239, 234, 209),
                    child: SingleChildScrollView(
                      child: isEdit == false
                          ? Column(
                              children: [
                                _boxText(
                                    field: "Full Name:",
                                    name: "Mayank Kumar Shah"),
                                const SizedBox(height: 5),
                                _boxText(
                                    field: "Email Id:",
                                    name: "mayank123@gmail.com"),
                                const SizedBox(height: 5),
                                _boxText(
                                    field: "Phone No:", name: "1234567890"),
                                const SizedBox(height: 5),
                                _boxText(
                                    field: "Location:", name: "Mumbai, India"),
                                const SizedBox(height: 5),
                                _boxText(
                                    field: "PAN No:", name: "123NPC200000"),
                                const SizedBox(height: 5),
                                _boxText(
                                    field: "Aadhar No:",
                                    name: "8081 1125 1146"),
                                const SizedBox(height: 30),
                              ],
                            )
                          : _textForm(),
                    ),
                  ),
                )
              ],
            ),
            const Positioned(
              top: 160,
              left: 245,
              child: CircleAvatar(
                maxRadius: 17,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
