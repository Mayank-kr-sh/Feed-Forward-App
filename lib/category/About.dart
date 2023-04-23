// ignore: file_names
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_donation/screen/teams/kashish.dart';
import 'package:food_donation/screen/teams/mayank.dart';
import 'package:food_donation/screen/teams/milind.dart';
import 'package:food_donation/screen/teams/tanush.dart';
import 'package:food_donation/screen1/home_screen.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  // late final Function member;

  List textList = [
    {
      "id": 1,
      "text_path":
          'The Food Donation Project System application is designed in such a way that the users have two options to select. If the user looking to donate food, login using username and password then add the below information in the application: Name of the food item and the excess quantity. Location of the user using GPS'
    },
    {
      "id": 2,
      "text_path":
          'A food donation app connects donors with local charities and food banks to reduce food waste. It should have a user-friendly interface, efficient donation process, location-based services, and communication feature. The app should also prioritize security, offer payment options, provide donation tracking, and feedback/rating system. Additionally, social sharing can promote awareness and inspire others to donate.'
    },
    {
      "id": 3,
      "text_path":
          'A food donation app is a platform that connects individuals, restaurants, and grocery stores with local charities and food banks to donate surplus food and reduce food waste. The app should have a user-friendly interface, efficient donation process, location-based services, and a communication feature. Additionally, it should prioritize security, offer payment options, provide donation tracking, and a feedback/rating system. Social sharing can also promote awareness and inspire others to donate.'
    },
    {
      "id": 4,
      "text_path":
          'The food donation app connects donors with local charities and food banks to reduce food waste and alleviate hunger. Its features include a user-friendly interface, efficient donation process, location-based services, communication, security, payment options, donation tracking, feedback/rating system, and social sharing. These features simplify the process of donating surplus food, ensure security, and make it easy to track the impact of donations.'
    },
    {
      "id": 5,
      "text_path":
          "The app's features, including user-friendly interface, efficient donation process, location-based services, communication, security, payment options, donation tracking, and feedback/rating system, make it easy and secure for users to donate and track their impact."
    },
  ];

  final CarouselController carouselController = CarouselController();
  int currIndex = 0;

  Widget _slidingBanner() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currIndex);
          },
          child: CarouselSlider(
            items: textList
                .map(
                  (item) => Text(
                    item['text_path'],
                    //textDirection: TextDirection.ltr,
                    //textWidthBasis: ,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: false,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: textList.asMap().entries.map((entry) {
              print(entry);
              print(entry.key);
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currIndex == entry.key ? 17 : 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currIndex == entry.key
                          ? Color.fromARGB(255, 86, 90, 93)
                          : Color.fromARGB(255, 171, 162, 162)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _teamMember({
    required String name,
    required String pos,
    required final Function member,
  }) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 216, 198),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(120, 0, 0, 0),
            blurRadius: 25,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            maxRadius: 40,
            backgroundImage: AssetImage("images/Logo.png"),
          ),
          SizedBox(
            height: 80,
            width: 200,
            //color: Colors.amberAccent,
            child: ListTile(
              title: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                pos,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => member(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 25,
            ),
          )
        ],
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SignInButton(
      //       Buttons.Email,
      //       text: "Reagarding any Query",
      //       onPressed: () {},
      //     ),
      //     SignInButton(
      //       Buttons.LinkedIn,
      //       text: "Connect us on LinkedIn",
      //       onPressed: () {},
      //     ),
      //     SignInButton(
      //       Buttons.GitHub,
      //       text: "Connect us on GitHub",
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
    );
  }

  Widget _midLine() {
    return Container(
      //height: 50,
      //color: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Color.fromARGB(255, 8, 8, 8),
            ),
          ),
          Text(
            "About Team Member's",
            style: TextStyle(
              color: Color.fromARGB(255, 15, 15, 15),
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Color.fromARGB(255, 12, 12, 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dynamicAbout() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 216, 198),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(120, 0, 0, 0),
            blurRadius: 25,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: _slidingBanner(),
    );
  }

  Widget _topSection() {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 100, 220, 242),
            Color.fromARGB(255, 33, 82, 243),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(120, 0, 0, 0),
            blurRadius: 25,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200),
          bottomLeft: Radius.circular(200),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 241, 229),
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 20,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 172, 226, 241),
              Color.fromARGB(255, 18, 160, 248),
              Color.fromARGB(217, 56, 48, 209),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const HomeScreen(),
              ),
            );
          },
        ),
        //elevation: 0.0,
        //centerTitle: true,
        // backgroundColor: Color.fromARGB(255, 114, 243, 118),
        title: const Text(
          "About",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            //fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topSection(),
            const SizedBox(height: 100),
            _dynamicAbout(),
            const SizedBox(height: 20),
            _midLine(),
            const SizedBox(height: 20),
            _teamMember(
              name: "Mayank Kumar Shah",
              pos: "21bds037",
              member: () => const Mayank(),
            ),
            const SizedBox(height: 20),
            _teamMember(
              name: "Milind Murmu",
              pos: "21bds038",
              member: () => const Milind(),
            ),
            const SizedBox(height: 20),
            _teamMember(
              name: "Kashish Raju Lonpande",
              pos: "21bds026",
              member: () => const Kashish(),
            ),
            const SizedBox(height: 20),
            _teamMember(
              name: "Korgaokar Tanush Dharmesh",
              pos: "21bds030",
              member: () => const Tanush(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
