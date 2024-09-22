// watchlist_page.dart
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class WatchlistPage extends StatelessWidget {
  final List<Map<String, dynamic>> watchlist;

  const WatchlistPage({required this.watchlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
        backgroundColor: Colors.green[700], 
      ),
      body: watchlist.isEmpty
          ? Center(
              child: Text(
                'Your Watchlist is Empty',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: watchlist.length,
              itemBuilder: (context, index) {
                final product = watchlist[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(
                      product['image'] ?? 'assets/products/default.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      product['name'] ?? 'Unnamed Product',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      product['price'] ?? 'Price not available',
                      style: TextStyle(fontSize: 14, color: Colors.green[800]),
                    ),
                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: product,
                        ),
                      ),
                    );
                  },
                  ),
                );
              },
            ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] ?? 'Product Details'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                product['image'] ?? 'assets/products/default.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product['name'] ?? 'Unnamed Product',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product['price'] ?? 'Price not available',
              style: TextStyle(fontSize: 20, color: Colors.green[800]),
            ),
            SizedBox(height: 16),
            Text(
              product['description'] ?? 'No description available.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
