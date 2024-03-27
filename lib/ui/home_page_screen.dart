import 'package:flutter/material.dart';

import '../ui/category/categories_overview_screen.dart';
import 'package:motor_app/ui/news/news_overview_screen.dart';
import 'package:motor_app/auth/register_screen.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Trang chủ',
      style: optionStyle,
    ),
    CategoryOverViewScreen(),
    NewsOverviewScreen(),
    Text(
      'Cài đặt',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Image.asset('assets/black_logo.png'),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            const Text('/'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterScreen.routeName);
              },
              child: const Text('Đăng ký'),
            ),
          ],
        ),
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
        ));
  }
}
