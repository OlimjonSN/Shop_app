import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/pages/login_page.dart';
import 'package:shopp/features/shopp/presentation/pages/splash_screen.dart';

import 'features/auth/data/model/user_model.dart';
import 'injection_container.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
      home: SplashScreen(),
    );
  }
}
