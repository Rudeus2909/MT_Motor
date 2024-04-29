import 'package:flutter/material.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/ui/products/product_detail_screen.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key, required this.searchKey});

  final String searchKey;

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductManager>().searchProduct(widget.searchKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderContainer(
            child: Column(
              children: [
                CustomAppbar(
                  title: Text(
                    'Tìm kiếm sản phẩm',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  showBackArrow: true,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<ProductManager>(
                builder: (context, productManager, child) {
                  if (productManager.searchProducts.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 8 / 7,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: productManager.searchProducts.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: GestureDetector(
                                          onTap: () {
                                            var idProduct = productManager
                                                .searchProducts[index]
                                                .idProduct;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailScreen(
                                                        productId: idProduct!),
                                              ),
                                            );
                                          },
                                          child: Image.network(
                                            productManager.searchProducts[index]
                                                .productImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    productManager
                                        .searchProducts[index].productName!,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 150),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/no-results.png',
                            height: 200,
                            width: 200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            'Không có mẫu xe mà bạn đang tìm kiếm trên ứng dụng',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
