// product_detail_page.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'dart:async';
import 'watchlist_page.dart';
import 'chat_page.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Timer _timer;
  late DateTime _auctionEndTime;
  final List<Map<String, dynamic>> _watchlist = [];

  @override
  void initState() {
    super.initState();
    _auctionEndTime = DateTime.parse(widget.product['auctionEndTime'] ?? DateTime.now().toString());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _getRemainingTime() {
    final now = DateTime.now();
    final difference = _auctionEndTime.difference(now);
    if (difference.isNegative) {
      return 'Auction Ended';
    } else {
      final days = difference.inDays;
      final hours = difference.inHours % 24;
      final minutes = difference.inMinutes % 60;
      final seconds = difference.inSeconds % 60;
      return '$days:$hours:$minutes:$seconds';
    }
  }

  Widget _buildRatingStars(int rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(Icon(
        i <= rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
      ));
    }
    return Row(children: stars);
  }

  Future<void> _showPlaceBidDialog(BuildContext context) async {
    final TextEditingController _quantityController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for closure
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Place Bid'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Enter the amount you want to purchase:'),
                TextField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Amount',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                // Handle the bid confirmation here
                final int quantity = int.parse(_quantityController.text);
                // Do something with the quantity

                // Show a confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your bid for $quantity kg has been placed.'),
                    duration: Duration(seconds: 3),
                  ),
                );

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> additionalImages = List<String>.from(widget.product['additionalImages'] ?? []);
    final int rating = widget.product['rating'] ?? 0;
    final String review = widget.product['review'] ?? 'No reviews yet';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: additionalImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(additionalImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product['price'] ?? 'Price not available',
                  style: TextStyle(fontSize: 24, color: Colors.green[800], fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.product['sold'] ?? '0'} sold',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              widget.product['name'] ?? 'Product Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildRatingStars(rating),
            SizedBox(height: 8),
            Text(
              'Harvest Day: ${widget.product['harvestDay'] ?? 'Not specified'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              widget.product['description'] ?? 'No Available Description',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Estimated Delivery Date: ${widget.product['estimatedDeliveryDate'] ?? 'No date specified'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Delivery Fee: ${widget.product['deliveryFee'] ?? 'No fee specified'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Auction Ends In: ${_getRemainingTime()}',
              style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Divider(),
            Text(
              'Product Review',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              review,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Divider(),
            Text(
              'Seller Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.product['sellerImage']),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product['sellerName'] ?? 'Seller Name',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.product['sellerAddress'] ?? 'Seller Address',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.black),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add, color: Colors.yellow),
            label: 'Add to Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel, color: Colors.red),
            label: 'Place Bid',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
              break;
            case 1:
              setState(() {
                _watchlist.add(widget.product);
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WatchlistPage(watchlist: _watchlist),
                ),
              );
              break;
            case 2:
              _showPlaceBidDialog(context);
              break;
          }
        },
      ),
    );
  }
}
