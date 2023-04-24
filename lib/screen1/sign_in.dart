// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_donation/resourses/authenticatuon.dart';
import 'package:food_donation/screen/Widgets/custom_main.dart';
import 'package:food_donation/screen/Widgets/text_field.dart';
import 'package:food_donation/screen1/home_screen.dart';
import 'package:food_donation/screen1/sign_up.dart';
import 'package:food_donation/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 202, 226),
                Colors.blue,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,

            // height: 100,
            // width: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/logo2.png",
                      height: screenSize.height * 0.3,
                      //height: 50,
                    ),
                    //SvgPicture.asset("images/doc.svg"),
                    Container(
                      height: screenSize.height / 1.7,
                      width: screenSize.width * 1.8,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(120, 0, 0, 0),
                              blurRadius: 20,
                            ),
                          ],
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(217, 56, 48, 209),
                              Color.fromARGB(255, 18, 160, 248),
                              Color.fromARGB(255, 172, 226, 241),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign-In",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 33,
                              color: Colors.white,
                            ),
                          ),
                          TextFieldWidget(
                            title: "Email",
                            controller: emailController,
                            obscureText: false,
                            hintText: "Enter your email",
                          ),
                          TextFieldWidget(
                            title: "Password",
                            controller: passwordController,
                            obscureText: true,
                            hintText: "Enter your password",
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(
                              color: const Color.fromARGB(255, 246, 193, 79),
                              isLoading: isLoading,
                              onPressed: () async {
                                setState(() {
                                  //isLoading = false;
                                  isLoading = true;
                                });

                                String output =
                                    await authenticationMethods.signInUser(
                                        email: emailController.text,
                                        password: passwordController.text);

                                if (output == "success") {
                                  //functions
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Utils().showSnackBar(
                                    context: context,
                                    content: output,
                                  );
                                }
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    letterSpacing: 0.6, color: Colors.black),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "New to Feed Forward?",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(
                              color: Colors.grey[400]!,
                              isLoading: false,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const SignUpScreen();
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                "Create an Donation Account",
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
