import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology/models/cart.dart';

class ListTileCart extends StatelessWidget {
  String lurl;
  String ltitel;
  double lprice;
  int lquantity;
  String productid;
  String id;

  ListTileCart(this.lurl, this.ltitel, this.lprice, this.lquantity,
      this.productid, this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(id),
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 12),
        ),
        onDismissed: (direction) {
          Provider.of<CartProvider>(context, listen: false)
              .removeitem(productid);
        },
        child: Card(
          elevation: 0.5,
          color: Color(0xFFF3F5F7),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(lurl.toString()),
              ),
            ),
            title: Text(ltitel),
            subtitle: Text('\$${lprice}'),
            trailing: Text('x${lquantity}'),
          ),
        ),
      ),
    );
  }
}
