import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/shopp/presentation/pages/cart_page.dart';
import '../../features/shopp/presentation/pages/home_page.dart';
import '../../features/shopp/presentation/pages/product_page.dart';

class RouteGenerator {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';

  static const String home = '/';
  static const String productPage = '/productPage';
  static const String cartPage = '/cartPage';
  static const String profilePage = '/profilePage';


  static onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      // case register:
      //   return MaterialPageRoute(builder: (_) => RegisterPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case productPage:
        return MaterialPageRoute(builder: (_) => const ProductPage());
      case cartPage:
        return MaterialPageRoute(builder: (_) => const CartPage());
      // case profilePage:
      //   return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}