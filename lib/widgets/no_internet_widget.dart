import 'package:bloc_starter_pro/utils/text_style.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ic_internet.png',
            width: 150,
            height: 120,
          ),
          const SizedBox(height: 20),
          const Text(
            'No Internet :(',
            style: CustomTextStyle.connectTitle,
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Please check your internet connection\n You are offline now!',
                textAlign: TextAlign.center,
                // Optional: This will center the text within the Text widget
                style: TextStyle(
                  fontSize: 16.0,
                  // Adjust the font size as needed
                  fontWeight: FontWeight.normal,
                  // Optional: Makes the text bold
                  color: Colors.grey, // Optional: You can customize the color
                )),
          ))
        ],
      ),
    );
  }
}
