import 'dart:math';
import 'package:flutter/material.dart';
import 'cart.dart';  // Import cart page

void main() => runApp(GreenTrayApp() as Widget);

class Product {
  final String name;
  final double price;
  final String category;
  final String imageUrl;
  final int orderCount; // For sorting by most ordered

  Product(this.name, this.price, this.category, this.imageUrl, this.orderCount);
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedCategory = 'All';
  String selectedSort = 'Price: Low to High';
  List<String> categories = ['All', 'Fruits', 'Vegetables', 'Dairy', 'Snacks'];
  List<String> sortOptions = ['Price: Low to High', 'Price: High to Low', 'Newest First', 'Most Ordered'];
  late List<Product> products;
  late List<Product> filteredProducts;

  // Arrays for different product categories
  final List<String> fruitNames = ['Apple', 'Banana', 'Orange', 'Grapes', 'Mango'];
  final List<String> vegetableNames = ['Carrot', 'Broccoli', 'Spinach', 'Potato', 'Tomato'];
  final List<String> dairyNames = ['Milk', 'Cheese', 'Yogurt', 'Butter', 'Cream'];
  final List<String> snackNames = ['Chips', 'Cookies', 'Candy', 'Nuts', 'Granola Bars'];

  @override
  void initState() {
    super.initState();
    products = generateRandomProducts();
    filteredProducts = products;
  }

  List<Product> generateRandomProducts() {
    Random random = Random();
    List<Product> generatedProducts = [];

    for (int i = 0; i < 20; i++) { // Generate 20 random products
      String category;
      String name;

      // Randomly select category and name
      int categoryIndex = random.nextInt(categories.length - 1); // Exclude 'All'
      if (categoryIndex == 0) {
        category = 'Fruits';
        name = fruitNames[random.nextInt(fruitNames.length)];
      } else if (categoryIndex == 1) {
        category = 'Vegetables';
        name = vegetableNames[random.nextInt(vegetableNames.length)];
      } else if (categoryIndex == 2) {
        category = 'Dairy';
        name = dairyNames[random.nextInt(dairyNames.length)];
      } else {
        category = 'Snacks';
        name = snackNames[random.nextInt(snackNames.length)];
      }

      double price = (random.nextDouble() * 20 + 1); // Price between $1 and $21
      int orderCount = random.nextInt(100); // Random order count for most ordered sorting

      generatedProducts.add(Product(
        name,
        price,
        category,
        'https://via.placeholder.com/150', // Placeholder image
        orderCount,
      ));
    }

    return generatedProducts;
  }

  void filterProducts() {
    setState(() {
      // Filter logic based on selectedCategory
      filteredProducts = selectedCategory == 'All' 
        ? products 
        : products.where((product) => product.category == selectedCategory).toList();

      // Sort logic based on selectedSort
      if (selectedSort == 'Price: Low to High') {
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (selectedSort == 'Price: High to Low') {
        filteredProducts.sort((b, a) => a.price.compareTo(b.price));
      } else if (selectedSort == 'Newest First') {
        // Assume products are ordered by the index they were created for simplicity
        filteredProducts.sort((a, b) => products.indexOf(b).compareTo(products.indexOf(a)));
      } else if (selectedSort == 'Most Ordered') {
        filteredProducts.sort((b, a) => a.orderCount.compareTo(b.orderCount));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart'); // Navigate to cart page
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                      filterProducts();
                    });
                  },
                ),
                DropdownButton<String>(
                  value: selectedSort,
                  items: sortOptions.map((String sortOption) {
                    return DropdownMenuItem<String>(
                      value: sortOption,
                      child: Text(sortOption),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSort = newValue!;
                      filterProducts();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: filteredProducts.length, // Updated to filtered products count
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(
                  productName: product.name,
                  productPrice: '\$${product.price.toStringAsFixed(2)}',
                  productImage: product.imageUrl,
                  onAddToCart: () {
                    // Implement add to cart functionality
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to home page
              },
            ),
            IconButton(
              icon: const Icon(Icons.contact_mail),
              onPressed: () {
                // Navigate to contact us page
              },
            ),
            IconButton(
              icon: const Icon(Icons.local_offer),
              onPressed: () {
                // Navigate to offers page
              },
            ),
            IconButton(
              icon: const Icon(Icons.subscriptions),
              onPressed: () {
                // Navigate to subscriptions page
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for displaying individual product cards
class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            productImage,
            height: 120,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  productPrice,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
                ElevatedButton(
                  onPressed: onAddToCart,
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
