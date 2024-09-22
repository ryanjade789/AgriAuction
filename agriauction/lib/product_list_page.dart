// product_list_page.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Ampalaya',
      'price': '₱95',
      'stock': 50,
      'image': 'assets/products/ampalaya.jpg',
    },
    {
      'name': 'Red Bell Pepper',
      'price': '₱310',
      'stock': 30,
      'image': 'assets/products/pepper.jpg',
    },
    {
      'name': 'Banana',
      'price': '₱121',
      'stock': 100,
      'image': 'assets/products/banana.png',
    },
    {
      'name': 'Basil',
      'price': '₱189',
      'stock': 20,
      'image': 'assets/products/basil.jpg',
    },
    {
      'name': 'Baguio Beans',
      'price': '₱79',
      'stock': 40,
      'image': 'assets/products/beans.jpg',
    },
    {
      'name': 'Bokchoy',
      'price': '₱116',
      'stock': 60,
      'image': 'assets/products/bokchoy.jpg',
    },
    {
      'name': 'Calamansi',
      'price': '₱147',
      'stock': 70,
      'image': 'assets/products/calamansi.jpg',
    },
    {
      'name': 'Strawberry',
      'price': '₱536',
      'stock': 25,
      'image': 'assets/products/strawberry.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Action for adding new product
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Action for adding new product
              },
              child: Text('Add New Product'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  product['image'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('${product['price']}'),
                      Text('Stocks: ${product['stock']}'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for boosting the product
                  },
                  child: Text('Boost'),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    // Action for delisting the product
                  },
                  child: Text('Delist'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    // Action for editing the product
                  },
                  child: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
