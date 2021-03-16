import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  Color appColor = Color(0xFFF316B4);
@override
Widget build(BuildContext context) {
  return Container(
    color: appColor,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("Assets/app_logo.png"),
          SizedBox(height: 16),
          Text("Neak Der Leng",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),)
        ],
      ),
    ),
  );
}
}