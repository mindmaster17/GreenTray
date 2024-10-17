import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String deliveryAddress = '';
  String phoneNumber = '';
  String selectedPaymentMethod = 'UPI';

  // List of payment options
  final List<String> paymentOptions = ['UPI', 'Bank Transfer', 'Cash on Delivery'];

  // Text editing controllers
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = deliveryAddress; // Initialize with empty or default address
    phoneController.text = phoneNumber; // Initialize with empty or default phone number
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address Section
            Text(
              'Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Enter your delivery address',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  deliveryAddress = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Phone Number Section
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Payment Method Section
            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: paymentOptions.map((paymentOption) {
                return ListTile(
                  title: Text(paymentOption),
                  leading: Radio<String>(
                    value: paymentOption,
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 30),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment confirmation or navigation to next step
                  _confirmPayment();
                },
                child: Text('Confirm Payment'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Confirmation of payment method
  void _confirmPayment() {
    if (deliveryAddress.isEmpty || phoneNumber.isEmpty) {
      // Show error if delivery address or phone number is missing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both delivery address and phone number')),
      );
    } else {
      // Here you can add logic for payment processing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment confirmed with $selectedPaymentMethod')),
      );
    }
  }
}
