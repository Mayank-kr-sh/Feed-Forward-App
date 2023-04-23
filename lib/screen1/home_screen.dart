import 'package:flutter/material.dart';
import 'package:food_donation/category/About.dart';
import 'package:food_donation/category/chat.dart';
import 'package:food_donation/category/money_donation.dart';
import 'package:food_donation/category/profile.dart';
import 'package:food_donation/resourses/cloudfirestore.dart';
import 'package:food_donation/screen/components/banner.dart';
import 'package:food_donation/screen/components/category.dart';
import 'package:food_donation/screen/components/loading.dart';
import 'package:food_donation/screen/components/product.dart';
import 'package:food_donation/screen/components/searchbar.dart';
import 'package:food_donation/screen/components/user_detail.dart';
import 'package:food_donation/screen/contact.dart';
import 'package:food_donation/screen/homepage.dart';
import 'package:food_donation/screen/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? rawFood;
  List<Widget>? cookedFood;
  List<Widget>? packedFood;
  List<Widget>? otherFood;

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      //print(controller.position.pixels);
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget detailSection() {
    return Column(
      children: [
        const SizedBox(
          height: 80 / 2,
        ),
        const CategoriesHorizontalListViewBar(),
        const AdBannerWidget(),
        ProductsShowcaseListView(title: "Raw Food", children: rawFood!),
        ProductsShowcaseListView(title: "Cooked Food", children: cookedFood!),
        ProductsShowcaseListView(title: "Packed Food", children: packedFood!),
        ProductsShowcaseListView(title: "Others Food", children: otherFood!),
      ],
    );
  }

  Widget _openDrawer() {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 250, 241, 229),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(120, 0, 0, 0),
                  blurRadius: 20,
                ),
              ],
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
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 43,
                  child: CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 40,
                    backgroundImage: AssetImage("images/logo1.jpg"),
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
                  builder: (ctx) => const HomeScreen(),
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
                  builder: (ctx) => ChatScreen(),
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

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductsFromDiscount(0);
    print("everything is Done");
    setState(() {
      rawFood = temp70;
      cookedFood = temp60;
      packedFood = temp50;
      otherFood = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _openDrawer(),
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: rawFood != null &&
              cookedFood != null &&
              packedFood != null &&
              otherFood != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  child: detailSection(),
                ),
                UserDetailsBar(
                  offset: offset,
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
