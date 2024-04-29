import 'package:flutter/material.dart';
import 'package:motor_app/auth/login_screen.dart';
import 'package:motor_app/manager/order_manager.dart';
import 'package:motor_app/manager/user_manager.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/admin/orders_manager/order_detail_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class OrderManagerScreen extends StatefulWidget {
  const OrderManagerScreen({super.key});

  @override
  State<OrderManagerScreen> createState() => _OrderManagerScreenState();
}

class _OrderManagerScreenState extends State<OrderManagerScreen> {

  @override
  void initState() {
    super.initState();
    context.read<OrderManager>().allOrders();
    context.read<UserManager>().fetchUser();
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
                    'Quản lý đơn hàng',
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
          Expanded(
            child: SingleChildScrollView(
              child: Consumer2<OrderManager, UserManager>(
                builder: (context, orderManager, userManager, child) {
                  if (orderManager.allOrder.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orderManager.allOrder.length,
                            itemBuilder: (context, index) {
                              var order = orderManager.allOrder[index].idOrder;
                              var idUser = orderManager.allOrder[index].idUser;
                              var user =
                                  context.read<UserManager>().findById(idUser);
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
                                                  'Đơn hàng ' + order.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
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
                                                            .allOrder[index]
                                                            .orderTime),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 41,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Người đặt: ',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleLarge,
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(user!.name!),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
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
                                                          orderManager
                                                              .allOrder[index]
                                                              .orderStatus,
                                                          style: orderManager
                                                                      .allOrder[
                                                                          index]
                                                                      .orderStatus ==
                                                                  "Đã xác nhận"
                                                              ? const TextStyle(
                                                                  color: Colors
                                                                      .green)
                                                              : orderManager
                                                                          .allOrder[
                                                                              index]
                                                                          .orderStatus ==
                                                                      "Chờ xác nhận"
                                                                  ? const TextStyle(
                                                                      color: Colors
                                                                          .black)
                                                                  : const TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width:47,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                var idOrder = orderManager.allOrder[index].idOrder;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderDetailManager(
                                                              idOrder: idOrder),
                                                    ),);
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
                        ],
                      ),
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
