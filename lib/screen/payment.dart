// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:food_donation/category/About.dart';
import 'package:food_donation/screen/components/my_button.dart';
import 'package:food_donation/screen/components/text_form_email.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late Razorpay razorpay;
  final TextEditingController amount = TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalError);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var option = {
      "key": "rzp_test_U9FYqEmbnVGgs7",
      "amount": num.parse(amount.text) * 100,
      "name": "Sample App",
      "discription": "Payment For the app",
      "prefill": {
        "conatct": "123456789",
        "email": "mayank123@gmail.com ",
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

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successfull");
    // Toast.show("Pament success", textStyle: context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("SUCCESS")));
  }

  void handlerError(PaymentFailureResponse response) {
    print("Payment Error");
    // Toast.show("Pament Error", textStyle: context);
  }

  void handlerExternalError(ExternalWalletResponse response) {
    print("External Wallet");
    // Toast.show("External Wallet", textStyle: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => About(),
              ),
            );
          },
        ),
        //elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 114, 243, 118),
        title: const Text(
          "Payment Gatway",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            //fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Column(
        children: [
          MyTextEmail(controller: amount, hint: 'Enter Amount'),
          SizedBox(height: 15),
          MyButton(
            name: "Pay",
            onpress: () {
              openCheckout();
            },
          ),
        ],
      ),
    );
  }
}
