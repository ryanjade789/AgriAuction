// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class DropdownCategories extends StatefulWidget {
  @override
  _DropdownCategoriesState createState() => _DropdownCategoriesState();
}

class _DropdownCategoriesState extends State<DropdownCategories> {
  String _selectedCategory = 'Citrus Fruits';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140, // Set the width of the dropdown button
      child: DropdownButton<String>(
        isExpanded: true,
        value: _selectedCategory,
        onChanged: (String? newValue) {
          setState(() {
            _selectedCategory = newValue!;
          });
        },
        items: <String>[
          'Citrus Fruits',
          'Stone Fruits',
          'Berries',
          'Melons',
          'Tropical Fruits',
          'Apples and Pears',
          'Leafy Greens',
          'Brassica Vegetable',
          'Allium Vegetables',
          'Root Vegetables',
          'Starchy Vegetables',
          'Squash Family',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
