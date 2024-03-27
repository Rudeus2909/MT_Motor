import 'package:flutter/material.dart';
import 'package:motor_app/models/category_model.dart';
import 'package:motor_app/ui/category/category_grid_tile.dart';
import 'package:motor_app/ui/category/category_manager.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  
  @override
  Widget build(BuildContext context) {
    final categories = context.select<CategoryManager, List<CategoryModel>>((categoriesManager) => categoriesManager.items);

    return GridView.builder(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      itemCount: categories.length,
      itemBuilder: (ctx, i) => CategoryListTile(categories[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}