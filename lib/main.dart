import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'BellotaText-Regular', textTheme: const TextTheme(bodySmall: TextStyle(color: Color(0xFF5F5A5A), fontWeight: FontWeight.w400))),
      title: 'Shop',
      home:  const ProductPage(),
    );
  }
}
