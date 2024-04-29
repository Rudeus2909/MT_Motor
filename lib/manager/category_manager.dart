import 'package:flutter/material.dart';
import 'package:motor_app/services/category_service.dart';

import '../models/category_model.dart';

class CategoryManager with ChangeNotifier {
  List<CategoryModel> categoryList = [];
  final _categoryService = CategoryService();

  Future<List<CategoryModel>> fetchCategory() async {
    categoryList.clear();
    try {
      if (categoryList.isEmpty) {
        categoryList = await _categoryService.fetchCategory();
      }
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

  //Tìm hãng xe theo id
  CategoryModel? findById(int idCategory) {
    try {
      return categoryList.firstWhere((item) => item.idCategory == idCategory);
    } catch (error) {
      print(error);
      return null;
    }
  }

  //Cập nhật tên hãng xe
  Future updateCategoryName(int idCategory, String categoryName) async {
    try {
      await _categoryService.updateCategoryName(idCategory, categoryName);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  //Cập nhật hình ảnh hãng xe
  Future updateCategoryImage(int idCategory, String categoryImage) async {
    try {
      await _categoryService.updateCategoryImage(idCategory, categoryImage);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
