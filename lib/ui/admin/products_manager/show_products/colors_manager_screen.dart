import 'package:flutter/material.dart';
import 'package:motor_app/ui/admin/products_manager/edit_products/edit_product_color_detail_screen.dart';
import 'package:motor_app/ui/products/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class ColorsManagerScreen extends StatefulWidget {
  const ColorsManagerScreen({super.key, required this.idProduct});

  final int idProduct;

  @override
  State<ColorsManagerScreen> createState() => _ColorsManagerScreenState();
}

class _ColorsManagerScreenState extends State<ColorsManagerScreen> {
  late final Future<void> _fetchProductColors;

  @override
  void initState() {
    super.initState();
    _fetchProductColors =
        context.read<ProductManager>().fetchProductColors(widget.idProduct);
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
                      'Quản lý thông tin sản phẩm',
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.clip,
                    ),
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
                future: _fetchProductColors,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RefreshIndicator(
                    child: const ProductColorsList(),
                    onRefresh: () => context
                        .read<ProductManager>()
                        .fetchProductColors(widget.idProduct),
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

class ProductColorsList extends StatelessWidget {
  const ProductColorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductManager>(
      builder: (context, productManager, child) {
        return SizedBox(
          height: 1000,
          child: ListView.builder(
            itemCount: productManager.productColor.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProductColorsListTile(
                    productColorsImageUrl:
                        productManager.productColor[index].imageUrl,
                    productColorsName:
                        productManager.productColor[index].colorName,
                    onEditPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProductColorDetailScreen(
                            idProduct:
                                productManager.productColor[index].idProduct,
                            idColor:
                                productManager.productColor[index].idColor!,
                          ),
                        ),
                      );
                    },
                    onDeletePressed: () {},
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

class ProductColorsListTile extends StatelessWidget {
  const ProductColorsListTile({
    Key? key,
    required this.productColorsImageUrl,
    required this.productColorsName,
    this.onEditPressed,
    this.onDeletePressed,
  }) : super(key: key);

  final String productColorsImageUrl;
  final String productColorsName;
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
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    productColorsImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    productColorsName,
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
