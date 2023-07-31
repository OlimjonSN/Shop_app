import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/features/auth/presentation/providers/auth_provider.dart';

import 'config/router/routes.dart';
import 'injection_container.dart';
// import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<AuthProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'BellotaText', textTheme: const TextTheme(bodySmall: TextStyle(color: Color(0xFF5F5A5A), fontWeight: FontWeight.w400))),
        title: 'Shop',
        initialRoute: RouteGenerator.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
