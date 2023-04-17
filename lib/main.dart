import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/layout/screen_layout.dart';
import 'package:food_donation/provider/User_data.dart';
import 'package:food_donation/provider/user_details_provider.dart';
import 'package:food_donation/screen/login.dart';
import 'package:food_donation/screen/payment.dart';
import 'package:food_donation/screen1/account_screen.dart';
import 'package:food_donation/screen1/cart_screen.dart';
import 'package:food_donation/screen1/more_screen.dart';
import 'package:food_donation/screen1/product_screen.dart';
import 'package:food_donation/screen1/result_screen.dart';
import 'package:food_donation/screen1/sign_in.dart';
import 'package:food_donation/user_Details/product.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<UserProvider>(
    //   create: (context) => UserProvider(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       snackBarTheme: const SnackBarThemeData(
    //         actionTextColor: Colors.white,
    //         backgroundColor: Colors.green,
    //       ),
    //       primaryColor: const Color.fromARGB(255, 232, 241, 58),
    //       visualDensity: VisualDensity.adaptivePlatformDensity,
    //     ),
    //     home: StreamBuilder(
    //       stream: FirebaseAuth.instance.authStateChanges(),
    //       builder: (context, AsyncSnapshot<User?> user) {
    //         if (user.connectionState == ConnectionState.waiting) {
    //           return const Center(
    //             child: CircularProgressIndicator(
    //               color: Colors.orange,
    //             ),
    //           );
    //         } else if (user.hasData) {
    //           return const ScreenLayout();
    //           // return ResultsScreen(query: "xyz");
    //           // return ProductScreen(
    //           //   productModel: ProductModel(
    //           //     url:
    //           //         "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
    //           //     productName: "Company Logo",
    //           //     cost: 100,
    //           //     discount: 10,
    //           //     uid: "mayank",
    //           //     sellerName: "food",
    //           //     sellerUid: "123",
    //           //     rating: 8,
    //           //     noOfRating: 8,
    //           //   ),
    //           // );
    //         } else {
    //           return const SignInScreen();
    //         }
    //       },
    //     ),
    //     // home: ResultsScreen(
    //     //   query: "Mayank",
    //     // ),
    //   ),
    // );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserDetailsProvider())
        ],
        child: MaterialApp(
          title: "Amazon Clone",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<User?> user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                } else if (user.hasData) {
                  return const ScreenLayout();
                  //return const SellScreen();
                } else {
                  return const SignInScreen();
                }
              }),
        ));
  }
}
