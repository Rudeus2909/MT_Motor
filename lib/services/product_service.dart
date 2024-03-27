import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motor_app/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProduct() async {
    List<ProductModel> productList = [];

    try {
      final respone = await http
          .get(Uri.parse('http://192.168.56.1:8080/php_api/product.php?'));

      if (respone.statusCode == 200) {
        final jsonData = jsonDecode(respone.body);
        productList = List<ProductModel>.from(
            jsonData.map((items) => ProductModel.fromJson(items)));
      }
    } catch (error) {
      print(error);
    }
    // for (ProductModel product in productList) {
    //   print(product.productName);
    // }
    return productList;
  }

  Future fetchProductDetail(int productId) async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.56.1:8080/php_api/product.php?id_product=$productId'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData;
      }
    } catch (error) {
      print(error);
    }
  }
}
