import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/screen/about.dart';
import 'package:food_donation/screen/contact.dart';
import 'package:food_donation/screen/homepage.dart';
import 'package:food_donation/screen/login.dart';
import 'package:food_donation/screen/screen.dart';
import 'package:food_donation/screen/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(
          actionTextColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        primaryColor: const Color.fromARGB(255, 232, 241, 58),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return HomePage();
      //     } else {
      //       return Login();
      //     }
      //   },
      // ),
      home: Screen(),
    );
  }
}
