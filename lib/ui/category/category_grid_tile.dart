import 'package:flutter/material.dart';
import 'package:motor_app/models/category_model.dart';
import 'package:motor_app/ui/products/product_overview_screen.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile(this.category, {super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black38),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(1, 0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 120,
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ProductOverViewScreen(
                            categoryId: category.idCategory!)),
                      ),
                    );
                  },
                  child: Image.network(
                    category.categoryImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          category.categoryName,
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }
}
