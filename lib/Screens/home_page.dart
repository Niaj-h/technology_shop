import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technology/Screens/cart_screen.dart';
import 'package:technology/models/cart.dart';

import 'package:technology/widgets/other_products_carosel.dart';
import 'package:technology/widgets/product_carosel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.search
  ];
  List<Widget> pages = [CartScreen()];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedindex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedindex == index
                ? Theme.of(context).accentColor
                : Color(0xFFe7BEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 20.0,
          color: _selectedindex == index
              ? Theme.of(context).primaryColor
              : Color(0xffb4c1c4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            ListView(padding: EdgeInsets.symmetric(vertical: 30.0), children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text('What would you like to find???',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                )),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _buildIcon(map.key))
                .toList(),
          ),
          SizedBox(height: 20.0),
          ProductCarosel(),
          OtherCarosel()
        ]),
      ),
    );
  }
}
