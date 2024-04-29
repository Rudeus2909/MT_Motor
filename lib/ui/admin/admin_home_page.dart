import 'package:flutter/material.dart';
import 'package:motor_app/ui/admin/orders_manager/orders_manager_screen.dart';
import 'package:motor_app/ui/admin/products_manager/show_products/categories_manager_screen.dart';
import 'package:motor_app/ui/admin/users_manager/users_manager_screen.dart';


class AdminHomePage extends StatefulWidget {
    static const routeName = "/admin";
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Tổng quan hoạt động ứng dụng'),
    CategoriesManagerScreen(),
    OrderManagerScreen(),
    UserManagerScreen(),
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
            label: 'Tổng quan',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_wheeler_rounded),
            label: 'Quản lý sản phẩm',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Badge(child: Icon(Icons.shopping_cart_checkout)),
            label: 'Quản lý đơn hàng',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),
            label: 'Quản lý tài khoản',
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
