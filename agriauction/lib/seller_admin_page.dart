// seller_admin_page.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'product_list_page.dart'; // Import the new ProductListPage
import 'my_finance_page.dart'; // Import the MyFinancePage
import 'shop_performance_page.dart';
class SellerAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
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
            SizedBox(height: 10),
            OrderStatus(),
            SizedBox(height: 20),
            Text(
              'Admin Tools',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            AdminToolsGrid(),
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
          icon: Icons.local_shipping,
          label: 'To Ship',
          count: 5, // Example count
          onPressed: () {
            // Define action on press
          },
        ),
        OrderStatusItem(
          icon: Icons.cancel,
          label: 'Cancelled',
          count: 2, // Example count
          onPressed: () {
            // Define action on press
          },
        ),
        OrderStatusItem(
          icon: Icons.undo,
          label: 'Return',
          count: 1, // Example count
          onPressed: () {
            // Define action on press
          },
        ),
        OrderStatusItem(
          icon: Icons.rate_review,
          label: 'Review',
          count: 3, // Example count
          onPressed: () {
            // Define action on press
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
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
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

class AdminToolsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        AdminToolItem(
          icon: Icons.store,
          label: 'My Products',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListPage()),
            );
          },
        ),
        AdminToolItem(
          icon: Icons.account_balance_wallet,
          label: 'My Finance',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyFinancePage()), 
            );
          },
        ),
        AdminToolItem(
          icon: Icons.bar_chart,
          label: 'Shop Performance',
           onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopPerformancePage()),
            );
          },
        ),
      ],
    );
  }
}

class AdminToolItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  AdminToolItem({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
