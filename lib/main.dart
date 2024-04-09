import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/services/register_service.dart';
import 'package:motor_app/ui/cart/cart_screen.dart';
import 'package:motor_app/ui/payment/order_manager.dart';
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
          create: (context) => LoginService(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterService(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryManager(),
          child: const CategoryOverViewScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderManager(),
        )
      ],
      child: GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
          brightness: Brightness.light,
          primaryColor: Colors.red.shade400,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headlineLarge: const TextStyle().copyWith(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            headlineMedium: const TextStyle().copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            headlineSmall: const TextStyle().copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            titleLarge: const TextStyle().copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            titleMedium: const TextStyle().copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            titleSmall: const TextStyle().copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.black),
            bodyLarge: const TextStyle().copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            bodyMedium: const TextStyle().copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            bodySmall: const TextStyle().copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5)),
            labelLarge: const TextStyle().copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            labelMedium: const TextStyle().copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(0.5)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 2),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black, size: 24),
            actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
            titleTextStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
          primaryColor: Colors.red.shade400,
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            headlineLarge: const TextStyle().copyWith(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            headlineMedium: const TextStyle().copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            headlineSmall: const TextStyle().copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            titleLarge: const TextStyle().copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            titleMedium: const TextStyle().copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            titleSmall: const TextStyle().copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.white),
            bodyLarge: const TextStyle().copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            bodyMedium: const TextStyle().copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            bodySmall: const TextStyle().copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.5)),
            labelLarge: const TextStyle().copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            labelMedium: const TextStyle().copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.white.withOpacity(0.5)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: Colors.red.shade400,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black, size: 24),
            actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
            titleTextStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
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
          CartScreen.routeName: (ctx) => SafeArea(child: CartScreen()),
        },
      ),
    );
  }
}
