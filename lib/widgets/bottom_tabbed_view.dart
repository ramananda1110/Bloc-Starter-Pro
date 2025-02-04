import 'package:bloc_starter_pro/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomTabbedView extends StatefulWidget {
  final List<Widget> screen;

  const BottomTabbedView({super.key, required this.screen});

  @override
  State<BottomTabbedView> createState() =>
      _BottomTabbedViewState(screens: screen);
}

class _BottomTabbedViewState extends State<BottomTabbedView> {
  int _selectedIndex = 0;
  final List<Widget> screens;

  _BottomTabbedViewState({required this.screens});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: GNav(
              haptic: true,
              backgroundColor: Colors.white,
              color: Color(0xfff8696bb),
              activeColor: AppColorTheme.primary,
              //iconSize: 24,
              // tab button border

              tabBorderRadius: 12,
              tabBackgroundColor: AppColorTheme.primary_light,
              gap: 4,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search_rounded,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                ),
              ],
              onTabChange: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
