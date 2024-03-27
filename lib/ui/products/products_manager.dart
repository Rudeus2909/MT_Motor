import 'package:flutter/material.dart';

import 'package:motor_app/models/product_model.dart';
import 'package:motor_app/services/product_service.dart';

class ProductManager with ChangeNotifier {
  List<ProductModel> productList = [];

  List<ProductModel> productListByCategory = [];
  var _productService = ProductService();

  Future<List<ProductModel>> fetchProduct() async {
    

    try {
      productList = await _productService.fetchProduct();
    } catch (error) {
      print(error);
    }
    return productList;
  }

  int get productCount {
    return productList.length;
  }

  List<ProductModel> get items {
    return [...productList];
  }

  /// Hàm này thêm sản phẩm vào danh sách dựa trên danh mục của sản phẩm
  Future<List<ProductModel>> fetchProductsByCategory(int idCategory) async {
    // Xóa danh sách sản phẩm theo danh mục cũ để cập nhật lại
    productListByCategory.clear();
    // Lặp qua từng sản phẩm trong danh sách sản phẩm
    for (var product in productList) {
      
      if (product.idCategory == idCategory) {
        productListByCategory.add(product);
      }
    }
    return productListByCategory;
  }

  // Trả về danh sách sản phẩm theo danh mục
  List<ProductModel> get itemsByCategory {
    return [...productListByCategory];
  }

  List productDetail = [];
  Future fetchProductDetail(int productId) async {
    try {
      productDetail = await _productService.fetchProductDetail(productId) as List;
      print(productDetail);
    } catch (error) {
      print(error);
    }
  } 
}