import 'package:bloc_starter_pro/pages/login_page.dart';
import 'package:bloc_starter_pro/pages/splash_page.dart';
import 'package:bloc_starter_pro/pages/user_list_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/userList':
        return MaterialPageRoute(builder: (_) => UserListPage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashPage());
      default:
        return null;
    }
  }
}