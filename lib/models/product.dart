import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductModel {
  String id;
  String title;
  String imgurl;
  double price;
  String description;
  ProductModel(
      {this.id, this.imgurl, this.price, this.title, this.description});
}

class ProductsProvider with ChangeNotifier {
  List<ProductModel> _dummyproducts = [
    // ProductModel(
    //   id: 'c1',
    //   imgurl:
    //       'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    //   title: 'Iphone',
    //   price: 999.99,
    // ),
    // ProductModel(
    //     id: 'c7',
    //     imgurl:
    //         'https://images.unsplash.com/photo-1587843618590-dd2f6ea2ccf2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80',
    //     title: 'X-box',
    //     price: 399.99),
    // ProductModel(
    //     id: 'c2',
    //     imgurl:
    //         'https://images.unsplash.com/photo-1507646227500-4d389b0012be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    //     title: 'Google Pod',
    //     price: 299.99),
    // ProductModel(
    //     id: 'c3',
    //     imgurl:
    //         'https://images.unsplash.com/photo-1593508512255-86ab42a8e620?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    //     title: 'VR',
    //     price: 499.99),
    // ProductModel(
    //     id: 'c4',
    //     imgurl:
    //         'https://images.unsplash.com/photo-1547043884-975a4f9ea025?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    //     title: 'DSLR',
    //     price: 1999.99),
    // ProductModel(
    //     id: 'c5',
    //     imgurl:
    //         'https://images.unsplash.com/photo-1491947153227-33d59da6c448?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    //     title: 'Arc',
    //     price: 29.99),
    // ProductModel(
    //     id: 'c6',
    //     imgurl:
    //         'https://images.unsplash.com/photo-1570635266338-9c44958d9aa3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    //     title: 'Mac',
    //     price: 2999.99)
  ];
  final String auth;
  ProductsProvider(this.auth, this._dummyproducts);

  Future<void> fetchdata() async {
    final url =
        'https://shop-app-2813.firebaseio.com/productdata.json?auth=$auth';
    final response = await http.get(url);

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<ProductModel> loadedProducts = [];
    extractedData.forEach((prodId, prodData) {
      loadedProducts.add(ProductModel(
          id: prodId,
          title: prodData['title'],
          price: prodData['price'],
          imgurl: prodData['imgurl']));
    });
    _dummyproducts = loadedProducts;
    notifyListeners();
  }

  List<ProductModel> get dummyproducts {
    return [..._dummyproducts];
  }
}
