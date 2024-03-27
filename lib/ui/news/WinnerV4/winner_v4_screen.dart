import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/WinnerV4/winner_v4.dart';

class WinnerV4Screen extends StatelessWidget {
  const WinnerV4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin Tức và khuyến mãi'),
      ),
      body: const WinnerV4(
          imageUrl1: 'assets/news/WinnerV4.jpg',
          imageUrl2: 'assets/news/WinnerV4_(1).png',
          imageUrl3: 'assets/news/WinnerV4_(2).png'),
    );
  }
}
