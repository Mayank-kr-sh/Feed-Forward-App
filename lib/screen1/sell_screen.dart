import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/provider/user_details_provider.dart';
import 'package:food_donation/resourses/cloudfirestore.dart';
import 'package:food_donation/screen/components/custom_main.dart';
import 'package:food_donation/screen/components/loading.dart';
import 'package:food_donation/screen/components/text_field.dart';
import 'package:food_donation/utils/utils.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<int> keysForDiscount = [0, 70, 60, 50];
  //keysofdiscoutn[selected -1]

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Type of food';
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: !isLoading
          ? SingleChildScrollView(
              child: SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            image == null
                                ? Image.network(
                                    "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                                    height: screenSize.height / 10,
                                  )
                                : Image.memory(
                                    image!,
                                    height: screenSize.height / 10,
                                  ),
                            IconButton(
                                onPressed: () async {
                                  Uint8List? temp = await Utils().pickImage();
                                  if (temp != null) {
                                    setState(() {
                                      image = temp;
                                    });
                                  }
                                },
                                icon: Icon(Icons.file_upload))
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          height: screenSize.height * 0.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFieldWidget(
                                  title: "Name",
                                  controller: nameController,
                                  obscureText: false,
                                  hintText: "Enter the name of the item"),
                              TextFieldWidget(
                                  title: "Cost",
                                  controller: costController,
                                  obscureText: false,
                                  hintText: "Enter the cost of the item"),
                              const Text(
                                "Discount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              ListTile(
                                title: Text("None"),
                                leading: Radio(
                                  value: 1,
                                  groupValue: selected,
                                  onChanged: (int? i) {
                                    setState(() {
                                      selected = i!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text("70%"),
                                leading: Radio(
                                  value: 2,
                                  groupValue: selected,
                                  onChanged: (int? i) {
                                    setState(() {
                                      selected = i!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text("60%"),
                                leading: Radio(
                                  value: 3,
                                  groupValue: selected,
                                  onChanged: (int? i) {
                                    setState(() {
                                      selected = i!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text("50%"),
                                leading: Radio(
                                  value: 4,
                                  groupValue: selected,
                                  onChanged: (int? i) {
                                    setState(() {
                                      selected = i!;
                                    });
                                  },
                                ),
                              ),
                              // DropdownButton<String>(
                              //   value: dropdownValue,
                              //   items: <String>[
                              //     "Type of food",
                              //     "Raw",
                              //     "Cooked",
                              //     "Packets"
                              //   ].map<DropdownMenuItem<String>>((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(
                              //         value,
                              //         style: TextStyle(
                              //             fontSize: 17,
                              //             color: Colors.grey[600]),
                              //       ),
                              //     );
                              //   }).toList(),
                              //   onChanged: (String? i) {
                              //     setState(
                              //       () {
                              //         dropdownValue = i!;
                              //       },
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.amber
                          width: screenSize.width * 0.6,
                          child: Column(
                            children: [
                              CustomMainButton(
                                color: Colors.yellow,
                                isLoading: isLoading,
                                //onPressed: () {},
                                onPressed: () async {
                                  String output = await CloudFirestoreClass()
                                      .uploadProductToDatabase(
                                          image: image,
                                          productName: nameController.text,
                                          rawCost: costController.text,
                                          discount:
                                              keysForDiscount[selected - 1],
                                          sellerName:
                                              Provider.of<UserDetailsProvider>(
                                                      context,
                                                      listen: false)
                                                  .userDetails
                                                  .name,
                                          sellerUid: FirebaseAuth
                                              .instance.currentUser!.uid);
                                  if (output == "success") {
                                    // ignore: use_build_context_synchronously
                                    Utils().showSnackBar(
                                        context: context,
                                        content: "Posted Product");
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                                child: const Text(
                                  "Sell",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomMainButton(
                                color: Colors.grey[300]!,
                                isLoading: false,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Back",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const LoadingWidget(),
    ));
  }
}
