import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motor_app/models/favorite.dart';
import 'package:motor_app/models/product_colors_model.dart';
import 'package:motor_app/models/product_detail_model.dart';
import 'package:motor_app/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProduct() async {
    List<ProductModel> productList = [];

    try {
      final respone = await http.get(
          Uri.parse('http://192.168.56.1:8080/php_api/products/product.php?'));

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

  Future<List<ProductDetailModel>> fetchProductDetail(int productId) async {
    List<ProductDetailModel> productDetail = [];
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.56.1:8080/php_api/products/product.php?id_product=$productId'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        productDetail = List<ProductDetailModel>.from(
            jsonData.map((item) => ProductDetailModel.fromJson(item)));
      }
    } catch (error) {
      print(error);
    }
    return productDetail;
  }

  Future fetchProductColors(int productId) async {
    List<ProductColorsModel> productColors = [];
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.56.1:8080/php_api/products/product_colors.php?id_product=$productId'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        productColors = List<ProductColorsModel>.from(
            jsonData.map((item) => ProductColorsModel.fromJson(item)));
      }
    } catch (error) {
      print(error);
    }
    return productColors;
  }

  //addToFavorite
  Future<bool> favorite(int idProduct, int idUser, int idColor, bool favorite) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/product.php?'),
        body: {
          'id_product': idProduct.toString(),
          'id_user': idUser.toString(),
          'id_color': idColor.toString(),
          'favorite': favorite.toString(),
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

  //fetchFavorite
  Future<List<FavoriteProductModel>> fetchFavorite(int idUser) async {
    List<FavoriteProductModel> favorite = [];
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:8080/php_api/products/product.php?id_user=$idUser'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        favorite = List<FavoriteProductModel>.from(jsonData.map((item) => FavoriteProductModel.fromJson(item)));
      }
    } catch (error) {
      print(error);
    }
    return favorite;
  }
}
