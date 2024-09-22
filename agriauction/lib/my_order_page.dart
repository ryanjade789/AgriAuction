// my_order_page.dart
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'home_page.dart';

class MyOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.green[700], 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            OrderStatus(),
            SizedBox(height: 20),
            Text(
              'My Wallet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            MyWallet(),
          ],
        ),
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OrderStatusItem(
          icon: Icons.payment,
          label: 'To Pay',
          count: 3,
          onPressed: () {
          },
        ),
        OrderStatusItem(
          icon: Icons.local_shipping,
          label: 'To Ship',
          count: 5,
          onPressed: () {
          },
        ),
        OrderStatusItem(
          icon: Icons.receipt,
          label: 'To Receive',
          count: 2, 
          onPressed: () {
          },
        ),
        OrderStatusItem(
          icon: Icons.rate_review,
          label: 'To Rate',
          count: 4, 
          onPressed: () {
          },
        ),
      ],
    );
  }
}

class MyWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyWalletItem(
          icon: Icons.account_balance_wallet,
          label: 'eWallet Balance',
          count: 150, 
          onPressed: () {
          },
        ),
        MyWalletItem(
          icon: Icons.card_giftcard,
          label: 'Vouchers',
          count: 5,
          onPressed: () {
          },
        ),
      ],
    );
  }
}

class OrderStatusItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final VoidCallback onPressed;

  OrderStatusItem({required this.icon, required this.label, required this.count, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(icon, size: 30),
              if (count > 0)
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      '$count',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}

class MyWalletItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final VoidCallback onPressed;

  MyWalletItem({required this.icon, required this.label, required this.count, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(icon, size: 30),
          SizedBox(height: 5),
          Text(label),
          Text(' ${count.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
