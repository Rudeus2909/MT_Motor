import 'package:flutter/material.dart';
import 'package:motor_app/ui/category/category_grid.dart';
import 'package:motor_app/manager/category_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class CategoryOverViewScreen extends StatefulWidget {
  const CategoryOverViewScreen({Key? key}) : super(key: key);

  @override
  State<CategoryOverViewScreen> createState() => _CategoryOverViewScreenState();
}

class _CategoryOverViewScreenState extends State<CategoryOverViewScreen> {
  late final Future<void> _fetchCategory =
      context.read<CategoryManager>().fetchCategory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderContainer(
            child: Column(
              children: [
                CustomAppbar(
                  title: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Danh mục hãng xe',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          FutureBuilder(
            future: _fetchCategory,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CategoryGrid(),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
