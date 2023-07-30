import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/pages/profileEdit_page.dart';
import 'package:shopp/features/shopp/presentation/pages/profile_page.dart';

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
      theme: ThemeData(fontFamily: 'BellotaText', textTheme: const TextTheme(bodySmall: TextStyle(color: Color(0xFF5F5A5A), fontWeight: FontWeight.w400))),
      title: 'Shop',
      home: const ProfilePage(),
    );
  }
}
