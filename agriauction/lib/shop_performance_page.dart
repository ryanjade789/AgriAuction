// shop_performance_page.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ShopPerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Performance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            PerformanceToolItem(
              icon: Icons.star,
              label: 'Shop Rating',
              onPressed: () {
              },
            ),
            PerformanceToolItem(
              icon: Icons.insights,
              label: 'Business Insights',
              onPressed: () {
              },
            ),
            PerformanceToolItem(
              icon: Icons.health_and_safety,
              label: 'Account Health',
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceToolItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  PerformanceToolItem({required this.icon, required this.label, required this.onPressed});

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