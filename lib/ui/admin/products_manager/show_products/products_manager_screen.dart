import 'package:flutter/material.dart';
import 'package:motor_app/ui/admin/products_manager/add_products/add_product_screen.dart';
import 'package:motor_app/ui/admin/products_manager/edit_products/edit_product_specifications.dart';
import 'package:motor_app/ui/admin/products_manager/show_products/colors_manager_screen.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class ProductsManagerScreen extends StatefulWidget {
  const ProductsManagerScreen({super.key, required this.idCategory});

  final int idCategory;

  @override
  State<ProductsManagerScreen> createState() => _ProductsManagerScreenState();
}

class _ProductsManagerScreenState extends State<ProductsManagerScreen> {

  @override
  void initState() {
    super.initState();
    context
        .read<ProductManager>()
        .fetchProductsByCategory(widget.idCategory);
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
                    showBackArrow: true,
                    title: Text(
                      'Quản lý sản phẩm',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
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
                            onEditPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditProductSpecificationScreen(
                                    idProduct: productManager
                                        .productListByCategory[index]
                                        .idProduct!,
                                  ),
                                ),
                              );
                            },
                            onDeletePressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('Xóa sản phẩm'),
                                  content: Text(
                                      'Bạn có chắc chắn muốn xóa sản phẩm này không'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Không'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        context
                                            .read<ProductManager>()
                                            .deleteProduct(
                                              productManager
                                                  .productListByCategory[index]
                                                  .idProduct!,
                                            );
                                        context.read<ProductManager>().removeProduct(productManager
                                        .productListByCategory[index]
                                        .idProduct!);
                                        Navigator.of(context).pop(true);
                                        await context.read<ProductManager>().fetchProductsByCategory(widget.idCategory);
                                      },
                                      child: const Text('Có'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ColorsManagerScreen(
                                      idProduct: productManager
                                          .productListByCategory[index]
                                          .idProduct!,
                                          idCategory: widget.idCategory,),
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddProductScreen(idCategory: widget.idCategory),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Thêm sản phẩm'),
          ),
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
    this.onEditPressed,
    this.onDeletePressed,
  }) : super(key: key);

  final String productImageUrl;
  final String productName;
  final void Function()? onTap;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

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
                onPressed: onEditPressed,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onDeletePressed,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
