import 'package:flutter/material.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/ui/products/product_detail_screen.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<ProductManager>().fetchProduct();
    context.read<ProductManager>().fetchProductsByCategory(widget.categoryId);
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
                      'Mẫu xe',
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
            Consumer<ProductManager>(
              builder: (context, productManager, child) {
                return SizedBox(
                  height: 1000,
                  child: ListView.builder(
                    itemCount: productManager.productListByCategory.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ProductListTile(
                            productImageUrl: productManager
                                .productListByCategory[index].productImage,
                            productName: productManager
                                .productListByCategory[index].productName,
                            onFavorite: () {},
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    productId: productManager
                                        .productListByCategory[index]
                                        .idProduct!,
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.productImageUrl,
    required this.productName,
    this.onTap,
    this.onFavorite,
  }) : super(key: key);

  final String productImageUrl;
  final String productName;
  final void Function()? onTap;
  final void Function()? onFavorite;

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
              AspectRatio(
                aspectRatio: 1.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    productImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    productName,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              IconButton(
                onPressed: onFavorite,
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
