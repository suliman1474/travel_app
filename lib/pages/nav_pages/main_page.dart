import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/bar_item_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/nav_pages/my_page.dart';
import 'package:travel_app/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int page = 0;
  void onTap(int index) {
    setState(() {
      page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        currentIndex: page,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: 'Bar', icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'My', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
