import 'package:bloc_starter_pro/config/routes/app_page.dart';
import 'package:bloc_starter_pro/screens/favourite_screen.dart';
import 'package:bloc_starter_pro/screens/login_page.dart';
import 'package:bloc_starter_pro/screens/main_screen.dart';
import 'package:bloc_starter_pro/screens/splash_page.dart';
import 'package:bloc_starter_pro/screens/user_list_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPage.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case AppPage.user:
        return MaterialPageRoute(builder: (_) => UserListPage());
      case AppPage.initial:
        return MaterialPageRoute(builder: (_) => SplashPage());

      case AppPage.main:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case AppPage.favorite:
        return MaterialPageRoute(builder: (_) => FavouriteScreen());
      default:
        return null;
    }
  }
}
