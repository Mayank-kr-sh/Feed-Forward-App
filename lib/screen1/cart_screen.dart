import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/provider/user_details_provider.dart';
import 'package:food_donation/resourses/cloudfirestore.dart';
import 'package:food_donation/screen/components/cart_item.dart';
import 'package:food_donation/screen/components/custom_main.dart';
import 'package:food_donation/screen/components/searchbar.dart';
import 'package:food_donation/screen/components/user_detail.dart';
import 'package:food_donation/user_Details/product.dart';
import 'package:food_donation/utils/utils.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        hasBackButton: false,
        isReadOnly: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 80 / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("cart")
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CustomMainButton(
                            color: Colors.yellow,
                            isLoading: true,
                            onPressed: () {},
                            child: const Text(
                              "Loading",
                            ));
                      } else {
                        return CustomMainButton(
                          color: Colors.yellow,
                          isLoading: false,
                          onPressed: () async {
                            await CloudFirestoreClass().buyAllItemsInCart(
                                userDetails: Provider.of<UserDetailsProvider>(
                                        context,
                                        listen: false)
                                    .userDetails);
                            Utils().showSnackBar(
                                context: context, content: "Done");
                          },
                          //onPressed: () {},
                          child: Text(
                            "Proceed to buy (${snapshot.data!.docs.length}) items",
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }
                    },
                  ),
                ),

                // Expanded(
                //   child: ListView.builder(
                //     itemCount: 5,
                //     itemBuilder: (context, index) {
                //       return CartItemWidget(
                //         product: ProductModel(
                //           url:
                //               "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
                //           productName: "Company Logo",
                //           cost: 100,
                //           discount: 10,
                //           uid: "mayank",
                //           sellerName: "food",
                //           sellerUid: "123",
                //           rating: 8,
                //           noOfRating: 8,
                //         ),
                //       );
                //     },
                //   ),
                // ),

                Expanded(
                    child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("cart")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            ProductModel model = ProductModel.getModelFromJson(
                                json: snapshot.data!.docs[index].data());
                            return CartItemWidget(product: model);
                          });
                    }
                  },
                ))
              ],
            ),
            UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
