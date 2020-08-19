import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology/models/cart.dart';
import 'package:technology/models/orders.dart';
import 'package:technology/widgets/listtilecart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  List<CartModel> cartProducts = [];

  @override
  Widget build(BuildContext context) {
    final cartiinfo = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'My Cart',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: 20.0,
              width: 150,
              child: Divider(height: 10, color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartiinfo.itemcount(),
                itemBuilder: (ctx, i) => ListTileCart(
                  cartiinfo.cartdummydata.values.toList()[i].imgurl,
                  cartiinfo.cartdummydata.values.toList()[i].title,
                  cartiinfo.cartdummydata.values.toList()[i].price,
                  cartiinfo.cartdummydata.values.toList()[i].quantity,
                  cartiinfo.cartdummydata.keys.toList()[i],
                  cartiinfo.cartdummydata.values.toList()[i].id,
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsetsDirectional.only(start: 195),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Total:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5)),
                  Text(
                    '\$${cartiinfo.gettotalsum()}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 195),
              child: GestureDetector(
                onTap: () {
                  Provider.of<Orders>(context, listen: false).addOrder(
                      cartiinfo.cartdummydata.values.toList(),
                      cartiinfo.gettotalsum());
                  cartiinfo.clearcart();
                },
                child: Chip(
                  backgroundColor: Colors.black,
                  label: Text(
                    'Check Out',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
