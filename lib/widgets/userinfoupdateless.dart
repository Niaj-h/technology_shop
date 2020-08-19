import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technology/Screens/orderscreen.dart';
import 'package:technology/models/cart.dart';

class UserInfoUpdateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            Provider.of<CartProvider>(context, listen: false)
                .itemcount()
                .toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            'Orders',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
            child: Divider(color: Colors.black54),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Transform(
                transform: Matrix4.translationValues(-20, 0.0, 0.0),
                child: Text('Your Favorites',
                    style: TextStyle(letterSpacing: 0.8))),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
            child: ListTile(
              leading: Icon(FontAwesomeIcons.bitbucket),
              title: Transform(
                  transform: Matrix4.translationValues(-20, 0.0, 0.0),
                  child: Text('Orders', style: TextStyle(letterSpacing: 0.8))),
            ),
          )
        ],
      ),
    );
  }
}
