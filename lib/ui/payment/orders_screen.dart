import 'package:flutter/material.dart';
import 'package:motor_app/ui/payment/order_detail_screen.dart';
import 'package:motor_app/ui/payment/order_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key, required this.idUser});

  final int idUser;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderManager>().fetchOrders(widget.idUser);
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
                      'Đơn hàng của ban',
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
            Consumer<OrderManager>(
              builder: (context, orderManager, child) {
                if (orderManager.orders.isNotEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 1000,
                        child: ListView.builder(
                          itemCount: orderManager.orders.length,
                          itemBuilder: (context, index) {
                            var order = index + 1;
                            return Column(
                              children: [
                                Container(
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
                                    child: SizedBox(
                                      height: 90,
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Đơn hàng ' + order.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'Ngày đặt: ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(orderManager
                                                  .orders[index].orderTime),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 145,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              var idOrder = context.read<OrderManager>().orders[index].idOrder;
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailScreen(idOrder: idOrder),));
                                            },
                                            icon: const Icon(
                                              Icons.arrow_forward_sharp,
                                              size: 30,
                                            ),
                                          )
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
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('Bạn chưa có đơn hàng nào'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
