import 'package:flutter/material.dart';
import 'package:motor_app/models/order_model.dart';
import 'package:motor_app/services/order_service.dart';

class OrderManager with ChangeNotifier {
  final _orderService = OrderService();

  //addOrder
  Future addOrder(
    int idUser,
    String orderTime,
    int idProduct,
    int total,
    String ordererName,
    String address,
    String email,
    String phone,
    int idColor,
    int amountAfterOrdering,
    String imageUrl,
  ) async {
    await _orderService.addOrder(
      idUser,
      orderTime,
      idProduct,
      total,
      ordererName,
      address,
      email,
      phone,
      idColor,
      amountAfterOrdering,
      imageUrl,
    );
    notifyListeners();
  }

  //fetchOrder
  late List<OrderModel> orders = [];
  Future<void> fetchOrders(int idUser) async {
    try {
      orders = await _orderService.fetchOrder(idUser);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  //fetchOrderDetail
  late List<OrderDetailModel> orderDetail = [];
  Future<void> fetchOrderDetail(int idOrder) async {
    try {
      orderDetail = await _orderService.fetchOrderDetail(idOrder);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
