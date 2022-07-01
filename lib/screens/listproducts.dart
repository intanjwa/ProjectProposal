import 'package:finalassessment/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalassessment/screens/Flavor.dart';

class products extends StatefulWidget {

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {

  List<String> urls = [
    "https://www.merryme.co/image/cache/products/chocolate-cheese-1500x1875.jpg",
    "https://www.merryme.co/image/cache/products/mint-choc-chip-400x500.jpg",
    "https://www.merryme.co/image/cache/products/tiramisu-1500x1875.jpg",
    "https://www.merryme.co/image/cache/products/strawberry-cheesecake-1500x1875.jpg",
    "https://www.merryme.co/image/cache/products/nutty-berries-1500x1875.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text("Ice- Creams"),
        backgroundColor: Colors.deepPurple,
        actions: [
          FlatButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              label: const Text(
                'Log out',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))
        ],
      ),
    body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(height: 30.0),
           const Text(
              "Welcome to Ice Cream Scope",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Choose your flavor!",
              style: TextStyle(
                color: Color.fromARGB(255, 214, 212, 212),
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            
           const SizedBox(height: 30.0),
            DefaultTabController(
              length: 1,
              child: Expanded(
                child: Column(
                  children: [

                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                FlavorIce(
                                    urls[0], "Chocolate Cheese", "RM30", 4),
                                FlavorIce(
                                    urls[1], "Mint Choc Chip", "RM30", 5),
                                FlavorIce(
                                    urls[2], "Tiramisu", "RM30", 4),
                                FlavorIce(
                                    urls[3], "Strawberry Cheesecake", "RM30", 4),
                                FlavorIce(
                                    urls[4], "Nutty Berries", "RM30", 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
