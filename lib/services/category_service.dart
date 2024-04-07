
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motor_app/models/category_model.dart';

class CategoryService {
  Future<List<CategoryModel>> fetchCategory() async {
    List<CategoryModel> categoryList = [];

    try {
      final respone = await http.get(Uri.parse('http://192.168.56.1:8080/php_api/products/category.php?'));

      if (respone.statusCode == 200) {
        final jsonData = jsonDecode(respone.body);
        categoryList = List<CategoryModel>.from(jsonData.map((items) => CategoryModel.fromJson(items)));
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
}