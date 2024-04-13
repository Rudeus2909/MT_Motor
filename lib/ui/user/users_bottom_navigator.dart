import 'package:flutter/material.dart';
import 'package:motor_app/ui/user/home_screen.dart';
import 'package:motor_app/ui/setting/setting_screen.dart';

import '../category/categories_overview_screen.dart';
import 'package:motor_app/ui/news/news_overview_screen.dart';

class UsersBottomNavigator extends StatefulWidget {
  static const routeName = "/home";
  const UsersBottomNavigator({super.key});

  @override
  State<UsersBottomNavigator> createState() => _UsersBottomNavigatorState();
}

class _UsersBottomNavigatorState extends State<UsersBottomNavigator> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryOverViewScreen(),
    NewsOverviewScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_wheeler_rounded),
            label: 'Sản phẩm',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Badge(child: Icon(Icons.all_inbox)),
            label: 'Tin tức',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),
            label: 'Cài đặt',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
