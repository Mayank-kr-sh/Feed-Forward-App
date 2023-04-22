// import 'package:flutter/material.dart';

// class DonationPage extends StatelessWidget {
//   const DonationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Donate Now'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Select an amount to donate:',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             const DonationAmountButtons(), // Display donation amount buttons
//             const SizedBox(height: 16.0),
//             const Divider(),
//             const SizedBox(height: 16.0),
//             const Text(
//               'Enter custom amount:',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             DonationCustomAmountField(), // Display custom amount text field
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle donation submit
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Thank You!'),
//                       content: const Text('Your donation has been submitted.'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text('OK'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: const Text('Donate Now'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DonationAmountButtons extends StatelessWidget {
//   const DonationAmountButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: const Text('\$10'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: const Text('\$25'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: const Text('\$50'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: const Text('\$100'),
//         ),
//       ],
//     );
//   }
// }

// class DonationCustomAmountField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.attach_money),
//         labelText: 'Amount',
//         border: OutlineInputBorder(),
//       ),
//       onChanged: (value) {
//         // Handle custom amount input
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class DonationPage extends StatefulWidget {
//   const DonationPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _DonationPageState createState() => _DonationPageState();
// }

// class _DonationPageState extends State<DonationPage> {
//   double _customAmount = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Donate Now'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Select an amount to donate:',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             DonationAmountButtons(), // Display donation amount buttons
//             SizedBox(height: 16.0),
//             Divider(),
//             SizedBox(height: 16.0),
//             Text(
//               'Enter custom amount:',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             TextFormField(
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.attach_money),
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _customAmount = double.parse(value);
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 if (_customAmount > 0) {
//                   // Handle custom amount submission
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Thank You!'),
//                         content: Text('You are donating \$$_customAmount.'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 } else {
//                   // Show error message for invalid amount
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Error'),
//                         content: Text('Please enter a valid amount.'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               child: Text('Donate Now'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DonationAmountButtons extends StatelessWidget {
//   const DonationAmountButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: Text('\$10'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: Text('\$25'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: Text('\$50'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Handle donation amount selection
//           },
//           child: Text('\$100'),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class DonationPage extends StatefulWidget {
//   const DonationPage({super.key});

//   @override
//   _DonationPageState createState() => _DonationPageState();
// }

// class _DonationPageState extends State<DonationPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _panNumber = '';
//   double _donationAmount = 0.0;

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       // Call API for payment processing
//       // Show summary page after successful payment
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Donation Summary'),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Name: $_name'),
//                 Text('PAN Number: $_panNumber'),
//                 Text('Donation Amount: \$$_donationAmount'),
//               ],
//             ),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Print'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Donate Now'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _name = value!;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'PAN Number',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your PAN number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _panNumber = value!;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 decoration: InputDecoration(
//                   labelText: 'Donation Amount',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the donation amount';
//                   }
//                   double amount = double.tryParse(value)!;
//                   if (amount <= 0) {
//                     return 'Please enter a valid donation amount';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _donationAmount = double.parse(value!);
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text('Donate Now'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _panNumberController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  bool _isPaymentSuccess = false;
  Razorpay _razorpay = Razorpay();

  void _initRazorpay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void initState() {
    super.initState();
    _initRazorpay();
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clear listeners before disposing
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      _isPaymentSuccess = true;
    });
    _showSummaryDialog();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      _isPaymentSuccess = false;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Error'),
          content: Text('Payment failed. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet response
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Donation Summary'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${_nameController.text}',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('PAN Number: ${_panNumberController.text}',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Amount: ${_amountController.text}',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _printSummary();
              },
              child: Text('Print'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetForm();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _printSummary() {
    // Perform print operation
    print('Printing Donation Summary...');
  }

  void _resetForm() {
    _nameController.clear();
    _panNumberController.clear();
    _amountController.clear();
    setState(() {
      _isPaymentSuccess = false;
    });
  }

  void _openRazorpayCheckout() {
    int amount = int.parse(_amountController.text) * 100; // Amount in paise
    var options = {
      'key': 'YOUR_RAZORPAY_API_KEY',
      'amount': amount,
      'name': _nameController.text,
      'description': 'Donation',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm'],
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _panNumberController,
                decoration: InputDecoration(labelText: 'PAN Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your PAN Number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount (INR)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter donation amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _openRazorpayCheckout();
                  }
                },
                child: Text('Donate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
