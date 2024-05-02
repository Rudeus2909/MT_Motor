import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motor_app/models/favorite.dart';
import 'package:motor_app/models/product_colors_model.dart';
import 'package:motor_app/models/product_detail_model.dart';
import 'package:motor_app/models/product_model.dart';

class ProductService {
  //Hiển thị danh sách sản phẩm
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

  //Thêm sản phẩm
  Future<bool> addProduct(
    String productName,
    int idCategory,
    String color,
    String price,
    String amount,
    String imageUrl,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/product.php?'),
        body: {
          'product_name': productName,
          'id_category': idCategory.toString(),
          'color': color,
          'price': price,
          'amount': amount,
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

  //Thêm màu và các thông tin cho sản phẩm
  Future<bool> addProductColor(
    int idProduct,
    String color,
    String price,
    String amount,
    String imageUrl,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/product.php?'),
        body: {
          'id_product': idProduct.toString(),
          'color': color,
          'price': price,
          'amount': amount,
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

  //Cập nhật màu và các thông tin cho sản phẩm
  Future<bool> updateProductColor(
    int idProduct,
    int idColor,
    String color,
    String price,
    String amount,
    String imageUrl,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://192.168.56.1:8080/php_api/products/edit_product_color.php?'),
        body: {
          'id_product': idProduct.toString(),
          'id_color': idColor.toString(),
          'color': color,
          'price': price,
          'amount': amount,
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

  //Lấy thông số sản phẩm
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

  //Thêm hoặc chỉnh sửa thông số sản phẩm
  Future<bool> updateProductDetail(
    int idProduct,
    String productName,
    String weight,
    String height,
    String width,
    String length,
    String petroTank,
    String engine,
    String cylinder,
    String maximumCapacity,
    String oilCacacity,
    String fuelConsumption,
    String gear,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/product.php?'),
        body: {
          'id_product': idProduct.toString(),
          'product_name': productName,
          'weight': weight,
          'height': height,
          'width': width,
          'length': length,
          'petro_tank_capacity': petroTank,
          'oil_capacity': oilCacacity,
          'gear': gear,
          'cylinder_capacity': cylinder,
          'fuel_consumption': fuelConsumption,
          'engine_type': engine,
          'maximum_capacity': maximumCapacity,
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

  //Lấy danh sách màu sản phẩm và các thông tin liên quan
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

  //Lấy danh sách màu và các thông tin liên quan để đặt hàng
  Future fetchProductColorInfo(int idProduct, int idColor) async {
    List<ProductColorInfoModel> productColorInfo = [];
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.56.1:8080/php_api/products/product_colors.php?id_product=$idProduct&&id_color=$idColor'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        productColorInfo = List<ProductColorInfoModel>.from(
            jsonData.map((item) => ProductColorInfoModel.fromJson(item)));
      }
    } catch (error) {
      print(error);
    }
    return productColorInfo;
  }

  //addToFavorite
  Future<bool> favorite(
      int idProduct, int idUser, int idColor, bool favorite) async {
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
      final response = await http.get(Uri.parse(
          'http://192.168.56.1:8080/php_api/products/product.php?id_user=$idUser'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        favorite = List<FavoriteProductModel>.from(
            jsonData.map((item) => FavoriteProductModel.fromJson(item)));
      }
    } catch (error) {
      print(error);
    }
    return favorite;
  }

  //Xóa màu và các thông tin sản phẩm
  Future<bool> deleteProductColor(int idProduct, int idColor) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/product.php?'),
        body: {
          'id_product': idProduct.toString(),
          'id_color': idColor.toString(),
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

  //Xóa sản phẩm
  Future<bool> deleteProduct(int idProduct) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://192.168.56.1:8080/php_api/products/delete_product.php?'),
        body: {
          'id_product': idProduct.toString(),
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

  //Tìm kiếm sản phẩm
  Future<List<SearchProductModel>> searchProduct(String searchKey) async {
    List<SearchProductModel> searchProducts = [];
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/search.php?'),
        body: {
          'key_word': searchKey,
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        searchProducts = List<SearchProductModel>.from(
          jsonData.map(
            (item) => SearchProductModel.fromJson(item),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
    return searchProducts;
  }

  //Hiển thị danh sách tất cả sản phẩm được yêu thích
  Future<List<MostFavoriteModel>> mostFavorite() async {
    List<MostFavoriteModel> mostFavorite = [];
    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.56.1:8080/php_api/products/most_favorite.php?'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        mostFavorite = List<MostFavoriteModel>.from(
          jsonData.map(
            (item) => MostFavoriteModel.fromJson(item),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
    return mostFavorite;
  }

  //Hiển thị sản phẩm được mua nhiều nhất
  Future<List<MostPurchasedModel>> mostPuschased() async {
    List<MostPurchasedModel> mostPuschased = [];
    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.56.1:8080/php_api/products/most_purchased.php?'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        mostPuschased = List<MostPurchasedModel>.from(
          jsonData.map(
            (item) => MostPurchasedModel.fromJson(item),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
    return mostPuschased;
  }
}
