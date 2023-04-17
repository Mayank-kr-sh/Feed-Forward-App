import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/provider/user_details_provider.dart';
import 'package:food_donation/screen/components/account_app_bar.dart';
import 'package:food_donation/screen/components/custom_main.dart';
import 'package:food_donation/screen/components/product.dart';
import 'package:food_donation/screen1/sell_screen.dart';
import 'package:food_donation/user_Details/user_details.dart';
import 'package:food_donation/utils/constant.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              const IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    color: const Color.fromARGB(255, 250, 211, 57),
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellScreen()));
                    },
                    child: const Text("Sell",
                        style: TextStyle(color: Colors.black))),
              ),
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("orders")
                      .get(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      List<Widget> children = [];
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        // ProductModel model = ProductModel.getModelFromJson(
                        //     json: snapshot.data!.docs[i].data());
                        // children.add(SimpleProductWidget(productModel: model));
                      }
                      return ProductsShowcaseListView(
                          title: "Your orders", children: testChildren);
                    }
                  }),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Requests",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Expanded(
              //     child: StreamBuilder(
              //         stream: FirebaseFirestore.instance
              //             .collection("users")
              //             .doc(FirebaseAuth.instance.currentUser!.uid)
              //             .collection("orderRequests")
              //             .snapshots(),
              //         builder: (context,
              //             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
              //                 snapshot) {
              //           if (snapshot.connectionState ==
              //               ConnectionState.waiting) {
              //             return Container();
              //           } else {
              //             return ListView.builder(
              //                 itemCount: snapshot.data!.docs.length,
              //                 itemBuilder: (context, index) {
              //                   OrderRequestModel model =
              //                       OrderRequestModel.getModelFromJson(
              //                           json:
              //                               snapshot.data!.docs[index].data());
              //                   return ListTile(
              //                     title: Text(
              //                       "Order: ${model.orderName}",
              //                       style:
              //                           TextStyle(fontWeight: FontWeight.w500),
              //                     ),
              //                     subtitle:
              //                         Text("Address: ${model.buyersAddress}"),
              //                     trailing: IconButton(
              //                         onPressed: () async {
              //                           FirebaseFirestore.instance
              //                               .collection("users")
              //                               .doc(FirebaseAuth
              //                                   .instance.currentUser!.uid)
              //                               .collection("orderRequests")
              //                               .doc(snapshot.data!.docs[index].id)
              //                               .delete();
              //                         },
              //                         icon: Icon(Icons.check)),
              //                   );
              //                 });
              //           }
              //         }))
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Container(
      height: 80 / 2,
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
      child: Container(
        height: 80 / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.000000000001),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: "${userDetailsModel.name}",
                      //text: "${userDetailsModel.name}",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
