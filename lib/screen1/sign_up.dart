// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_donation/resourses/authenticatuon.dart';
import 'package:food_donation/screen/components/custom_main.dart';
import 'package:food_donation/screen/components/text_field.dart';
import 'package:food_donation/screen1/sign_in.dart';
import 'package:food_donation/utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/logo2.png",
                      height: screenSize.height * 0.22,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.7,
                      child: FittedBox(
                        child: Container(
                          height: screenSize.height * 0.7,
                          width: screenSize.width,
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
                                "Sign-Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 33,
                                  color: Colors.white,
                                ),
                              ),
                              TextFieldWidget(
                                title: "Name",
                                controller: nameController,
                                obscureText: false,
                                hintText: "Enter your name",
                              ),
                              TextFieldWidget(
                                title: "Mobile Number",
                                controller: phoneController,
                                obscureText: false,
                                hintText: "Enter your Mobile Number",
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
                                  color: Color.fromARGB(255, 246, 193, 79),
                                  isLoading: isLoading,
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    String output =
                                        await authenticationMethods.signUpUser(
                                            name: nameController.text,
                                            phone: phoneController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                    setState(() {
                                      isLoading = false;
                                    });
                                    if (output == "success") {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SignInScreen(),
                                        ),
                                      );
                                    } else {
                                      //error
                                      Utils().showSnackBar(
                                        context: context,
                                        content: output,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        letterSpacing: 0.6,
                                        color: Colors.black),
                                  ),
                                ),
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
                                          return const SignInScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Back to Log In Page",
                                    style: TextStyle(
                                      letterSpacing: 0.6,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
