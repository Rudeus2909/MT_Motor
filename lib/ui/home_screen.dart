import 'package:flutter/material.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/news/news_overview_screen.dart';
import 'package:motor_app/ui/products/product_detail_screen.dart';
import 'package:motor_app/ui/products/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/user_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var idUser = context.read<LoginService>().idUser;
    context.read<UserManager>().fetchUserById(idUser);
    context.read<ProductManager>().fetchSomeProduct();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Custom Appbar
            HeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    title: Consumer<UserManager>(
                      builder: (context, userManager, child) {
                        if (userManager.user.isNotEmpty) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Xin chào',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    userManager.user[0].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    actions: [
                      //Favorite
                      Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //SearchBar
                  const SearchBar(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),

            //Some products
            Container(
              height: 400,
              width: 390,
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.two_wheeler_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sản phẩm',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                    child: Consumer<ProductManager>(
                      builder: (context, productManager, child) {
                        if (productManager.someProduct.isNotEmpty) {
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  width: 350,
                                  height: 320,
                                  child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        productManager.someProduct.length,
                                    itemBuilder: (context, index) {
                                      selectedIndex = index;
                                      return Column(
                                        children: [
                                          Image.asset(
                                            productManager.someProduct[index]
                                                .productImage,
                                            fit: BoxFit.cover,
                                            width: 350,
                                            height: 250,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                productManager
                                                    .someProduct[
                                                        selectedIndex]
                                                    .productName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(productId: productManager.someProduct[selectedIndex].idProduct!),));
                                                },
                                                icon: const Icon(Icons.arrow_forward, size: 30,),
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            const Divider(),
            const SizedBox(
              height: 25,
            ),

            //Advertise
            Advertise(),

            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class Advertise extends StatelessWidget {
  Advertise({
    super.key,
  });

  //List images
  final List<String> imageUrl = [
    'assets/news/ProHonda.jpg',
    'assets/news/Sales.png',
    'assets/news/Sales1.jpg',
    'assets/news/XS155R.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.add_alert,
                color: Colors.red,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Tin Tức & Khuyến mãi',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black38),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 350,
                height: 250,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrl.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imageUrl[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewsOverviewScreen(),
                    ));
              },
              child: const Text('Xem tất cả'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            const Icon(Icons.search),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Tìm kiếm sản phẩm',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
