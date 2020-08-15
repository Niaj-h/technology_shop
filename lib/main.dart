import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technology/Screens/cart_screen.dart';
import 'package:technology/Screens/product_info.dart';
import 'package:technology/models/cart.dart';
import 'package:technology/widgets/bottomnavbar.dart';
import './models/product.dart';

import 'Screens/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: Color(0xFFF3F5F7), // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(create: (context) => CartProvider())
      ],
      child: MaterialApp(
        title: 'technology',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: Color(0xFFD8ECF1),
            primaryColor: Color(0xFF3EBACE),
            scaffoldBackgroundColor: Color(0xFFF3F5F7)),
        home: BottomNavBar(),
        routes: {
          ProductInfo.routeName: (context) => ProductInfo(),
          CartScreen.routeName: (context) => CartScreen()
        },
      ),
    );
  }
}
