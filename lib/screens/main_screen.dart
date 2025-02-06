import 'package:bloc_starter_pro/screens/favourite_screen.dart';
import 'package:bloc_starter_pro/screens/search_screen.dart';
import 'package:bloc_starter_pro/screens/trending_news_screen.dart';
import 'package:bloc_starter_pro/widgets/appbar_widget.dart';
import 'package:bloc_starter_pro/widgets/bottom_tabbed_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> screens = [
    const TrendingNewsScreen(),
    SearchScreen(),
    const FavouriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Trending News"),
      body: BottomTabbedView(screen: screens),
    );
  }
}
