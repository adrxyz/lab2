import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _page = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _page = index;
          });
        },
        children: const <Widget>[
          HomeScreen(),
          Center(child: Text("Saved Screen", style: TextStyle(fontSize: 24))),
          Center(child: Text("Artists Screen", style: TextStyle(fontSize: 24))),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30, color: Colors.white),
          Icon(Icons.bookmark_outline, size: 30, color: Colors.white),
          Icon(Icons.group_outlined, size: 30, color: Colors.white),
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}