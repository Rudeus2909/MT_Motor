import 'package:flutter/material.dart';
import 'package:motor_app/models/favorite.dart';
import 'package:motor_app/models/product_colors_model.dart';
import 'package:motor_app/models/product_detail_model.dart';

import 'package:motor_app/models/product_model.dart';
import 'package:motor_app/services/product_service.dart';

class ProductManager with ChangeNotifier {
  final _productService = ProductService();

  //Hiển thị danh sách tất cả sản phẩm
  List<ProductModel> productList = [];
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

  //Tìm sản phẩm theo id
  ProductModel? findById(int id) {
    try {
      return productList.firstWhere((item) => item.idProduct == id);
    } catch (error) {
      return null;
    }
  }

  /// Hàm này thêm sản phẩm vào danh sách dựa trên danh mục của sản phẩm
  List<ProductModel> productListByCategory = [];
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

  //Hiển thị thông số sản phẩm
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
  //Tìm thông số sản phẩm theo id_product
  ProductDetailModel? findProductDetailById(int id) {
    try {
      return productDetail.firstWhere((item) => item.idProduct == id);
    } catch (error) {
      return null;
    }
  }

  //Lấy danh sách các màu và các thông tin khác để hiển thị trong trang chi tiết
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

  //Tìm màu và các thông tin theo id_product
  ProductColorsModel? findProductColorDetailById(int id) {
    try {
      return productColor.firstWhere((item) => item.idProduct == id);
    } catch (error) {
      return null;
    }
  }

  //Lấy thông tin màu, giá, ảnh của sản phẩm khi đặt mua
  late List<ProductColorInfoModel> productColorInfo = [];
  Future<void> fetchProductColorInfo(int idProduct, int idColor) async {
    try {
      productColorInfo =
          await _productService.fetchProductColorInfo(idProduct, idColor);
    } catch (error) {
      print(error);
    }
    notifyListeners();
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

  //Thêm vào yêu thích
  Future favorite(int idProduct, int idUser, int idColor, bool favorite) async {
    _productService.favorite(idProduct, idUser, idColor, favorite);
    notifyListeners();
  }

  //Hiển thị các sản phẩm yêu thích
  late List<FavoriteProductModel> favoriteProducts = [];
  Future<void> fetchFavorite(int idUser) async {
    try {
      favoriteProducts = await _productService.fetchFavorite(idUser);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
