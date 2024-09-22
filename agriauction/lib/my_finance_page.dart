// my_finance_page.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';

class MyFinancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final double balance = 568.00;
    final List<Map<String, String>> transactions = [
      {'date': '2024-07-20', 'description': '1 kg of Ampalaya Sold', 'amount': '+ ₱95.00'},
      {'date': '2024-07-22', 'description': '2 kgs of Red Bell Pepper Sold', 'amount': '+ ₱620.00'},
      {'date': '2024-07-25', 'description': 'Refund for 1 kg Calamansi', 'amount': '- ₱147.00'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('My Finance'),
        backgroundColor: Colors.green[700], 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '₱${balance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Past Transactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return ListTile(
                    title: Text(transaction['description']!),
                    subtitle: Text(transaction['date']!),
                    trailing: Text(
                      transaction['amount']!,
                      style: TextStyle(
                        color: transaction['amount']!.startsWith('-') ? Colors.red : Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
