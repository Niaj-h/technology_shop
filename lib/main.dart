import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technology/Screens/product_info.dart';

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
    return MaterialApp(
      title: 'technology',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Color(0xFFD8ECF1),
          primaryColor: Color(0xFF3EBACE),
          scaffoldBackgroundColor: Color(0xFFF3F5F7)),
      home: HomePage(),
      routes: {ProductInfo.routeName: (context) => ProductInfo()},
    );
  }
}
