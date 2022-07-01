import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finalassessment/screens/cart.dart';
import 'package:finalassessment/screens/listproducts.dart';
import 'package:flutter/material.dart';
import 'history.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  List<Widget> pages = [ history(),  products(), const cart()];

  int selectIndex = 1;
  void onPageChanged(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),

      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepPurple,
          color: Colors.deepPurple.shade200,
          animationDuration: const Duration(milliseconds: 300),
          onTap: onItemTap,
          items: const [
            Icon(
              Icons.history,
              color: Colors.white,
            ),
            Icon(
              Icons.store,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )
          ]), // CurvedNavigationBar
    );
  }
}
