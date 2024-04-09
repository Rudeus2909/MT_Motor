import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motor_app/models/order_model.dart';

class OrderService {

  //addOrder
  Future<bool> addOrder(
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
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/order.php?'),
        body: {
          'id_user': idUser.toString(),
          'order_time': orderTime,
          'id_product': idProduct.toString(),
          'total': total.toString(),
          'orderer_name': ordererName,
          'address': address,
          'email': email,
          'phone': phone,
          'id_color': idColor.toString(),
          'amount_after_ordering': amountAfterOrdering.toString(),
          'image_path': imageUrl,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  //fetchOrder
  Future<List<OrderModel>> fetchOrder(int idUser) async {
    List<OrderModel> orders = [];
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:8080/php_api/order.php?id_user=$idUser'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        orders = List<OrderModel>.from(jsonData.map((item) => OrderModel.fromJson(item)));
      }
    } catch (error) {
      print(error);
    }
    return orders;
  }

  //fetchOrderDetail
  Future<List<OrderDetailModel>> fetchOrderDetail(int idOrder) async {
    List<OrderDetailModel> orderDetail = [];
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:8080/php_api/order.php?id_order=$idOrder'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        orderDetail = List<OrderDetailModel>.from(jsonData.map((item) => OrderDetailModel.fromJson(item)));
      }
    } catch (error) {
      print(error);
    }
    return orderDetail;
  }
}
