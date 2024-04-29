import 'package:flutter/material.dart';
import 'package:motor_app/ui/orders/order_detail_screen.dart';
import 'package:motor_app/manager/order_manager.dart';
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
      body: Column(
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
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<OrderManager>(
                builder: (context, orderManager, child) {
                  if (orderManager.orders.isNotEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 1000,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orderManager.orders.length,
                            itemBuilder: (context, index) {
                              var order = orderManager.orders[index].idOrder;
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
                                        height: 150,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Đơn hàng ' +
                                                      order.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
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
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'Trạng thái đơn hàng: ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  orderManager.orders[index]
                                                      .orderStatus,
                                                  style: orderManager
                                                              .orders[index]
                                                              .orderStatus ==
                                                          "Đã xác nhận"
                                                      ? const TextStyle(
                                                          color: Colors.green)
                                                      : orderManager
                                                                  .orders[index]
                                                                  .orderStatus ==
                                                              "Chờ xác nhận"
                                                          ? const TextStyle(
                                                              color:
                                                                  Colors.black)
                                                          : const TextStyle(
                                                              color:
                                                                  Colors.red),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 145,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                var idOrder = context
                                                    .read<OrderManager>()
                                                    .orders[index]
                                                    .idOrder;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderDetailScreen(
                                                              idOrder: idOrder),
                                                    ));
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
