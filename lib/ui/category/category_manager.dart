
import 'package:flutter/material.dart';
import 'package:motor_app/services/category_service.dart';

import '../../models/category_model.dart';

class CategoryManager with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  Future<List<CategoryModel>> fetchCategory() async {
    var _categoryService = CategoryService();

    try {
      categoryList = await _categoryService.fetchCategory();
    } catch (error) {
      print(error);
    }
    return categoryList;
  }

  int get categoryCount {
    return categoryList.length;
  }

  List<CategoryModel> get items {
    return [...categoryList];
  }
}