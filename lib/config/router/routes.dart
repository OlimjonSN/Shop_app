import 'package:flutter/material.dart';
import 'package:shopp/features/auth/presentation/pages/registration_page.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/shopp/presentation/pages/cart_page.dart';
import '../../features/shopp/presentation/pages/home_page.dart';
import '../../features/shopp/presentation/pages/product_page.dart';
import '../../features/shopp/presentation/pages/profile_page.dart';

class RouteGenerator {
  static const String splashScreen = '/splash';
  static const String login = '/login';
  static const String register = '/register';

  static const String home = '/';
  static const String productPage = '/productPage';
  static const String cartPage = '/cartPage';
  static const String profilePage = '/profilePage';


  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case productPage:
        return MaterialPageRoute(builder: (_) => const ProductPage());
      case cartPage:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}