import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:food_donation/screen/components/haveacc.dart';
import 'package:food_donation/screen/components/my_button.dart';
import 'package:food_donation/screen/components/text_form_email.dart';
import 'package:food_donation/screen/components/text_form_pss.dart';
import 'package:food_donation/screen/homepage.dart';
import 'package:food_donation/screen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
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
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = 'Please Check Internet Connection';
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        isloding = false;
      });
    } catch (e) {
      setState(() {
        isloding = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    await FirebaseFirestore.instance
        .collection('UserData')
        .doc(authResult.user?.uid)
        .set({
      "UserNmae": fullname.text,
      "UserEmail": email.text,
      "UserNumber": phone.text,
      "UserId": authResult.user?.uid,
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomePage(),
      ),
    );
    setState(() {
      isloding = false;
    });
  }

  GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

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
    } else if (repassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rewrite Password Is Compulsory'),
        ),
      );
    } else {
      submit();
    }
  }

  Widget _topSection() {
    return Container(
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(120, 0, 0, 0),
            blurRadius: 20,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(190),
          bottomLeft: Radius.circular(190),
        ),
        image: DecorationImage(
          image: NetworkImage(
              'https://img.freepik.com/premium-vector/food-donation-box-2d-vector-isolated-illustration-grocery-products-give-away-non-profit-humanitarian-aid-flat-composition-cartoon-background-charity-contribution-colourful-scene_151150-6593.jpg?w=2000'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

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
          MyTextPass(repassword, 'Rewrite password'),
        ],
      ),
    );
  }

  Widget _button() {
    return isloding == false
        ? MyButton(
            name: 'SignUp',
            onpress: () {
              vaildation(context);
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  // Widget _haveAccount() {
  //   return HaveAccount(
  //     question: 'Already have an Account? ',
  //     sub: 'Login',
  //     ontap: () {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (ctx) => const Login(),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _haveAccountTemp() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Text(
  //         'Already have an Account? ',
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 18,
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (ctx) => const Login(),
  //             ),
  //           );
  //         },
  //         child: const Text(
  //           'Login',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             fontSize: 20,
  //             color: Colors.green,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      // key: scaffold,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topSection(),
              const SizedBox(height: 15),
              _textForm(),
              const SizedBox(height: 10),
              _button(),
              const SizedBox(height: 10),
              //_haveAccount(),
              //_haveAccountTemp(),
            ],
          ),
        ),
      ),
    );
  }
}
