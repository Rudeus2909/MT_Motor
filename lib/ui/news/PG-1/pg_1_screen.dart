import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/PG-1/pg_1.dart';

class PG1Screen extends StatelessWidget {
  const PG1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tin Tức và khuyến mãi', style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: const PG1(
        imageUrl1: 'assets/news/review_PG-1.jpg',
        imageUrl2: 'assets/news/PG-1.jpg',
        imageUrl3: 'assets/news/review_PG-1_1.jpg',
      ),
    );
  }
}
