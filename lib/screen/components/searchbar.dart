import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/category/About.dart';
import 'package:food_donation/category/money_donation.dart';
import 'package:food_donation/category/profile.dart';
import 'package:food_donation/screen/contact.dart';
import 'package:food_donation/screen/homepage.dart';
import 'package:food_donation/screen/location.dart';
import 'package:food_donation/screen/login.dart';
import 'package:food_donation/screen1/result_screen.dart';
import 'package:food_donation/screen1/search_screen.dart';
import 'package:food_donation/utils/utils.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    //GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    Widget _openDrawer(context) {
      return Drawer(
        backgroundColor: const Color.fromARGB(255, 239, 234, 209),
        child: ListView(
          children: [
            DrawerHeader(
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
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 40,
                      backgroundImage: AssetImage("images/Logo.png"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Guest",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        // color: Colors.amber,
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => const Login(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          //radius
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => HomePage(),
                  ),
                );
              },
              leading: const Icon(
                Icons.home_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Home Page",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Contact(),
                  ),
                );
              },
              leading: const Icon(
                Icons.contact_phone_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Contact Us",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const About(),
                  ),
                );
              },
              leading: const Icon(
                Icons.info_outline,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "About Us",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const MyProfile(),
                  ),
                );
              },
              leading: const Icon(
                Icons.person_outline,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "My Profile",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Contact(),
                  ),
                );
              },
              leading: const Icon(
                Icons.star_border_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Review & Rating",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Payment(),
                  ),
                );
              },
              leading: const Icon(
                Icons.work_history_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "History",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Contact(),
                  ),
                );
              },
              leading: const Icon(
                Icons.format_quote_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "FAQs",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Contact(),
                  ),
                );
              },
              leading: const Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Support',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Call Us',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "91+ 8418885752",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text(
                          "Mail Us:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          child: const SizedBox(width: 10),
                          onTap: () {},
                        ),
                        Text(
                          "zerohunger.mtmk@gmail.com",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(217, 56, 48, 209),
              Color.fromARGB(255, 18, 160, 248),
              Color.fromARGB(255, 172, 226, 241),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  )
                //: Container(),
                : IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
            SizedBox(
              width: 200,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: TextField(
                    onSubmitted: (String query) {
                      print("submittrd ${query}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(query: query),
                        ),
                      );
                    },
                    readOnly: isReadOnly,
                    onTap: () {
                      if (isReadOnly) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchScreen(),
                          ),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none, // Set border side to none
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Location(),
                  ),
                );
              },
              icon: const Icon(
                Icons.location_on_outlined,
                size: 28,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
