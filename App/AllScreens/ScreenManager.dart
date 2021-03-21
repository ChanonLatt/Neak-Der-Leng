
import 'package:flutter/material.dart';
import '../Utils/AppColors.dart';
import 'AppBottomNavigationScreens/AllPlacesScreen.dart';
import 'AppBottomNavigationScreens/FavoriteScreen.dart';
import 'AppBottomNavigationScreens/HomeScreen.dart';
import 'AppBottomNavigationScreens/MapScreen.dart';
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
  PageController _pageControl = PageController();
  int _currentBottomNavigationIndex = 0;
  bool _isFirstTimeRun = true;

  @override
  Widget build(BuildContext context) {
    if (_isFirstTimeRun) {
      _isFirstTimeRun = false;
      return FutureBuilder(
          future: Future.delayed(Duration(seconds: 2)),
          builder: (context,AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else {
              return Scaffold(
                body: _buildBodyPageView,
                bottomNavigationBar: _buildBottomNavigationItems,
              );
            }
          }
      );
    } else {
      return Scaffold(
        body: _buildBodyPageView,
        bottomNavigationBar: _buildBottomNavigationItems,
      );
    }

  }

  get _buildBottomNavigationItems {
    const double iconSize = 24.0;
    return BottomNavigationBar(
      currentIndex: _currentBottomNavigationIndex,
      onTap: (int index) {
        setState(() {
          _currentBottomNavigationIndex = index;
          _pageControl.animateToPage(index, duration: Duration(milliseconds: 1), curve: Curves.bounceInOut);
        });
      },
      selectedItemColor: appColor,
        unselectedItemColor: appBlack,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Image.asset("App/Utils/Assets/home_outline.png", width: iconSize, height: iconSize),
            activeIcon: Image.asset("App/Utils/Assets/home_filled.png", width: iconSize, height: iconSize),

          ),BottomNavigationBarItem(
              label: "All Places",
              icon: Image.asset("App/Utils/Assets/all_provinces_outline.png", width: iconSize, height: iconSize),
              activeIcon: Image.asset("App/Utils/Assets/all_provinces_filled.png", width: iconSize, height: iconSize))
          ,BottomNavigationBarItem(
              label: "Map",
              icon: Image.asset("App/Utils/Assets/map_outline.png", width: iconSize, height: iconSize),
              activeIcon: Image.asset("App/Utils/Assets/map_filled.png", width: iconSize, height: iconSize),
          ),BottomNavigationBarItem(
              label: "Saved",
              icon: Image.asset("App/Utils/Assets/saved_outline.png", width: iconSize, height: iconSize),
              activeIcon: Image.asset("App/Utils/Assets/saved_filled.png", width: iconSize, height: iconSize),
          ),

        ]
    );
  }

  get _buildBodyPageView {
    return Container(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _pageControl,
        children: [
          HomeScreen(),
          AllPlacesScreen(),
          MapScreen(),
          FavoriteScreen()
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentBottomNavigationIndex = index;
          });
        },
      ),
    );
  }
}

