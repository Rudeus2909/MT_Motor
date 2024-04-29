import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/services/register_service.dart';
import 'package:motor_app/ui/admin/admin_home_page.dart';
import 'package:motor_app/manager/order_manager.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/utils/app_setting.dart';
import 'package:motor_app/utils/motor_app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'manager/category_manager.dart';
import 'package:motor_app/manager/user_manager.dart';
import 'package:provider/provider.dart';
import 'ui/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettings(storage: prefs),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserManager()),
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
        theme:
            settings.isDarkMode ? MotorAppTheme.dark() : MotorAppTheme.light(),
        // title: 'MyShop',
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        routes: {
          UsersBottomNavigator.routeName: (ctx) => const SafeArea(
                child: UsersBottomNavigator(),
              ),
          LoginScreen.routeName: (ctx) => SafeArea(
                child: LoginScreen(),
              ),
          RegisterScreen.routeName: (ctx) => SafeArea(
                child: RegisterScreen(),
              ),
          AdminHomePage.routeName: (ctx) => SafeArea(child: AdminHomePage()),
        },
      ),
    );
  }
}
