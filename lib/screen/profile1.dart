import 'package:flutter/material.dart';
import 'package:food_donation/screen/homepage.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  // UserProvider userProvider;
  // MyProfile({this.userProvider});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    //var userData = widget.userProvider.currentUserData;

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
          "My Profile",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 130,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 114, 243, 118),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 175, 172, 160),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    // userData.userName,
                                    "Mayank Kumar Shah",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Text(userData.userEmail),
                                  Text("Mayank123@gmail.com")
                                ],
                              ),
                              const CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Color.fromARGB(255, 30, 31, 31),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 238, 232, 204),
                                  child: Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Color.fromARGB(255, 31, 35, 33),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.shop_outlined, title: "My Orders"),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery Address"),
                    listTile(
                        icon: Icons.person_outline, title: "Refer A Friends"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions"),
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy Policy"),
                    listTile(icon: Icons.add_chart, title: "About"),
                    listTile(
                        icon: Icons.exit_to_app_outlined, title: "Log Out"),
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 80, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  // userData.userImage ??
                  "images/Logo.png",
                ),
                radius: 45,
                backgroundColor: Color.fromARGB(255, 239, 234, 209),
              ),
            ),
          )
        ],
      ),
    );
  }
}
