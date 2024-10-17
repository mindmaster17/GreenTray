import 'package:flutter/material.dart';
import 'product.dart'; // Import your ProductPage

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  // Sample subscription data (You can replace this with actual data)
  String subscriptionFrequency = 'Weekly'; // Default frequency
  bool isActive = true; // Subscription status

  void _editSubscription() {
    // Implement edit subscription logic (e.g., show a dialog to change frequency)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? newFrequency = subscriptionFrequency;
        return AlertDialog(
          title: const Text('Edit Subscription'),
          content: DropdownButton<String>(
            value: newFrequency,
            items: ['None', 'Daily', 'Weekly', 'Monthly', 'Yearly']
                .map((String frequency) {
              return DropdownMenuItem<String>(
                value: frequency,
                child: Text(frequency),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                newFrequency = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newFrequency != null) {
                  setState(() {
                    subscriptionFrequency = newFrequency!;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _cancelSubscription() {
    // Implement cancel subscription logic
    setState(() {
      isActive = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Subscription has been cancelled.'),
      ),
    );
  }

  void _renewSubscription() {
    // Implement renew subscription logic
    setState(() {
      isActive = true; // Renew the subscription
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Subscription has been renewed.'),
      ),
    );
  }

  void _manageProducts() {
    // Navigate to the Product Page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Subscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Subscription Frequency:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subscriptionFrequency,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isActive ? _editSubscription : null,
              child: const Text('Edit Subscription'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: isActive ? _cancelSubscription : null,
              child: const Text('Cancel Subscription'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red color for cancel button
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: !isActive ? _renewSubscription : null,
              child: const Text('Renew Subscription'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Green color for renew button
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _manageProducts(),
              child: const Text('Manage Products'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color for manage products button
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
