import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_app/auth/login_manager.dart';
import 'package:motor_app/auth/register_manager.dart';
import 'package:motor_app/ui/products/products_manager.dart';
import 'ui/category/category_manager.dart';
import 'package:motor_app/user_manager.dart';
import 'package:motor_app/user_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserManager(),
          child: const UserScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryManager(),
          child: const CategoryOverViewScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductManager(),
        ),
      ],
      child: GetMaterialApp(
        // title: 'MyShop',
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        routes: {
          HomePageScreen.routeName: (ctx) => const SafeArea(
                child: HomePageScreen(),
              ),
          LoginScreen.routeName: (ctx) => SafeArea(
                child: LoginScreen(),
              ),
          RegisterScreen.routeName: (ctx) => SafeArea(
                child: RegisterScreen(),
              ),
        },
        
      ),
    );
  }
}
