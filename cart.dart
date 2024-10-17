import 'package:flutter/material.dart';
import 'frequency.dart'; // Import the frequency page

void main() => runApp(GreenTrayApp() as Widget);

class GreenTrayApp {
  // Add your app configuration here
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample data: list of items in the cart
  List<Map<String, dynamic>> cartItems = [
    {"name": "Apples", "quantity": 2, "price": 3.0},
    {"name": "Milk", "quantity": 1, "price": 2.5},
    {"name": "Bread", "quantity": 3, "price": 1.2},
  ];

  // Function to calculate the total price of the items in the cart
  double getTotalPrice() {
    return cartItems.fold(0.0, (total, item) => total + (item['quantity'] * item['price']));
  }

  // Function to update the quantity of an item
  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] += change;
      if (cartItems[index]['quantity'] < 1) {
        cartItems[index]['quantity'] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                cartItems.clear(); // Clear cart items
              });
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(cartItems[index]['name'][0]),
                        ),
                        title: Text(cartItems[index]['name']),
                        subtitle: Text('Price: \₹${cartItems[index]['price'].toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                updateQuantity(index, -1);
                              },
                            ),
                            Text('${cartItems[index]['quantity']}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                updateQuantity(index, 1);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Total Price Section
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\₹${getTotalPrice().toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the frequency selection page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FrequencyPage()),
                          );
                        },
                        child: Text('Select Frequency'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
