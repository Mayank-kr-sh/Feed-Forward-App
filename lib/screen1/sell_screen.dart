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
  TextEditingController locationController = TextEditingController();
  TextEditingController mssgController = TextEditingController();
  List<int> keysForDiscount = [70, 60, 50];
  //keysofdiscoutn[selected -1]

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    locationController.dispose();
    mssgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            image == null
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundColor:
                                        Color.fromARGB(54, 158, 158, 158),
                                    child: Image.asset(
                                      "images/upload.png",
                                      height: screenSize.height / 3,
                                    ),
                                  )
                                : Image.memory(
                                    image!,
                                    height: screenSize.height / 5,
                                  ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () async {
                                    Uint8List? temp = await Utils().pickImage();
                                    if (temp != null) {
                                      setState(() {
                                        image = temp;
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.file_upload_rounded,
                                    color: Colors.grey,
                                    size: 10,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          height: screenSize.height * 0.65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFieldWidget(
                                  title: "Food Name",
                                  controller: nameController,
                                  obscureText: false,
                                  hintText: "Enter the name of the item"),
                              TextFieldWidget(
                                  title: "Location",
                                  controller: locationController,
                                  obscureText: false,
                                  hintText: "Enter Location to Pick Up Food"),
                              TextFieldWidget(
                                  title: "Other Information",
                                  controller: locationController,
                                  obscureText: false,
                                  hintText:
                                      "Please Mention the quality of food"),
                              const Text(
                                "Category Of Foods",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 2),
                              // ListTile(
                              //   title: Text("Other Food"),
                              //   leading: Radio(
                              //     value: 1,
                              //     groupValue: selected,
                              //     onChanged: (int? i) {
                              //       setState(() {
                              //         selected = i!;
                              //       });
                              //     },
                              //   ),
                              // ),
                              SizedBox(height: 2),
                              ListTile(
                                title: const Text("Raw Food"),
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
                              SizedBox(height: 2),
                              ListTile(
                                title: const Text("Cooked Food"),
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
                              SizedBox(height: 2),
                              ListTile(
                                title: const Text("Packed Food"),
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
                            ],
                          ),
                        ),
                        SizedBox(
                          // color: Colors.amber
                          width: screenSize.width * 0.6,
                          child: Column(
                            children: [
                              CustomMainButton(
                                color: Colors.yellow,
                                isLoading: isLoading,
                                onPressed: () async {
                                  String output = await CloudFirestoreClass()
                                      .uploadProductToDatabase(
                                          image: image,
                                          productName: nameController.text,
                                          rawCost: locationController.text,
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
                                        content: "Notified Sucessfully");
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                                child: const Text(
                                  "Notify To Organization",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomMainButton(
                                color: Colors.grey[300]!,
                                isLoading: false,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Back to Profile",
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
