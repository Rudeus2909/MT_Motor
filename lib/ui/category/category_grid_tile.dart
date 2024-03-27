import 'package:flutter/material.dart';
import 'package:motor_app/models/category_model.dart';
import 'package:motor_app/ui/products/product_overview_screen.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile(this.category, {super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: CategoryGridFooter(
          category: category,
        ),
        child: GestureDetector(
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductOverViewScreen(categoryId: category.idCategory!))));
          },
          child: Image.asset(
            category.categoryImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CategoryGridFooter extends StatelessWidget {
  const CategoryGridFooter({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      title: Text(
        category.categoryName,
        textAlign: TextAlign.center,
      ),
    );
  }
}
