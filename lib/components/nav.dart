import 'package:flutter/material.dart';
import 'package:rest_auto/order_history.dart';
import 'package:rest_auto/productScreen.dart';

import '../table.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int selectedBar = 0;

  void changeBar(int index) {
    setState(() {
      selectedBar = index;
    });
  }
  List<Widget> bottomBarScreens=[
    const TMS(),
    const Productscreen(),
    const OrderHistoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomBarScreens[selectedBar],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeBar,
        currentIndex: selectedBar,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label:""),
        BottomNavigationBarItem(icon: Icon(Icons.fastfood), label:""),
        BottomNavigationBarItem(icon: Icon(Icons.history), label:""),
      ],

      ),
    );
  }
}
