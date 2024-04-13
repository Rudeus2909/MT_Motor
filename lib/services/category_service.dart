import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motor_app/models/category_model.dart';

class CategoryService {
  Future<List<CategoryModel>> fetchCategory() async {
    List<CategoryModel> categoryList = [];

    try {
      final respone = await http.get(
          Uri.parse('http://192.168.56.1:8080/php_api/products/category.php?'));

      if (respone.statusCode == 200) {
        final jsonData = jsonDecode(respone.body);
        categoryList = List<CategoryModel>.from(
            jsonData.map((items) => CategoryModel.fromJson(items)));
      }
    } catch (error) {
      print(error);
    }
    // for (CategoryModel category in categoryList) {
    //   print(category.categoryName);
    //   print(category.categoryImage);
    // }
    return categoryList;
  }

  //Cập nhật tên hãng xe
  Future<bool> updateCategoryName(int idCategory, String categoryName) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/category.php?'),
        body: {
          'id_category': idCategory.toString(),
          'category_name': categoryName,
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

  //Cập nhật hình ảnh hãng xe
  Future<bool> updateCategoryImage(int idCategory, String categoryImage) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/products/category.php?'),
        body: {
          'id_category': idCategory.toString(),
          'category_image': categoryImage,
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
}
