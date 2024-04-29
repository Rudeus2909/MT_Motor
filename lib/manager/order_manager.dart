import 'package:flutter/material.dart';
import 'package:motor_app/models/order_model.dart';
import 'package:motor_app/services/order_service.dart';

class OrderManager with ChangeNotifier {
  final _orderService = OrderService();

  //Thêm đơn hàng
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

  //Hiển thị tất cả đơn hàng
  late List<OrderModel> allOrder = [];
  Future<void> allOrders() async {
    try {
      allOrder = await _orderService.allOrders();
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  OrderModel? find(int idOrder) {
    try {
      return allOrder.firstWhere((item) => item.idOrder == idOrder);
    } catch (error) {
      return null;
    }
  }

  //Hiển thị đơn hàng theo id_user
  late List<OrderModel> orders = [];
  Future<void> fetchOrders(int idUser) async {
    try {
      orders = await _orderService.fetchOrder(idUser);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  //Tìm đơn đặt hàng theo id_order
  OrderModel? findById(int idOrder) {
    try {
      return orders.firstWhere((item) => item.idOrder == idOrder);
    } catch (error) {
      return null;
    }
  }

  //Hiển thị chi tiết đơn hàng
  late List<OrderDetailModel> orderDetail = [];
  Future<void> fetchOrderDetail(int idOrder) async {
    try {
      orderDetail.clear();
      orderDetail = await _orderService.fetchOrderDetail(idOrder);
      notifyListeners();
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  //Cập nhật trạng thái đơn hàng
  Future updateOrderStatus(int idOrder, String orderStatus) async {
    await _orderService.updateOrderStatus(idOrder, orderStatus);
    notifyListeners();
  }
}
