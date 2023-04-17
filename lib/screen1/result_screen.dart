import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/screen/components/result_widget.dart';
import 'package:food_donation/screen/components/searchbar.dart';
import 'package:food_donation/user_Details/product.dart';

class ResultsScreen extends StatelessWidget {
  final String query;
  const ResultsScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Showing results for ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text: query,
                      style: const TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 2 / 4),
                itemBuilder: (context, index) {
                  return ResultsWidget(
                    product: ProductModel(
                      url:
                          "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
                      productName: "Company Logo",
                      cost: 100,
                      discount: 10,
                      uid: "mayank",
                      sellerName: "food",
                      sellerUid: "123",
                      rating: 3,
                      noOfRating: 8,
                    ),
                  );
                }),
          )
          //Expanded(
          // child: FutureBuilder(
          //     future: FirebaseFirestore.instance
          //         .collection("products")
          //         .where("productName", isEqualTo: query)
          //         .get(),
          //     builder: (context,
          //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
          //             snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const LoadingWidget();
          //       } else {
          //         return GridView.builder(
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //                     crossAxisCount: 3, childAspectRatio: 2 / 3.5),
          //             itemCount: snapshot.data!.docs.length,
          //             itemBuilder: (context, index) {
          //               ProductModel product =
          //                   ProductModel.getModelFromJson(
          //                       json: snapshot.data!.docs[index].data());
          //               return ResultsWidget(product: product);
          //             });
          //       }
          //     }))
        ],
      ),
    );
  }
}
