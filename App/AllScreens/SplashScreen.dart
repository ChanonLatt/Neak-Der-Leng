import 'package:flutter/material.dart';

import '../Utils/AppColors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("App/Utils/Assets/app_logo.png"),
          SizedBox(height: 16),
          Text("Neak Der Leng",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none
            ),)
        ],
      ),
    );
  }
}