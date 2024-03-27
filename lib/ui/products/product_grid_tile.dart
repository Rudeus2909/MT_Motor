import 'package:flutter/material.dart';
import 'package:motor_app/models/product_model.dart';
import 'package:motor_app/ui/products/product_detail/product_detail_screen.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile(this.product, {super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: ProductGridFooter(
          product: product,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(productId: product.idProduct!)));
          },
          child: Image.asset(
            product.productImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProductGridFooter extends StatelessWidget {
  const ProductGridFooter({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      title: Text(
        product.productName,
        textAlign: TextAlign.center,
      ),
    );
  }
}
