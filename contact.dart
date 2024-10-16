import 'package:flutter/material.dart';

void main() => runApp(GreenTrayApp());

class GreenTrayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenTray',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactUsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _message;
  String _inquiryType = 'General';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get in Touch With Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Name',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => _name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => _email = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Message',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                      onSaved: (value) => _message = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      value: _inquiryType,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Inquiry Type',
                      ),
                      items: <String>['General', 'Support', 'Feedback']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _inquiryType = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Handle form submission (e.g., send data to server)
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Message Sent!'),
                            ),
                          );
                        }
                      },
                      child: const Text('Send Message'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text('Phone: +123 456 7890'),
              const Text('Email: support@GreenTray.com'),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text('Follow Us:'),
                  IconButton(
                    icon: const Icon(Icons.facebook),
                    onPressed: () {
                      // Open Facebook
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt), // Instagram icon
                    onPressed: () {
                      // Open Instagram
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.green,
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            '© 2024 GreenTray. All Rights Reserved.',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
