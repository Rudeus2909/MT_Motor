import 'package:flutter/material.dart';
import 'package:motor_app/auth/login_screen.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/admin/products_manager/edit_products/edit_category_screen.dart';
import 'package:motor_app/ui/admin/products_manager/show_products/products_manager_screen.dart';
import 'package:motor_app/manager/category_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class CategoriesManagerScreen extends StatefulWidget {
  const CategoriesManagerScreen({super.key});

  @override
  State<CategoriesManagerScreen> createState() =>
      _CategoriesManagerScreenState();
}

class _CategoriesManagerScreenState extends State<CategoriesManagerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryManager>().fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    title: Text(
                      'Quản lý hãng xe',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    actions: [
                      Tooltip(
                        message: "Đăng xuất",
                        child: IconButton(
                          onPressed: () {showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Đăng xuất'),
                                content: const Text(
                                    'Bạn có muốn đăng xuất khỏi ứng dụng'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Không'),
                                    child: const Text('Không'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<LoginService>().logout();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('Có'),
                                  ),
                                ],
                              ),
                            );},
                          icon: const Icon(Icons.logout),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1000,
              child: FutureBuilder(
                future: context.read<CategoryManager>().fetchCategory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () =>
                        context.read<CategoryManager>().fetchCategory(),
                    child: const CategoryList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryManager>(
      builder: (context, categoryManager, child) {
        return SizedBox(
          height: 1000,
          child: ListView.builder(
            itemCount: categoryManager.categoryList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CategoryListTile(
                    categoryImageUrl:
                        categoryManager.categoryList[index].categoryImage,
                    categoryName:
                        categoryManager.categoryList[index].categoryName,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditCategoryScreen(
                              idCategory: categoryManager
                                  .categoryList[index].idCategory!),
                        ),
                      );
                      context.read<ProductManager>().fetchProductsByCategory(categoryManager.categoryList[index].idCategory!);
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsManagerScreen(
                              idCategory: categoryManager
                                  .categoryList[index].idCategory!),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    super.key,
    required this.categoryImageUrl,
    required this.categoryName,
    this.onTap,
    this.onPressed,
  });

  final String categoryImageUrl;
  final String categoryName;
  final void Function()? onTap;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      categoryImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    categoryName,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.edit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
