import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/pro_honda_news/pro_honda_news.dart';

class ProHondaNewsScreen extends StatelessWidget {
  const ProHondaNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tin tức và khuyến mãi',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      body: const ProHondaNews(
        imageUrl: 'assets/news/ProHonda.jpg',
      ),
    );
  }
}
