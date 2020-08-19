import 'package:flutter/cupertino.dart';

class CartModel {
  String id;
  String title;
  String imgurl;
  int quantity;
  double price;
  CartModel({this.id, this.title, this.imgurl, this.price, this.quantity});
}

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartdummydata = {};

  Map<String, CartModel> get cartdummydata {
    return {..._cartdummydata};
  }

  double gettotalsum() {
    var totalsum = 0.0;
    _cartdummydata.forEach((key, CartModel) {
      totalsum += CartModel.price * CartModel.quantity;
    });
    return totalsum;
  }

  int itemcount() {
    return _cartdummydata.length;
  }

  void additems(String id, String title, double price, String imgurl) {
    if (_cartdummydata.containsKey(id)) {
      _cartdummydata.update(
        id,
        (value) => CartModel(
            id: value.id,
            title: value.title,
            imgurl: value.imgurl,
            quantity: value.quantity + 1,
            price: value.price),
      );
    } else {
      _cartdummydata.putIfAbsent(
        id,
        () => CartModel(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            imgurl: imgurl,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeitem(String dataid) {
    _cartdummydata.remove(dataid);
    notifyListeners();
  }

  void clearcart() {
    _cartdummydata = {};
    notifyListeners();
  }
}
