import 'package:flutter/material.dart';
import 'package:motor_app/models/product_model.dart';
import 'package:motor_app/ui/products/products_grid.dart';
import 'package:motor_app/ui/products/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class ProductOverViewScreen extends StatefulWidget {
  late final int categoryId;
  static const routeName = "/products";
  ProductOverViewScreen({super.key, required this.categoryId});

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  late final Future<List<ProductModel>> _fetchProduct;
  @override
  void initState() {
    super.initState();
    context.read<ProductManager>().fetchProduct();
    _fetchProduct = context
        .read<ProductManager>()
        .fetchProductsByCategory(widget.categoryId);
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
                      'Sản phẩm',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    showBackArrow: true,
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1000,
              child: FutureBuilder(
                future: _fetchProduct,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const ProductGrid();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
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
