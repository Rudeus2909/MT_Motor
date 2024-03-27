import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/suzuki_sale/suzuki_sale.dart';

class SuzukiSaleScreen extends StatelessWidget {
  const SuzukiSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin Tức và khuyến mãi'),
      ),
      body: const SuzukiSale(imageUrl1: 'assets/news/SuzukiSale.webp',),
    );
  }
}