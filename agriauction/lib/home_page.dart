// home_page.dart
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:agriauction/my_order_page.dart';
import 'package:agriauction/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dropdown_categories.dart';
import 'login_page.dart';
import 'product_detail_page.dart';
import 'seller_signup_page.dart';
import 'watchlist_page.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  final List<String> imgList = [
    'assets/slideshow/promo1.png',
    'assets/slideshow/promo2.png',
    'assets/slideshow/promo3.png',
    'assets/slideshow/promo4.png',
    'assets/slideshow/promo5.png',
  ];

  final List<Map<String, dynamic>> productList = [
    {
      'image': 'assets/products/ampalaya.jpg',
      'name': 'Ampalaya',
      'price': '₱95',
      'sold': '20',
      'rating': 4,
      'harvestDay': '2024-07-17',
      'location': 'Pantabangan, Nueva Ecija',
      'estimatedDeliveryDate': '2024-07-20',
      'deliveryFee': '₱10',
      'auctionEndTime': '2024-08-20T12:00:00',
      'review': 'Savior M. \n⭐⭐⭐⭐⭐ \n\nThe product was fresh and worth the price',
      'description': 'Ampalaya, also known as bitter melon, is a nutrient-rich vegetable valued for its distinctive'
          ' bitter taste and numerous health benefits, including blood sugar regulation and boosting immunity,'
          ' making it a popular choice for health-conscious shoppers.',
      'additionalImages': [
        'assets/products/ampalaya.jpg',
        'assets/products/am1.jpg',
        'assets/products/am2.jpg',
      ],
      'sellerName': 'BINI Aiah',
      'sellerImage': 'assets/bini/aiah.jpg',  
      'sellerAddress': 'Lapu-Lapu City, Cebu',

    },
    {
      'image': 'assets/products/pepper.jpg',
      'name': 'Red Bell Pepper',
      'price': '₱310',
      'sold': '35',
      'rating': 4,
      'harvestDay': '2024-07-24',
      'location': 'Legazpi City, Albay',
      'estimatedDeliveryDate': '2024-07-27',
      'deliveryFee': '₱5',
      'auctionEndTime': '2024-07-26T12:00:00',
      'review': 'Chris O. \n⭐⭐⭐⭐ \n\nThe bell peppers are sweet and crunchy',
      'description': 'Red bell peppers are vibrant, sweet, and crunchy vegetables that are rich in vitamins A and C,' 
      ' perfect for adding color and nutrition to a variety of dishes.',
      'additionalImages': [
        'assets/products/pepper.jpg',
        'assets/products/pepper1.jpg',
        'assets/products/pepper2.jpg',
      ],
      'sellerName': 'BINI Colet',
      'sellerImage': 'assets/bini/colet.jpg',  
      'sellerAddress': 'Tagbilaran City, Bohol',

    },
    {
      'image': 'assets/products/banana.png',
      'name': 'Banana',
      'price': '₱121',
      'sold': '50',
      'rating': 4,
      'harvestDay': '2024-07-22',
      'location': 'Calapan City, Oriental Mindoro',
      'estimatedDeliveryDate': '2024-07-28',
      'deliveryFee': '₱5',
      'auctionEndTime': '2024-07-25T08:00:00',
      'review': 'Mel E. \n⭐⭐⭐⭐⭐ \n\nThe bananas are fresh and sweet',
      'description': 'Bananas are a versatile and naturally sweet fruit packed with essential nutrients like' 
      ' potassium and vitamin C, making them a healthy and convenient snack for any time of day.',
      'additionalImages': [
        'assets/products/banana.png',
        'assets/products/banana1.jpg',
        'assets/products/banana2.png',
      ],
      'sellerName': 'BINI Maloi',
      'sellerImage': 'assets/bini/maloi.jpg',  
      'sellerAddress': 'Lemery, Batangas',
    },
    {
      'image': 'assets/products/basil.jpg',
      'name': 'Basil',
      'price': '₱189',
      'sold': '45',
      'rating': 5,
      'harvestDay': '2024-08-15',
      'location': 'Calapan City, Oriental Mindoro',
      'estimatedDeliveryDate': '2024-08-19',
      'deliveryFee': '₱5',
      'auctionEndTime': '2024-08-17T14:00:00',
      'review': 'Angelo M. \n⭐⭐⭐⭐⭐ \n\nThe basil are fresh and aromatic',
      'description': 'Basil is a fresh, aromatic herb with a peppery flavor, perfect for enhancing salads, sauces,' 
      ' and a variety of dishes, and is rich in essential vitamins and antioxidants.',
      'additionalImages': [
        'assets/products/basil.jpg',
        'assets/products/basil1.jpg',
        'assets/products/basil2.jpeg',
      ],
      'sellerName': 'BINI Jhoanna',
      'sellerImage': 'assets/bini/jho.jpg',  
      'sellerAddress': 'Calamba City, Laguna',
    },
    {
      'image': 'assets/products/beans.jpg',
      'name': 'Baguio Beans',
      'price': '₱79',
      'sold': '32',
      'rating': 4,
      'harvestDay': '2024-07-29',
      'location': 'Baguio City, Benguet',
      'estimatedDeliveryDate': '2024-08-01',
      'deliveryFee': '₱5',
      'auctionEndTime': '2024-07-30T20:00:00',
      'review': 'Rhon V. \n⭐⭐⭐⭐ \n\nThe bananas are tightly packed',
      'description': 'Baguio beans, also known as snap beans, are crisp, tender vegetables rich in vitamins A and C, '
      'ideal for adding a fresh, crunchy texture to salads, stir-fries, and side dishes.',
      'additionalImages': [
        'assets/products/beans.jpg',
        'assets/products/beans1.jpg',
        'assets/products/beans2.jpg',
      ],
      'sellerName': 'BINI Gwen',
      'sellerImage': 'assets/bini/gwen.jpg',  
      'sellerAddress': 'Daraga, Albay',
    },
    {
      'image': 'assets/products/bokchoy.jpg',
      'name': 'Bokchoy',
      'price': '₱116',
      'sold': '60',
      'rating': 5,
      'harvestDay': '2024-07-22',
      'location': 'Calapan City, Oriental Mindoro',
      'estimatedDeliveryDate': '2024-07-28',
      'deliveryFee': '₱5',
      'auctionEndTime': '2024-07-25T08:00:00',
      'review': "Michael T. \n⭐⭐⭐⭐⭐ \n\nThe bokchoy's stem are crisp",
      'description': 'Bok choy, a nutritious leafy green vegetable, is prized for its mild, crisp stems and tender leaves, ' 
      'making it an excellent addition to stir-fries, soups, and salads.',
      'additionalImages': [
        'assets/products/bokchoy.jpg',
        'assets/products/bokchoy1.jpg',
        'assets/products/bokchoy2.jpg',
      ],
      'sellerName': 'BINI Mikha',
      'sellerImage': 'assets//bini/mikha.png',  
      'sellerAddress': 'Cebu City, Cebu',
    },
    {
      'image': 'assets/products/calamansi.jpg',
      'name': 'Calamansi',
      'price': '₱147',
      'sold': '44',
      'rating': 3,
      'harvestDay': '2024-08-05',
      'location': 'Bawi, Padre Garcia',
      'estimatedDeliveryDate': '2024-08-10',
      'deliveryFee': '₱5',
      'auctionEndTime': '2024-08-08T10:00:00',
      'review': 'Ronald L. \n⭐⭐⭐⭐ \n\nThe delivered calamansi are fresh and big',
      'description': 'Calamansi is a small, citrus fruit known for its tangy flavor and high vitamin C content, '
      'perfect for adding a zesty kick to beverages, marinades, and culinary dishes.',
      'additionalImages': [
        'assets/products/calamansi.jpg',
        'assets/products/calamansi1.jpg',
        'assets/products/calamansi2.jpg',
      ],
      'sellerName': 'BINI Stacey',
      'sellerImage': 'assets/bini/stacey.jpg',  
      'sellerAddress': 'Nueva Vizcaya',

    },
    {
      'image': 'assets/products/strawberry.jpg',
      'name': 'Strawberry',
      'price': '₱536',
      'sold': '25',
      'rating': 4,
      'harvestDay': '2024-08-02',
      'location': 'La Trinidad, Benguet',
      'estimatedDeliveryDate': '2024-08-05',
      'deliveryFee': '₱5',
      'auctionEndTime': '2024-08-04T20:00:00',
      'review': "Jhoanna R. \n⭐⭐⭐⭐ \n\nThe strawberry's are sweet and juicy",
      'description': 'Strawberries are juicy, sweet berries packed with antioxidants and vitamin C, ' 
      'ideal for enjoying fresh, in desserts, or as a vibrant addition to salads and smoothies.',
      'additionalImages': [
        'assets/products/strawberry.jpg',
        'assets/products/straw1.jpg',
        'assets/products/straw2.jpg',
      ],
      'sellerName': 'BINI Sheena',
      'sellerImage': 'assets/bini/sheena.jpg',  
      'sellerAddress': 'Santiago City, Isabela',
    },
    
  ];

  // Function to build star rating
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            DropdownCategories(), // Dropdown menu
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.bookmark_add),
               onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WatchlistPage(watchlist: [],)),
              );
            },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Ryan Jade T. Manalo",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("21-34023@g.batstate-u.edu.ph"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profilepic.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
               onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('My Order'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrderPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.store_sharp),
              title: const Text('My Shop'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SellerSignUpPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final String imageUrl = imgList[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200, // Adjust the height as needed
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {},
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Live Auction',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevent GridView from scrolling separately
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.75,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return GestureDetector(
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
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(product['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    product['price']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${product['sold']} sold',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              _buildRatingStars(product['rating'] ?? 0), // Add the rating stars here
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
