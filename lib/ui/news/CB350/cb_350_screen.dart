import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/CB350/CB_350.dart';

class CB350Screen extends StatelessWidget {
  const CB350Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin Tức và khuyến mãi'),
      ),
      body: const CB350(
        imageUrl1: 'assets/news/CB350_1.jpg',
        imageUrl2: 'assets/news/CB350_2.jpg',
        imageUrl3: 'assets/news/CB350.jpg',
      ),
    );
  }
}
