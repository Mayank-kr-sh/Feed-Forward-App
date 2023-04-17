import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/screen/components/cost_item.dart';
import 'package:food_donation/screen/components/custom_main.dart';
import 'package:food_donation/screen/components/custome_simple_rounded.dart';
import 'package:food_donation/screen/components/rating_widget.dart';
import 'package:food_donation/screen/components/review_dialog.dart';
import 'package:food_donation/screen/components/review_widgit.dart';
import 'package:food_donation/screen/components/searchbar.dart';
import 'package:food_donation/screen/components/user_detail.dart';
import 'package:food_donation/user_Details/product.dart';
import 'package:food_donation/user_Details/review_model.dart';
import 'package:food_donation/user_Details/user_details.dart';
import 'package:food_donation/utils/utils.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  //SizedBox spaceThingy = const SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height - (170 + (170 / 2)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 80 / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        widget.productModel.sellerName,
                                        style: const TextStyle(
                                            color: Colors.cyan, fontSize: 16),
                                      ),
                                    ),
                                    Text(widget.productModel.productName),
                                  ],
                                ),
                                RatingStatWidget(
                                  rating: widget.productModel.rating,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                  maxHeight: screenSize.height / 3),
                              child: Image.network(widget.productModel.url),
                            ),
                          ),
                          spaceThingy,
                          CostWidget(
                              color: Colors.black,
                              cost: widget.productModel.cost),
                          spaceThingy,
                          CustomMainButton(
                            color: Colors.orange,
                            isLoading: false,
                            // onPressed: () async {
                            //   await CloudFirestoreClass().addProductToOrders(
                            //       model: widget.productModel,
                            //       userDetails:
                            //           Provider.of<UserDetailsProvider>(
                            //                   context,
                            //                   listen: false)
                            //               .userDetails);
                            //   Utils().showSnackBar(
                            //       context: context, content: "Done");
                            // },
                            onPressed: () {},
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          spaceThingy,
                          CustomMainButton(
                            color: Colors.yellow,
                            isLoading: false,
                            // onPressed: () async {
                            //   await CloudFirestoreClass().addProductToCart(
                            //       productModel: widget.productModel);
                            //   Utils().showSnackBar(
                            //       context: context,
                            //       content: "Added to cart.");
                            // },
                            onPressed: () {},
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          spaceThingy,
                          CustomSimpleRoundedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ReviewDialog(
                                          productUid: widget.productModel.uid,
                                        ));
                              },
                              // onPressed: () {},
                              text: "Add a review for this product"),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: screenSize.height,
                    //   child: ListView.builder(
                    //     itemCount: 10,
                    //     itemBuilder: (contex, Index) {
                    //       return const ReviewWidget(
                    //         review: ReviewModel(
                    //             senderName: "Mayank",
                    //             description: "Good",
                    //             rating: 4),
                    //       );
                    //     },
                    //   ),
                    // )
                    SizedBox(
                        height: screenSize.height,
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("products")
                              .doc(widget.productModel.uid)
                              .collection("reviews")
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            } else {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    ReviewModel model =
                                        ReviewModel.getModelFromJson(
                                            json: snapshot.data!.docs[index]
                                                .data());
                                    return ReviewWidget(review: model);
                                  });
                            }
                          },
                        ))
                  ],
                ),
              ),
            ),
            const UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
