import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/top3moto/top_3_moto_news.dart';

class Top3MotoScreen extends StatelessWidget {
  const Top3MotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tin Tức và khuyến mãi',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Top3Moto(
        imageUrl1: 'assets/news/XS155R.jpg',
        imageUrl2: 'assets/news/Top3Moto.jpg',
        imageUrl3: 'assets/news/YZF-R15.jpg',
      ),
    );
  }
}
