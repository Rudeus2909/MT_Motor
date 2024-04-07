import 'package:flutter/material.dart';
import 'package:motor_app/models/product_colors_model.dart';
import 'package:motor_app/models/product_detail_model.dart';

import 'package:motor_app/models/product_model.dart';
import 'package:motor_app/services/product_service.dart';

class ProductManager with ChangeNotifier {
  List<ProductModel> productList = [];

  List<ProductModel> productListByCategory = [];
  final _productService = ProductService();

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
    if (productList.isEmpty) {
      productList = await _productService.fetchProduct();
    }
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

  late List<ProductDetailModel> _productDetail = [];
  List<ProductDetailModel> get productDetail => _productDetail;

  Future<void> fetchProductDetail(int productId) async {
    try {
      _productDetail = await ProductService().fetchProductDetail(productId);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  late List<ProductColorsModel> _productColors = [];
  List<ProductColorsModel> get productColor => _productColors;
  Future<void> fetchProductColors(int productId) async {
    try {
      _productColors = await ProductService().fetchProductColors(productId);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  ProductModel? findById(int id) {
    try {
      return productList.firstWhere((item) => item.idProduct == id);
    } catch (error) {
      return null;
    }
  }

  ProductColorsModel? findProductColorDetailById(int id) {
    try {
      return productColor.firstWhere((item) => item.idProduct == id);
    } catch (error) {
      return null;
    }
  }

  //Lấy một số sản phẩm cố định
  late List<ProductModel> someProduct = [];
  Future<void> fetchSomeProduct() async {
    try {
      if (productList.isEmpty) {
        productList = await _productService.fetchProduct();
      }
      someProduct.clear();
      for (var product in productList) {
        if (product.idProduct == 1 ||
            product.idProduct == 2 ||
            product.idProduct == 3) {
          someProduct.add(product);
        }
      }
    } catch (error) {
      print(error);
    }
  }

  //Favorite
  Future favorite(int idProduct, int idUser, int favorite) async {
    _productService.favorite(idProduct, idUser, favorite);
    notifyListeners();
  }
}
