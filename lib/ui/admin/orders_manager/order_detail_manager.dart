import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:motor_app/manager/order_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class OrderDetailManager extends StatefulWidget {
  const OrderDetailManager({super.key, required this.idOrder});

  final int idOrder;

  @override
  State<OrderDetailManager> createState() => _OrderDetailManagerState();
}

class _OrderDetailManagerState extends State<OrderDetailManager> {
  @override
  void initState() {
    super.initState();
    context.read<OrderManager>().fetchOrderDetail(widget.idOrder);
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
                      'Quản lý đơn hàng',
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
                var orderStatus =
                    orderManager.find(widget.idOrder)!.orderStatus;
                if (orderManager.orderDetail.isNotEmpty) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mã đơn hàng: ${widget.idOrder}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Ngày đặt hàng: ',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(orderManager.orders[0].orderTime),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Trạng thái đơn hàng: ',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  orderStatus,
                                  style: orderStatus == "Đã xác nhận"
                                      ? const TextStyle(
                                          color: Colors.green,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)
                                      : orderStatus == "Chờ xác nhận"
                                          ? const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)
                                          : const TextStyle(
                                              color: Colors.red,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: LimitedBox(
                            maxHeight: 100,
                            child: Row(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1.3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      orderManager.orderDetail[0].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        orderManager.orderDetail[0].productName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Màu sắc: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            orderManager
                                                .orderDetail[0].colorName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'vi_VN',
                                          symbol: 'VNĐ',
                                          decimalDigits: 0,
                                        ).format(
                                            orderManager.orderDetail[0].total),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Số lượng: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          Text(orderManager
                                              .orderDetail[0].quantity
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Thông tin người đặt hàng',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tên người đặt hàng: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Địa chỉ: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'E-mail: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Số điện thoại: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    orderManager.orderDetail[0].ordererName,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    orderManager.orderDetail[0].address,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    orderManager.orderDetail[0].email,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    orderManager.orderDetail[0].phone,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tổng cộng',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tạm tính: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Thuế: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Giảm giá: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tổng số tiền: ',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'vi_VN',
                                      symbol: 'VNĐ',
                                      decimalDigits: 0,
                                    ).format(orderManager.orderDetail[0].total),
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '0',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '0',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'vi_VN',
                                      symbol: 'VNĐ',
                                      decimalDigits: 0,
                                    ).format(orderManager.orderDetail[0].total),
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Consumer<OrderManager>(
          builder: (context, orderManager, child) {
            if (orderManager.find(widget.idOrder) != null) {
              if (orderManager.find(widget.idOrder)!.orderStatus ==
                  'Chờ xác nhận') {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Từ chối đơn hàng'),
                            content: const Text(
                                'Bạn chắc chắn muốn từ chối đơn hàng?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Không'),
                                child: const Text('Không'),
                              ),
                              TextButton(
                                onPressed: () {
                                  String orderStatus = 'Đã hủy';
                                  context
                                      .read<OrderManager>()
                                      .updateOrderStatus(
                                          widget.idOrder, orderStatus);
                                  Navigator.pop(context, 'Có');
                                  setState(() {});
                                  context
                                      .read<OrderManager>()
                                      .fetchOrderDetail(widget.idOrder);
                                  Fluttertoast.showToast(
                                    msg: "Từ chối đơn hàng thành công",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                },
                                child: const Text('Có'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.red,
                        side: const BorderSide(color: Colors.black),
                      ),
                      child: Text(
                        'Từ chối đơn hàng',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Xác nhận đơn hàng'),
                            content: const Text(
                                'Bạn chắc chắn muốn xác nhận đơn hàng?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Không'),
                                child: const Text('Không'),
                              ),
                              TextButton(
                                onPressed: () {
                                  String orderStatus = 'Đã xác nhận';
                                  context
                                      .read<OrderManager>()
                                      .updateOrderStatus(
                                          widget.idOrder, orderStatus);
                                  Navigator.pop(context, 'Có');
                                  setState(() {});
                                  context
                                      .read<OrderManager>()
                                      .fetchOrderDetail(widget.idOrder);
                                  Fluttertoast.showToast(
                                    msg: "Xác nhận đơn hàng thành công",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                },
                                child: const Text('Có'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.green,
                        side: const BorderSide(color: Colors.black),
                      ),
                      child: Text(
                        'Xác nhận đơn hàng',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.red,
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: null,
                      child: Text(
                        'Từ chối đơn hàng',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.red,
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: null,
                      child: Text(
                        'Xác nhận đơn hàng',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
                      ),
                    ),
                  ],
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
