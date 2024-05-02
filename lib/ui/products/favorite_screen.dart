import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.idUser});

  final int idUser;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductManager>().fetchFavorite(widget.idUser);
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
                    title: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Sản phẩm đã thích',
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Consumer<ProductManager>(
              builder: (context, favoriteProducts, child) {
                if (favoriteProducts.favoriteProducts.isNotEmpty) {
                  return Column(
                    children: [
                      RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(const Duration(seconds: 1));
                          context
                              .read<ProductManager>()
                              .fetchFavorite(widget.idUser);
                        },
                        child: SizedBox(
                          height: 700,
                          child: ListView.builder(
                            itemCount: favoriteProducts.favoriteProducts.length,
                            itemBuilder: (context, index) {
                              if (favoriteProducts
                                      .favoriteProducts[index].favorite ==
                                  'true') {
                                return Column(
                                  children: [
                                    Container(
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
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: LimitedBox(
                                          maxHeight: 60,
                                          child: Row(
                                            children: [
                                              AspectRatio(
                                                aspectRatio: 1.5,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(15),
                                                  child: Image.network(
                                                    favoriteProducts
                                                        .favoriteProducts[index]
                                                        .imageUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 24,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      favoriteProducts
                                                          .favoriteProducts[
                                                              index]
                                                          .productName,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!.apply(color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Màu sắc: ',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineSmall!.apply(color: Colors.black),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          favoriteProducts
                                                              .favoriteProducts[
                                                                  index]
                                                              .colorName,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleLarge!.apply(color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 24,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  var favorite = false;
                                                  var idProduct =
                                                      favoriteProducts
                                                          .favoriteProducts[
                                                              index]
                                                          .idProduct;
                                                  var idColor = favoriteProducts
                                                      .favoriteProducts[index]
                                                      .idColor;
                                                  context
                                                      .read<ProductManager>()
                                                      .favorite(
                                                          idProduct,
                                                          widget.idUser,
                                                          idColor,
                                                          favorite);
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        "Xóa khỏi yêu thích thành công",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0,
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                );
                              } else {
                                return const Center();
                              }
                            },
                          ),
                        ),
                      )
                    ],
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
                            'Bạn chưa yêu thích mẫu xe nào cả',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
