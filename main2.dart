import 'package:flutter/material.dart';
import 'cart.dart';  // Import cart page
import 'contact.dart'; // Import contact page
import 'product.dart'; // Import product page
import 'subscription.dart'; // Import subscription page
import 'about.dart'; // Import about page

void main() {
  runApp(GreenTrayApp());
}

class GreenTrayApp extends StatelessWidget {
  const GreenTrayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenTray',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/cart': (context) => CartPage(), // Register the cart route
        '/contact': (context) => ContactUsPage(), // Register the contact route
        '/products': (context) => ProductPage(), // Assuming you want to navigate to ProductPage
        '/subscriptions': (context) => SubscriptionPage(), // Register the subscription route
        '/about': (context) => AboutPage(), // Register the about route
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GreenTray'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'GreenTray Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigate to Home
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Products'),
              onTap: () {
                Navigator.pushNamed(context, '/products'); // Navigate to Products page
              },
            ),
            ListTile(
              leading: const Icon(Icons.subscriptions),
              title: const Text('Subscriptions'),
              onTap: () {
                Navigator.pushNamed(context, '/subscriptions'); // Navigate to Subscriptions page
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer),
              title: const Text('Offers'),
              onTap: () {
                // Navigate to Offers
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about'); // Navigate to About page
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, '/contact'); // Navigate to Contact Us
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Hero Section
          Container(
            height: 250.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/1500x400'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Fresh Groceries Delivered Right to Your Door',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Subscribe for hassle-free deliveries every week',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Start subscription action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                    ),
                    child: Text('Start Your Subscription'),
                  ),
                ],
              ),
            ),
          ),
          // Features Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FeatureCard(
                  title: 'Fresh Produce',
                  description: 'Get fresh fruits and vegetables delivered to you.',
                  icon: Icons.local_grocery_store,
                ),
                FeatureCard(
                  title: 'Same-Day Delivery',
                  description: 'Order now and get your groceries the same day.',
                  icon: Icons.delivery_dining,
                ),
                FeatureCard(
                  title: 'Flexible Subscription Plans',
                  description: 'Choose a plan that fits your needs.',
                  icon: Icons.subscriptions,
                ),
                FeatureCard(
                  title: 'Customer Reviews',
                  description: '"Groceries are always fresh and on time!"',
                  icon: Icons.reviews,
                ),
              ],
            ),
          ),
          // CTA Section
          Container(
            color: Colors.orange,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Sign Up Now and Get 10% Off Your First Subscription!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    // Sign up action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange, backgroundColor: Colors.white, // Button text color
                  ),
                  child: Text('Get Started Today'),
                ),
              ],
            ),
          ),
        ],
      ),
      // Footer Section
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 41.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Phone: +123 456 7890',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Email: support@GreenTray.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Follow Us',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: .0),
                  Text('Facebook', style: TextStyle(color: Colors.white)),
                  Text('Instagram', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for feature cards
class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const FeatureCard({super.key, 
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.green, size: 40.0),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
