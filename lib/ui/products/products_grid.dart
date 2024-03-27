import 'package:flutter/material.dart';
import 'package:motor_app/models/product_model.dart';
import 'package:motor_app/ui/products/product_grid_tile.dart';
import 'package:motor_app/ui/products/products_manager.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductManager, List<ProductModel>>((productsManager) => productsManager.itemsByCategory);

    return GridView.builder(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductListTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
