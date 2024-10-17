import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Customized Grocery Subscription Service for Thrissur',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Imagine receiving your groceries as effortlessly as a daily newspaper or milk delivery—fresh, high-quality essentials arriving at your doorstep every day, tailored to your household’s needs. Our customized grocery subscription service offers exactly that, with a model designed to simplify grocery shopping for busy households in Thrissur.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Customers can personalize their subscriptions by choosing the items they need—vegetables, fruits, milk, bread, pantry staples—and select the frequency of deliveries, whether daily or weekly. Each delivery is sourced from trusted local vendors, ensuring freshness, quality, and safety with every order.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Our flexible subscription plans adapt to changing needs, allowing households to easily adjust their orders, pause deliveries, or skip a day—all through a simple app or website. Plus, with direct-to-consumer deliveries, we keep costs low while maintaining strict standards of hygiene and food safety.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'By eliminating the hassle of grocery shopping and guaranteeing fresh, high-quality products at your door, we’re making sure you always have the essentials when you need them, without compromise.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Innovative Features and Benefits:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildFeatureCard(
                title: 'Convenience at Your Fingertips',
                description:
                    'Our user-friendly app allows customers to effortlessly manage their subscriptions, adjust orders, and track deliveries in real-time. No more last-minute grocery runs or worrying about running out of essentials.',
              ),
              _buildFeatureCard(
                title: 'Reduce Food Waste',
                description:
                    'With customized orders based on actual consumption patterns, households receive only what they need, minimizing food waste and promoting sustainability. This is not just a grocery delivery service; it\'s a step towards responsible consumption.',
              ),
              _buildFeatureCard(
                title: 'Quality Assurance',
                description:
                    'We prioritize the quality of every item delivered. Our rigorous quality control checks ensure that only the freshest produce and highest-quality goods reach your home. Our partnerships with local farmers and vendors allow us to maintain strict hygiene standards and food safety protocols.',
              ),
              _buildFeatureCard(
                title: 'Community Support',
                description:
                    'By sourcing groceries locally, our service supports the local economy and strengthens community ties. Customers can feel good knowing their purchases contribute to local farmers and businesses.',
              ),
              _buildFeatureCard(
                title: 'Festive Flexibility',
                description:
                    'During festivals or special occasions, customers can easily modify their subscriptions to include additional items, ensuring they have everything they need for celebrations without the stress of last-minute shopping.',
              ),
              _buildFeatureCard(
                title: 'Trial and Feedback',
                description:
                    'We offer trial subscriptions for new customers, allowing them to experience the service risk-free. Continuous feedback will help us improve and tailor our offerings to meet customer preferences better.',
              ),
              const SizedBox(height: 20),
              const Text(
                'In conclusion, our customized grocery subscription service is not just about delivering food; it\'s about enhancing the way households in Thrissur manage their grocery needs. We are committed to delivering convenience, quality, and sustainability, making fresh, safe groceries accessible to everyone, every day. Join us in revolutionizing the grocery shopping experience, ensuring that high-quality food is always just a doorstep away.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({required String title, required String description}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
