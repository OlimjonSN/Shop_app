import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/features/auth/presentation/providers/auth_provider.dart';

import 'config/router/routes.dart';
import 'features/shopp/presentation/providers/shopp_provider.dart';
import 'features/shopp_admin/presentation/providers/shopp_admin_procider.dart';
import 'injection_container.dart';
// import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => sl<ShoppProvider>()),
        ChangeNotifierProvider(create: (_) => sl<ShoppAdminProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'BellotaText', textTheme: const TextTheme(bodySmall: TextStyle(color: Color(0xFF5F5A5A), fontWeight: FontWeight.w400))),
        title: 'Shop',
        initialRoute: RouteGenerator.categoyAdmin,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
