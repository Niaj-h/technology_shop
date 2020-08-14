import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technology/widgets/other_products_carosel.dart';
import 'package:technology/widgets/product_carosel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currenttab = 0;
  int _selectedindex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.feather,
    FontAwesomeIcons.fedex,
    FontAwesomeIcons.female,
    FontAwesomeIcons.fileAudio
  ];

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
          size: 25.0,
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currenttab,
          onTap: (int value) {
            setState(() {
              _currenttab = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.feather),
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
    );
  }
}
