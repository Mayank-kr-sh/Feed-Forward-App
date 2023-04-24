// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with SingleTickerProviderStateMixin {
  late Razorpay razorpay;
  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimation;

  // TextEditingController donationAmount = TextEditingController();
  // TextEditingController donorName = TextEditingController();
  String donorName = '';
  String donationAmount = '';
  String donarPanNumber = '';

  @override
  void initState() {
    super.initState();
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_scaleAnimationController);

    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalError);
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
    razorpay.clear();
  }

  void _playTickAnimation() {
    _scaleAnimationController.reset();
    _scaleAnimationController.forward();
    Vibrate.feedback(FeedbackType.success);
  }

  void _showConfirmationDialog() async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Confirm Donation',
          contentText:
              'Name: $donorName\nPAN Number: $donarPanNumber\nDonation Amount: ₹ $donationAmount',
          onPositiveClick: () {
            Navigator.of(context).pop();
            openCheckout();
          },
          positiveText: 'Confirm',
          negativeText: 'Cancel',
        );
      },
    );
  }

  void openCheckout() {
    var option = {
      "key": "rzp_test_U9FYqEmbnVGgs7",
      "amount": num.parse(donationAmount) * 100,
      "name": "Feed Forward",
      "discription": "Donation",
      "prefill": {
        "conatct": "xxx xxx 4645",
        "email": "test@gmail.com ",
      },
      "external": {
        "wallets": "[Paytem]",
      }
    };

    try {
      razorpay.open(option);
    } catch (e) {
      print(e.toString());
    }
  }

  // void handlerPaymentSuccess(PaymentSuccessResponse response) {
  //   print("Payment Successfull");
  //   // Toast.show("Pament success", textStyle: context);
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("SUCCESS")));
  // }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Payment success callback
    print('Payment Success: ${response.paymentId}');
    _uploadDonorDetails();
    _playTickAnimation();
  }

  void handlerError(PaymentFailureResponse response) {
    print("Payment Error ${response.code} - ${response.message}");
    // Toast.show("Pament Error", textStyle: context);
  }

  void handlerExternalError(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
    // Toast.show("External Wallet", textStyle: context);
  }

  void _uploadDonorDetails() async {
    // Upload donor details to Firebase Firestore
    await Firebase.initializeApp();
    FirebaseFirestore.instance.collection('donors').add({
      'Donor Name': donorName,
      'Donation Amount': donationAmount,
      'Pan Number': donarPanNumber,
    });
    setState(() {
      donorName = '';
      donationAmount = '';
      donarPanNumber = '';
    });
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
        title: const Text('Donation Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Thank you for choosing to donate!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Your donation will be used to support our organization and its activities. Please provide your details below:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 32.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Donor Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  donorName = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Donor Pan Number',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  donarPanNumber = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Donation Amount',
                prefixText: '₹ ',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  donationAmount = value;
                });
              },
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.orange,
                  elevation: 5.0,
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: () {
                  if (donorName.isNotEmpty &&
                      donationAmount.isNotEmpty &&
                      donarPanNumber.isNotEmpty) {
                    _showConfirmationDialog();
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please fill in all the fields.'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  'Submit Donation',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            ScaleTransition(
              scale: _scaleAnimation,
              child: const Icon(
                Icons.check_circle,
                size: 48.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
