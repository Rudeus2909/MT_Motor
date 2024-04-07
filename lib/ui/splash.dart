import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_app/ui/screen.dart';
import 'package:motor_app/utils/global_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(HomePageScreen());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(child: Image.asset('assets/white_logo.png')),
    );
  }
}
