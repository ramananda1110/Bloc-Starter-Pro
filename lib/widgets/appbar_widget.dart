import 'package:bloc_starter_pro/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

PreferredSize buildAppBar(BuildContext context, {required String title}) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      // Set the preferred height here
      child: AppBar(
        elevation: 2,
        shadowColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColorTheme.white),
        ),
        backgroundColor: AppColorTheme.primary,
      ));
}

PreferredSize buildAppBarWithBack(BuildContext context,
    {required String title}) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      // Set the preferred height here
      child: AppBar(
        elevation: 2,
        shadowColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          // Customize the color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColorTheme.white),
        ),
        backgroundColor: AppColorTheme.primary,
      ));
}
