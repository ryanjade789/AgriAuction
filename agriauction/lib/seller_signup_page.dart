// seller_signup_page.dart
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'seller_admin_page.dart';

class SellerSignUpPage extends StatefulWidget {
  @override
  _SellerSignUpPageState createState() => _SellerSignUpPageState();
}

class _SellerSignUpPageState extends State<SellerSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _shopPermitController = TextEditingController();
  final TextEditingController _shopAddressController = TextEditingController();
  final TextEditingController _shopDescriptionController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showSignUpSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seller Sign Up Successful'),
          content: Text('You have successfully signed up as a seller.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SellerAdminPage()), // Navigate to SellerAdminPage
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Sign Up'),
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _shopNameController,
                  decoration: InputDecoration(labelText: 'Shop Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Shop Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _shopPermitController,
                  decoration: InputDecoration(labelText: 'Business Permit'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Business Permit';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _shopAddressController,
                  decoration: InputDecoration(labelText: 'Shop Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Shop Address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _shopDescriptionController,
                  decoration: InputDecoration(labelText: 'Shop Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Shop Description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contactNumberController,
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Contact Number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email Address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform seller sign-up action
                      _showSignUpSuccessDialog();
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
