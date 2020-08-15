import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technology/Screens/cart_screen.dart';
import 'package:technology/Screens/home_page.dart';
import 'package:technology/models/cart.dart';
import 'package:technology/widgets/badge.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> _pages = [HomePage(), CartScreen()];
  int _currenttab = 0;
  @override
  Widget build(BuildContext context) {
    final dummyinfo = Provider.of<CartProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currenttab,
          onTap: (int value) {
            setState(() {
              _currenttab = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Badge(
                color: Colors.red,
                child: Icon(FontAwesomeIcons.shoppingCart),
                value: dummyinfo.itemcount().toString(),
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1496440737103-cd596325d314?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                radius: 15.0,
              ),
              title: SizedBox.shrink(),
            ),
          ]),
      body: _pages[_currenttab],
    );
  }
}
