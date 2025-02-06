import 'package:bloc_starter_pro/config/routes/app_page.dart';
import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:bloc_starter_pro/screens/favourite_screen.dart';
import 'package:bloc_starter_pro/screens/login_page.dart';
import 'package:bloc_starter_pro/screens/main_screen.dart';
import 'package:bloc_starter_pro/screens/news_details_screen.dart';
import 'package:bloc_starter_pro/screens/splash_page.dart';
import 'package:bloc_starter_pro/screens/user_list_page.dart';
import 'package:bloc_starter_pro/widgets/no_screen_found.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
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

      case AppPage.details:
        final args = settings.arguments as NewsData?;

        if (args != null) {
          return MaterialPageRoute(
            builder: (context) {
              //if (args != null) {
              return NewsDetailsScreen(
                newsData: args,
              );
              // }
            },
          );
        }

      default:
        return _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => NotFoundScreen());
  }
}
