import 'package:bloc_starter_pro/screens/login_page.dart';
import 'package:bloc_starter_pro/screens/splash_page.dart';
import 'package:bloc_starter_pro/screens/user_list_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/userList':
        return MaterialPageRoute(builder: (_) => UserListPage());
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
      default:
        return null;
    }
  }
}
