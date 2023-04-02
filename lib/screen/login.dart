// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_donation/screen/components/haveacc.dart';
import 'package:food_donation/screen/components/my_button.dart';
import 'package:food_donation/screen/components/text_form_email.dart';
import 'package:food_donation/screen/components/text_form_pss.dart';
import 'package:food_donation/screen/components/title.dart';
import 'package:food_donation/screen/homepage.dart';
import 'package:food_donation/screen/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();

  GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = RegExp(pattern);
  bool isloding = false;
  late UserCredential authResult;
  void submit() async {
    setState(() {
      isloding = true;
    });
    try {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const HomePage(),
        ),
      );
    } on PlatformException catch (e) {
      String message = 'Please Check Internet Connection';
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
        ),
      );
      setState(() {
        isloding = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        isloding = false;
      });
    }

    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (ctx) => const HomePage(),
    //   ),
    // );
    setState(() {
      isloding = false;
    });
  }

  void vaildation(context) {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Both field Is Empty'),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Empty'),
        ),
      );
    }
    if (!regExp.hasMatch(email.text)) {
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
    } else {
      submit();
    }
  }

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 530,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(120, 0, 0, 0),
                      blurRadius: 20,
                      // offset: Offset(4, 3),
                      // blurRadius: 20,
                      // color: Color.fromRGBO(0, 0, 0, 0.16),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(450),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/07/13/15/istock-619643870.jpg'),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(
                    //     Color.fromARGB(130, 91, 92, 91), BlendMode.color),
                  ),
                  //color: Color.fromARGB(141, 76, 175, 79),
                ),
                child: TopTitle(
                  title: 'Zero Hunger',
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 160,
                        width: 320,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            MyTextEmail(
                              controller: email,
                              hint: 'Username or Email',
                            ),
                            const SizedBox(height: 20),
                            MyTextPass(password, 'password'),
                          ],
                        ),
                      ),
                    ),
                    isloding == false
                        ? MyButton(
                            name: 'Login',
                            onpress: () {
                              vaildation(context);
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    const SizedBox(height: 20),
                    HaveAccount(
                      question: "Don't Have an Account ?",
                      sub: 'SignUp',
                      ontap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => const SignUp(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
