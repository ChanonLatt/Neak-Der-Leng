
import 'package:flutter/material.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ScreenManager(),
  ));
}

class ScreenManager extends StatefulWidget {
  @override
  _ScreenManagerState createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 300)),
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return Scaffold(
              body: Container(
                color: Colors.white,
              ),
              bottomNavigationBar: _buildBottomNaigationItems,
            );
          }
        }
    );
  }
  get _buildBottomNaigationItems => BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: "Home",
            icon: Image.asset("App/Utils/Assets/home_outline.png"),
            activeIcon: Image.asset("App/Utils/Assets/home_filled.png")
        ),BottomNavigationBarItem(
          label: "All Provinces",
            icon: Image.asset("App/Utils/Assets/all_provinces_outline.png"),
            activeIcon: Image.asset("App/Utils/Assets/all_provinces_filled.png")
        ),BottomNavigationBarItem(
          label: "Map",
            icon: Image.asset("App/Utils/Assets/map_outline.png"),
            activeIcon: Image.asset("App/Utils/Assets/map_filled.png")
        ),BottomNavigationBarItem(
          label: "Saved",
            icon: Image.asset("App/Utils/Assets/saved_outline.png"),
            activeIcon: Image.asset("App/Utils/Assets/saved_filled.png")
        ),

      ]
  );
}
