import 'package:flutter/material.dart';
import 'package:test_geekgarden/feature/products/screens/main_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geek Garden',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainProductScreen(),
    );
  }
}
